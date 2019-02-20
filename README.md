Compiler can not pattern match a swift error to an error type defined in a generic class if the pattern is not specialized and the error has an associated value of the generic placeholder type. Given the following example class:

```swift
class SomeClass<SomeType> {

	enum SomeError: Error {

		case someErrorCase(SomeType)

	}

	func someFunction(someParameter: SomeType) throws {
		throw SomeError.someErrorCase(someParameter)
	}

}
```

The compiler will not be able to compile the following do-catch statement but will also not error out and continue to run indefinitely:

```
do {
	let someInstance = SomeClass<Int>()
	try someInstance.someFunction(someParameter: 0)
} catch SomeClass.SomeError.someErrorCase {
	print("caught some error case")
}
```

If the catch statement is specialized from `SomeClass.SomeError.someErrorCase` to `SomeClass<Int>.SomeError.someErrorCase` then the compiler will succeed, however the indexing process that runs in the background will still struggle with this line of code and will continue to use CPU resources at an elevated level until the project is closed.

Link to swift bug: https://bugs.swift.org/browse/SR-6692
