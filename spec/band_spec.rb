require('spec_helper')

describe(Band) do

  it{ should have_and_belong_to_many(:venues) }

  describe('#titlecase_name') do
    it('should put the band names in titlecase when creating') do
      new_band = Band.create({:name => "rolling stones"})
      expect(Band.find(new_band.id()).name()).to(eq("Rolling Stones"))
    end
  end

  describe('#validates_uniqueness') do
    it('should not save a duplicate band entry') do
      new_band1 = Band.create({:name => "rolling stones"})
      new_band2 = Band.create({:name => "Rolling Stones"})
      expect(Band.all()).to(eq([new_band1]))
    end
  end

  describe('#validates_presence') do
    it('should not accept a blank name') do
      new_band = Band.create({:name => ""})
      expect(Band.all()).to(eq([]))
    end
  end
end
