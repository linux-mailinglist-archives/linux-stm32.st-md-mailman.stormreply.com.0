Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10D93D555
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 16:49:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D046C78015;
	Fri, 26 Jul 2024 14:49:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DCDC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 14:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9088FCE17EF;
 Fri, 26 Jul 2024 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4802EC32786;
 Fri, 26 Jul 2024 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722005378;
 bh=Z4Unxh9riY/mmX1bd2RGjAQIZdTsnqCI5uhuBf/P4P0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bchnRRVbFfL8YH5kYPOkkcygJF1sKD2938nLGWR8H/ylXlIiwl5IzgWeNRo75Pm5p
 xFTvalx10ML0C0+ewkhOdevwfnyHOgSau8XUD+1mpe3ZdAYVmzZRd17Wb/aVba62LF
 UbSuSNBOR6usrIcfDC2PZwHts8Mheh/WTx0O11Vi6wA4t36Is97KZAO4q/ZLYcNya8
 a1xQQh5y9NSJInzlfAuw9X5pyYjdUJB2/bNTdBNX0xslb4zIVvz9bJEjcTYFFD8WtV
 2tGS5ex9ATccqf7P5u48DzVvqA+5zIiYc87DnePNPb2RHrmngDEr9OTgfYuGR4/ryc
 P16f2h1rxbX8Q==
Date: Fri, 26 Jul 2024 11:49:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <ZqO3gPcCCVh1r5WM@x1>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1>
 <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1>
 <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 "Liang, Kan" <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 coresight@lists.linaro.org, mike.leach@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, anshuman.khandual@arm.com,
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, leo.yan@linux.dev,
 Jiri Olsa <jolsa@kernel.org>, gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH v6 00/17] coresight: Use per-sink trace ID
 maps for Perf sessions
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

On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
> On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
> > On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
> > > On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
> > > > On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
> > > > > This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> > > > > as long as there are fewer than that many ETMs connected to each sink.
> > > > 
> > > > Hey, may I take the tools part, i.e. patches 0-7 and someone on the ARM
> > > > kernel team pick the driver bits?

> > > I plan to pick the kernel driver bits for v6.12

> > Perhaps it is better for me to wait for that?

> Yes, please.

Please let me know when you do so so that I can merge the tooling bits.

Thanks,

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
