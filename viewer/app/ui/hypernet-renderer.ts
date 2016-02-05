import {GraphComponents} from '../core/graph'
import {EventListener} from '../core/event-listener'
export class HyperNetRenderer {
    private graph: GraphComponents.Graph;
    private canvas: HypernetCanvas;
    private map: Map<GraphComponents.Vertex, CanvasPoint>;
    private edgeMap: Map<GraphComponents.Edge, CanvasEdge>;
    constructor(graph: GraphComponents.Graph, hypernetCanvas: HypernetCanvas) {
        this.graph = graph;
        this.canvas = hypernetCanvas;
        this.canvas.setMaxExtent(0, 4, 0, 4);
        this.map = new Map<GraphComponents.Vertex, CanvasPoint>();
        this.edgeMap = new Map<GraphComponents.Edge, CanvasEdge>();
    }

    public draw() {
        
        this.graph.vertices.forEach((vertex) => {
            var point = new CanvasPoint(vertex);
            point.VertexUpdatedListener = (canvasPoint) => {
                this.graph.getAdjacent(canvasPoint.Vertex).forEach((edge) => {
                    var canvasEdge = this.edgeMap.get(edge);
                    if(canvasEdge.EdgeRefreshListener){
                        canvasEdge.EdgeRefreshListener(canvasEdge);
                    }
                });
            }
            this.map.set(vertex, point);
        });
        
        this.graph.edges.forEach((edge) => {
            var from = this.map.get(edge.from);
            var to = this.map.get(edge.to);
            var canvasEdge = new CanvasEdge(edge, from, to);
            this.edgeMap.set(edge, canvasEdge);
            this.canvas.drawLine(canvasEdge);
        });
        
        this.map.forEach((vertex) => {
            this.canvas.drawPoint(vertex);
        });
    }
}

export interface HypernetCanvas {
    drawLine(edge: CanvasEdge);
    drawPoint(point: CanvasPoint);
    setMaxExtent(xmin: number, xmax: number, ymin: number, ymax: number);
}

export class Point {
    x: number;
    y: number;
}

export class CanvasEdge {
    private fromPt: CanvasPoint;
    private toPt: CanvasPoint;
    private _edge;
    public EdgeRefreshListener: EventListener<CanvasEdge>
    public data: any;
    
    constructor (edge: GraphComponents.Edge, from: CanvasPoint, to: CanvasPoint){
        this.fromPt = from;
        this.toPt = to;
        this._edge = edge;
    }
    
    public get from() : CanvasPoint {
        return this.fromPt;
    }
    
    public get to() : CanvasPoint {
        return this.toPt;
    }
    
    public get edge() : GraphComponents.Edge {
        return this._edge;
    }
}

export class CanvasPoint {
    private vertex: GraphComponents.Vertex;
    
    public VertexUpdatedListener: EventListener<CanvasPoint>
    
    constructor (vertex: GraphComponents.Vertex){
        this.vertex = vertex;
    }
    
    public get x() : number {
        return this.vertex.x;
    }
    
    public get y() : number {
        return this.vertex.y;
    }
    
    public get Vertex() : GraphComponents.Vertex {
        return this.vertex;
    }
    
    public setCoordinates(x: number, y: number){
        this.vertex.x = x;
        this.vertex.y = y;
        if(this.VertexUpdatedListener){
            this.VertexUpdatedListener(this);
        }
    }
}


