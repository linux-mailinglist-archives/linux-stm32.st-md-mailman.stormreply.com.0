Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DC69FD77
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 22:07:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F25EC6A5F8;
	Wed, 22 Feb 2023 21:07:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64787C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 21:07:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so1140746wmb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8G1ZZCqe7oLJNMmQoeuHW9a2nnVWH+Bwvpabz2Ke6Uc=;
 b=hotTbPRfeoWtVnZaQWSmWIX/DaweLrsMNCm49ZruH5ZhDhgOqxU3ua8s+jZOS6+KWP
 RR8WQ4qwi7pvDefCqtQ0jRM8dzO/0A4OMrvpNN0JgRLIiESrHWtM6DNVukuxAOSIrHSJ
 XHIDdMHD5HckqO5uiXpEQ9SpwlG7fBwL/aQntMX5yVamFbGDNkvqc27lQehNynTvjFK8
 6eKR6CkluRlobW2MVOZI/R/Wx6erulQZED0WVON6SAnF5qMQCiWKdUIztfB0yDWDCp4z
 EOzLFS//3jDoLBFOAKxtndIpTiPbMoZra07JaROK6WsvTPKkbRX0ZSw7erYYl7ZVjaX8
 UXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8G1ZZCqe7oLJNMmQoeuHW9a2nnVWH+Bwvpabz2Ke6Uc=;
 b=Ot1tQzHMnyYtOyPa6lWsTANtREVE3NDf1JKhm3PD3Yelbn0mH4ALqjcj6iOr5XGCCf
 9wy8wF3CILIwPbNydhI2D23Y+TIu2bOmG2pBWYyjdezApQ14jMxI7ks4wuG108vEe/Xj
 KvKmLS6qJrntKPfDUJWIkgKpasoGVupsYXU+RRKLvVC+Coj6bkcorJEZFsxJhviaRTA4
 7AVeeJ1VA3Vv+pScdGbJfl3hfIXFNCLZY1vMHoXFexM6XOTRhMPFEBYWmSR95crLmX16
 pEVuIVTSpRwc9nAicBkPvGxe1Pn/rqVcQ4z7vst2fVsrBfeDTX+WcrgN1vT732d7xYUl
 F9cg==
X-Gm-Message-State: AO0yUKVhx5gKaAR0uFtXgi6lwQTCli6qjI8AWYjk7PP/hFsWtClFmcL+
 hh4EAgUjVpeNWuv6Jcs2H4CmwoozotJ5po491aKy9Q==
X-Google-Smtp-Source: AK7set9NKIzvTnNyFneuYrnpBVDtiCK3o/9JJEhQUT8GsbiPNk3r05WOVHNefecTgKK5m5yU6kTmtP4Gy4szlpg9faA=
X-Received: by 2002:a05:600c:1c95:b0:3db:1d5e:699 with SMTP id
 k21-20020a05600c1c9500b003db1d5e0699mr1034332wms.195.1677100041458; Wed, 22
 Feb 2023 13:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20230219092848.639226-1-irogers@google.com>
 <Y/IFNyI9JcChoR2p@kernel.org>
 <CAP-5=fWzydsYNKPBv+wCh4M9QaRbk5NiJOUDsjbjPdPjFWQ82g@mail.gmail.com>
 <CAP-5=fWmFtktttCmXBmF1W-V5yU47UFod=MxOX3re5pG_ScETQ@mail.gmail.com>
 <Y/Yc4m6ozl9B0w4l@kernel.org>
In-Reply-To: <Y/Yc4m6ozl9B0w4l@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 22 Feb 2023 13:07:09 -0800
Message-ID: <CAP-5=fXq1UMLrmshkuVHo-y_2Rsz1PT+bj3RJDVj0zimTborOw@mail.gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Sandipan Das <sandipan.das@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>,
 Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>,
 James Clark <james.clark@arm.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Kan Liang <kan.liang@linux.intel.com>,
 Suzuki Poulouse <suzuki.poulose@arm.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
 Caleb Biggers <caleb.biggers@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Sean Christopherson <seanjc@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Florian Fischer <florian.fischer@muhq.space>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-perf-users <linux-perf-users@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: [Linux-stm32] [PATCH v1 00/51] shadow metric clean up and
	improvements
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
Content-Type: multipart/mixed; boundary="===============7423081693233259934=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7423081693233259934==
Content-Type: multipart/alternative; boundary="00000000000039e15905f55048fa"

--00000000000039e15905f55048fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 5:47=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kern=
el.org>
wrote:

