Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C68FDE97
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 08:15:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D5F3C712A2;
	Thu,  6 Jun 2024 06:15:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E0F3C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 20:35:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B0B339;
 Wed,  5 Jun 2024 13:36:15 -0700 (PDT)
Received: from [10.2.76.71] (e132581.arm.com [10.2.76.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 536A23F64C;
 Wed,  5 Jun 2024 13:35:48 -0700 (PDT)
Message-ID: <d89cd4b3-5839-47ce-89e2-a1f0f4d2ed6c@arm.com>
Date: Wed, 5 Jun 2024 21:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, gankulkarni@os.amperecomputing.com,
 mike.leach@linaro.org, leo.yan@linux.dev, anshuman.khandual@arm.com
References: <20240604143030.519906-1-james.clark@arm.com>
Content-Language: en-US
From: Leo Yan <leo.yan@arm.com>
In-Reply-To: <20240604143030.519906-1-james.clark@arm.com>
X-Mailman-Approved-At: Thu, 06 Jun 2024 06:15:23 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/16] coresight: Use per-sink trace ID
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/4/24 15:30, James Clark wrote:
> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> as long as there are fewer than that many ETMs connected to each sink.

I tested this patch set on Hikey960 with below combinations:

- Only applied the kernel patches;
- Only applied the perf tool patches;
- Applied both the kernel and perf tool patches.

All of them can pass the test for `perf record` and `perf report` 
commands, I think this patch series is promised on Armv8 platform with 
small amount of CPUs.

Tested-by: Leo Yan <leo.yan@arm.com>

As you said that there might be a concern for running this patch set on 
a system with big amount of CPUs. Once you think it's ready for merging, 
please share at here.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
