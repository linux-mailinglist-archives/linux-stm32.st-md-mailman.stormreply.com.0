Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3378BDF22
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 11:57:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B4E6C5E2D1;
	Tue,  7 May 2024 09:57:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47759C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 09:57:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9251063;
 Tue,  7 May 2024 02:58:17 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 46E393F587; Tue,  7 May 2024 02:57:48 -0700 (PDT)
Message-ID: <07e869aa-6c4d-46f1-bce1-fe37aa72ce87@arm.com>
Date: Tue, 7 May 2024 10:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-14-james.clark@arm.com>
 <8080ae06-7014-4afe-8620-ffaca6e3c597@arm.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <8080ae06-7014-4afe-8620-ffaca6e3c597@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, suzuki.poulose@arm.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Garry <john.g.garry@oracle.com>, coresight@lists.linaro.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, scclevenger@os.amperecomputing.com,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH 12/17] coresight: Make CPU id map a
 property of a trace ID map
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



On 07/05/2024 07:22, Anshuman Khandual wrote:
> 
> 
> On 4/29/24 20:51, James Clark wrote:
>> The global CPU ID mappings won't work for per-sink ID maps so move it to
>> the ID map struct. coresight_trace_id_release_all_pending() is hard
>> coded to operate on the default map, but once Perf sessions use their
>> own maps the pending release mechanism will be deleted. So it doesn't
>> need to be extended to accept a trace ID map argument at this point.
>>
>> Signed-off-by: James Clark <james.clark@arm.com>
>> ---
>>  .../hwtracing/coresight/coresight-etm-perf.c  |  3 +-
>>  .../coresight/coresight-etm3x-core.c          |  3 +-
>>  .../coresight/coresight-etm4x-core.c          |  3 +-
>>  .../hwtracing/coresight/coresight-trace-id.c  | 28 ++++++++-----------
>>  .../hwtracing/coresight/coresight-trace-id.h  |  2 +-
>>  include/linux/coresight.h                     |  1 +
>>  6 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 4afb9d29f355..25f1f87c90d1 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -508,7 +508,8 @@ static void etm_event_start(struct perf_event *event, int flags)
>>  		hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
>>  				   CS_AUX_HW_ID_CURR_VERSION);
>>  		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
>> -				    coresight_trace_id_read_cpu_id(cpu));
>> +				    coresight_trace_id_read_cpu_id(cpu,
>> +						coresight_trace_id_map_default()));
>>  		perf_report_aux_output_id(event, hw_id);
>>  	}
>>  
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index 4149e7675ceb..b21f5ad94e63 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -501,7 +501,8 @@ static int etm_enable_perf(struct coresight_device *csdev,
>>  	 * with perf locks - we know the ID cannot change until perf shuts down
>>  	 * the session
>>  	 */
>> -	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu);
>> +	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu,
>> +						  coresight_trace_id_map_default());
>>  	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>  		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
>>  			dev_name(&drvdata->csdev->dev), drvdata->cpu);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index f32c8cd7742d..d16d6efb26fa 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -776,7 +776,8 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>>  	 * with perf locks - we know the ID cannot change until perf shuts down
>>  	 * the session
>>  	 */
>> -	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu);
>> +	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu,
>> +						  coresight_trace_id_map_default());
>>  	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>  		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
>>  			dev_name(&drvdata->csdev->dev), drvdata->cpu);
>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
>> index 45ddd50d09a6..b393603dd713 100644
>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>> @@ -13,10 +13,12 @@
>>  #include "coresight-trace-id.h"
>>  
>>  /* Default trace ID map. Used in sysfs mode and for system sources */
>> -static struct coresight_trace_id_map id_map_default;
>> +static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>> +static struct coresight_trace_id_map id_map_default = {
>> +	.cpu_map = &id_map_default_cpu_ids
>> +};
>>  
>> -/* maintain a record of the mapping of IDs and pending releases per cpu */
>> -static DEFINE_PER_CPU(atomic_t, cpu_id) = ATOMIC_INIT(0);
>> +/* maintain a record of the pending releases per cpu */
>>  static cpumask_t cpu_id_release_pending;
>>  
>>  /* perf session active counter */
>> @@ -46,12 +48,6 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
>>  #define PERF_SESSION(n)
>>  #endif
>>  
>> -/* unlocked read of current trace ID value for given CPU */
>> -static int _coresight_trace_id_read_cpu_id(int cpu)
>> -{
>> -	return atomic_read(&per_cpu(cpu_id, cpu));
>> -}
> 
> Just wondering where this per cpu cpu_id ^^ is being dropped off as well
> OR is it still getting used ?
> 

No it's still needed. It's not dropped in this set.

I just moved the implementation into coresight_trace_id_read_cpu_id()
rather than add a new argument to _coresight_trace_id_read_cpu_id().
Although I might change that because of Mike's comment about keeping
both the map and non map versions of the functions to reduce some of the
churn changing the callers.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