> Em Tue, Feb 21, 2023 at 09:44:36AM -0800, Ian Rogers escreveu:
> > On Sun, Feb 19, 2023 at 7:43=E2=80=AFAM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Sun, Feb 19, 2023, 3:17 AM Arnaldo Carvalho de Melo <
> acme@kernel.org> wrote:
> > > >
> > > > Em Sun, Feb 19, 2023 at 01:27:57AM -0800, Ian Rogers escreveu:
> > > > > Recently the shadow stat metrics broke due to repeated aggregatio=
n
> and
> > > > > a quick fix was applied:
> > > > >
> https://lore.kernel.org/lkml/20230209064447.83733-1-irogers@google.com/
> > > > > This is the longer fix but one that comes with some extras. To
> avoid
> > > > > fixing issues for hard coded metrics, the topdown, SMI cost and
> > > > > transaction flags are moved into json metrics. A side effect of
> this
> > > > > is that TopdownL1 metrics will now be displayed when supported, i=
f
> no
> > > > > "perf stat" events are specified.
> > > > >
> > > > > Another fix included here is for event grouping as raised in:
> > > > >
> https://lore.kernel.org/lkml/CA+icZUU_ew7pzWJJZLbj1xsU6MQTPrj8tkFfDhNdTDR=
QfGUBMQ@mail.gmail.com/
> > > > > Metrics are now tagged with NMI and SMT flags, meaning that the
> events
> > > > > shouldn't be grouped if the NMI watchdog is enabled or SMT is
> enabled.
> > > > >
> > > > > Given the two issues, the metrics are re-generated and the patche=
s
> > > > > also include the latest Intel vendor events. The changes to the
> metric
> > > > > generation code can be seen in:
> > > > > https://github.com/intel/perfmon/pull/56
> > > > >
> > > > > Hard coded metrics support thresholds, the patches add this
> ability to
> > > > > json metrics so that the hard coded metrics can be removed. Migra=
te
> > > > > remaining hard coded metrics to looking up counters from the
> > > > > evlist/aggregation count. Finally, get rid of the saved_value log=
ic
> > > > > and thereby look to fix the aggregation issues.
> > > > >
> > > > > Some related fix ups and code clean ups are included in the
> changes,
> > > > > in particular to aid with the code's readability and to keep
> topdown
> > > > > documentation in sync.
> > > >
> > > > That is great work but won't have a reasonable time sitting on
> > > > linux-next to make it into 6.3.
> > > >
> > > > I have just applied it locally for the usual set of tests, that I'l=
l
> > > > report back here.
> > >
> > >
> > > Ugh. I'm guessing it won't be useful if I point out more things broke=
n
> > > with the current workaround, like metrics with --repeat :-/
> > >
> > > Thanks,
> > > Ian
> >
> > So currently the flow of patches is:
> >
> > 1) initially testing - acme tmp.perf/core
> > 2) things staged for next release - acme perf/core (perhaps this
> > should be called perf-next)
>
> Yeah, perf-tools-next probably.
>
> > 3) linux wide next release testing - linux-next
> > 4) release - linus/master
> >
> > I wonder if there should be a perf-next-next branch to work around the
> > "sitting time" problem. Otherwise anybody who touches code in these 51
> > patches will create a merge conflict. Given the aggregation issues
> > we're likely to see changes in this code and so conflicts are likely
> > to happen.
> >
> > The patch flow with perf-next-next would be:
> >
> > 1) initial testing - tmp.perf-next-next
> > 2) things acquiring sitting time and where developers work -
> perf-next-next
> > 3) things staged for the next release - perf-next
> > 4) as 3 above
> > 5) as 4 above
> >
> > With linux-next picking up acme perf/core (aka perf-next) daily it
> > isn't clear whether we should work off of perf-core or linux-next as
> > they are so in sync. This process means we've lost a sitting place for
> > developer patches and we're going to feel the pain in terms of merge
> > conflicts on the list, difficulty building off of the latest work
> > without cherry-picking from the list, etc.
>
> I'll send perf/core to Linus today and then your 51 patches will appear
> on perf-tools-next, where we'll do what was done before in perf/core
> (remained like that for historical reasons).
>
> I'll make perf/urgent become 'perf-tools', and when the merge window
> closes, we turn 'perf-tools-next' into 'perf-tools',
>
> - Arnaldo
>

Awesome, thanks! I'm also happy if people review the changes :-)

Ian


