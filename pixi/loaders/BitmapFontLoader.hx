package pixi.loaders;

import pixi.textures.Texture;
import pixi.utils.EventTarget;

@:native("PIXI.BitmapFontLoader")
extern class BitmapFontLoader extends EventTarget {

	/**
	 * The xml loader is used to load in XML bitmap font data ('xml' or 'fnt')
	 * To generate the data you can use http://www.angelcode.com/products/bmfont/
	 * This loader will also load the image file as the data.
	 * When loaded this class will dispatch a 'loaded' event
	 *
	 * @class BitmapFontLoader
	 * @uses EventTarget
	 * @constructor
	 * @param url {String} The url of the sprite sheet JSON file
	 * @param crossorigin {Bool} Whether requests should be treated as crossorigin
	 */
	function new(url:String, ?crossorigin:Bool);

	/**
     * The url of the bitmap font data
     *
     * @property url
     * @type String
     */
	var url:String;

	/**
     * Whether the requests should be treated as cross origin
     *
     * @property crossorigin
     * @type Boolean
     */
	var crossorigin:Bool;

	/**
     * [read-only] The base url of the bitmap font data
     *
     * @property baseUrl
     * @type String
     * @readOnly
     */
	var baseUrl:String;

	/**
     * [read-only] The texture of the bitmap font
     *
     * @property texture
     * @type Texture
     */
	var texture:Texture;

	/**
	 * Loads the XML font data
	 *
	 * @method load
	 */
	function load():Void;
}