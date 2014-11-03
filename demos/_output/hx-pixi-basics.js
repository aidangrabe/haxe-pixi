(function () { "use strict";
var demos = {};
demos.basics = {};
demos.basics.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	window.document.body.appendChild(this._renderer.view);
	this._bunny = new PIXI.Sprite(PIXI.Texture.fromImage("assets/basics/bunny.png"));
	this._bunny.anchor.set(0.5,0.5);
	this._bunny.scale.set(2,2);
	this._bunny.position.x = 400;
	this._bunny.position.y = 300;
	this._stage.addChild(this._bunny);
	window.requestAnimationFrame($bind(this,this.animate));
};
demos.basics.Main.main = function() {
	new demos.basics.Main();
};
demos.basics.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._bunny.rotation += 0.1;
		this._renderer.render(this._stage);
	}
};
var pixi = {};
pixi.utils = {};
pixi.utils.RenderingOptions = function(view,resolution,transparent) {
	this.preserveDrawingBuffer = false;
	this.antialias = false;
	this.clearBeforeRender = true;
	this.resolution = 1;
	this.transparent = false;
	if(view != null) this.view = view;
	if(resolution != null) this.resolution = resolution;
	if(transparent != null) this.transparent = transparent;
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
demos.basics.Main.main();
})();