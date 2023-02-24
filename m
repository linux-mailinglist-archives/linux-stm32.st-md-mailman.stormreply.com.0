Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 184246A3B9D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 08:17:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF6BEC6A5FC;
	Mon, 27 Feb 2023 07:17:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4124C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 22:48:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id ko13so973668plb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 14:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=qeATGpMAUhlPhNlH9gLwCd/TfxdFp8lFPK3Fc+jb8A4=;
 b=Es3b3ycUyHUUzwLVFclE4aaFgl10/UTcec+goyMlkH/IUCyzlYs1lYdHiL7UhEwt3U
 TY692Ar4ptj+Or+3WFK5qEAhRXwp1uih2X/G+j7UiM+q0JiNAZru/VlDZA+KanFvhjJd
 Wn/pdc4L9yW3JWEDn/IZtvFmFxVeeSTQ6pNEunlboQf4p7lMtuSeFAdOLOxeabQwk4oY
 qw8njtIEm4wE5j7GkZYa1hc7099iTIRWn+J6KIQthbu/sS2MQ3R+A8vvpXUoKK4OI3rS
 hzr8O0m5LocQZF0GCwIObsnc9yEsBy6VunYD7vrNOwCe6DAa7qVYGzbfM6fnbmqRvJWE
 AIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qeATGpMAUhlPhNlH9gLwCd/TfxdFp8lFPK3Fc+jb8A4=;
 b=62t36sp7aYH5QCLUvQRt4zUvHH++xRsmIhGK/OU9i5hdGZWRBtCAbWWbIva3ZKaPlO
 0BsKDZ1fd/feqMSNMgAdoh5L7tXNROml+yXwsHqJW068dTl3iQK7y96AdXFiernjpHci
 4VfVS9m9+TzXRCjp1sbXeNA7Yx7o4p4LvCzctWcMgTLn0hqDr4Tcys4XwcDVBPeUDv8u
 ZRho2FZQA/aFQRlCmW9E6xuRE7qlvfrKyAPZ6nSiAW26iQSLhzJI0wu5LByi+u6EQ2h3
 WHhexSJTJK5dm3AElFWnBYOPcQZtSaEA1zCK8m4NDsBtRRK08qYq3Jue1HXA/qFJoFS6
 nSUg==
X-Gm-Message-State: AO0yUKWG7FfFC6xNvE0RDJjlHIXmAa49LUo73PKCwl2qRiy/P05sl9JP
 nWCVQvA6MmrALxwV/6py8Jk=
X-Google-Smtp-Source: AK7set+PhjoHKaKfk5icN0Rs8rA4nm5038euOGQAbYkKXG/+4fURV/b5B0PelIz1YulzEAHf6TFvvg==
X-Received: by 2002:a17:902:6b06:b0:19c:d5d4:843c with SMTP id
 o6-20020a1709026b0600b0019cd5d4843cmr2723168plk.20.1677278893220; 
 Fri, 24 Feb 2023 14:48:13 -0800 (PST)
Received: from google.com ([2601:647:6780:44b0:776c:a206:d0db:818b])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902bb8c00b00194a297cb8esm13674pls.191.2023.02.24.14.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 14:48:12 -0800 (PST)
Date: Fri, 24 Feb 2023 14:48:07 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Message-ID: <Y/k+p8IPY/ftl3KQ@google.com>
References: <20230219092848.639226-1-irogers@google.com>
 <20230219092848.639226-51-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230219092848.639226-51-irogers@google.com>
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:17:23 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Sandipan Das <sandipan.das@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 James Clark <james.clark@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 Kan Liang <kan.liang@linux.intel.com>,
 Suzuki Poulouse <suzuki.poulose@arm.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Sean Christopherson <seanjc@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Florian Fischer <florian.fischer@muhq.space>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: [Linux-stm32] [PATCH v1 50/51] perf stat: Use counts rather
	than saved_value
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sun, Feb 19, 2023 at 01:28:47AM -0800, Ian Rogers wrote:
> Switch the hard coded metrics to use the aggregate value rather than
> from saved_value. When computing a metric like IPC the aggregate count
> comes from instructions then cycles is looked up and if present IPC
> computed. Rather than lookup from the saved_value rbtree, search the
> counter's evlist for the desired counter.
> 
> A new helper evsel__stat_type is used to both quickly find a metric
> function and to identify when a counter is the one being sought. So
> that both total and miss counts can be sought, the stat_type enum is
> expanded. The ratio functions are rewritten to share a common helper
> with the ratios being directly passed rather than computed from an
> enum value.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
[SNIP]
> -static double runtime_stat_avg(enum stat_type type, int aggr_idx,
> -			       struct runtime_stat_data *rsd)
> +static double find_stat(const struct evsel *evsel, int aggr_idx, enum stat_type type)
>  {
> -	struct saved_value *v;
> -
> -	v = saved_value_lookup(NULL, aggr_idx, false, type, rsd->ctx, rsd->cgrp);
> -	if (!v)
> -		return 0.0;
> -
> -	return avg_stats(&v->stats);
> +	const struct evsel *cur;
> +	int evsel_ctx = evsel_context(evsel);
> +
> +	evlist__for_each_entry(evsel->evlist, cur) {
> +		struct perf_stat_aggr *aggr;
> +
> +		/* Ignore the evsel that is being searched from. */
> +		if (evsel == cur)
> +			continue;
> +
> +		/* Ignore evsels that are part of different groups. */
> +		if (evsel->core.leader->nr_members &&
> +		    evsel->core.leader != cur->core.leader)

The evsel->nr_members is somewhat confusing in that it counts itself
as a member.  I'm not sure it resets the nr_members to 0 for standalone
events.  You'd better checking nr_members greater than 1 for group
events.

Thanks,
Namhyung


> +			continue;
> +		/* Ignore evsels with mismatched modifiers. */
> +		if (evsel_ctx != evsel_context(cur))
> +			continue;
> +		/* Ignore if not the cgroup we're looking for. */
> +		if (evsel->cgrp != cur->cgrp)
> +			continue;
> +		/* Ignore if not the stat we're looking for. */
> +		if (type != evsel__stat_type(cur))
> +			continue;
> +
> +		aggr = &cur->stats->aggr[aggr_idx];
> +		if (type == STAT_NSECS)
> +			return aggr->counts.val;
> +		return aggr->counts.val * cur->scale;
> +	}
> +	return 0.0;
>  }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
