require 'test_helper'

describe Category do
   it 'is nestable' do
     assert_includes self.class.desc.included_modules, CollectiveIdea::Acts::NestedSet::Model
   end
end
