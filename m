Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D5934E17
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2024 15:24:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE152C78015;
	Thu, 18 Jul 2024 13:24:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B18BC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 13:24:46 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70b42250526so576872b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721309085; x=1721913885;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fq6buaq0J77LyE/GBWk8ILfSOIynHPKL2rGxd48KAGw=;
 b=EQzFQOVZfQAIObgOkL19UCTxr6sVyvWeO+hWT529mY8fBmD4L+xIsMK9FL0W6Wb2fJ
 7+yvLsFTYZ5jSL3xVGk1E459cPHauplZMmYJK9iODyH8exhOUIgR+VkSVQC1j5HjEQKE
 EMRQG5NSbj3wc+5NIf7XX8vWd+KKZzvKTp41ONWnumq8denjkcLseU3zsGmePwJ6Dei+
 bcr2rfZsQ4stEztCJ44GRScTvZwbMBMEOtPDT+IsbMBI1WdLHkpNB/FBChR/1ZEsm9ot
 iPIt6HvuNHckpC8j8qUJdoz3eZTbAffIjc3vr93tYwGli7GaN6v1CS4miTk/A1y9AAez
 DG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721309085; x=1721913885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fq6buaq0J77LyE/GBWk8ILfSOIynHPKL2rGxd48KAGw=;
 b=R+w/DphOpKiRNLgob4ATvxND1u8KQBSEYzp7GQLfiDqVE7CSzEzrAZ/fEa113OWFD5
 SCcomaeDDpAR+2B8/eq6FE9V/Kj4T50bBo67kmCJQ5ud/F5llJJGzbZwFrOXAQancj03
 1w+JaUbrNslxi6H9/dXYMid3OyGDkaoH9NEbz8+pzsorQtMSrABb+WOB+B7vLlTBFU7K
 74ct+22RMzX3F3W2UW+a3RM9b7VtjyjczDj+NXpjw0tvnc8rb1WqLVb+WAROUPKpd6Na
 PQvdMKrxOocWvzpJdsgt/OE/HigDULSPPc6Lzmq/gg3ZF9ruNjdIq9OwBBXHcxhakE8k
 we2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC20NQWa40WqAYP+s7jHiHUKikd2F3KcnUzz+M1W2aB8k2IJOLBC8Yl2wACOUGYk95xxEu6IKsDEPgLekrc5oi4O3NsFlJXrlAQCSXWLK1DAl/m2fOL12x
X-Gm-Message-State: AOJu0YxCyqWGgDj1n32CGMl06xOyX2UdW7Wh9C5tj5FeSG6OVTu8ZsHB
 SAxaPDJTSN5WAKuty9UPu2JjKnvDlOIqRaViaxYGBiZq85rwzl4gThSbBgaf28wZzj4SJogHYQy
 ZFubNSEh9MqJ9RO8V3FEmHNnnXa1jCKGY3fBXmA==
X-Google-Smtp-Source: AGHT+IH9mIMsGzBmrv3QWb32eFUfrlMcHd5f8eA96tyiDq6Dw/aKdX2ecIK8CZzn1z6FPeTtkwF7rM24BmD+rSYOAdo=
X-Received: by 2002:a05:6a00:4b15:b0:706:8066:5cdf with SMTP id
 d2e1a72fcca58-70ce5066a47mr5635179b3a.21.1721309085199; Thu, 18 Jul 2024
 06:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-6-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-6-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 18 Jul 2024 14:24:34 +0100
Message-ID: <CAJ9a7Vh9GwbFZQDH=FedjnvdVPrOQnftCpu2CBh4EFT=kbg_2Q@mail.gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, "Liang,
 Kan" <kan.liang@linux.intel.com>, suzuki.poulose@arm.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, anshuman.khandual@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH v5 05/17] perf: cs-etm: Only save valid
	trace IDs into files
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

On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> This isn't a bug because Perf always masks with
> CORESIGHT_TRACE_ID_VAL_MASK before using these values, but to avoid it
> looking like it could be, make an effort to not save bad values.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/arch/arm/util/cs-etm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index b0118546cd4d..14b8afabce3a 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -643,7 +643,8 @@ static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu)
>
>  static __u64 cs_etm_get_legacy_trace_id(struct perf_cpu cpu)
>  {
> -       return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu);
> +       /* Wrap at 48 so that invalid trace IDs aren't saved into files. */
> +       return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu % 48);
>  }
>
>  static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr, struct perf_cpu cpu)
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
