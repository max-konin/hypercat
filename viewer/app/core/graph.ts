export module GraphComponents {
    export interface Vertex {
        x: number;
        y: number;
        id: string;
        data: any;
    }

    export interface Edge {
        from: Vertex;
        to: Vertex;
        data: any;
    }

    class VertexClass implements Vertex {
        protected _x: number;
        private _y: number;
        private _id: string;
        private _data: any;

        constructor(x, y, id) {
            this._x = x;
            this._y = y;
            this._id = id;
        }

        public get x(): number {
            return this._x;
        }

        public get y(): number {
            return this._y;
        }

        public get id(): string {
            return this._id;
        }

        public get data(): any {
            return this._data;
        }
        public set data(data: any) {
            this._data = data;
        }

    }

    class EdgeClass implements Edge {
        private _fromVertex: Vertex;
        private _toVertex: Vertex;
        _data: any;


        public get from() {
            return this._fromVertex;
        }

        public get to() {
            return this._toVertex;
        }

        public get data(): any {
            return this._data;
        }
        public set data(data: any) {
            this._data = data;
        }

        public constructor(from: Vertex, to: Vertex) {
            this._fromVertex = from;
            this._toVertex = to;
        }
    }

    export class Graph {
        private _edges: EdgeClass[];
        private _vertices: Map<string, Vertex>;
        public static fromJsonObject(jsonObject: any) {
            var vertices: any[] = jsonObject.vertices;
            var result = new Graph();
            result._vertices = new Map<string, Vertex>();

            vertices.forEach((vertexObj) => {
                if (!vertexObj.x || !vertexObj.y || !vertexObj.id) {
                    throw new ConvertationError("Ivalid vertex in the input array");
                }
                
                result._vertices.set(vertexObj.id, new VertexClass(vertexObj.x, vertexObj.y, vertexObj.id));
            })

            var edges: any[] = jsonObject.edges;
            result._edges = edges.map((obj) => {
                var node1 = result._vertices.get(obj.from);
                var node2 = result._vertices.get(obj.to);
                if (!node1 || !node2) {
                    throw new ConvertationError("Invalid edge in the input array");
                }

                return new EdgeClass(node1, node2);
            });
            return result;
        }
        
        public get edges() : Array<Edge> {
            return this._edges;
        }
        
        public get vertices() : Map<string, Vertex> {
            return this._vertices;
        }
    }

    export class ConvertationError extends Error {
        constructor(message: string){
            super();
        }
    }
}


