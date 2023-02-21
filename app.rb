class Gpt
    def initialize
        @client = OpenAI::Client.new
    end

    def self.run
        new.start
    end

    def start
        puts "\n What would you like to ask GPT-3? Type 'exit' to quit. \n".green
        ask_gpt
    end

    private

    def ask_gpt
        user_input = gets.chomp
        
        if user_input == "exit"
            end_app
        else
            response(user_input)
            ask_gpt
        end
    end

    def end_app
        puts "Goodbye!"
        exit
    end

    def response(user_input)
        response = @client.completions(
            parameters: {
                model: "text-davinci-003",
                prompt: user_input,
                max_tokens: 50,
                temperature: 0.3,
                top_p: 1,
                frequency_penalty: 0,
                presence_penalty: 0
            }
        )
        puts response["choices"].map { |choice| choice["text"].chomp.yellow + "\n \n" }
    end

end