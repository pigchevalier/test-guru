GistResult = Struct.new(:hash, :url, :response) do
  def success?
    response.status == 201
  end
end
