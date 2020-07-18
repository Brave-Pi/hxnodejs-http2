package js.node;

import js.node.stream.Readable.IReadable;
import js.node.http2.Stream;
import js.node.http2.Session;

@:jsRequire('http2')
typedef Http2 = js.node.http2.Constants;

typedef Headers = haxe.DynamicAccess<Array<String>>;
typedef Http1IncomingHttpHeaders = Headers;
typedef OutgoingHttpHeaders = Headers;
typedef IncomingHttpHeaders = haxe.DynamicAccess<String>;

typedef IncomingHttpStatusHeader = {
	@:optional var status:Float;
};

typedef StreamPriorityOptions = {
	@:optional var exclusive:Bool;
	@:optional var parent:Float;
	@:optional var weight:Float;
	@:optional var silent:Bool;
};

typedef StreamState = {
	@:optional var localWindowSize:Float;
	@:optional var state:Float;
	@:optional var localClose:Float;
	@:optional var remoteClose:Float;
	@:optional var sumDependencyWeight:Float;
	@:optional var weight:Float;
};

typedef ServerStreamResponseOptions = {
	@:optional var endStream:Bool;
	@:optional var waitForTrailers:Bool;
};

typedef StatOptions = {
	var offset:Float;
	var length:Float;
};

typedef ServerStreamFileResponseOptions = {
	@:optional function statCheck(stats:js.node.fs.Stats, headers:OutgoingHttpHeaders, statOptions:StatOptions):haxe.extern.EitherType<Void, Bool>;
	@:optional var waitForTrailers:Bool;
	@:optional var offset:Float;
	@:optional var length:Float;
};

typedef ServerStreamFileResponseOptionsWithError = {
	> ServerStreamFileResponseOptions,
	@:optional function onError(err:Int):Void;
};

typedef AlternativeServiceOptions = {
	var origin:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, js.node.url.URL>>;
};

typedef SessionOptions = {
	@:optional var maxDeflateDynamicTableSize:Float;
	@:optional var maxSessionMemory:Float;
	@:optional var maxHeaderListPairs:Float;
	@:optional var maxOutstandingPings:Float;
	@:optional var maxSendHeaderBlockLength:Float;
	@:optional var paddingStrategy:Float;
	@:optional var peerMaxConcurrentStreams:Float;
	@:optional var settings:Settings;
	@:optional function selectPadding(frameLen:Float, maxFrameLen:Float):Float;
	@:optional function createConnection(authority:js.node.url.URL, option:SessionOptions):js.node.stream.Duplex.IDuplex;
};

typedef ClientSessionOptions = {
	> SessionOptions,
	@:optional var maxReservedRemoteStreams:Float;
	@:optional var createConnection:js.node.url.URL->SessionOptions->js.node.stream.Duplex.IDuplex;
	@:optional var protocol:haxe.extern.EitherType<String, String>;
};

typedef ServerSessionOptions = {
	> SessionOptions,
	@:optional var Http1IncomingMessage:Dynamic;
	@:optional var Http1ServerResponse:Dynamic;
	@:optional var Http2ServerRequest:Dynamic;
	@:optional var Http2ServerResponse:Dynamic;
};

typedef SecureClientSessionOptions = {
	> ClientSessionOptions,
	> js.node.tls.Tls.ConnectionOptions,
};

typedef SecureServerSessionOptions = {
	> ServerSessionOptions,
	> js.node.tls.Tls.TlsOptions,
};

typedef ServerOptions = {
	> ServerSessionOptions,
};

typedef SecureServerOptions = {
	> SecureServerSessionOptions,
	@:optional var allowHTTP1:Bool;
	@:optional var origins:Array<String>;
};

