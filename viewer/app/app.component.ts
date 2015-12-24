import {Component, Inject, QueryList, ViewQuery, AfterViewInit} from 'angular2/core';

import  {GraphComponents} from './core/graph'
import {HyperNetRenderer} from './ui/hypernet-renderer'
import {FabricJSHypernetCanvas} from './ui/fabric-js-directive/fabric-js-hypernet-canvas'
declare var dockspawn: any;
@Component({
    selector: 'my-app',
    templateUrl: 'app/html/main.html',
    directives: [FabricJSHypernetCanvas]
})

export class AppComponent implements AfterViewInit{
    private a: number;
    private queryList : QueryList<FabricJSHypernetCanvas>;
    private init: boolean;
    ngAfterViewInit() {
        console.log(this.queryList);
        
        var canvas = this.queryList.first;
        var renderer = new HyperNetRenderer(this.getGraph(), canvas);
        renderer.draw();
    }
    
    private getGraph(): GraphComponents.Graph {
        var jsonGraph: any = {
            vertices: [
                { id: 'a', x: 1, y: 1},
                { id: 'b', x: 3, y: 1},
                { id: 'c', x: 3, y: 3},
                { id: 'd', x: 1, y: 3}
            ],
            edges: [
                {from: 'a', to: 'b' },
                {from: 'b', to: 'c' },
                {from: 'c', to: 'd' },
                {from: 'd', to: 'a' },
                {from: 'a', to: 'c' },
            ]
        }
        return GraphComponents.Graph.fromJsonObject(jsonGraph);
    }
    
    constructor(@ViewQuery(FabricJSHypernetCanvas, {descendants: true}) queryList: QueryList<FabricJSHypernetCanvas>) {
        this.queryList = queryList;
        var divDockManager = document.getElementById("my_dock_manager");
        var dockManager = new dockspawn.DockManager(divDockManager);
        dockManager.initialize();
        // Let the dock manager element fill in the entire screen
        var onResized = function(e) {
            dockManager.resize(window.innerWidth - (divDockManager.clientLeft + divDockManager.offsetLeft), window.innerHeight - (divDockManager.clientTop + divDockManager.offsetTop));
        }
        window.onresize = onResized;
        onResized(null);

        // Convert existing elements on the page into "Panels".
        // They can then be docked on to the dock manager
        // Panels get a titlebar and a close button, and can also be
        // converted to a floating dialog box which can be dragged / resized
        var hypernetWindow = new dockspawn.PanelContainer(document.getElementById("hypernet_window"), dockManager);
        var properties = new dockspawn.PanelContainer(document.getElementById("properties_window"), dockManager);
        var outline = new dockspawn.PanelContainer(document.getElementById("outline_window"), dockManager);
        var editor1 = new dockspawn.PanelContainer(document.getElementById("editor1_window"), dockManager);
        

        // Dock the panels on the dock manager
        var documentNode = dockManager.context.model.documentManagerNode;
        var outlineNode = dockManager.dockLeft(documentNode, outline, 0.15);
        var solutionNode = dockManager.dockFill(outlineNode, hypernetWindow);
        var propertiesNode = dockManager.dockDown(outlineNode, properties, 0.6);
        var editor1Node = dockManager.dockFill(documentNode, editor1);
        
        
    }
}