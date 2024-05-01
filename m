Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1178B88DC
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 13:06:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D65FC7129E;
	Wed,  1 May 2024 11:06:48 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129BFC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 11:06:41 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso6154347b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714561599; x=1715166399;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVIfCEDLcryVh1sxegO1WMzH32gqhTaOJpqJeO8zPZI=;
 b=V/HQM9aC8efoD2lMpBzQ3Hl89JFzuMmPxqo64gLIbXZ6DEgu2kT9DcHsETWs9eSVzI
 D+kpVVFnXhd0/1ajic1AGEHKdoWZV2y7xsgLmLgvLZeaZhlIiydJ6h/HU2CV4o9q/al0
 SLgyrxsq825ohrwyr5Zg0sunJQH8aShXhGTQp6PnD4M4hId37bsr2bn36CgBMSJB3QTH
 Z0YuLqRTdxNNceNiBo7934JAvAml4teFKjeNWFQU6SmWpBM0x0Z9AE5EvJD8IYXwL+Lm
 i240lZRhV4FtfTr+vEO4nhwqpMIMCqTFQEs+KdKJtlYh95JeyIBhIsG/1tXTLCtxNjoD
 R02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714561599; x=1715166399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVIfCEDLcryVh1sxegO1WMzH32gqhTaOJpqJeO8zPZI=;
 b=CJ43lRu/T9HxZE06CEYvHvIbcWwp2j1Y36MlvTqeLBlr/4rqfU7E1Orf2soM4K0owU
 WzQ3PkFoaNa7UpYO54AupkL2RpGjnI4WyaXJydCSA5MZJBnzA6RwzijvtYY/dIZa1KQr
 0nLS41ExhsHX6m0Lfbfxz32n3Kvsci3EwFC1wEBaJgmvkQIlbU/pJk/WXfClpmsYOylr
 5+mYYlTn+MSzISTaorGtfJlGP/G6ZMc7tP7aSbCaF/WZUDIUsrkS+YRODNg+YyrV8Pir
 JaQv/Dw5qBSCJKzRT+zJhxNSTGyDgFUsHQjcy6ORBm1zwdq3SZNXKhouFbyfazjbfsBH
 3lqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI/ELcCqno2ew2DW7Ww6mwE4WjVuAmWV2lZ6kg8K4c9GlkQtlcnHsVhNj6Xy4GU5Me9Z2lmc/Bz+ID8Qcqig+dk6Ey86hhh5zMsM9MRrNFI6LDOA1sI3jD
X-Gm-Message-State: AOJu0Yz1BlaCKIRqsHfLwcBKuFroCW1EoO5n4y03/c5GvrgisZt/Z3iN
 6z8DdB9d+BATEMR1Bepq4ChrRFjWN6KGESBgAkSi9sjKvuq7PNoZiblgxVWK+3I+BGdFkBcmF4f
 jZ7BCyo//mQwj5mSuBukAB4/pwvul9rA7L3bKJQ==
X-Google-Smtp-Source: AGHT+IEIeZDG2abjSl7JiRn4xQhRhE22MbWI7q0YUcF0ys8JS5PMok3Dg8kUX1MoLmYeliXkgq+kWLLlOGEYtodZ7Ag=
X-Received: by 2002:a05:6a20:5a89:b0:1a7:9e85:c28f with SMTP id
 kh9-20020a056a205a8900b001a79e85c28fmr1964085pzb.48.1714561599628; Wed, 01
 May 2024 04:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-9-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-9-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 May 2024 12:06:28 +0100
Message-ID: <CAJ9a7VgAg==xysGSjR9Cd5oO1+=HQF0xxcpamgntb_PV6aw6JQ@mail.gmail.com>
To: James Clark <james.clark@arm.com>
Cc: scclevenger@os.amperecomputing.com, Mark Rutland <mark.rutland@arm.com>,
 Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH 08/17] coresight: Remove unused stubs
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

On Mon, 29 Apr 2024 at 16:24, James Clark <james.clark@arm.com> wrote:
>
> This file is never included anywhere if CONFIG_CORESIGHT is not set so
> they are unused and aren't currently compile tested with any config so
> remove them.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.h   | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index bebbadee2ceb..744531158d6b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -62,7 +62,6 @@ struct etm_event_data {
>         struct list_head * __percpu *path;
>  };
>
> -#if IS_ENABLED(CONFIG_CORESIGHT)
>  int etm_perf_symlink(struct coresight_device *csdev, bool link);
>  int etm_perf_add_symlink_sink(struct coresight_device *csdev);
>  void etm_perf_del_symlink_sink(struct coresight_device *csdev);
> @@ -77,23 +76,6 @@ static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
>  int etm_perf_add_symlink_cscfg(struct device *dev,
>                                struct cscfg_config_desc *config_desc);
>  void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
> -#else
> -static inline int etm_perf_symlink(struct coresight_device *csdev, bool link)
> -{ return -EINVAL; }
> -int etm_perf_add_symlink_sink(struct coresight_device *csdev)
> -{ return -EINVAL; }
> -void etm_perf_del_symlink_sink(struct coresight_device *csdev) {}
> -static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
> -{
> -       return NULL;
> -}
> -int etm_perf_add_symlink_cscfg(struct device *dev,
> -                              struct cscfg_config_desc *config_desc)
> -{ return -EINVAL; }
> -void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc) {}
> -
> -#endif /* CONFIG_CORESIGHT */
> -
>  int __init etm_perf_init(void);
>  void etm_perf_exit(void);
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
