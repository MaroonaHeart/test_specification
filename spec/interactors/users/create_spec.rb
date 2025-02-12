# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Users::Create, type: :interactor do
  describe '.execute' do
    subject { described_class.run(params) }

    before do
      create(:skill, name: 'postgreSQL')
      create(:skill, name: 'rails')
      create(:interest, name: 'psychology')
      create(:interest, name: 'programming')
    end

    context 'when params is valid' do
      let(:params) { attributes_for(:user).merge(skills: 'ruby, rails, docker, postgreSQL', interests: ['psychology', 'programming']) }

      it 'creates user' do
        expect { subject }.to(change(User, :count).by(1))
      end

      it 'creates user with skills' do
        expect(subject.user.skills.pluck(:name)).to eq ['postgreSQL', 'rails']
      end

      it 'creates user with interests' do
        expect(subject.user.interests.pluck(:name)).to eq ['psychology', 'programming']
      end
    end

    context 'when user with email exists' do
      before { create(:user, email: 'job.offer@gmail.com') }
      let(:params) { attributes_for(:user).merge(email: 'job.offer@gmail.com') }

      it 'has error on email' do
        expect { subject }.not_to change(User, :count)
        expect(subject.errors.messages[:email]).to eq(['A user with that email already exists'])
      end
    end

    context 'when params is invalid' do
      let(:params) { nil }

      it 'raises ArgumentError' do
        expect { subject }.to(raise_error(ArgumentError, 'inputs must be a hash, ActiveInteraction::Inputs, or ActionController::Parameters'))
      end
    end
  end
end
