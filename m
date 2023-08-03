Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCB76F424
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 22:45:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242D8C6A5FA;
	Thu,  3 Aug 2023 20:45:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 898A3C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 20:45:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4453661EA4;
 Thu,  3 Aug 2023 20:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E650C433C8;
 Thu,  3 Aug 2023 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691095503;
 bh=UXQA6Sp9+nMzLruVQvdX9wDbmeN6Do6qtEMNu/DE6z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=piuUAmY1whkLscSpXc/ecQ8BF+bGTHOGX80qiBdapzrA+Bp6pea2GgyjsjrO3iaSL
 W7inX5fZDlClWalQXBHohsJ1aNrw9Whlep2P1KaA6K0lAexF0S3JSZDr6YU0zsl03N
 d7t04VvFvVGiFqNIYCXTbUD/QClspQch/oDS4KDivyBEk6PjfvftNfp+STUjiXf5S0
 FF3nETvU7uUF4kMuEbb1OmY4t8wBKmD8yOFTy3Yy8Uyn8OdjTGnNh74vbN++jdzm1d
 IbodNSFFZ+r91a2NHwzltgo4IDM+iUaneWm3x/NigJi07dpdk11SxVzsUR3CWTe7Ww
 mslOqRW5y3jyQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 15BA1404DF; Thu,  3 Aug 2023 17:45:01 -0300 (-03)
Date: Thu, 3 Aug 2023 17:45:01 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Manank Patel <manank@manank.me>
Message-ID: <ZMwRzQC+wBgJpDfr@kernel.org>
References: <20230803-fix-typo-v1-1-b794378d594e@manank.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803-fix-typo-v1-1-b794378d594e@manank.me>
X-Url: http://acmel.wordpress.com
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Jens Schleusener <Jens.Schleusener@fossies.org>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] tools: perf: pmu-events: Fix typo
	poiint->point
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

Em Thu, Aug 03, 2023 at 11:27:30AM +0530, Manank Patel escreveu:
> Fix typo in file floating-point.json in /arch/x86/westmereep-dp

AFAIK these are generated using a tool, so the fix needs to go to the
file from where the JSON files are generated, Ian?

- Arnaldo
 
> Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
> Signed-off-by: Manank Patel <manank@manank.me>
> ---
>  tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json b/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
> index c03f8990fa82..196ae1d9b157 100644
> --- a/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
> +++ b/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
> @@ -8,7 +8,7 @@
>          "UMask": "0x1"
>      },
>      {
> -        "BriefDescription": "X87 Floating poiint assists for invalid input value (Precise Event)",
> +        "BriefDescription": "X87 Floating point assists for invalid input value (Precise Event)",
>          "EventCode": "0xF7",
>          "EventName": "FP_ASSIST.INPUT",
>          "PEBS": "1",
> 
> ---
> base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> change-id: 20230803-fix-typo-3cb207284310
> 
> Best regards,
> -- 
> Manank Patel <manank@manank.me>
> 

-- 

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
