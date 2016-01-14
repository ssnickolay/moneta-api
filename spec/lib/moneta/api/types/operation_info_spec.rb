describe Moneta::Api::Types::OperationInfo do
  let(:operation_info) { described_class.new }

  describe '#add_attribute' do
    subject {
      operation_info.attribute
      operation_info.add_attribute(item)
      operation_info.attribute
    }

    context 'when item instance of Moneta::Api::Types::KeyValueAttribute' do
      let(:item) { Moneta::Api::Types::KeyValueAttribute.new.fill(key: 'key', value: 'value') }

      its(:count) { is_expected.to eq 1 }
    end

    context 'when wrong item' do
      let(:item) { String.new }

      it { expect{ subject }.to raise_error(TypeError) }
    end
  end

  describe '#get_attribute' do
    before do
      operation_info.add_attribute(Moneta::Api::Types::KeyValueAttribute.new.fill(key: 'key', value: 'value'))
    end

    subject { operation_info.get_attribute('key') }

    it { is_expected.to be_a Moneta::Api::Types::KeyValueAttribute }
  end
end
