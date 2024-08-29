Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D21964A15
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 17:31:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A51EC6DD6E;
	Thu, 29 Aug 2024 15:31:43 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A73D1C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 15:31:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2621A44084;
 Thu, 29 Aug 2024 15:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB53C4CEC3;
 Thu, 29 Aug 2024 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724945494;
 bh=ZPbu71g6dfyWDg4bm9S3SHHiwmbci3SUkSp1SD6E/uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BJV7h05QFFQ2FjRmLz6759wZoaRcQiPfN1WwrG7adnANoJydNYw3y5R9f7CWClr/Z
 r4GeWzQMyRnR7IUMKlwrpELLlbm7FKhGeZZCYuuRhN7XH/Z3Yx17d27YWbQzmz/hlj
 bxV9CRtHP9halhZ2y9tmSA4J4/ZCq9nahd7BJFPGeXQvcWoUClML6+olkAjzP7zSMl
 HGVbIhcc82oa6zDRio3OGtj5MUcoH9nYCh2Tkbxuu6T+87h58M8MPEQv2BUvKHctwK
 /blxw1QwUtzoaRaVOTnvYKKTZ8T55mB/rMxTtENMMAeZAXvxYX1Ff+5y/lycDyfxO0
 fWIUfbY52c7JA==
Date: Thu, 29 Aug 2024 12:31:30 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Message-ID: <ZtCUUsJNj9Z1CRLK@x1>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1>
 <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1>
 <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
 <ZqO3gPcCCVh1r5WM@x1>
 <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
 <7b96894c-f5df-473b-be50-ee118ce3cfaf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b96894c-f5df-473b-be50-ee118ce3cfaf@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 "Liang, Kan" <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 anshuman.khandual@arm.com, coresight@lists.linaro.org,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com, Suzuki K Poulose <suzuki.poulose@arm.com>
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

On Thu, Aug 29, 2024 at 10:05:02AM +0100, James Clark wrote:
> 
> 
> On 22/08/2024 3:35 pm, Suzuki K Poulose wrote:
> > Hi Arnaldo,
> > 
> > On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:
> > > On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
> > > > On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
> > > > > On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
> > > > > > On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
> > > > > > > On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
> > > > > > > > This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> > > > > > > > as long as there are fewer than that many ETMs
> > > > > > > > connected to each sink.
> > > > > > > 
> > > > > > > Hey, may I take the tools part, i.e. patches 0-7 and
> > > > > > > someone on the ARM
> > > > > > > kernel team pick the driver bits?
> > > 
> > > > > > I plan to pick the kernel driver bits for v6.12
> > > 
> > > > > Perhaps it is better for me to wait for that?
> > > 
> > > > Yes, please.
> > > 
> > > Please let me know when you do so so that I can merge the tooling bits.
> > 
> > I have now merged the driver changes to coresight/next, they will be
> > sent to Greg for v6.12. [0]
> > 
> > You may go ahead and merge the tool bits.

I'm taking this as an Acked-by: Suzuki, ok?

> > Thanks
> > Suzuki
> > 
> > [0] https://lkml.kernel.org/r/172433479466.350842.6920589600831615538.b4-ty@arm.com
> > 
> > 
> > > 
> > > Thanks,
> > > 
> > > - Arnaldo
> > 
> 
> Hi Arnaldo,
> 
> I just checked and the tool patches still apply cleanly if you're able to
> take them.

Sure.

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
