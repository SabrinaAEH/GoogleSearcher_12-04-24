require_relative '../lib/google_searcher.rb'

describe 'GoogleSearcher' do
    describe '#get_search_results' do
      it 'retourne une liste de résultats de recherche non vide' do
        results = get_search_results('test')
        expect(results).not_to be_empty
      end
  
    end
  end