> > Thanks,
> > Ian
> >
> > > > - Arnaldo
> > > >
> > > > > Ian Rogers (51):
> > > > >   perf tools: Ensure evsel name is initialized
> > > > >   perf metrics: Improve variable names
> > > > >   perf pmu-events: Remove aggr_mode from pmu_event
> > > > >   perf pmu-events: Change aggr_mode to be an enum
> > > > >   perf pmu-events: Change deprecated to be a bool
> > > > >   perf pmu-events: Change perpkg to be a bool
> > > > >   perf expr: Make the online topology accessible globally
> > > > >   perf pmu-events: Make the metric_constraint an enum
> > > > >   perf pmu-events: Don't '\0' terminate enum values
> > > > >   perf vendor events intel: Refresh alderlake events
> > > > >   perf vendor events intel: Refresh alderlake-n metrics
> > > > >   perf vendor events intel: Refresh broadwell metrics
> > > > >   perf vendor events intel: Refresh broadwellde metrics
> > > > >   perf vendor events intel: Refresh broadwellx metrics
> > > > >   perf vendor events intel: Refresh cascadelakex events
> > > > >   perf vendor events intel: Add graniterapids events
> > > > >   perf vendor events intel: Refresh haswell metrics
> > > > >   perf vendor events intel: Refresh haswellx metrics
> > > > >   perf vendor events intel: Refresh icelake events
> > > > >   perf vendor events intel: Refresh icelakex metrics
> > > > >   perf vendor events intel: Refresh ivybridge metrics
> > > > >   perf vendor events intel: Refresh ivytown metrics
> > > > >   perf vendor events intel: Refresh jaketown events
> > > > >   perf vendor events intel: Refresh knightslanding events
> > > > >   perf vendor events intel: Refresh sandybridge events
> > > > >   perf vendor events intel: Refresh sapphirerapids events
> > > > >   perf vendor events intel: Refresh silvermont events
> > > > >   perf vendor events intel: Refresh skylake events
> > > > >   perf vendor events intel: Refresh skylakex metrics
> > > > >   perf vendor events intel: Refresh tigerlake events
> > > > >   perf vendor events intel: Refresh westmereep-dp events
> > > > >   perf jevents: Add rand support to metrics
> > > > >   perf jevent: Parse metric thresholds
> > > > >   perf pmu-events: Test parsing metric thresholds with the fake P=
MU
> > > > >   perf list: Support for printing metric thresholds
> > > > >   perf metric: Compute and print threshold values
> > > > >   perf expr: More explicit NAN handling
> > > > >   perf metric: Add --metric-no-threshold option
> > > > >   perf stat: Add TopdownL1 metric as a default if present
> > > > >   perf stat: Implement --topdown using json metrics
> > > > >   perf stat: Remove topdown event special handling
> > > > >   perf doc: Refresh topdown documentation
> > > > >   perf stat: Remove hard coded transaction events
> > > > >   perf stat: Use metrics for --smi-cost
> > > > >   perf stat: Remove perf_stat_evsel_id
> > > > >   perf stat: Move enums from header
> > > > >   perf stat: Hide runtime_stat
> > > > >   perf stat: Add cpu_aggr_map for loop
> > > > >   perf metric: Directly use counts rather than saved_value
> > > > >   perf stat: Use counts rather than saved_value
> > > > >   perf stat: Remove saved_value/runtime_stat
> > > > >
> > > > >  tools/perf/Documentation/perf-stat.txt        |   27 +-
> > > > >  tools/perf/Documentation/topdown.txt          |   70 +-
> > > > >  tools/perf/arch/powerpc/util/header.c         |    2 +-
> > > > >  tools/perf/arch/x86/util/evlist.c             |    6 +-
> > > > >  tools/perf/arch/x86/util/topdown.c            |   78 +-
> > > > >  tools/perf/arch/x86/util/topdown.h            |    1 -
> > > > >  tools/perf/builtin-list.c                     |   13 +-
> > > > >  tools/perf/builtin-script.c                   |    9 +-
> > > > >  tools/perf/builtin-stat.c                     |  233 +-
> > > > >  .../arch/x86/alderlake/adl-metrics.json       | 3190
> ++++++++++-------
> > > > >  .../pmu-events/arch/x86/alderlake/cache.json  |   36 +-
> > > > >  .../arch/x86/alderlake/floating-point.json    |   27 +
> > > > >  .../arch/x86/alderlake/frontend.json          |    9 +
> > > > >  .../pmu-events/arch/x86/alderlake/memory.json |    3 +-
> > > > >  .../arch/x86/alderlake/pipeline.json          |   14 +-
> > > > >  .../arch/x86/alderlake/uncore-other.json      |   28 +-
> > > > >  .../arch/x86/alderlaken/adln-metrics.json     |  811 +++--
> > > > >  .../arch/x86/broadwell/bdw-metrics.json       | 1439 ++++----
> > > > >  .../arch/x86/broadwellde/bdwde-metrics.json   | 1405 ++++----
> > > > >  .../arch/x86/broadwellx/bdx-metrics.json      | 1626 +++++----
> > > > >  .../arch/x86/broadwellx/uncore-cache.json     |   74 +-
> > > > >  .../x86/broadwellx/uncore-interconnect.json   |   64 +-
> > > > >  .../arch/x86/broadwellx/uncore-other.json     |    4 +-
> > > > >  .../arch/x86/cascadelakex/cache.json          |   24 +-
> > > > >  .../arch/x86/cascadelakex/clx-metrics.json    | 2198 ++++++-----=
-
> > > > >  .../arch/x86/cascadelakex/frontend.json       |    8 +-
> > > > >  .../arch/x86/cascadelakex/pipeline.json       |   16 +
> > > > >  .../arch/x86/cascadelakex/uncore-memory.json  |   18 +-
> > > > >  .../arch/x86/cascadelakex/uncore-other.json   |  120 +-
> > > > >  .../arch/x86/cascadelakex/uncore-power.json   |    8 +-
> > > > >  .../arch/x86/graniterapids/cache.json         |   54 +
> > > > >  .../arch/x86/graniterapids/frontend.json      |   10 +
> > > > >  .../arch/x86/graniterapids/memory.json        |  174 +
> > > > >  .../arch/x86/graniterapids/other.json         |   29 +
> > > > >  .../arch/x86/graniterapids/pipeline.json      |  102 +
> > > > >  .../x86/graniterapids/virtual-memory.json     |   26 +
> > > > >  .../arch/x86/haswell/hsw-metrics.json         | 1220 ++++---
> > > > >  .../arch/x86/haswellx/hsx-metrics.json        | 1397 ++++----
> > > > >  .../pmu-events/arch/x86/icelake/cache.json    |   16 +
> > > > >  .../arch/x86/icelake/floating-point.json      |   31 +
> > > > >  .../arch/x86/icelake/icl-metrics.json         | 1932 +++++-----
> > > > >  .../pmu-events/arch/x86/icelake/pipeline.json |   23 +-
> > > > >  .../arch/x86/icelake/uncore-other.json        |   56 +
> > > > >  .../arch/x86/icelakex/icx-metrics.json        | 2153 +++++------
> > > > >  .../arch/x86/icelakex/uncore-memory.json      |    2 +-
> > > > >  .../arch/x86/icelakex/uncore-other.json       |    4 +-
> > > > >  .../arch/x86/ivybridge/ivb-metrics.json       | 1270 ++++---
> > > > >  .../arch/x86/ivytown/ivt-metrics.json         | 1311 ++++---
> > > > >  .../pmu-events/arch/x86/jaketown/cache.json   |    6 +-
> > > > >  .../arch/x86/jaketown/floating-point.json     |    2 +-
> > > > >  .../arch/x86/jaketown/frontend.json           |   12 +-
> > > > >  .../arch/x86/jaketown/jkt-metrics.json        |  602 ++--
> > > > >  .../arch/x86/jaketown/pipeline.json           |    2 +-
> > > > >  .../arch/x86/jaketown/uncore-cache.json       |   22 +-
> > > > >  .../x86/jaketown/uncore-interconnect.json     |   74 +-
> > > > >  .../arch/x86/jaketown/uncore-memory.json      |    4 +-
> > > > >  .../arch/x86/jaketown/uncore-other.json       |   22 +-
> > > > >  .../arch/x86/jaketown/uncore-power.json       |    8 +-
> > > > >  .../arch/x86/knightslanding/cache.json        |   94 +-
> > > > >  .../arch/x86/knightslanding/pipeline.json     |    8 +-
> > > > >  .../arch/x86/knightslanding/uncore-other.json |    8 +-
> > > > >  tools/perf/pmu-events/arch/x86/mapfile.csv    |   29 +-
> > > > >  .../arch/x86/sandybridge/cache.json           |    8 +-
> > > > >  .../arch/x86/sandybridge/floating-point.json  |    2 +-
> > > > >  .../arch/x86/sandybridge/frontend.json        |   12 +-
> > > > >  .../arch/x86/sandybridge/pipeline.json        |    2 +-
> > > > >  .../arch/x86/sandybridge/snb-metrics.json     |  601 ++--
> > > > >  .../arch/x86/sapphirerapids/cache.json        |   24 +-
> > > > >  .../x86/sapphirerapids/floating-point.json    |   32 +
> > > > >  .../arch/x86/sapphirerapids/frontend.json     |    8 +
> > > > >  .../arch/x86/sapphirerapids/pipeline.json     |   19 +-
> > > > >  .../arch/x86/sapphirerapids/spr-metrics.json  | 2283 ++++++-----=
-
> > > > >  .../arch/x86/sapphirerapids/uncore-other.json |   60 +
> > > > >  .../arch/x86/silvermont/frontend.json         |    2 +-
> > > > >  .../arch/x86/silvermont/pipeline.json         |    2 +-
> > > > >  .../pmu-events/arch/x86/skylake/cache.json    |   25 +-
> > > > >  .../pmu-events/arch/x86/skylake/frontend.json |    8 +-
> > > > >  .../pmu-events/arch/x86/skylake/other.json    |    1 +
> > > > >  .../pmu-events/arch/x86/skylake/pipeline.json |   16 +
> > > > >  .../arch/x86/skylake/skl-metrics.json         | 1877 ++++++----
> > > > >  .../arch/x86/skylake/uncore-other.json        |    1 +
> > > > >  .../pmu-events/arch/x86/skylakex/cache.json   |    8 +-
> > > > >  .../arch/x86/skylakex/frontend.json           |    8 +-
> > > > >  .../arch/x86/skylakex/pipeline.json           |   16 +
> > > > >  .../arch/x86/skylakex/skx-metrics.json        | 2097 +++++------
> > > > >  .../arch/x86/skylakex/uncore-memory.json      |    2 +-
> > > > >  .../arch/x86/skylakex/uncore-other.json       |   96 +-
> > > > >  .../arch/x86/skylakex/uncore-power.json       |    6 +-
> > > > >  .../arch/x86/tigerlake/floating-point.json    |   31 +
> > > > >  .../arch/x86/tigerlake/pipeline.json          |   18 +
> > > > >  .../arch/x86/tigerlake/tgl-metrics.json       | 1942 +++++-----
> > > > >  .../arch/x86/tigerlake/uncore-other.json      |   28 +-
> > > > >  .../arch/x86/westmereep-dp/cache.json         |    2 +-
> > > > >  .../x86/westmereep-dp/virtual-memory.json     |    2 +-
> > > > >  tools/perf/pmu-events/jevents.py              |   58 +-
> > > > >  tools/perf/pmu-events/metric.py               |    8 +-
> > > > >  tools/perf/pmu-events/pmu-events.h            |   35 +-
> > > > >  tools/perf/tests/expand-cgroup.c              |    3 +-
> > > > >  tools/perf/tests/expr.c                       |    7 +-
> > > > >  tools/perf/tests/parse-metric.c               |   21 +-
> > > > >  tools/perf/tests/pmu-events.c                 |   49 +-
> > > > >  tools/perf/util/cpumap.h                      |    3 +
> > > > >  tools/perf/util/cputopo.c                     |   14 +
> > > > >  tools/perf/util/cputopo.h                     |    5 +
> > > > >  tools/perf/util/evsel.h                       |    2 +-
> > > > >  tools/perf/util/expr.c                        |   16 +-
> > > > >  tools/perf/util/expr.y                        |   12 +-
> > > > >  tools/perf/util/metricgroup.c                 |  178 +-
> > > > >  tools/perf/util/metricgroup.h                 |    5 +-
> > > > >  tools/perf/util/pmu.c                         |   17 +-
> > > > >  tools/perf/util/print-events.h                |    1 +
> > > > >  tools/perf/util/smt.c                         |   11 +-
> > > > >  tools/perf/util/smt.h                         |   12 +-
> > > > >  tools/perf/util/stat-display.c                |  117 +-
> > > > >  tools/perf/util/stat-shadow.c                 | 1287 ++-----
> > > > >  tools/perf/util/stat.c                        |   74 -
> > > > >  tools/perf/util/stat.h                        |   96 +-
> > > > >  tools/perf/util/synthetic-events.c            |    2 +-
> > > > >  tools/perf/util/topdown.c                     |   68 +-
> > > > >  tools/perf/util/topdown.h                     |   11 +-
> > > > >  120 files changed, 18025 insertions(+), 15590 deletions(-)
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/cache.json
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/memory.json
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/other.json
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/pipeline.json
> > > > >  create mode 100644
> tools/perf/pmu-events/arch/x86/graniterapids/virtual-memory.json
> > > > >
> > > > > --
> > > > > 2.39.2.637.g21b0678d19-goog
> > > > >
> > > >
> > > > --
> > > >
> > > > - Arnaldo
>
> --
>
> - Arnaldo
>

