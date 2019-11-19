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
