module LinkHelper
	def linkHelper(int, path, cancan: nil)
		link_to t(int), path, cancan
	end
end