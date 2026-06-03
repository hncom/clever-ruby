require "clever-ruby"

describe "URL encoding" do
  it "escapes configuration base URL without obsolete URI warnings" do
    config = Clever::Configuration.new
    config.host = "api.clever.com"
    config.base_path = "/v2.0 test"

    expect { expect(config.base_url).to eq("https://api.clever.com/v2.0%20test") }.
      not_to output(/URI\.(escape|encode) is obsolete/).to_stderr_from_any_process
  end

  it "escapes request URLs without obsolete URI warnings" do
    client = Clever::ApiClient.new

    expect { expect(client.build_request_url("/sections/test section")).to eq("https://api.clever.com/v2.0/sections/test%20section") }.
      not_to output(/URI\.(escape|encode) is obsolete/).to_stderr_from_any_process
  end
end
