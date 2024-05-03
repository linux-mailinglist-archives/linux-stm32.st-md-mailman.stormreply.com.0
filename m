Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7EF8BACB3
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 14:40:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2959C712A2;
	Fri,  3 May 2024 12:40:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01344C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 12:40:47 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6f28bb6d747so7630998b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714740046; x=1715344846;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rYwSNDI9QgFV+fd05nUh9/SdEfqos7OFNMtSW+S8lRs=;
 b=CWs4ttmWl3gVpEGRxZsAjsgeF64g5kZyXZWOEyzEYcZal04fFZ9HFw5qhfLbr9Okef
 9JycIyo4GGrCGo5IVzOfEqD1cl2Ymb5zRNvmh1spw45OKORshjm1xvA/C6mjG3rIwC1H
 MkGWHejNvgl5n7OFynGya+PYJOOoyp7bVcaku+EvGV8wehnfJnbGv+4pvWFGUQkIC5R/
 RqI0BfTCitwcW/7ZP1zTVurEe7AjljN8Bu4S+Bl7/zpFFbozbsRwRQizya58CFvG+2Oh
 JVr5C7/x8wqSXpAYcLKwa7L5meke74SwPag5IOGTeyyLA2RecIOilVqcEnkklRBgeRNM
 gDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714740046; x=1715344846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rYwSNDI9QgFV+fd05nUh9/SdEfqos7OFNMtSW+S8lRs=;
 b=u3t404GviLl3T1ju+qsVU9bFWmJHFhXX2zP3VfBpwYAXm3yJB1edcChXLQDdztxFAH
 l6kqv/kDAxiUkzIoWIa7UN+n81w6GSj6wzlxpDA754pFG1MiJFBcssEPEfWKeSHySG6P
 zkysylBstkfN8gpLg9ohhSti2wlpPNTrh76I7kkLsErbfrOX0aER3HNGh/DDfM7ljPrn
 Mfctzv2x7jEIBY6IRmxxapT5osonZr9IzRxFQ3sH76YPTON0oU3qbuIcHEhRfK3I1ovo
 33MrGOP5QAODMnEVBW0NDiUX4c+1uyBBXL5BvAu6IeIbGvJe445/wtP3iAT/Bv3sqhgb
 Rw9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRt4ivWOcqw2Ls8TdOaAg/gBqtwXF5ZM7ILIRMVbZ5GuJq2NdzX45xtMbwnvMFJgZRMu99ch2BzWzOP87l02LDpUQ8SbFU/gpsefJgzxFta4uWTzXimg3D
X-Gm-Message-State: AOJu0YwC30DbjTIynG8m7QfXfC2MZiWUTBhgh/Wz9lKdnAC3+MmCGGzX
 5RdBRjlTEsI7tHlrrLeSlvgQxI3d+PF9fNm34hyq/zWS42sjsupuPYyQn9+R59Z1gge5O0Efft6
 rNj+twjHAdV3FdP5XRC5uHiTJp7K3Urw4Y1eXMA==
X-Google-Smtp-Source: AGHT+IFryEDRWu+bcUZI//BoyKSedi7LKHRkuYMa36RWP3/43wK/TONQNCJDn3kMk2kEWxukIvBvLHPZTVJTjYKqYok=
X-Received: by 2002:a05:6a20:9703:b0:1ad:ab1:9a03 with SMTP id
 hr3-20020a056a20970300b001ad0ab19a03mr2171735pzc.25.1714740046457; Fri, 03
 May 2024 05:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-1-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 May 2024 13:40:34 +0100
Message-ID: <CAJ9a7Vi7P3kBG5x_JC6AxDL-AvPc5=48eEC0gH3CHceVtSNmOQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 00/17] coresight: Use per-sink trace ID
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

Hi James

