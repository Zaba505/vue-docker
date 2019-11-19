@test "should accept arg" {
  run jwt -a HS256 -s secret "{}"
  [ $status -eq 0 ]
  [ -n "$output" ]
}

@test "should accept pipe" {
  output=$(echo -en "{}" | jwt -a HS256 -s secret)
  [ -n "$output" ]
}

@test "verify output" {
  run jwt -a HS256 -s secret "{}"
  [ $status -eq 0 ]
  [ "$output" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M" ]
}

@test "verify complex claims" {
  local tok_fmt='{"iss":"%s","iat":%d,"exp":%d,"jti":"%s"}'

  claims=$(printf $tok_fmt "123" 1574200340 1574200640 751)
  run jwt -a HS256 -s secret $claims
  [ $status -eq 0 ]
  [ "$output" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIxMjMiLCJpYXQiOjE1NzQyMDAzNDAsImV4cCI6MTU3NDIwMDY0MCwianRpIjoiNzUxIn0.7A9ANmHXJMMUXdw0EIe6nqnvD8VFvmnlaxqDMI5tVUU" ]
}
