Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3668BE6A5
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 16:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E7AAC5E2D2;
	Tue,  7 May 2024 14:54:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF535CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 14:54:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4EDA9CE119B;
 Tue,  7 May 2024 14:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F295BC2BBFC;
 Tue,  7 May 2024 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715093668;
 bh=Yskj674ZMF177lDIJTS3t2DCNKi8KbRLjMbjRBFCvDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maSV0SdSvYk9LCFNKcXLubAdxffaYIb9IBUOo8nvYgE/vbrjkokm7EXkhHi/46wbH
 jrQb/ujpzl8k+TDX13WUV9KSHBYjqxeSHtInzTDDQjjUwkWWWI+LB7snR8hLoGoDFf
 ArlNz1Nxtswsg3O23MwPQ1+TG9Pc9wg+oYxRH0rpSOnzLMlc4p/vM+7se4ojUb/PqK
 hgZQJY26vJkaiOlTKRJyE7iXXpXE4dw6Kr2vfGfjPLQp8dCuTyGJy74vz05Beh66ON
 X40v0Bpwp3eqBUIkjrIRDmOmuBIknqheXCQ4y6Ng1Rz+85tY+3YTaNWRKR33IxFFzE
 4gPD9fVMOzyIw==
Date: Tue, 7 May 2024 11:54:25 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ZjpAoVEam4CQ96zC@x1>
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-2-james.clark@arm.com>
 <08bcd616-5006-45df-b8cc-45cf3a1dd762@arm.com>
 <de635db0-6510-452f-91be-4fc5f7fdf671@arm.com>
 <ecb16ad9-7c91-4cf6-ab7e-4b4b5be7165c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecb16ad9-7c91-4cf6-ab7e-4b4b5be7165c@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Garry <john.g.garry@oracle.com>, coresight@lists.linaro.org,
 scclevenger@os.amperecomputing.com, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH 01/17] perf cs-etm: Print error for new
 PERF_RECORD_AUX_OUTPUT_HW_ID versions
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

On Tue, May 07, 2024 at 04:27:25PM +0530, Anshuman Khandual wrote:
> On 5/7/24 15:36, James Clark wrote:
> > On 07/05/2024 04:47, Anshuman Khandual wrote:
> >> On 4/29/24 20:51, James Clark wrote:
> >>> The likely fix for this is to update Perf so print a helpful message.
> >>>
> >>> Signed-off-by: James Clark <james.clark@arm.com>
> >>> ---
> >>>  tools/perf/util/cs-etm.c | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> >>> index d65d7485886c..32818bd7cd17 100644
> >>> --- a/tools/perf/util/cs-etm.c
> >>> +++ b/tools/perf/util/cs-etm.c
> >>> @@ -335,8 +335,11 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
> >>>  	trace_chan_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
> >>>  
> >>>  	/* check that we can handle this version */
> >>> -	if (version > CS_AUX_HW_ID_CURR_VERSION)
> >>> +	if (version > CS_AUX_HW_ID_CURR_VERSION) {
> >>> +		pr_err("CS ETM Trace: PERF_RECORD_AUX_OUTPUT_HW_ID version %d not supported. Please update Perf.\n",
> >>
> >> Is not this bit misleading ? PERF_RECORD_AUX_OUTPUT_HW_ID is just the perf record
> >> format identifier. The record version here, is derived from the platform specific
> >> hardware ID information embedded in this perf record.
> > 
> > Not sure I follow what you mean here. 'version' is something that's
> > output by the kernel. It's saved into a perf.data file, and if Perf
> > can't handle version 2 for example, you need to update Perf.
 
> Got it.
 
> >> Should not this be just s/PERF_RECORD_AUX_OUTPUT_HW_ID/hardware ID/ instead ?
> >>
> > 
> > It's just a way to go from the error message to the part of the code or
> > docs that you need to look at. "hardware ID" wouldn't lead you anywhere
> > so I don't think it would be useful.
> 
> Sure, fair enough.

I'm taking this as an Acked-by, ok?

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
