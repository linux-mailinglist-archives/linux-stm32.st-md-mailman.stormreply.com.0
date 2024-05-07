Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 595428BE06A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 12:57:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F593C5E2D2;
	Tue,  7 May 2024 10:57:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F454C5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 10:57:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B5191063;
 Tue,  7 May 2024 03:57:58 -0700 (PDT)
Received: from [10.163.37.41] (unknown [10.163.37.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31DEF3F587;
 Tue,  7 May 2024 03:57:23 -0700 (PDT)
Message-ID: <ecb16ad9-7c91-4cf6-ab7e-4b4b5be7165c@arm.com>
Date: Tue, 7 May 2024 16:27:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-2-james.clark@arm.com>
 <08bcd616-5006-45df-b8cc-45cf3a1dd762@arm.com>
 <de635db0-6510-452f-91be-4fc5f7fdf671@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <de635db0-6510-452f-91be-4fc5f7fdf671@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Garry <john.g.garry@oracle.com>, coresight@lists.linaro.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, scclevenger@os.amperecomputing.com,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
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



On 5/7/24 15:36, James Clark wrote:
> 
> 
> On 07/05/2024 04:47, Anshuman Khandual wrote:
>>
>>
>> On 4/29/24 20:51, James Clark wrote:
>>> The likely fix for this is to update Perf so print a helpful message.
>>>
>>> Signed-off-by: James Clark <james.clark@arm.com>
>>> ---
>>>  tools/perf/util/cs-etm.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>>> index d65d7485886c..32818bd7cd17 100644
>>> --- a/tools/perf/util/cs-etm.c
>>> +++ b/tools/perf/util/cs-etm.c
>>> @@ -335,8 +335,11 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
>>>  	trace_chan_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
>>>  
>>>  	/* check that we can handle this version */
>>> -	if (version > CS_AUX_HW_ID_CURR_VERSION)
>>> +	if (version > CS_AUX_HW_ID_CURR_VERSION) {
>>> +		pr_err("CS ETM Trace: PERF_RECORD_AUX_OUTPUT_HW_ID version %d not supported. Please update Perf.\n",
>>
>> Is not this bit misleading ? PERF_RECORD_AUX_OUTPUT_HW_ID is just the perf record
>> format identifier. The record version here, is derived from the platform specific
>> hardware ID information embedded in this perf record.
> 
> Not sure I follow what you mean here. 'version' is something that's
> output by the kernel. It's saved into a perf.data file, and if Perf
> can't handle version 2 for example, you need to update Perf.

Got it.

> 
>>
>> Should not this be just s/PERF_RECORD_AUX_OUTPUT_HW_ID/hardware ID/ instead ?
>>
> 
> It's just a way to go from the error message to the part of the code or
> docs that you need to look at. "hardware ID" wouldn't lead you anywhere
> so I don't think it would be useful.

Sure, fair enough.

> 
>>> +		       version);
>>>  		return -EINVAL;
>>> +	}
>>>  
>>>  	/* get access to the etm metadata */
>>>  	etm = container_of(session->auxtrace, struct cs_etm_auxtrace, auxtrace);
>>
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