--00000000000039e15905f55048fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 22, 2023 at 5:47=E2=80=AFAM A=
rnaldo Carvalho de Melo &lt;<a href=3D"mailto:acme@kernel.org">acme@kernel.=
org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Em Tue, Feb 21, 2023 at 09:44:36AM -0800, Ian=
 Rogers escreveu:<br>
&gt; On Sun, Feb 19, 2023 at 7:43=E2=80=AFAM Ian Rogers &lt;<a href=3D"mail=
to:irogers@google.com" target=3D"_blank">irogers@google.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; On Sun, Feb 19, 2023, 3:17 AM Arnaldo Carvalho de Melo &lt;<a hre=
f=3D"mailto:acme@kernel.org" target=3D"_blank">acme@kernel.org</a>&gt; wrot=
e:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Em Sun, Feb 19, 2023 at 01:27:57AM -0800, Ian Rogers escreve=
u:<br>
&gt; &gt; &gt; &gt; Recently the shadow stat metrics broke due to repeated =
aggregation and<br>
&gt; &gt; &gt; &gt; a quick fix was applied:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lore.kernel.org/lkml/20230209064447.=
83733-1-irogers@google.com/" rel=3D"noreferrer" target=3D"_blank">https://l=
ore.kernel.org/lkml/20230209064447.83733-1-irogers@google.com/</a><br>
&gt; &gt; &gt; &gt; This is the longer fix but one that comes with some ext=
ras. To avoid<br>
&gt; &gt; &gt; &gt; fixing issues for hard coded metrics, the topdown, SMI =
cost and<br>
&gt; &gt; &gt; &gt; transaction flags are moved into json metrics. A side e=
ffect of this<br>
&gt; &gt; &gt; &gt; is that TopdownL1 metrics will now be displayed when su=
pported, if no<br>
&gt; &gt; &gt; &gt; &quot;perf stat&quot; events are specified.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Another fix included here is for event grouping as rais=
ed in:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lore.kernel.org/lkml/CA+icZUU_ew7pzW=
JJZLbj1xsU6MQTPrj8tkFfDhNdTDRQfGUBMQ@mail.gmail.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lore.kernel.org/lkml/CA+icZUU_ew7pzWJJZLbj1xsU6MQTP=
rj8tkFfDhNdTDRQfGUBMQ@mail.gmail.com/</a><br>
&gt; &gt; &gt; &gt; Metrics are now tagged with NMI and SMT flags, meaning =
that the events<br>
&gt; &gt; &gt; &gt; shouldn&#39;t be grouped if the NMI watchdog is enabled=
 or SMT is enabled.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Given the two issues, the metrics are re-generated and =
