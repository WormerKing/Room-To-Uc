module UsersHelper
	def scroll_method
		arr = ["<script>","kaydır();","</script>"]
		arr.join.html_safe
	end
end
