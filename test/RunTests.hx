package;

import tink.unit.*;
import tink.testrunner.*;
import tink.CoreApi;
import js.node.Http2;

using Lambda;
using bp.test.Utils;

class RunTests {
	static function main() {
		Runner.run(TestBatch.make([new Test(),])).handle(Runner.exit);
	}
}

@:asserts
class Test {
	public function new() {}

	var server:Http2SecureServer;
	var gotRequest:Future<Noise>;

	public function create_http2_server() {
		var onRequest = Future.trigger();
		gotRequest = onRequest;
		return asserts.assert(({
			server = Http2.createSecureServer({
				cert: js.node.Fs.readFileSync('./localhost-cert.pem'),
				key: js.node.Fs.readFileSync('./localhost-privkey.pem'),
				allowHTTP1: true
			}, (req, res) -> {
					res.writeHead(200, "OK");
					res.end("<h1>Hello, World</h1>");
					res.stream.on('close', () -> onRequest.trigger(Noise));
					Noise;
				});
		}).attempt(true));
	}

	public function http2_listen() {
		return asserts.assert(({
			server.listen(8080);
			trace('Listening on port 8080');
			Noise;
		}).attempt(true));
	}

	@:timeout(100000)
	public function wait_for_request() {
		gotRequest.next(_ -> {
			asserts.assert(true);
			asserts.done();
		});
		return asserts;
	}
}
