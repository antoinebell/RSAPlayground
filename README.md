# RSAPlayground
This Swift Playground shows how to create RSA keys in order to encrypt and decrypt small messages.

This example will illustrate in simple terms how RSA works. 

## What is RSA ? ##

RSA is an asymetrical cryptography algorithm. It works with two keys as we'll see now.
Alice will create two key, one public, one private. In order to create them, she will choose thw prime numbers p and q. We have then n = p * q. Finally, she also choose e, another prime. She will publish her public key as (RSA, n, e).
To send her a message, you just need to use her public key and her only will be able to decrypt the message with her private key.
The strength of this algorithm is that it is nearly impossible to find quickly enough p and q from n because of the size of the numbers used.

## What will you find in the playground ? ##

You will find the process of creating the keys with small prime numbers and you'll be able to see how encryption and decryption works.

## Why creating this ? ##

This was my project for WWDC 2017.
What's more, I have to write an article for my studies about cryptography and RSA is one of the part inside the article.

## License ##

RSAPlayground is available under the MIT License.
Copyright 2017 Antoine Bellanger.
