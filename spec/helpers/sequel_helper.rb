# Overidding Minitest::Test.run method to be able to wrap
# queries within a rollbacked transaction
# It's the only way I found to do it since Minitest >= 5.0

class Minitest::Test
  alias_method :minitest_test_run, :run
  def run
    run = nil
    Sequel::Model.db.transaction(:rollback=>:always) do
      run = minitest_test_run
    end
    return run
  end
end
