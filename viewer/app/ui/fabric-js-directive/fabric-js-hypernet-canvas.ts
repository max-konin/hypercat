/// <reference path="../../../typings/fabricjs/fabricjs.d.ts/" />
import {Component, Inject, ElementRef, Attribute} from 'angular2/core';
import {HypernetCanvas, CanvasPoint, Point, CanvasEdge} from '../hypernet-renderer';
@Component({
    selector: 'hypernet-canvas',
    templateUrl: 'app/html/fabric-js-hypernet-canvas.html'
})
export class FabricJSHypernetCanvas implements HypernetCanvas {

    private canvas: fabric.ICanvas;
    private offsetX = 0;
    private offsetY = 0;
    private aspect = 1;
    constructor(@Inject(ElementRef) elementRef: ElementRef) {
        var domElement: HTMLElement = elementRef.nativeElement;
        var canvasElement = domElement.getElementsByTagName('canvas')[0];

        this.canvas = new fabric.Canvas(canvasElement);
        fabric.Circle.prototype.originX = fabric.Circle.prototype.originY = 'center';

        var boundingRect = domElement.getBoundingClientRect();
        this.setDimensions(boundingRect.width, boundingRect.height);
    }
    
    /**
	 * Sets the dimensions of canvas. Use negative number to leave the dimension as is.
	 */
    public setDimensions(width: number, height: number) {
        if (width > 0) this.canvas.setWidth(width);
        if (height > 0) this.canvas.setHeight(height);

        this.canvas.renderAll();
    }

    drawLine(edge: CanvasEdge) {
        var p1 = this.getCanvasPoint(edge.from);
        var p2 = this.getCanvasPoint(edge.to);
        
        var line = new fabric.Line([p1.x, p1.y, p2.x, p2.y], {fill: 'black', stroke: 'black', strokeWidth: 5, selectable: false});
        edge.data = line;
        edge.EdgeRefreshListener = (canvasEdge) => {this.redawEdge(canvasEdge)};
        this.canvas.add(line);
        
    };
    
    private redawEdge(edge: CanvasEdge) {
        var line: fabric.IObject;
        line = edge.data;
        
        var p1 = this.getCanvasPoint(edge.from);
        var p2 = this.getCanvasPoint(edge.to);
        console.log(p1);
        line.set({'x1': p1.x, 'y1': p1.y, 'x2': p2.x, 'y2': p2.y});
    }
    
    drawPoint(point: CanvasPoint) {
        var cx = this.offsetX + this.aspect * point.x;
        var cy = this.offsetY + this.aspect * point.y;
        var radius = 15;
        
        var p = new fabric.Circle({
            radius: 15,
            fill: "blue",
            left: cx,
            top: cy
        });
        p.lockScalingX = p.lockScalingY = p.lockUniScaling = p.lockRotation = true;
        p.hasControls = p.hasBorders = false;
        
        p.on("moving", (evt) => {
            var realPoint = this.getRealPoint(p.getLeft(), p.getTop())
            point.setCoordinates(realPoint.x, realPoint.y);
            this.canvas.renderAll(); 
        });
        
        
        this.canvas.add(p);
    };
    
    
    
    private getCanvasPoint(point: Point) : Point {
        return {x : this.offsetX + this.aspect * point.x, y : this.offsetY + this.aspect * point.y};
    }
    
    private getRealPoint(canvasX: number, canvasY: number): Point{
        return {x: (canvasX - this.offsetX)/this.aspect, y: (canvasY - this.offsetY)/this.aspect}
    }

    

    setMaxExtent(xmin: number, xmax: number, ymin: number, ymax: number) {
        var cw = this.canvas.getWidth(); //canvas width
        var ch = this.canvas.getHeight();
        var rew = xmax - xmin; //real extent width, the extent of object aream
        var reh = ymax - ymin;

        this.aspect = Math.min(cw / rew, ch / reh);// Pick the smallest ratio to make the whole picture match the canvas;
        this.offsetX = -xmin
        this.offsetY = -ymin;
    }
}