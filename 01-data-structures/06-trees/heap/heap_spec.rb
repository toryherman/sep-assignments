include RSpec

require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { Heap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node with higher rating as a left child" do
      heap.insert(root, district)
      expect(root.left.title).to eq "District 9"
    end

    it "properly inserts a new node with a lower rating and reorganizes" do
      heap.insert(root, pacific_rim)
      expect(root.title).to eq "Pacific Rim"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a node" do
      heap.insert(root, braveheart)
      heap.insert(root, pacific_rim)
      expect(heap.find(root, "Pacific Rim").title).to eq "Pacific Rim"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes nodes" do
      heap.insert(root, hope)
      heap.insert(root, empire)
      heap.delete(root, "Star Wars: A New Hope")
      heap.delete(root, "Star Wars: The Empire Strikes Back")
      expect(heap.find(root, "Star Wars: A New Hope")).to be_nil
      expect(heap.find(root, "Star Wars: The Empire Strikes Back")).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, jedi)
       heap.insert(root, martian)
       heap.insert(root, pacific_rim)
       heap.insert(root, inception)
       heap.insert(root, braveheart)
       heap.insert(root, shawshank)
       heap.insert(root, district)
       heap.insert(root, mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nThe Matrix: 87\nInception: 86\nThe Shawshank Redemption: 91\nDistrict 9: 90\nMad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\nThe Martian: 92\n"
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, jedi)
       heap.insert(root, martian)
       heap.insert(root, pacific_rim)
       heap.insert(root, inception)
       heap.insert(root, braveheart)
       heap.insert(root, shawshank)
       heap.insert(root, district)
       heap.insert(root, mad_max_2)
       root = heap.root
       heap.delete(root, "Star Wars: Return of the Jedi")
       heap.delete(root, "Braveheart")
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
