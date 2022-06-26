# I am a fake python script
class person:
	def __init__(self, name):
		self.name = name

	def greet(self):
		print("Hello, my name is " + self.name)

me = person(name = "David")
me.greet()