Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '490368754455301', '33a7536a83353f1ea80b75d05040b927'
    provider :github, 'cad3332606911153a538', 'ac262139dfefe28c07e0f8a50732b1846b5c9c68'
    provider :twitter, 'fLPhpGxxfe68yELYi1VInlLDB', '4gIFLRUjk6mgeWTCVuqeCzxNGsiYSJrcrA2p5I1GQtIDCo9Yit'
end