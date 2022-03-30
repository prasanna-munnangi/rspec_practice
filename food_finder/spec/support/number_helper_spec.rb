# encoding: UTF-8
# frozen_string_literal: true

describe 'NumberHelper' do

  include NumberHelper

  describe '#number_to_currency' do

    context 'using default values' do

      it 'correctly formats an integer' do
        int_value = 10
        expect(number_to_currency(int_value)).to eq('$10.00')
      end

      it 'correctly formats a float' do
        float_value = 1000.10
        expect(number_to_currency(float_value)).to eq('$1,000.10')
      end

      it 'correctly formats a string' do
        string_value = '1213.65453'
        expect(number_to_currency(string_value)).to eq('$1,213.65')
      end

      it 'uses delimiters for very large numbers' do
        delimiter_value = 130_403_000_000
        expect(number_to_currency(delimiter_value)).to eq('$130,403,000,000.00')
      end

      it 'does not have delimiters for small numbers' do
        no_delimiter_value = 13
        expect(number_to_currency(no_delimiter_value)).to eq('$13.00')
      end

    end

    context 'using custom options' do

      it 'allows changing the :unit' do
        rupee_currency= '₹'
        integer_value = 100
        expect(number_to_currency(integer_value,
                                  unit: rupee_currency)).to eq('₹100.00')
      end

      it 'allows changing the :precision' do
        precision_value = 4
        float_value = 123.8394
        expect(number_to_currency(float_value,
                                  precision: precision_value)).to eq('$123.8394')
      end

      it 'omits the separator if :precision is 0' do
        precision_value = 0
        float_value = 531.523
        expect(number_to_currency(float_value,
                                  precision: precision_value)).to eq('$531')
      end

      it 'allows changing the :delimiter' do
        delimiter_value = '_'
        value = 103000000
        expect(number_to_currency(value,
                                  delimiter: delimiter_value)).to eq('$103_000_000.00')
      end

      it 'allows changing the :separator' do
        separator_value = '-'
        value = 134
        expect(number_to_currency(value,
                                  separator: separator_value)).to eq('$134-00')
      end

      it 'correctly formats using multiple options' do
        euro_currency = '£'
        precision_value = 3
        delimiter_value = '_'
        separator_value = '-'
        value = 100340.145
        expect(number_to_currency(value,
                                  unit: euro_currency,
                                  precision: precision_value,
                                  delimiter: delimiter_value,
                                  separator: separator_value)).to eq('£100_340-145')
      end

    end

  end

end
