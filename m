Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B948BB4C1
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 22:24:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35DCBC712BD;
	Fri,  3 May 2024 20:24:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B395C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 20:23:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D08DCE1A19;
 Fri,  3 May 2024 20:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAD8C116B1;
 Fri,  3 May 2024 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714767834;
 bh=VHK2aYXQsjwUVWEy+15TxeXXA9tATJmF9VCn5bK+xlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3znZihvBOZCe+Su1jHeQ4Usj4NM8suZd89dcBJWo8tt5kYIE9olqRolnGuImWyyv
 fhE8F72lrnZsrreBH4pXIxIvUCOqvVgxeGTV+6VXcASG1fL6cbANzlu8mI5ObU0lRY
 pIw6V9c7Os3iZtCGUAnUMYZ99XchqPuoW3v8sNLkv/eLQkJ0qdI87sa8sZVaIHSp/Y
 BmnUfO1ppzA5rYy+PuN7MKTuBJPR7XKNU4v2pmNpV4i9NsjQCj8F/nCNhgdLMZIN5O
 z3JGzsb4A6I1+lSH8Ovyun6au29I2oiXNMQgtDB1CONeU0J3WmI+fvLy0Os5gwL78Y
 d6sR9BBQQ6WDA==
Date: Fri, 3 May 2024 17:23:51 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@arm.com>
Message-ID: <ZjVH118DtAdZKo2v@x1>
References: <20240429152207.479221-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429152207.479221-1-james.clark@arm.com>
Cc: scclevenger@os.amperecomputing.com, Mark Rutland <mark.rutland@arm.com>,
 Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 suzuki.poulose@arm.com, coresight@lists.linaro.org,
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

On Mon, Apr 29, 2024 at 04:21:45PM +0100, James Clark wrote:
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

I guess I can pick the tooling part now, right? Further reviewing would
be nice tho.

- Arnaldo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
