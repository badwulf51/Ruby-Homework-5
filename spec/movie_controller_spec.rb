require 'rails_helper'

describe MoviesController, type: 'controller' do
    let(:movies) { ['star wars', 'raiders'] }    
    
    context '#search_directors' do
        describe 'movie has a director' do
            it 'responds to the search_directors route' do
              get :search_directors, { id: 1 }
            end
        end 
        
        describe 'search similar movies' do
          it 'queries the Movie model about similar movies' do
            @movie = Movie.create(:id => "101", title: "Vault", director: "Lone Vaulter")
            get :search_directors, id: @movie[:id]
            expect(response).to redirect_to(movies_path)
          end
          
          it 'assigns similar movies to the template' do
            @movieTest1 = Movie.create(:id => "102", title: "Vault 2", director: "Lone Vaulter")
            @movieTest2 = Movie.create(:id => "103", title: "Vault 3", director: "Lone Vaulter")
            get :search_directors, id: @movieTest1[:id]
            expect(Movie.where(:director => @movieTest2.director).size).to eq(2)
          end
        end

        describe "#create a movie" do 
          before(:all) do 
            @movie_create_params = {title: "test",rating: "G", description: "A test movie", director: "Test Director", release_date: 20190101}
          end
          
          it "create a movie" do 
            expect{post :create, movie: @movie_create_params}.to change{Movie.all.size}.by(1)
          end
        end
        
    end    
end