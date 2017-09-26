require 'spec_helper'

describe 'Survey' do
  let(:survey) { Survey.new({title: "what dog do you like?"}) }

  describe '#capitalizes_title' do
    it 'will capitalizes each word in title before saving' do
      survey.save
      expect(survey.title).to eq "What Dog Do You Like?"
    end
  end
end
