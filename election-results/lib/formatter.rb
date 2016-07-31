class Formatter

  PARTY_CODES = { C: "Conservative Party",
  L: "Labour Party",
  UKIP: "UKIP",
  LD: "Liberal Democrats",
  G: "Green Party",
  Ind: "Independent",
  SNP: "SNP" }



  def format_file file
    formatted_results = []

    broken_up = file.split(", ")

    formatted_results << broken_up.shift




    party_and_vote = broken_up.each_slice(2)



  party_and_vote.each { |votes, party_code|

      party_code = party_code_lookup PARTY_CODES, party_code
      formatted_results << party_code

      formatted_results << votes
    }






  end

  def party_code_lookup party_codes, party_code
    party_codes.select {|code, party_name| code.to_s == party_code}.values[0]
  end

  def votes_total results
    results.inject {|total, votes| total += votes }
  end



end
