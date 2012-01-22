import unittest

def find_first_line(lines):
	for i, line in enumerate(lines):
		if line.startswith('*'):
			return i

def parse_as_list(string):
	"""
	Takes a string meant to represent a list and attempts to convert it into a list of strings
	e.g. "lol2","lol"
	(no beginning and closing brackets)
	"""
	unclosed_lists = 0
	unclosed_tuples = 0
	start_index = 0
	the_list = []
	for i, c in enumerate(string):
		if c == '[':
			unclosed_lists += 1
		if c == ']':
			unclosed_lists -= 1
		if c == '(':
			unclosed_tuples += 1
		if c == ')':
			unclosed_tuples -= 1
		if unclosed_lists == 0 and unclosed_tuples == 0 and c == ',':
			this_item = string[start_index:i]
			the_list.append(this_item)
			start_index = i + 1

	the_list.append(string[start_index:])
	return the_list

def get_values_list(lines, start, end):
	string = ''.join(map(lambda x: x.strip(), lines[start:end]))
	try:
		return parse_as_list(string[string.index('[') + 1:string.rindex(']')])
	except ValueError:
		print string

if __name__ == '__main__':
	class TestShit(unittest.TestCase):
		def runTest(self):
			cases = {
				'"lol","lol2"': ['"lol"', '"lol2"'],
				'[1,2,3],[1,2,3,4]': ['[1,2,3]', '[1,2,3,4]'],
				'2,4': ['2', '4'],
				'Node ((1,"lol"),Empty,Empty),Empty': ['Node ((1,"lol"),Empty,Empty)', 'Empty'],
				'Node ((1,"lol"),Empty,Empty),Empty,Empty,Empty': ['Node ((1,"lol"),Empty,Empty)', 'Empty', 'Empty', 'Empty'],
			}
			for string, expected in cases.iteritems():
				self.assertEqual(parse_as_list(string), expected)

	unittest.main()
