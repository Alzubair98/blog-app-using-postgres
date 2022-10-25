require_relative '../rails_helper.rb'

RSpec.describe "post controller", :type => :request do
    context "the index method" do
        it "show all users" do
            get("/users/10/posts")
            expect(assigns(:posts)).to eq(Post.all)  
        end

        it "render index template" do
            get("/users/10/posts")
            expect(response).to render_template('index')  
        end
    
        it "the veiw body is correct (index)" do
            get("/users/10/posts")
            expect(response.body).to include('<h1>index for user posts</h1>')
        end
    end

    context "the show method" do
        it 'show specific user post veiw' do
            get("/users/403/posts/85")
            expect(response.body).to include('<h1>spesific user post</h1>')  
        end

        it 'render the correct page' do
            get('/users/403/posts/85')
            expect(response.body).to render_template('show')  
        end
    end
end