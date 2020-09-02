package com.f5704.ask.service.repository;

import static org.elasticsearch.index.query.QueryBuilders.termQuery;
import static org.elasticsearch.index.query.QueryBuilders.boolQuery;

import org.apache.commons.lang.StringUtils;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryStringQueryBuilder;
import org.elasticsearch.index.query.QueryStringQueryBuilder.Operator;
import org.elasticsearch.search.highlight.HighlightBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;
import org.springframework.stereotype.Component;

import com.f5704.ask.util.query.FAggResultExtractor;
import com.f5704.ask.util.query.FResultMapper;
import com.f5704.ask.web.model.Topic;

@Component
public class TopicRepositoryImpl implements TopicEsCommonRepository {
	private ElasticsearchTemplate elasticsearchTemplate;

	@Autowired
	public void setElasticsearchTemplate(ElasticsearchTemplate elasticsearchTemplate) {
		this.elasticsearchTemplate = elasticsearchTemplate;
		if (!elasticsearchTemplate.indexExists(Topic.class)) {
			elasticsearchTemplate.createIndex(Topic.class);
		}
		if (!elasticsearchTemplate.typeExists("f5704", "f5704_ask_topic")) {
			elasticsearchTemplate.putMapping(Topic.class);
		}
	}

	@Override
	public Page<Topic> getTopicByCate(String cate, String q, final int p, final int ps) {

		Page<Topic> pages = null;
		BoolQueryBuilder boolQueryBuilder=boolQuery();
		for (int i=0;i<cate.length();++i)
			boolQueryBuilder.must(termQuery("cate", String.valueOf(cate.charAt(i))));
		NativeSearchQueryBuilder searchQueryBuilder = new NativeSearchQueryBuilder().withQuery(boolQueryBuilder)
				.withSort(new FieldSortBuilder("top").unmappedType("boolean").order(SortOrder.DESC))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC));
		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		searchQueryBuilder.withHighlightFields(new HighlightBuilder.Field("title").fragmentSize(200));
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			if (!StringUtils.isBlank(q)) {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FResultMapper());
			} else {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
			}
		}
		return pages;
	}

	@Override
	public Page<Topic> getTopicByCateAndUser(String cate, String q, String user, final int p, final int ps) {

		Page<Topic> pages = null;
		NativeSearchQueryBuilder searchQueryBuilder = new NativeSearchQueryBuilder().withQuery(termQuery("cate", cate))
				.withQuery(termQuery("creater", user))
				.withSort(new FieldSortBuilder("top").unmappedType("boolean").order(SortOrder.DESC))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC));

		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {

			if (!StringUtils.isBlank(q)) {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FResultMapper());
			} else {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
			}
		}
		return pages;
	}

	@Override
	public Page<Topic> findByCon(NativeSearchQueryBuilder searchQueryBuilder, String q, final int p, final int ps) {
		Page<Topic> pages = null;
		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			if (!StringUtils.isBlank(q)) {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FResultMapper());
			} else {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
			}
		}
		return pages;
	}

	@Override
	public Page<Topic> getTopicByCateAndRela(String cate, String field, int p, int ps) {

		Page<Topic> pages = null;
		SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(termQuery("cate", cate))
				.withSort(new FieldSortBuilder(field).unmappedType("integer").order(SortOrder.DESC)).build()
				.setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
		}
		return pages;
	}

	@Override
	public Page<Topic> countByCon(NativeSearchQueryBuilder searchQueryBuilder, String field, String q, int p, int ps) {
		Page<Topic> pages = null;
		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FAggResultExtractor(field));
		}
		return pages;
	}

	@Override
	public Page<Topic> getAllTopic(String q, int p, int ps) {
		Page<Topic> pages = null;
		NativeSearchQueryBuilder searchQueryBuilder = new NativeSearchQueryBuilder()
				.withSort(new FieldSortBuilder("top").unmappedType("boolean").order(SortOrder.DESC))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC));
		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		searchQueryBuilder.withHighlightFields(new HighlightBuilder.Field("title").fragmentSize(200));
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			if (!StringUtils.isBlank(q)) {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FResultMapper());
			} else {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
			}
		}
		return pages;
	}

	@Override
	public Page<Topic> getTopicByUser(String user, String q, int p, int ps) {
		Page<Topic> pages = null;
		NativeSearchQueryBuilder searchQueryBuilder = new NativeSearchQueryBuilder().withQuery(termQuery("creater", user))
				.withSort(new FieldSortBuilder("top").unmappedType("boolean").order(SortOrder.DESC))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC));
		if (!StringUtils.isBlank(q)) {
			searchQueryBuilder.withQuery(new QueryStringQueryBuilder(q).defaultOperator(Operator.AND));
		}
		searchQueryBuilder.withHighlightFields(new HighlightBuilder.Field("title").fragmentSize(200));
		SearchQuery searchQuery = searchQueryBuilder.build().setPageable(new PageRequest(p, ps));
		if (elasticsearchTemplate.indexExists(Topic.class)) {
			if (!StringUtils.isBlank(q)) {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class, new FResultMapper());
			} else {
				pages = elasticsearchTemplate.queryForPage(searchQuery, Topic.class);
			}
		}
		return pages;
	}
}
