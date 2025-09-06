# Arabic Lexical Semantic Relation Dataset (ASRD)

ASRD
Arabic Lexical Semantic Relation Dataset contains over 1.6 million diacritized examples for various semantic relations. 
[![DOI](https://zenodo.org/badge/931998777.svg)](https://doi.org/10.5281/zenodo.15486724)

## 📚 Selected Resources

Five Arabic semantic resources were used as the foundation for constructing the dataset:

- **Arabic WordNet (AWN)**  
  A specialized version of the Princeton WordNet (PWN) for Arabic. AWN includes Arabic-specific senses in addition to synsets aligned with PWN. It distinguishes between two types of hypernym relations: *subclass-of* for concepts and *instance-of* for objects.  
  🔗 [AWN Website](http://globalwordnet.org/resources/arabic-wordnet/)

- **Open Multilingual WordNet**  
  A multilingual WordNet that links concepts and synsets to PWN. Only concepts that can be aligned with PWN are retained; others are discarded.  
  🔗 [OMW](https://omwn.org/omw1.html)

- **The Arabic Ontology**  
  An ontology using *subsumption* as a backbone relation, along with other semantic links like *InstanceOf*, *PartOf*, *SameAs*, and *SubClassOf*. It contains instantiable concepts rooted in expert, scientific, and commonsense knowledge.  
  🔗 [Arabic Ontology](https://ontology.birzeit.edu/)

- **RADIF Thesaurus (for Antonymy and Synonymy)**  
  A resource containing synonyms, antonyms, rhymes (qawafi), and plurals extracted from the Radif mobile application.  
  🔗 [GitHub Repo](https://github.com/mdanok/ArabicLT)  
  🔗 [Radif App on Play Store](https://play.google.com/store/apps/details?id=com.tahadz.radif_dictionary)

- **Qur’an Ontology**  
  Covers Quranic chapters, verses, lemmas, roots, pronouns, named entities, and events.  
  🔗 [Qur’an Ontology](http://www.quranontology.com/)

## 📊 Number of Examples per Semantic Relation Type

| **Relation Type**       | **Number of Examples** |
|-------------------------|------------------------:|
| hyponym                | 625,979                |
| hypernym               | 621,422                |
| synonym                | 327,952                |
| verb_groups            | 26,438                 |
| entailments            | 12,289                 |
| antonym                | 12,033                 |
| causes                 | 7,832                  |
| has_instance           | 3,281                  |
| is_instance            | 3,281                  |
| part_meronyms          | 2,197                  |
| part_holonyms          | 2,192                  |
| member_meronyms        | 1,172                  |
| member_holonyms        | 1,167                  |
| attributes             | 588                    |
| similar                | 406                    |
| also_sees              | 328                    |
| substance_holonyms     | 187                    |
| substance_meronyms     | 187                    |
| **Total**              | **1,648,931**          |
## Contact Author 
Randah Alharbi (raharbi@uqu.edu.sa)
