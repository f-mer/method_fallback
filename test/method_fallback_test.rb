require 'test_helper'

describe MethodFallback do
  describe 'when alias is given' do
    it 'returns aliased' do
      klass = Class.new do
        include MethodFallback

        def foo
          nil
        end

        def baz
          OpenStruct.new(bar: :bar)
        end

        fallback foo: :bar, to: :baz
      end

      expect(klass.new.foo).must_equal(:bar)
    end
  end

  describe 'when original is present' do
    it 'returns the original' do
      klass = Class.new do
        include MethodFallback

        def foo
          :foo
        end

        fallback :foo, to: :bar
      end

      expect(klass.new.foo).must_equal(:foo)
    end
  end

  describe 'when original is nil' do
    it 'returns the fallback' do
      klass = Class.new do
        include MethodFallback

        def foo
          nil
        end

        def bar
          OpenStruct.new(foo: :bar)
        end

        fallback :foo, to: :bar
      end

      expect(klass.new.foo).must_equal(:bar)
    end
  end

  describe 'when :to is nil' do
    it 'returns nil' do
      klass = Class.new do
        include MethodFallback

        def foo
          nil
        end

        def bar
          nil
        end

        fallback :foo, to: :bar
      end

      expect(klass.new.foo).must_be_nil
    end
  end

  it 'preserves the original accessor' do
    klass = Class.new do
      include MethodFallback

      def foo
        nil
      end

      def bar
        :bar
      end

      fallback :foo, to: :bar
    end

    expect(klass.new.foo_without_fallback).must_be_nil
  end
end
