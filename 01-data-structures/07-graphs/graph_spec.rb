include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:graph) { Graph.new() }

  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:chris_penn) { Node.new("Chris Penn") }
  let (:sarah_jessica_parker) { Node.new("Sarah Jessica Parker") }
  let (:zac_efron) { Node.new("Zac Efron") }
  let (:michelle_pfeiffer) { Node.new("Michelle Pfeiffer") }
  let (:robert_deniro) { Node.new("Robert De Niro") }
  let (:halle_berry) { Node.new("Halle Berry") }
  let (:ashton_kutcher) { Node.new("Ashton Kutcher") }
  let (:jessica_alba) { Node.new("Jessica Alba") }
  let (:kathy_bates) { Node.new("Kathy Bates") }
  let (:jessica_biel) { Node.new("Jessica Biel") }
  let (:bradley_cooper) { Node.new("Bradley Cooper") }
  let (:patrick_dempsey) { Node.new("Patrick Dempsey") }
  let (:amy_adams) { Node.new("Amy Adams") }
  let (:james_marsden) { Node.new("James Marsden") }
  let (:idina_menzel) { Node.new("Idina Menzel") }
  let (:julie_andrews) { Node.new("Julie Andrews") }
  let (:susan_sarandon) { Node.new("Susan Sarandon") }

  before do
    # Footloose
    kevin_bacon.film_actor_hash['Footloose'] = [lori_singer, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    lori_singer.film_actor_hash['Footloose'] = [kevin_bacon, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    john_lithgow.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, dianne_wiest, chris_penn, sarah_jessica_parker]
    dianne_wiest.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, chris_penn, sarah_jessica_parker]
    chris_penn.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, dianne_wiest, sarah_jessica_parker]
    sarah_jessica_parker.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, dianne_wiest, chris_penn]

    # New Year's Eve
    sarah_jessica_parker.film_actor_hash["New Year\'s Eve"] = [zac_efron, michelle_pfeiffer, robert_deniro, halle_berry, ashton_kutcher]
    zac_efron.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, michelle_pfeiffer, robert_deniro, halle_berry, ashton_kutcher]
    michelle_pfeiffer.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, robert_deniro, halle_berry, ashton_kutcher]
    robert_deniro.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, halle_berry, ashton_kutcher]
    halle_berry.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, robert_deniro, ashton_kutcher]
    ashton_kutcher.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, robert_deniro, halle_berry]

    # Valentine's Day
    ashton_kutcher.film_actor_hash["Valentine\'s Day"] = [jessica_alba, kathy_bates, jessica_biel, bradley_cooper, patrick_dempsey]
    jessica_alba.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, kathy_bates, jessica_biel, bradley_cooper, patrick_dempsey]
    kathy_bates.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, jessica_biel, bradley_cooper, patrick_dempsey]
    jessica_biel.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, bradley_cooper, patrick_dempsey]
    bradley_cooper.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, jessica_biel, patrick_dempsey]
    patrick_dempsey.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, jessica_biel, bradley_cooper]

    # Enchanted
    patrick_dempsey.film_actor_hash["Enchanted"] = [amy_adams, james_marsden, idina_menzel, julie_andrews, susan_sarandon]
    amy_adams.film_actor_hash["Enchanted"] = [patrick_dempsey, james_marsden, idina_menzel, julie_andrews, susan_sarandon]
    james_marsden.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, idina_menzel, julie_andrews, susan_sarandon]
    idina_menzel.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, julie_andrews, susan_sarandon]
    julie_andrews.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, idina_menzel, susan_sarandon]
    susan_sarandon.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, idina_menzel, julie_andrews]
  end

  describe "#find_kevin_bacon(kevin, actor)" do
    # have to split up tests, otherwise all nodes must be reset between each test
    it "properly finds connection of first degree actor" do
      expect(graph.find_kevin_bacon(kevin_bacon, sarah_jessica_parker)).to eq ["Footloose"]
    end

    it "properly finds connection of second degree actor" do
      expect(graph.find_kevin_bacon(kevin_bacon, ashton_kutcher)).to eq ["New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of third degree actor" do
      expect(graph.find_kevin_bacon(kevin_bacon, bradley_cooper)).to eq ["Valentine's Day", "New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of fourth degree actor" do
      expect(graph.find_kevin_bacon(kevin_bacon, amy_adams)).to eq ["Enchanted", "Valentine's Day", "New Year\'s Eve", "Footloose"]
    end
  end
end
