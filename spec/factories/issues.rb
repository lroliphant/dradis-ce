FactoryBot.define do
  factory :issue do
    sequence(:text) { |n| "#[Title]#\nRspec multiple Apache bugs #{n}\n\n#[Description]#\nFoo" }
    author { 'factory_bot' }
    category { Category.issue }
    node { Project.new.issue_library }
    state { :published }

    trait :tagged_issue do
      after :create do |issue|
        issue.tags << FactoryBot.create(:tag)
      end
    end

    trait :with_liquid do
      text {
        "#[Title]#\nFoo\n\n#[Description]#\nLiquid: {{issue.title}}\n\nProject: {{project.name}}"
      }
    end
  end
end
