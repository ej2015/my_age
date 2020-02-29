# frozen_string_literal: true

require 'spec_helper'
require 'pry'

describe MyAge::Calculator do
  let(:user) { UserWithDob.new }
  let(:user_without_dob) { UserWithoutDob.new }

  it 'has a version number' do
    expect(MyAge::VERSION).not_to be nil
  end

  context 'user has dob attribute' do
    describe '#age' do
      it 'is zero if dob is blank' do
        user.dob = nil
        expect(user.age(Date.today)).to eq 0
      end

      it 'is zero if date is blank' do
        user.dob = Date.new(2000, 1, 1)
        expect(user.age(nil)).to eq 0
      end

      it 'is zero if date is smaller than dob' do
        user.dob = Date.new(9000, 1, 1)
        expect(user.age).to eq 0
      end

      it 'works without argument' do
        user.dob = Date.new(2000, 1, 1)
        expect(user.age).to be >= 18
      end

      context 'non-leap birthday' do
        before :each do
          user.dob = Date.new(1993, 1, 3)
        end
        it 'is zero before first birthday' do
          expect(user.age(Date.new(1994, 1, 2))).to eq 0
        end

        it 'is one on first birthday' do
          expect(user.age(Date.new(1994, 1, 3))).to eq 1
        end

        it 'is one before second birthday' do
          expect(user.age(Date.new(1995, 1, 2))).to eq 1
        end

        it 'is 2 on second birthday' do
          expect(user.age(Date.new(1995, 1, 3))).to eq 2
        end

        it 'is 4 on 4th birthday' do
          expect(user.age(Date.new(1997.1, 3))).to eq 4
        end

        it 'is 8 on 8th birthday' do
          expect(user.age(Date.new(2001, 1, 3))).to eq 8
        end

        it 'is 7 before 8th birthday' do
          expect(user.age(Date.new(2001, 1, 2))).to eq 7
        end

        it 'is 20 on 20th birthday' do
          expect(user.age(Date.new(2013, 1, 3))).to eq 20
        end

        it 'is 19 before 20th birthday' do
          expect(user.age(Date.new(2013, 1, 2))).to eq 19
        end

        it 'is 110 on 110th birthday' do
          expect(user.age(Date.new(2103, 1, 3))).to eq 110
        end
      end

      context 'leap day' do
        before :each do
          user.dob = Date.new(1996, 2, 29)
        end
        it 'is zero before first birthday' do
          expect(user.age(Date.new(1997, 2, 28))).to eq 0
        end

        it 'is one after first birthday' do
          expect(user.age(Date.new(1997, 3, 1))).to eq 1
        end

        it 'is one before second birthday' do
          expect(user.age(Date.new(1998, 2, 28))).to eq 1
        end

        it 'is 2 after second birthday' do
          expect(user.age(Date.new(1998, 3, 1))).to eq 2
        end

        it 'is 3 before 4th birthday' do
          expect(user.age(Date.new(2000, 2, 28))).to eq 3
        end

        it 'is 4 on 4th birthday' do
          expect(user.age(Date.new(2000, 2, 29))).to eq 4
        end

        it 'is 8 on 8th birthday' do
          expect(user.age(Date.new(2004, 2, 29))).to eq 8
        end

        it 'is 7 before 8th birthday' do
          expect(user.age(Date.new(2004, 2, 28))).to eq 7
        end

        it 'is 20 on 20th birthday' do
          expect(user.age(Date.new(2016, 3, 1))).to eq 20
        end

        it 'is 19 before 20th birthday' do
          expect(user.age(Date.new(2016, 2, 28))).to eq 19
        end

        it 'is 110 after 110th birthday' do
          expect(user.age(Date.new(2106, 3, 1))).to eq 110
        end
      end

      context 'before special non-leap year e.g. 2100' do
        before :each do
          user.dob = Date.new(2096, 3, 1)
        end

        it 'is 4 on 4th birthday' do
          expect(user.age(Date.new(2100, 3, 1))).to eq 4
        end
      end
    end
  end

  context 'user without dob attribute' do
    describe '#age' do
      it 'is one after first birthday' do
        user_without_dob.date_of_birth = Date.new(1996, 2, 28)
        expect(user_without_dob.age(Date.new(1997, 3, 1))).to eq 1
      end

      it 'is three before fourth birthday' do
        user_without_dob.date_of_birth = Date.new(1996, 2, 28)
        expect(user_without_dob.age(Date.new(2000, 2, 1))).to eq 3
      end
    end
  end
end
