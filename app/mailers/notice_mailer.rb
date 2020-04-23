class NoticeMailer < ApplicationMailer
	default to: "nekonyan.yuki51@gmail.com"

	def alert()
		mail(subject: "失敗しました")
	end
end
