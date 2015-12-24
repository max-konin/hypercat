import {GraphComponents} from '../core/graph'
export class HyperNetRenderer {
    private graph: GraphComponents.Graph;
    private canvas: HypernetCanvas;
    constructor(graph: GraphComponents.Graph, hypernetCanvas: HypernetCanvas) {
        this.graph = graph;
        this.canvas = hypernetCanvas;
        this.canvas.setMaxExtent(0, 4, 0, 4);
    }

    public draw() {
        this.graph.edges.forEach((edge) => {
            debugger;
            this.canvas.drawLine(
                { x: edge.from.x, y: edge.from.y },
                { x: edge.to.x, y: edge.to.y });
        });
        
        this.graph.vertices.forEach((vertex) => {
            this.canvas.drawPoint({x : vertex.x, y : vertex.y});
        })
    }
}

export interface HypernetCanvas {
    drawLine(from: Point, to: Point);
    drawPoint(point: Point);
    setMaxExtent(xmin: number, xmax: number, ymin: number, ymax: number);
}

export class Point {
    x: number;
    y: number;
}