the patches<br>
&gt; &gt; &gt; &gt; also include the latest Intel vendor events. The change=
s to the metric<br>
&gt; &gt; &gt; &gt; generation code can be seen in:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/intel/perfmon/pull/56" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/intel/perfmon/pull/56=
</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hard coded metrics support thresholds, the patches add =
this ability to<br>
&gt; &gt; &gt; &gt; json metrics so that the hard coded metrics can be remo=
ved. Migrate<br>
&gt; &gt; &gt; &gt; remaining hard coded metrics to looking up counters fro=
m the<br>
&gt; &gt; &gt; &gt; evlist/aggregation count. Finally, get rid of the saved=
_value logic<br>
&gt; &gt; &gt; &gt; and thereby look to fix the aggregation issues.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Some related fix ups and code clean ups are included in=
 the changes,<br>
&gt; &gt; &gt; &gt; in particular to aid with the code&#39;s readability an=
d to keep topdown<br>
&gt; &gt; &gt; &gt; documentation in sync.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; That is great work but won&#39;t have a reasonable time sitt=
ing on<br>
&gt; &gt; &gt; linux-next to make it into 6.3.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have just applied it locally for the usual set of tests, t=
hat I&#39;ll<br>
&gt; &gt; &gt; report back here.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Ugh. I&#39;m guessing it won&#39;t be useful if I point out more =
things broken<br>
&gt; &gt; with the current workaround, like metrics with --repeat :-/<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Ian<br>
&gt; <br>
&gt; So currently the flow of patches is:<br>
&gt; <br>
&gt; 1) initially testing - acme tmp.perf/core<br>
&gt; 2) things staged for next release - acme perf/core (perhaps this<br>
&gt; should be called perf-next)<br>
<br>
Yeah, perf-tools-next probably.<br>
<br>
&gt; 3) linux wide next release testing - linux-next<br>
&gt; 4) release - linus/master<br>
&gt; <br>
&gt; I wonder if there should be a perf-next-next branch to work around the=
<br>
&gt; &quot;sitting time&quot; problem. Otherwise anybody who touches code i=
n these 51<br>
&gt; patches will create a merge conflict. Given the aggregation issues<br>
&gt; we&#39;re likely to see changes in this code and so conflicts are like=
ly<br>
&gt; to happen.<br>
&gt; <br>
&gt; The patch flow with perf-next-next would be:<br>
&gt; <br>
&gt; 1) initial testing - tmp.perf-next-next<br>
&gt; 2) things acquiring sitting time and where developers work - perf-next=
-next<br>
&gt; 3) things staged for the next release - perf-next<br>
&gt; 4) as 3 above<br>
&gt; 5) as 4 above<br>
&gt; <br>
&gt; With linux-next picking up acme perf/core (aka perf-next) daily it<br>
&gt; isn&#39;t clear whether we should work off of perf-core or linux-next =
as<br>
&gt; they are so in sync. This process means we&#39;ve lost a sitting place=
 for<br>