extern class Http2Server extends js.node.net.Server {

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2Server {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2Server {})
	@:overload(function(event:String, listener:Void->Void):Http2Server {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2Server {})
	function addListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server;

	@:overload(function(event:String, request:Http2ServerRequest, response:Http2ServerResponse):Bool {})
	@:overload(function(event:String, session:ServerHttp2Session):Bool {})
	@:overload(function(event:String, err:js.lib.Error):Bool {})
	@:overload(function(event:String, stream:ServerHttp2Stream, headers:IncomingHttpHeaders, flags:Float):Bool {})
	@:overload(function(event:String):Bool {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool {})
	function emit(event:String, request:Http2ServerRequest, response:Http2ServerResponse):Bool;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2Server {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2Server {})
	@:overload(function(event:String, listener:Void->Void):Http2Server {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2Server {})
	function on(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2Server {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2Server {})
	@:overload(function(event:String, listener:Void->Void):Http2Server {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2Server {})
	function once(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2Server {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2Server {})
	@:overload(function(event:String, listener:Void->Void):Http2Server {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2Server {})
	function prependListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2Server {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2Server {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2Server {})
	@:overload(function(event:String, listener:Void->Void):Http2Server {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2Server {})
	function prependOnceListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2Server;

	function setTimeout(?msec:Float, ?callback:Void->Void):Http2Server;
}

extern class Http2SecureServer extends js.node.tls.Server {

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:Void->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.node.tls.TLSSocket->Void):Http2SecureServer {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2SecureServer {})
	function addListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer;

	@:overload(function(event:String, request:Http2ServerRequest, response:Http2ServerResponse):Bool {})
	@:overload(function(event:String, session:ServerHttp2Session):Bool {})
	@:overload(function(event:String, err:js.lib.Error):Bool {})
	@:overload(function(event:String, stream:ServerHttp2Stream, headers:IncomingHttpHeaders, flags:Float):Bool {})
	@:overload(function(event:String):Bool {})
	@:overload(function(event:String, socket:js.node.tls.TLSSocket):Bool {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool {})
	function emit(event:String, request:Http2ServerRequest, response:Http2ServerResponse):Bool;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:Void->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.node.tls.TLSSocket->Void):Http2SecureServer {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2SecureServer {})
	function on(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:Void->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.node.tls.TLSSocket->Void):Http2SecureServer {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2SecureServer {})
	function once(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:Void->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.node.tls.TLSSocket->Void):Http2SecureServer {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2SecureServer {})
	function prependListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer;

	@:overload(function(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Session->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:ServerHttp2Stream->IncomingHttpHeaders->Float->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:Void->Void):Http2SecureServer {})
	@:overload(function(event:String, listener:js.node.tls.TLSSocket->Void):Http2SecureServer {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2SecureServer {})
	function prependOnceListener(event:String, listener:Http2ServerRequest->Http2ServerResponse->Void):Http2SecureServer;

	function setTimeout(?msec:Float, ?callback:Void->Void):Http2SecureServer;
}

extern class Http2ServerRequest extends js.node.stream.Readable<Http2ServerRequest> {
	function new(stream:ServerHttp2Stream, headers:IncomingHttpHeaders, options:js.node.stream.Readable.ReadableNewOptions, rawHeaders:Array<String>):Void;
	var readonly:Dynamic;
	var aborted:Bool;
	var authority:String;
	var connection:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>;
	var complete:Bool;
	var headers:IncomingHttpHeaders;
	var httpVersion:String;
	var httpVersionMinor:Float;
	var httpVersionMajor:Float;
	var method:String;
	var rawHeaders:Array<String>;
	var rawTrailers:Array<String>;
	var scheme:String;
	var socket:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>;
	var stream:ServerHttp2Stream;
	var trailers:IncomingHttpHeaders;
	var url:String;
	function setTimeout(msecs:Float, ?callback:Void->Void):Void;
	function read(?size:Float):haxe.extern.EitherType<Buffer, haxe.extern.EitherType<String, Null<Dynamic>>>;

	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String>->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerRequest {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerRequest {})
	function addListener(event:String, listener:Bool->Float->Void):Http2ServerRequest;

	@:overload(function(event:String):Bool {})
	@:overload(function(event:String, chunk:haxe.extern.EitherType<Buffer, String>):Bool {})
	@:overload(function(event:String):Bool {})
	@:overload(function(event:String):Bool {})
	@:overload(function(event:String, err:js.lib.Error):Bool {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool {})
	function emit(event:String, hadError:Bool, code:Float):Bool;

	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String>->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerRequest {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerRequest {})
	function on(event:String, listener:Bool->Float->Void):Http2ServerRequest;

	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String>->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerRequest {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerRequest {})
	function once(event:String, listener:Bool->Float->Void):Http2ServerRequest;

	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String>->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerRequest {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerRequest {})
	function prependListener(event:String, listener:Bool->Float->Void):Http2ServerRequest;

	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:haxe.extern.EitherType<Buffer, String>->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerRequest {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerRequest {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerRequest {})
	function prependOnceListener(event:String, listener:Bool->Float->Void):Http2ServerRequest;
}

extern class Http2ServerResponse extends js.node.Stream<Http2ServerResponse> {
	function new(stream:ServerHttp2Stream):Void;
	var readonly:Dynamic;
	var connection:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>;
	var finished:Bool;
	var headersSent:Bool;
	var socket:haxe.extern.EitherType<js.node.net.Socket, js.node.tls.TLSSocket>;
	var stream:ServerHttp2Stream;
	var sendDate:Bool;
	var statusCode:Float;
	var statusMessage:String;
	function addTrailers(trailers:OutgoingHttpHeaders):Void;

	@:overload(function(data:haxe.extern.EitherType<String, Uint8Array>, ?callback:Void->Void):Void {})
	@:overload(function(data:haxe.extern.EitherType<String, Uint8Array>, encoding:String, ?callback:Void->Void):Void {})
	function end(?callback:Void->Void):Void;

	function getHeader(name:String):String;
	function getHeaderNames():Array<String>;
	function getHeaders():OutgoingHttpHeaders;
	function hasHeader(name:String):Bool;
	function removeHeader(name:String):Void;
	function setHeader(name:String, value:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, Array<String>>>):Void;
	function setTimeout(msecs:Float, ?callback:Void->Void):Void;

	@:overload(function(chunk:haxe.extern.EitherType<String, Uint8Array>, encoding:String, ?callback:js.lib.Error->Void):Bool {})
	function write(chunk:haxe.extern.EitherType<String, Uint8Array>, ?callback:js.lib.Error->Void):Bool;

	function writeContinue():Void;

	@:overload(function(statusCode:Float, statusMessage:String, ?headers:OutgoingHttpHeaders):Http2ServerResponse {})
	function writeHead(statusCode:Float, ?headers:OutgoingHttpHeaders):Http2ServerResponse;

	function createPushResponse(headers:OutgoingHttpHeaders, callback:haxe.extern.EitherType<js.lib.Error, Null<Dynamic>>->Http2ServerResponse->Void):Void;

	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerResponse {})
	function addListener(event:String, listener:Void->Void):Http2ServerResponse;

	@:overload(function(event:String):Bool {})
	@:overload(function(event:String, error:js.lib.Error):Bool {})
	@:overload(function(event:String):Bool {})
	@:overload(function(event:String, src:js.node.stream.Readable.IReadable):Bool {})
	@:overload(function(event:String, src:js.node.stream.Readable.IReadable):Bool {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool {})
	function emit(event:String):Bool;

	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerResponse {})
	function on(event:String, listener:Void->Void):Http2ServerResponse;

	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerResponse {})
	function once(event:String, listener:Void->Void):Http2ServerResponse;

	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerResponse {})
	function prependListener(event:String, listener:Void->Void):Http2ServerResponse;

	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.lib.Error->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:Void->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:String, listener:js.node.stream.Readable.IReadable->Void):Http2ServerResponse {})
	@:overload(function(event:haxe.extern.EitherType<String, js.lib.Symbol>, listener:haxe.extern.Rest<Dynamic>->Void):Http2ServerResponse {})
	function prependOnceListener(event:String, listener:Void->Void):Http2ServerResponse;
}
