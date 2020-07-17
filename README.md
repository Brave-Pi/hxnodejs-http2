# hxnodejs-http2

Haxe externs for Node.js [HTTP/2 module](https://nodejs.org/api/http2.html).

(initially generated with [`ts2hx`](https://github.com/Simn/ts2hx))

## Example

__Generating `localhost-cert.pem` and `localhost-privkey.pem`__:
```
openssl req -x509 -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost' -keyout localhost-privkey.pem -out localhost-cert.pem
```

__Simple test__:

```haxe
var onRequest = Future.trigger(); // to be triggered when the first request occurs
server = js.node.Http2.createSecureServer({
				cert: js.node.Fs.readFileSync('./localhost-cert.pem'),
				key: js.node.Fs.readFileSync('./localhost-privkey.pem'),
				allowHTTP1: true
			}, (req, res) -> {
					res.writeHead(200, "OK");
					res.end("<h1>Hello, World</h1>");
					res.stream.on('close', () -> onRequest.trigger(Noise)); // after the first request is finished.
					Noise;
                });
server.listen(8080);
trace('Listening on port 8080');
onRequest.next(_ -> {
    server.close(); // stop listening for new connections after the first request
});
```