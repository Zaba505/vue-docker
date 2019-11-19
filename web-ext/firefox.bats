source deployees

@test "should properly generate JWT" {
  out=$(gen_tok "Bob" 100 12345 "secret")
  [ $out = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJCb2IiLCJpYXQiOjEwMCwiZXhwIjo0MDAsImp0aSI6IjEyMzQ1In0.TfZZcle7LBm3s8b5nhNgNd04z8rc9CTc2HkqTMM-nI8" ]
}

@test "should require id" {
  run firefox
  [ $status -eq 1 ]
  [ "$output" = "firefox: must provide api id for firefox addons api" ]
}

@test "should require s8" {
  run firefox --id app
  [ $status -eq 1 ]
  [ "$output" = "firefox: must provide api secret for firefox addons api" ]
}

@test "should require .zip file as arg" {
  run firefox --id app --secret secret
  [ $status -eq 1 ]
  [ "$output" = "firefox: must provide web extension as .zip file" ]
}

@test "should handle api error" {
  run firefox --id app --secret secret hello.zip
  [ $status -eq 1 ]
}
