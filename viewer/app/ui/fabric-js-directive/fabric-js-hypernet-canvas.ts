/// <reference path="../../../typings/fabricjs/fabricjs.d.ts/" />
import {Component, Inject, ElementRef, Attribute} from 'angular2/core';
import {HypernetCanvas, Point} from '../hypernet-renderer';
@Component({
    selector: 'hypernet-canvas',
    templateUrl: 'app/html/fabric-js-hypernet-canvas.html'
})
export class FabricJSHypernetCanvas implements HypernetCanvas {

    private canvas: fabric.ICanvas;
    private offsetX = 0;
    private offsetY = 0;
    private aspect = 1;
    constructor( @Inject(ElementRef) elementRef: ElementRef) {
        var domElement: HTMLElement = elementRef.nativeElement;
        var canvasElement = domElement.getElementsByTagName('canvas')[0];

        this.canvas = new fabric.Canvas(canvasElement);

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

    drawLine(from: Point, to: Point) {
        var p1 = this.getCanvasPoint(from);
        var p2 = this.getCanvasPoint(to);
        
        var line = new fabric.Line([p1.x, p1.y, p2.x, p2.y], {fill: 'black', stroke: 'black', strokeWidth: 5, selectable: false})
        this.canvas.add(line);
    };
    drawPoint(point: Point) {
        var cx = this.offsetX + this.aspect * point.x;
        var cy = this.offsetY + this.aspect * point.y;
        var radius = 15;
        var p = new fabric.Circle({
            radius: 15,
            fill: "green",
            left: cx - radius,
            top: cy - radius
        });
        
        this.canvas.add(p);
    };
    
    private getCanvasPoint(point: Point) : Point {
        return {x : this.offsetX + this.aspect * point.x, y : this.offsetY + this.aspect * point.y};
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