package js.node.http2;
import js.lib.Symbol;
import js.lib.Error;

extern class Http2Stream extends js.node.Stream<Http2Stream> {
	var readonly : Dynamic;
	var aborted : Bool;
	var bufferSize : Float;
	var closed : Bool;
	var destroyed : Bool;
	var endAfterHeaders : Bool;
	@:optional
	var id : Float;
	var pending : Bool;
	var rstCode : Float;
	var sentHeaders : OutgoingHttpHeaders;
	@:optional
	var sentInfoHeaders : Array<OutgoingHttpHeaders>;
	@:optional
	var sentTrailers : OutgoingHttpHeaders;
	var session : Http2Session;
	var state : StreamState;
	function close(?code:Float, ?callback:Void -> Void):Void;
	function priority(options:StreamPriorityOptions):Void;
	function setTimeout(msecs:Float, ?callback:Void -> Void):Void;
	function sendTrailers(headers:OutgoingHttpHeaders):Void;
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String> -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Error -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Stream { })
	function addListener(event:String, listener:Void -> Void):Http2Stream;
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String, chunk:haxe.extern.EitherType<Buffer, String>):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String, err:Error):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String, frameType:Float, errorCode:Float):Bool { })
	@:overload(function(event:String, src:js.node.stream.Readable.IReadable):Bool { })
	@:overload(function(event:String, src:js.node.stream.Readable.IReadable):Bool { })
	@:overload(function(event:String, code:Float):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String, trailers:IncomingHttpHeaders, flags:Float):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, args:haxe.extern.Rest<Dynamic>):Bool { })
	function emit(event:String):Bool;
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String> -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Error -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Stream { })
	function on(event:String, listener:Void -> Void):Http2Stream;
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String> -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Error -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Stream { })
	function once(event:String, listener:Void -> Void):Http2Stream;
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String> -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Error -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Stream { })
	function prependListener(event:String, listener:Void -> Void):Http2Stream;
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String> -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Error -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):Http2Stream { })
	@:overload(function(event:String, listener:Void -> Void):Http2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Stream { })
	function prependOnceListener(event:String, listener:Void -> Void):Http2Stream;
}
extern class ClientHttp2Stream extends Http2Stream {
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Stream { })
	function addListener(event:String, listener:Void -> { }):ClientHttp2Stream;
	@:overload(function(event:String, headers:Dynamic, flags:Float):Bool { })
	@:overload(function(event:String, headers:IncomingHttpHeaders, flags:Float):Bool { })
	@:overload(function(event:String, headers:Dynamic, flags:Float):Bool { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, args:haxe.extern.Rest<Dynamic>):Bool { })
	function emit(event:String):Bool;
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Stream { })
	function on(event:String, listener:Void -> { }):ClientHttp2Stream;
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Stream { })
	function once(event:String, listener:Void -> { }):ClientHttp2Stream;
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Stream { })
	function prependListener(event:String, listener:Void -> { }):ClientHttp2Stream;
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:IncomingHttpHeaders -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:String, listener:Dynamic -> Float -> Void):ClientHttp2Stream { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Stream { })
	function prependOnceListener(event:String, listener:Void -> { }):ClientHttp2Stream;
}
extern class ServerHttp2Stream extends Http2Stream {
	// var readonly : Dynamic;
	var headersSent : Bool;
	var pushAllowed : Bool;
	function additionalHeaders(headers:OutgoingHttpHeaders):Void;
	@:overload(function(headers:OutgoingHttpHeaders, ?options:StreamPriorityOptions, ?callback:haxe.extern.EitherType<Error, Null<Any>> -> ServerHttp2Stream -> OutgoingHttpHeaders -> Void):Void { })
	function pushStream(headers:OutgoingHttpHeaders, ?callback:haxe.extern.EitherType<Error, Null<Any>> -> ServerHttp2Stream -> OutgoingHttpHeaders -> Void):Void;
	function respond(?headers:OutgoingHttpHeaders, ?options:ServerStreamResponseOptions):Void;
	function respondWithFD(fd:haxe.extern.EitherType<Float, Dynamic>, ?headers:OutgoingHttpHeaders, ?options:ServerStreamFileResponseOptions):Void;
	function respondWithFile(path:String, ?headers:OutgoingHttpHeaders, ?options:ServerStreamFileResponseOptionsWithError):Void;
}