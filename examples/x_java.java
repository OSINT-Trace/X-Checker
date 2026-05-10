AsyncHttpClient client = new DefaultAsyncHttpClient();
// API.Market URL: https://prod.api.market/api/v1/osint-trace-1/x-checker/check/x
client.prepare("POST", "https://x-checker.p.rapidapi.com/check")
	// API.Market Header: X-Api-Key: YOUR_API_KEY
.setHeader("x-rapidapi-key", "Sign Up for Key")
	.setHeader("x-rapidapi-host", "x-checker.p.rapidapi.com")
	.setHeader("Content-Type", "application/json")
	.setBody("{"input":"test@example.com"}")
	.execute()
	.toCompletableFuture()
	.thenAccept(System.out::println)
	.join();

client.close();