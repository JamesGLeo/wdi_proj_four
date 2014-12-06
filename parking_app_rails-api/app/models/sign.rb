class Sign
  scope :located_at,          ->
  scope :restricted_during,   ->

  def as_json(options = nil)
    super(options.merge(except: [:signsequence]))
  end
end