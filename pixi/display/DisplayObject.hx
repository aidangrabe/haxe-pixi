package pixi.display;

import pixi.core.Matrix;
import pixi.core.Rectangle;
import pixi.primitives.Graphics;
import pixi.core.Point;
import pixi.textures.Texture;
import pixi.renderers.canvas.CanvasRenderer;
import pixi.renderers.webgl.WebGLRenderer;

@:native("PIXI.DisplayObject")
extern class DisplayObject {

	/**
	 * The base class for all objects that are rendered on the screen.
	 * This is an abstract class and should not be used on its own rather it should be extended.
	 *
	 * @class DisplayObject
	 * @constructor
	*/
	function new(x:Float, y:Float, radius:Float):Void;

	/**
	 * Indicates if the sprite will have touch and mouse interactivity. It is false by default
	 *
	 * @property interactive
	 * @type Boolean
	 * @default false
	*/
	var interactive:Bool;

	/**
	 * [Deprecated] Indicates if the sprite will have touch and mouse interactivity. It is false by default
	 * Instead of using this function you can now simply set the interactive property to true or false
	 *
	 * @method setInteractive
	 * @param interactive {Bool}
	 * @deprecated Simply set the `interactive` property directly
	*/
	function setInteractive(interactive:Bool):Void;

	/**
	 * [read-only] Indicates if the sprite is globaly visible.
	 *
	 * @property worldVisible
	 * @type Boolean
	*/
	var worldVisible:Bool;

	/**
	 * Sets a mask for the displayObject. A mask is an object that limits the visibility of an object to the shape of the mask applied to it.
	 * In PIXI a regular mask must be a PIXI.Graphics object. This allows for much faster masking in canvas as it utilises shape clipping.
	 * To remove a mask, set this property to null.
	 *
	 * @property mask
	 * @type Graphics
	*/
	var mask:Graphics;

	/**
	 * Sets the filters for the displayObject.
	 * * IMPORTANT: This is a webGL only feature and will be ignored by the canvas renderer.
	 * To remove filters simply set this property to 'null'
	 * @property filters
	 * @type Array An array of filters
	*/
	var filters:Array<Dynamic>;

	/**
	 * Set weather or not a the display objects is cached as a bitmap.
	 * This basically takes a snap shot of the display object as it is at that moment. It can provide a performance benefit for complex static displayObjects
	 * To remove filters simply set this property to 'null'
	 * @property cacheAsBitmap
	 * @type Boolean
	*/
	var cacheAsBitmap:Bool;

	/**
	 * The coordinate of the object relative to the local coordinates of the parent.
	*/
	var position:Point;

	/**
	 * The scale factor of the object.
	*/
	var scale:Point;

	/**
	 * The pivot point of the displayObject that it rotates around
	*/
	var pivot:Point;

	/**
	 * The rotation of the object in radians.
	*/
	var rotation:Float;

	/**
	 * The opacity of the object.
	*/
	var alpha:Float;

	/**
	 * The visibility of the object.
	*/
	var visible:Bool;

	/**
	 * This is the defined area that will pick up mouse / touch events. It is null by default.
	 * Setting it is a neat way of optimising the hitTest function that the interactionManager will use (as it will not need to hit test all the children)
	*/
	var hitArea:Dynamic;

	/**
	 * This is used to indicate if the displayObject should display a mouse hand cursor on rollover
	*/
	var buttonMode:Bool;

	/**
	 * Can this object be rendered
	*/
	var renderable:Bool;

	/**
	 * [read-only] The display object container that contains this display object.
	*/
	var parent:DisplayObjectContainer;

	/**
	 * [read-only] The stage the display object is connected to, or undefined if it is not connected to the stage.
	*/
	var stage:Stage;

	/**
	 * [read-only] The multiplied alpha of the displayObject
	*/
	var worldAlpha:Float;

	/**
	 * This is the cursor that will be used when the mouse is over this object. To enable this the element must have interaction = true and buttonMode = true
	*/
	var defaultCursor:String;

	/**
	 * [NYI] Holds whether or not this object is dynamic, for rendering optimization
	*/
	var a0:Bool;

	/**
	 * The area the filter is applied to like the hitArea this is used as more of an optimisation
	 * rather than figuring out the dimensions of the displayObject each frame you can set this rectangle
	*/
	var filterArea:Rectangle;

	/**
	 * The original, cached bounds of the object
	*/
	var bounds:Rectangle;

	/**
	 * The most up-to-date bounds of the object
	*/
	var currentBounds:Rectangle;

	/**
	 * The position of the displayObject on the x axis relative to the local coordinates of the parent.
	*/
	var x:Float;

	/**
	 * The position of the displayObject on the y axis relative to the local coordinates of the parent.
	*/
	var y:Float;

    /**
     * Retrieves the bounds of the displayObject as a rectangle object
     *
     * @method getBounds
     * @param matrix {Matrix}
     * @return {Rectangle} the rectangular bounding area
     */
	function getBounds(matrix:Matrix):Rectangle;

	/**
	 * Sets the object's stage reference, the stage this object is connected to
	 *
	 * @method setStageReference
	 * @param stage {Stage} the stage that the object will have as its current stage reference
	*/
	function setStageReference(stage:Stage):Void;

    /**
     * Useful function that returns a texture of the displayObject object that can then be used to create sprites
     * This can be quite useful if your displayObject is static / complicated and needs to be reused multiple times.
     *
     * @method generateTexture
     * @param resolution {Number} The resolution of the texture being generated
     * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
     * @param renderer {CanvasRenderer|WebGLRenderer} The renderer used to generate the texture.
     * @return {Texture} a texture of the graphics object
     */
    @:overload(function(resolution:Float, scaleMode:Int, ?renderer:CanvasRenderer):Texture{})
	function generateTexture(resolution:Float, scaleMode:Int, ?renderer:WebGLRenderer):Texture;

	function updateCache():Void;

	var click:InteractionData -> Void;
	var tap:InteractionData -> Void;
	var mousedown:InteractionData -> Void;
	var mouseout:InteractionData -> Void;
	var mouseover:InteractionData -> Void;
	var mouseup:InteractionData -> Void;
    var mousemove:InteractionData -> Void;
	var mouseupoutside:InteractionData -> Void;
    var touchstart:InteractionData -> Void;
    var touchmove:InteractionData -> Void;
    var touchend:InteractionData -> Void;
    var touchendoutside:InteractionData -> Void;
	var rightclick:InteractionData -> Void;
	var rightdown:InteractionData -> Void;
	var rightup:InteractionData -> Void;
}
