//: [Previous](@previous)

import Foundation

//MARK : - RSA Keys
var RSA_P=3
var RSA_Q=11
var RSA_N=33
var RSA_M=20
var RSA_E=7
var RSA_D=3

//MARK: - Exponent extension

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

//MARK: - ENCRYPTION

print("Note : We'll take here static values in order to make sure it works due to limitations with too big exponents and modulo.")

print("With what we created here, we can just encrypt integers that must be smaller than p and q. Let's do that")

print("Let's pick a number smaller than p and q. For this, we check which one is the smaller and then we remove it two. This avoids problem with too small numbers.")

var message = 2

print("We now encrypt our message. To do this we use the number we just randomly choose and put it on exponent 'e' which is the first part of the public key. We then modulo it by 'n', which is the second part of our public key.")

var encryptedMessage = (message ^^ RSA_E) % RSA_N

print("As simple as that ! This was our message : \(message) and now we encrypted it and it is : \(encryptedMessage).")

//MARK: - DECRYPTION

print("Let's decrypt it now, remember our encrypted message is : \(encryptedMessage).")

var decryptedMessage = 0

print("To decrypt it, we just need to put our received encrypted message to the power of d and modulo it by n.")

decryptedMessage = (encryptedMessage ^^ RSA_D) % RSA_N

print("Here we go ! Our message was :", encryptedMessage)

print("This is the end ! Hope you liked it. Thanks for trying it ! You can find more infos on why I did this project on the next and last page.")

//: [Next](@next)
