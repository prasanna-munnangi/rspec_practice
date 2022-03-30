describe 'String' do

  describe '#titleize' do

    it 'capitalizes each word in a string' do
      words = 'i am a disco dancer'
      expect(words.titleize).to eq('I Am A Disco Dancer')
    end

    it 'works with single-word strings' do
      single_word = 'gregarious'
      expect(single_word.titleize).to eq('Gregarious')
    end

    it 'capitalizes all uppercase strings' do
      uppercase_string = 'I AM ALL THE WAY UP'
      expect(uppercase_string.titleize).to eq('I Am All The Way Up')
    end

    it 'capitalizes mixed-case strings' do
      mixedcase_string = 'food FInder AppLiCation'
      expect(mixedcase_string.titleize).to eq('Food Finder Application')
    end

  end

  describe '#blank?' do

    it 'returns true if string is empty' do
      expect(''.blank?).to be true
    end

    it 'returns true if string contains only spaces' do
      expect('  '.blank?).to be true
    end

    # Get a tab using a double-quoted string with \t
    # example: "\t\t\t"
    it 'returns true if string contains only tabs' do
      expect("\t\t\t".blank?).to be true
    end

    it 'returns true if string contains only spaces and tabs' do
      expect("  \t\t\t".blank?).to be true
    end

    it 'returns false if string contains a letter' do
      expect('a  d'.blank?).to be false
    end

    it 'returns false if string contains a number' do
      expect('a9342s  '.blank?).to be false
    end

  end

end
