class String  
    def br_to_new_line  
        self.gsub('<br>', "\n")  
    end  
    def strip_tag  
        self.gsub(%r[<[^>]*>], '')  
    end  
		def strip_all_tag
			self.gsub(%r[<.*>], '')
		end
		def strip_51job_tag
			self.gsub(%r[<br.*], '').gsub(%r[<[^>]*>], '')
		end
end #String 