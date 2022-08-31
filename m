Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 509EA5A83CB
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 18:58:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 007B7C03FDB;
	Wed, 31 Aug 2022 16:58:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2789C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 16:58:28 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so12938985pjk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=TupKKvR6dZz/3iGpRAyOcguuOG/Q6iuwOMieQ0bzyVU=;
 b=uSF2CEdt7dbN626BZ+yeyXPs6NUKow3AXH68ik8oWTc9KRrPdpTHY0tvt4iy05cXPo
 Gjf098D8/sguiFHNa5vvueI29pc24OwxK9+oZLZHGj40yyewW47G7GEUu1nZr1HJvsgR
 Vx7uhEjIqSLjUdpTvFnC/Y+8sbJZhb2biBPPm+R8vc8zAiIat69QzHj2M4lRPFWMu2nR
 2sg+Ak8gYSSbZXxEAYFBHTmJuPxQJkTmcjUGgc5GVn5zxukfragxRf9Rw7gEhoSjyNm1
 ghvd5lGDw882s+erKsZyb+B+U8/31I96vFEjc383BYQPVJMtPuZEcgPycgx6i39+8yvp
 9Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=TupKKvR6dZz/3iGpRAyOcguuOG/Q6iuwOMieQ0bzyVU=;
 b=SqrXYlgbaxmnykLoSwW0r+Kwer6VTMc+lWACDlEiBWe1FCMKODi2hqeLROHt4Vqgfq
 pJPB9Wp5aO73L5GoJcEFBMVeSq3CeIcpKcDLNogQOugX6YmVeSa3kdpYlcTOdQh7MUhI
 2OobD9y02a7SahP4uF3RNUAXBNqjMIaVsUBsF+1kKnKeUpJp67OBBW0+pMaAQ+/j7cCF
 CYccng6L+C9sDQGfvbGcn3+YfYOVBAmmXm43iBf3nvlnJEqWMP6ylv9PufMH8tuVKFWz
 HtUBdlPt8zfeElO0VKlJq3/RtL8nIeTLsHECC5uuaNHmt47BozxgD04DzKB/j4LaCQIn
 IE5g==
X-Gm-Message-State: ACgBeo0aiKietK8m5GsFgS35q4mCpyYh6NFStV6JlIcMbJKQxmYctcLM
 C71SQTMDZgSNKzvv/dG53UTI9A==
X-Google-Smtp-Source: AA6agR5FlvqIoK70Z7dfClOiW6h6rYHmf/RXsXy9uD7rsP6YWnHuqz4j0rhpNDTbM5Jw0ZJxIvHe9g==
X-Received: by 2002:a17:902:d509:b0:16f:1e1:2067 with SMTP id
 b9-20020a170902d50900b0016f01e12067mr26137455plg.140.1661965107344; 
 Wed, 31 Aug 2022 09:58:27 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a635b0c000000b0042a713dd68csm3590306pgb.53.2022.08.31.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 09:58:26 -0700 (PDT)
Date: Wed, 31 Aug 2022 10:58:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: James Clark <james.clark@arm.com>
Message-ID: <20220831165823.GB217472@p14s>
References: <20220830172614.340962-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830172614.340962-1-james.clark@arm.com>
Cc: suzuki.poulose@arm.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH v2 0/5] coresight: Reduce duplicated sysfs
	accessors
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

I have applied this set.

Thanks,
Mathieu

On Tue, Aug 30, 2022 at 06:26:08PM +0100, James Clark wrote:
> Changes since v1:
> 
>   * Keep existing signed offset value types until the very last commit
>     and then remove them all at once
> 
>   * Also split out usages of read_pair() and read32() into separate
>     functions in the last commit 
> 
>   * Whitespace fixes
> 
>   * Replaced any touched scnprintf() with sysfs_emit()
> 
> ======
> 
> The intent of this change is to reduce the large number identical of
> functions created by macros for sysfs accessors. It's possible to re-use
> the same function but pass in the register to access as an argument.
> This reduces the size of the coresight modules folder by 244KB.
> 
> The first two patches are refactors to simplify and remove some dead
> code, and the second two are the changes to use a shared function.
> 
> Testing
> =======
> 
> No changes in any of the outputs:
> 
>   cat /sys/bus/coresight/devices/*/mgmt/* > before.txt
>   cat /sys/bus/coresight/devices/*/mgmt/* > after.txt
>   diff before.txt after.txt
> 
> With the following modules loaded:
> 
>   ls /sys/bus/coresight/devices/
>   etm0  etm2  funnel0  funnel2  replicator0  tmc_etf0  tmc_etf2  tpiu0
>   etm1  etm3  funnel1  funnel3  stm0         tmc_etf1  tmc_etr0
> 
> 
> James Clark (5):
>   coresight: Remove unused function parameter
>   coresight: Simplify sysfs accessors by using csdev_access abstraction
>   coresight: Re-use same function for similar sysfs register accessors
>   coresight: cti-sysfs: Re-use same functions for similar sysfs register
>     accessors
>   coresight: Make new csdev_access offsets unsigned
> 
>  drivers/hwtracing/coresight/coresight-catu.c  |  27 +--
>  drivers/hwtracing/coresight/coresight-catu.h  |   8 +-
>  drivers/hwtracing/coresight/coresight-core.c  |  28 +++
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 213 +++++++-----------
>  drivers/hwtracing/coresight/coresight-etb10.c |  28 +--
>  .../coresight/coresight-etm3x-sysfs.c         |  34 +--
>  drivers/hwtracing/coresight/coresight-priv.h  |  74 +++---
>  .../coresight/coresight-replicator.c          |  10 +-
>  drivers/hwtracing/coresight/coresight-stm.c   |  40 +---
>  .../hwtracing/coresight/coresight-tmc-core.c  |  48 ++--
>  drivers/hwtracing/coresight/coresight-tmc.h   |   4 +-
>  include/linux/coresight.h                     |  23 ++
>  12 files changed, 227 insertions(+), 310 deletions(-)
> 
> -- 
> 2.28.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