&gt; developer patches and we&#39;re going to feel the pain in terms of mer=
ge<br>
&gt; conflicts on the list, difficulty building off of the latest work<br>
&gt; without cherry-picking from the list, etc.<br>
<br>
I&#39;ll send perf/core to Linus today and then your 51 patches will appear=
<br>
on perf-tools-next, where we&#39;ll do what was done before in perf/core<br=
>
(remained like that for historical reasons).<br>
<br>
I&#39;ll make perf/urgent become &#39;perf-tools&#39;, and when the merge w=
indow<br>
closes, we turn &#39;perf-tools-next&#39; into &#39;perf-tools&#39;,<br>
<br>
- Arnaldo<br></blockquote><div><br></div><div>Awesome, thanks! I&#39;m also=
 happy if people review the changes :-)</div><div><br></div><div>Ian</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Thanks,<br>
&gt; Ian<br>
&gt; <br>
&gt; &gt; &gt; - Arnaldo<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Ian Rogers (51):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf tools: Ensure evsel name is initialize=
d<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf metrics: Improve variable names<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Remove aggr_mode from pmu_=
event<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Change aggr_mode to be an =
enum<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Change deprecated to be a =
bool<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Change perpkg to be a bool=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf expr: Make the online topology accessi=
ble globally<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Make the metric_constraint=
 an enum<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Don&#39;t &#39;\0&#39; ter=
