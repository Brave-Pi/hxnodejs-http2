package js.node.http2;
typedef Settings = {
	@:optional var headerTableSize : Float;
	@:optional var enablePush : Bool;
	@:optional var initialWindowSize : Float;
	@:optional var maxFrameSize : Float;
	@:optional var maxConcurrentStreams : Float;
	@:optional var maxHeaderListSize : Float;
	@:optional var enableConnectProtocol : Bool;
};

typedef ClientSessionRequestOptions = {
	@:optional var endStream : Bool;
	@:optional var exclusive : Bool;
	@:optional var parent : Float;
	@:optional var weight : Float;
	@:optional var waitForTrailers : Bool;
};
typedef SessionState = {
	@:optional var effectiveLocalWindowSize : Float;
	@:optional var effectiveRecvDataLength : Float;
	@:optional var nextStreamID : Float;
	@:optional var localWindowSize : Float;
	@:optional var lastProcStreamID : Float;
	@:optional var remoteWindowSize : Float;
	@:optional var outboundQueueSize : Float;
	@:optional var deflateDynamicTableSize : Float;
	@:optional var inflateDynamicTableSize : Float;
};
extern class Http2Session extends js.node.events.EventEmitter<Http2Session> {
	var readonly : Dynamic;
	@:optional var alpnProtocol : String;
	var closed : Bool;
	var connecting : Bool;
	var destroyed : Bool;
	@:optional var encrypted : Bool;
	var localSettings : Settings;
	@:optional var originSet : Array<String>;
	var pendingSettingsAck : Bool;
	var remoteSettings : Settings;
	var socket : haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>;
	var state : SessionState;
	var type : Float;
	function close(?callback:Void -> Void):Void;
	function destroy(?error:js.lib.Error, ?code:Float):Void;
	function goaway(?code:Float, ?lastStreamID:Float, ?opaqueData:js.lib.ArrayBufferView):Void;
	@:overload(function(payload:js.lib.ArrayBufferView, callback:haxe.extern.EitherType<js.lib.Error, Null<Any>> -> Float -> Buffer -> Void):Bool { })
	function ping(callback:haxe.extern.EitherType<js.lib.Error, Null<Any>> -> Float -> Buffer -> Void):Bool;
	function ref():Void;
	function setTimeout(msecs:Float, ?callback:Void -> Void):Void;
	function settings(settings:Settings):Void;
	function unref():Void;
	@:overload(function(event:String, listener:js.lib.Error -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Float -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Buffer -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Session { })
	function addListener(event:String, listener:Void -> Void):Http2Session;
	@:overload(function(event:String, err:js.lib.Error):Bool { })
	@:overload(function(event:String, frameType:Float, errorCode:Float, streamID:Float):Bool { })
	@:overload(function(event:String, errorCode:Float, lastStreamID:Float, opaqueData:Buffer):Bool { })
	@:overload(function(event:String, settings:Settings):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:String, settings:Settings):Bool { })
	@:overload(function(event:String):Bool { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool { })
	function emit(event:String):Bool;
	@:overload(function(event:String, listener:js.lib.Error -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Float -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Buffer -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Session { })
	function on(event:String, listener:Void -> Void):Http2Session;
	@:overload(function(event:String, listener:js.lib.Error -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Float -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Buffer -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Session { })
	function once(event:String, listener:Void -> Void):Http2Session;
	@:overload(function(event:String, listener:js.lib.Error -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Float -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Buffer -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Session { })
	function prependListener(event:String, listener:Void -> Void):Http2Session;
	@:overload(function(event:String, listener:js.lib.Error -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Float -> Void):Http2Session { })
	@:overload(function(event:String, listener:Float -> Float -> Buffer -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:String, listener:Settings -> Void):Http2Session { })
	@:overload(function(event:String, listener:Void -> Void):Http2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):Http2Session { })
	function prependOnceListener(event:String, listener:Void -> Void):Http2Session;
}
extern class ServerHttp2Session extends Http2Session {
	
	// var readonly : Dynamic;
	var server : haxe.extern.EitherType<Http2Server, Http2SecureServer>;
	function altsvc(alt:String, originOrStream:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, haxe.extern.EitherType<js.node.url.URL, AlternativeServiceOptions>>>):Void;
	function origin(args:haxe.extern.Rest<haxe.extern.EitherType<String, haxe.extern.EitherType<js.node.url.URL, { var origin : String; }>>>):Void;
	@:overload(function(event:String, listener:ServerHttp2Stream -> IncomingHttpHeaders -> Float -> Void):ServerHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ServerHttp2Session { })
	function addListener(event:String, listener:ServerHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ServerHttp2Session;
	@:overload(function(event:String, stream:ServerHttp2Stream, headers:IncomingHttpHeaders, flags:Float):Bool { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, args:haxe.extern.Rest<Dynamic>):Bool { })
	function emit(event:String, session:ServerHttp2Session, socket:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>):Bool;
	@:overload(function(event:String, listener:ServerHttp2Stream -> IncomingHttpHeaders -> Float -> Void):ServerHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ServerHttp2Session { })
	function on(event:String, listener:ServerHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ServerHttp2Session;
	@:overload(function(event:String, listener:ServerHttp2Stream -> IncomingHttpHeaders -> Float -> Void):ServerHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ServerHttp2Session { })
	function once(event:String, listener:ServerHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ServerHttp2Session;
	@:overload(function(event:String, listener:ServerHttp2Stream -> IncomingHttpHeaders -> Float -> Void):ServerHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ServerHttp2Session { })
	function prependListener(event:String, listener:ServerHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ServerHttp2Session;
	@:overload(function(event:String, listener:ServerHttp2Stream -> IncomingHttpHeaders -> Float -> Void):ServerHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ServerHttp2Session { })
	function prependOnceListener(event:String, listener:ServerHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ServerHttp2Session;
}

extern class ClientHttp2Session extends Http2Session {
	function request(?headers:OutgoingHttpHeaders, ?options:ClientSessionRequestOptions):ClientHttp2Stream;
	@:overload(function(event:String, listener:Array<String> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Stream -> Dynamic -> Float -> Void):ClientHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Session { })
	function addListener(event:String, listener:String -> String -> Float -> Void):ClientHttp2Session;
	@:overload(function(event:String, origins:Array<String>):Bool { })
	@:overload(function(event:String, session:ClientHttp2Session, socket:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>):Bool { })
	@:overload(function(event:String, stream:ClientHttp2Stream, headers:Dynamic, flags:Float):Bool { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool { })
	function emit(event:String, alt:String, origin:String, stream:Float):Bool;
	@:overload(function(event:String, listener:Array<String> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Stream -> Dynamic -> Float -> Void):ClientHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Session { })
	function on(event:String, listener:String -> String -> Float -> Void):ClientHttp2Session;
	@:overload(function(event:String, listener:Array<String> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Stream -> Dynamic -> Float -> Void):ClientHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Session { })
	function once(event:String, listener:String -> String -> Float -> Void):ClientHttp2Session;
	@:overload(function(event:String, listener:Array<String> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Stream -> Dynamic -> Float -> Void):ClientHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Session { })
	function prependListener(event:String, listener:String -> String -> Float -> Void):ClientHttp2Session;
	@:overload(function(event:String, listener:Array<String> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Session -> haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket> -> Void):ClientHttp2Session { })
	@:overload(function(event:String, listener:ClientHttp2Stream -> Dynamic -> Float -> Void):ClientHttp2Session { })
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic> -> Void):ClientHttp2Session { })
	function prependOnceListener(event:String, listener:String -> String -> Float -> Void):ClientHttp2Session;
}

