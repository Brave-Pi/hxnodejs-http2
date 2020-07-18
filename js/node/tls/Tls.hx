package js.node.tls;

import js.node.tls.SecureContext;

typedef CommonConnectionOptions = {
	@:optional var secureContext : js.node.tls.SecureContext;
	@:optional var enableTrace : Bool;
	@:optional var requestCert : Bool;
	@:optional var ALPNProtocols : haxe.extern.EitherType<Array<String>, haxe.extern.EitherType<Array<Uint8Array>, Uint8Array>>;
	@:optional var SNICallback : String -> (haxe.extern.EitherType<Error, Null<Error>> -> js.node.tls.SecureContext -> Void) -> Void;
	@:optional var rejectUnauthorized : Bool;
};

typedef TlsOptions = {
	>SecureContextOptions,
	>CommonConnectionOptions,
	@:optional var handshakeTimeout : Float;
	@:optional var sessionTimeout : Float;
	@:optional var ticketKeys : Buffer;
	@:optional function pskCallback(socket:TLSSocket, identity:String):haxe.extern.EitherType<DataView, haxe.extern.EitherType<TypedArray, Null<Any>>>;
	@:optional var pskIdentityHint : String;
};

typedef PSKCallbackNegotation = {
	var psk : haxe.extern.EitherType<DataView, TypedArray>;
	var identitty : String;
};

typedef ConnectionOptions = {
	>SecureContextOptions,
	>CommonConnectionOptions,
	@:optional var host : String;
	@:optional var port : Float;
	@:optional var path : String;
	@:optional var socket : js.node.net.Socket;
	@:optional var checkServerIdentity : Dynamic;
	@:optional var servername : String;
	@:optional var session : Buffer;
	@:optional var minDHSize : Float;
	@:optional var lookup : js.node.net.LookupFunction;
	@:optional var timeout : Float;
	@:optional function pskCallback(hint:haxe.extern.EitherType<String, Null<Any>>):haxe.extern.EitherType<PSKCallbackNegotation, Null<Any>>;
};
