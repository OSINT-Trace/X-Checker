package main

import (
	"fmt"
	"strings"
	"net/http"
	"io"
)

func main() {

	// API.Market URL: https://prod.api.market/api/v1/osint-trace-1/x-checker/check/x
url := "https://x-checker.p.rapidapi.com/check"

	payload := strings.NewReader("{"input":"test@example.com"}")

	req, _ := http.NewRequest("POST", url, payload)

	// API.Market Header: X-Api-Key: YOUR_API_KEY
req.Header.Add("x-rapidapi-key", "Sign Up for Key")
	req.Header.Add("x-rapidapi-host", "x-checker.p.rapidapi.com")
	req.Header.Add("Content-Type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}