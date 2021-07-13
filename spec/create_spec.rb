describe 'creating bears table' do
  let(:db) do
    SQLite3::Database.new(':memory:')
  end

  before do
    sql = File.read("lib/create.sql")
    db.execute_batch(sql)
  end

  it "creates a bears table with a name field" do
    expect { db.execute("SELECT name FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with a age field" do
    expect { db.execute("SELECT age FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with a sex field" do
    expect { db.execute("SELECT sex FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with a color field" do
    expect { db.execute("SELECT color FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with a temperament field" do
    expect { db.execute("SELECT temperament FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with an alive field" do
    expect { db.execute("SELECT alive FROM bears;") }.not_to raise_exception
  end

  it "creates a bears table with an id as a primary key" do
    expect(db.execute("PRAGMA table_info(bears);").detect { |arr| arr[-1] == 1 && arr[2] == "INTEGER" }.length).to eq(6)
  end
end