minate enum values<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh alderlake=
 events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh alderlake=
-n metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh broadwell=
 metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh broadwell=
de metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh broadwell=
x metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh cascadela=
kex events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Add graniterapids=
 events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh haswell m=
etrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh haswellx =
metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh icelake e=
vents<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh icelakex =
metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh ivybridge=
 metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh ivytown m=
etrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh jaketown =
events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh knightsla=
nding events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh sandybrid=
ge events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh sapphirer=
apids events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh silvermon=
t events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh skylake e=
vents<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh skylakex =
metrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh tigerlake=
 events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf vendor events intel: Refresh westmeree=
p-dp events<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf jevents: Add rand support to metrics<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf jevent: Parse metric thresholds<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf pmu-events: Test parsing metric thresh=
olds with the fake PMU<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf list: Support for printing metric thre=
sholds<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf metric: Compute and print threshold va=
lues<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf expr: More explicit NAN handling<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf metric: Add --metric-no-threshold opti=
on<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Add TopdownL1 metric as a defaul=
t if present<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Implement --topdown using json m=
etrics<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Remove topdown event special han=
dling<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf doc: Refresh topdown documentation<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Remove hard coded transaction ev=
ents<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Use metrics for --smi-cost<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Remove perf_stat_evsel_id<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Move enums from header<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Hide runtime_stat<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Add cpu_aggr_map for loop<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf metric: Directly use counts rather tha=
n saved_value<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Use counts rather than saved_val=
ue<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0perf stat: Remove saved_value/runtime_stat<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/Documentation/perf-stat.txt=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A027 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/Documentation/topdown.txt=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A070 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/arch/powerpc/util/header.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/arch/x86/util/evlist.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/arch/x86/util/topdown.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A078 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/arch/x86/util/topdown.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 -<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/builtin-list.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/builtin-script.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 9 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/builtin-stat.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 233 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlake/adl-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 3190 ++++++++++-------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/alderlake/cache.json=C2=
=A0 |=C2=A0 =C2=A036 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlake/floating-point.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A027 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlake/frontend.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/alderlake/memory.json |=
=C2=A0 =C2=A0 3 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlake/pipeline.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlake/uncore-other.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A028 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/alderlaken/adln-metrics.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 811 +++--<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/broadwell/bdw-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1439 ++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/broadwellde/bdwde-metrics.json=C2=A0=
 =C2=A0| 1405 ++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/broadwellx/bdx-metrics.json=C2=A0 =
