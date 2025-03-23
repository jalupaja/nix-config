{
  security.acme = {
    acceptTerms = false;

    defaults.email = "REDACTED";
  };

  services.nginx = {
    enable = false;
    virtualHosts."test.local" = {
      forceSSL = true;
      enableACME = false;

      listen = [ {addr = "127.0.0.1"; port=88; ssl=true; } ];
      locations."/".proxyPass = "http://localhost:5173/";

      sslCertificate = "/etc/ngx-selfsigned.crt";
      sslCertificateKey = "/etc/ngx-selfsigned.key";

    };
  };
}
