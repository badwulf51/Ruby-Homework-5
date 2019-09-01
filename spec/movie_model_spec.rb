require 'rails_helper'


describe Movie do
  context 'other movies by that director' do
    it 'finds movies with same director' do
        movie1 = Movie.create(title: 'Movie1', director: 'Director1')
        movie2 = Movie.create(title: 'Movie2', director: 'Director1')
        results = Movie.similar_movies(movie1.id)
        expect(results).to eq([movie1, movie2])
    end        
  end    

  context 'no other movies by that director' do
    it 'finds no other movies with same director' do
        # YOUR TEST CODE HERE
        # Remove the pending and fail lines to execute your test code
        #pending "Implement this test!"
        #fail
    end
  end
end