=C2=A0 =C2=A0 | 1626 +++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/broadwellx/uncore-cache.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A074 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../x86/broadwellx/uncore-interconnect.json=C2=A0=
 =C2=A0|=C2=A0 =C2=A064 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/broadwellx/uncore-other.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/cache.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/clx-metrics.json=C2=A0 =
=C2=A0 | 2198 ++++++------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/frontend.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/pipeline.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A016 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/uncore-memory.json=C2=
=A0 |=C2=A0 =C2=A018 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/uncore-other.json=C2=A0=
 =C2=A0|=C2=A0 120 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/cascadelakex/uncore-power.json=C2=A0=
 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/graniterapids/cache.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A054 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/graniterapids/frontend.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/graniterapids/memory.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 174 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/graniterapids/other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A029 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/graniterapids/pipeline.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 102 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../x86/graniterapids/virtual-memory.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/haswell/hsw-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1220 ++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/haswellx/hsx-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1397 ++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/icelake/cache.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A016 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelake/floating-point.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A031 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelake/icl-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1932 +++++-----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/icelake/pipeline.json |=
=C2=A0 =C2=A023 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelake/uncore-other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A056 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelakex/icx-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2153 +++++------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelakex/uncore-memory.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/icelakex/uncore-other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/ivybridge/ivb-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1270 ++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/ivytown/ivt-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1311 ++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/jaketown/cache.json=C2=A0=
 =C2=A0|=C2=A0 =C2=A0 6 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/floating-point.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/frontend.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/jkt-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 602 ++--<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/pipeline.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/uncore-cache.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A022 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../x86/jaketown/uncore-interconnect.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A074 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/uncore-memory.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/uncore-other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A022 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/jaketown/uncore-power.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/knightslanding/cache.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A094 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/knightslanding/pipeline.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/knightslanding/uncore-other.json |=
=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/pmu-events/arch/x86/mapfile.csv=C2=A0 =
=C2=A0 |=C2=A0 =C2=A029 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sandybridge/cache.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sandybridge/floating-point.json=C2=
=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sandybridge/frontend.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sandybridge/pipeline.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sandybridge/snb-metrics.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 601 ++--<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sapphirerapids/cache.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../x86/sapphirerapids/floating-point.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A032 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sapphirerapids/frontend.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sapphirerapids/pipeline.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A019 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sapphirerapids/spr-metrics.json=C2=
=A0 | 2283 ++++++------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/sapphirerapids/uncore-other.json |=
=C2=A0 =C2=A060 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/silvermont/frontend.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/silvermont/pipeline.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/skylake/cache.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A025 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/skylake/frontend.json |=
=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/skylake/other.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/skylake/pipeline.json |=
=C2=A0 =C2=A016 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylake/skl-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1877 ++++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylake/uncore-other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pmu-events/arch/x86/skylakex/cache.json=C2=A0=
 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/frontend.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/pipeline.json=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A016 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/skx-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2097 +++++------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/uncore-memory.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/uncore-other.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A096 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/skylakex/uncore-power.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/tigerlake/floating-point.json=C2=A0 =
=C2=A0 |=C2=A0 =C2=A031 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/tigerlake/pipeline.json=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A018 +<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/tigerlake/tgl-metrics.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1942 +++++-----<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/tigerlake/uncore-other.json=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A028 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../arch/x86/westmereep-dp/cache.json=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 .../x86/westmereep-dp/virtual-memory.json=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/pmu-events/jevents.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A058 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/pmu-events/metric.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/pmu-events/pmu-events.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A035 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/tests/expand-cgroup.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/tests/expr.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7=
 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/tests/parse-metric.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A021 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/tests/pmu-events.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A049 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/cpumap.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/cputopo.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/cputopo.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/evsel.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2=
 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/expr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A016 +=
-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/expr.y=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +=
-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/metricgroup.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 178 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/metricgroup.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A017 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/print-events.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/smt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A011 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/smt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A012 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/stat-display.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 117 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/stat-shadow.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1287 ++-----<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/stat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A074 -=
<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/stat.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A096 +=
-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/synthetic-events.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/topdown.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A068 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tools/perf/util/topdown.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A011 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 120 files changed, 18025 insertions(+), 15590 del=
etions(-)<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/cache.json<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/frontend.json<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/memory.json<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/other.json<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/pipeline.json<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tools/perf/pmu-events/arch/x86=
/graniterapids/virtual-memory.json<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.39.2.637.g21b0678d19-goog<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Arnaldo<br>
<br>
-- <br>
<br>
- Arnaldo<br>
</blockquote></div></div>

--00000000000039e15905f55048fa--

--===============7423081693233259934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7423081693233259934==--
