require('spec_helper')

describe(Venue) do

  it{ should have_and_belong_to_many(:bands) }

  describe('#titlecase_name') do
    it('should put the venue names in titlecase when creating') do
      new_venue = Venue.create({:name => "crystal ballroom"})
      expect(Venue.find(new_venue.id()).name()).to(eq("Crystal Ballroom"))
    end
  end

  describe('#validates_uniqueness') do
    it('should not save a duplicate venue entry') do
      new_venue1 = Venue.create({:name => "crystal ballroom"})
      new_venue2 = Venue.create({:name => "Crystal Ballroom"})
      expect(Venue.all()).to(eq([new_venue1]))
    end
  end

  describe('#validates_presence') do
    it('should not accept a blank name') do
      new_venue = Venue.create({:name => ""})
      expect(Venue.all()).to(eq([]))
    end
  end
end
