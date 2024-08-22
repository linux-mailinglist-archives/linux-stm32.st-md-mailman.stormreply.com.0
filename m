Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E302295B88D
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 16:35:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5F21C71287;
	Thu, 22 Aug 2024 14:35:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CE9EC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:35:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071C3DA7;
 Thu, 22 Aug 2024 07:35:38 -0700 (PDT)
Received: from [10.57.72.240] (unknown [10.57.72.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49AD23F66E;
 Thu, 22 Aug 2024 07:35:08 -0700 (PDT)
Message-ID: <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
Date: Thu, 22 Aug 2024 15:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1> <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1> <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
 <ZqO3gPcCCVh1r5WM@x1>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ZqO3gPcCCVh1r5WM@x1>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Arnaldo,

On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:
> On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
>> On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
>>> On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
>>>> On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
>>>>> On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
>>>>>> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
>>>>>> as long as there are fewer than that many ETMs connected to each sink.
>>>>>
>>>>> Hey, may I take the tools part, i.e. patches 0-7 and someone on the ARM
>>>>> kernel team pick the driver bits?
> 
>>>> I plan to pick the kernel driver bits for v6.12
> 
>>> Perhaps it is better for me to wait for that?
> 
>> Yes, please.
> 
> Please let me know when you do so so that I can merge the tooling bits.

I have now merged the driver changes to coresight/next, they will be
sent to Greg for v6.12. [0]

You may go ahead and merge the tool bits.

Thanks
Suzuki

[0] 
https://lkml.kernel.org/r/172433479466.350842.6920589600831615538.b4-ty@arm.com


> 
> Thanks,
> 
> - Arnaldo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