On Mon, 29 Apr 2024 at 16:23, James Clark <james.clark@arm.com> wrote:
>
> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> as long as there are fewer than that many ETMs connected to each sink.
>
> Each sink owns its own trace ID map, and any Perf session connecting to
> that sink will allocate from it, even if the sink is currently in use by
> other users. This is similar to the existing behavior where the dynamic
> trace IDs are constant as long as there is any concurrent Perf session
> active. It's not completely optimal because slightly more IDs will be
> used than necessary, but the optimal solution involves tracking the PIDs
> of each session and allocating ID maps based on the session owner. This
> is difficult to do with the combination of per-thread and per-cpu modes
> and some scheduling issues. The complexity of this isn't likely to worth
> it because even with multiple users they'd just see a difference in the
> ordering of ID allocations rather than hitting any limits (unless the
> hardware does have too many ETMs connected to one sink).
>
> Per-thread mode works but only until there are any overlapping IDs, at
> which point Perf will error out. Both per-thread mode and sysfs mode are
> left to future changes, but both can be added on top of this initial
> implementation and only sysfs mode requires further driver changes.
>
> The HW_ID version field hasn't been bumped in order to not break Perf
> which already has an error condition for other values of that field.
> Instead a new minor version has been added which signifies that there
> are new fields but the old fields are backwards compatible.
>

Looking at this overall - would it not be better to introduce the
concept of a "sink ID" to allow the detection of multiple sources into
the single sink that is now done by emitting multiple AUX_HWID packets
with the CPU+ID extra data?
This sink ID could be part of the sink csdev struct - or even the
id_map struct - a simple count of sinks as the per sink maps are
created would be sufficient. If this sink ID replaced the CPU+ID extra
data in the HWID packets, then each packet could be emitted just once,
and perf can then collate based on the sink id.

Moreover, once we are ready to address the per-thread issues - then
the overlap would not matter. Generate OpenCSD decode trees per sink
ID, add docoders to the tree per Trace ID. Thus if a buffer has data
from sink 1 trace id 5, ans sink 2, trace ID 5, then pick the right
decoder for the combo.

Finally in systems with ETE+TRBE were there is no use of trace IDs, a
sink ID of 0x0 could potentially indicate that 1:1 relationship.

Regards

Mike

>
> James Clark (17):
>   perf cs-etm: Print error for new PERF_RECORD_AUX_OUTPUT_HW_ID versions
>   perf auxtrace: Allow number of queues to be specified
>   perf: cs-etm: Create decoders after both AUX and HW_ID search passes
>   perf: cs-etm: Allocate queues for all CPUs
>   perf: cs-etm: Move traceid_list to each queue
>   perf: cs-etm: Create decoders based on the trace ID mappings
>   perf: cs-etm: Support version 0.1 of HW_ID packets
>   coresight: Remove unused stubs
>   coresight: Clarify comments around the PID of the sink owner
>   coresight: Move struct coresight_trace_id_map to common header
>   coresight: Expose map argument in trace ID API
>   coresight: Make CPU id map a property of a trace ID map
>   coresight: Pass trace ID map into source enable
>   coresight: Use per-sink trace ID maps for Perf sessions
>   coresight: Remove pending trace ID release mechanism
>   coresight: Re-emit trace IDs when the sink changes in per-thread mode
>   coresight: Emit HW_IDs for all ETMs that are using the sink
>
>  drivers/hwtracing/coresight/coresight-core.c  |  10 +
>  drivers/hwtracing/coresight/coresight-dummy.c |   3 +-
>  .../hwtracing/coresight/coresight-etm-perf.c  |  82 ++-
>  .../hwtracing/coresight/coresight-etm-perf.h  |  20 +-
>  .../coresight/coresight-etm3x-core.c          |  14 +-
>  .../coresight/coresight-etm4x-core.c          |  14 +-
>  drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>  drivers/hwtracing/coresight/coresight-sysfs.c |   3 +-
>  .../hwtracing/coresight/coresight-tmc-etr.c   |   5 +-
>  drivers/hwtracing/coresight/coresight-tmc.h   |   5 +-
>  drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>  .../hwtracing/coresight/coresight-trace-id.c  | 107 +--
>  .../hwtracing/coresight/coresight-trace-id.h  |  57 +-
>  include/linux/coresight-pmu.h                 |  17 +-
>  include/linux/coresight.h                     |  20 +-
>  tools/include/linux/coresight-pmu.h           |  17 +-
>  tools/perf/util/auxtrace.c                    |   9 +-
>  tools/perf/util/auxtrace.h                    |   1 +
>  .../perf/util/cs-etm-decoder/cs-etm-decoder.c |  28 +-
>  tools/perf/util/cs-etm.c                      | 617 ++++++++++++------
>  tools/perf/util/cs-etm.h                      |   2 +-
>  21 files changed, 633 insertions(+), 404 deletions(-)
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
