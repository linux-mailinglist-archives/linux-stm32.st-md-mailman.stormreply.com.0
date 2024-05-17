Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D820B8C848A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 12:09:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 999A6C6DD6D;
	Fri, 17 May 2024 10:09:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33CA3C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 10:09:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C2A1424;
 Fri, 17 May 2024 03:09:30 -0700 (PDT)
Received: from [10.91.2.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9856A3F762;
 Fri, 17 May 2024 03:09:03 -0700 (PDT)
Message-ID: <9b7a5afb-63b9-4dd2-8a43-32ae725c42bf@arm.com>
Date: Fri, 17 May 2024 12:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mike Leach <mike.leach@linaro.org>
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-12-james.clark@arm.com>
 <CAJ9a7Vjj++Bvu2EFVxpXvW4nes0qxVqjxgBWwi1L904p86a7gw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <CAJ9a7Vjj++Bvu2EFVxpXvW4nes0qxVqjxgBWwi1L904p86a7gw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 11/17] coresight: Expose map argument in
	trace ID API
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



On 01/05/2024 12:31, Mike Leach wrote:
> Hi James,
> 
> On Mon, 29 Apr 2024 at 16:25, James Clark <james.clark@arm.com> wrote:
>>
>> The trace ID API is currently hard coded to always use the global map.
>> The functions that take the map as an argument aren't currently public.
>> Make them public so that Perf mode can pass in its own maps. At the
>> moment all usages are still hard coded to use the global map, but now
>> on the caller side.
>>
>> System ID functions are unchanged because they will always use the
>> default map.
>>
>> Signed-off-by: James Clark <james.clark@arm.com>
>> ---
>>  .../hwtracing/coresight/coresight-etm-perf.c  |  5 +++--
>>  .../coresight/coresight-etm3x-core.c          |  5 +++--
>>  .../coresight/coresight-etm4x-core.c          |  5 +++--
>>  .../hwtracing/coresight/coresight-trace-id.c  | 22 +++++++------------
>>  .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++---
>>  5 files changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index c0c60e6a1703..4afb9d29f355 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -232,7 +232,7 @@ static void free_event_data(struct work_struct *work)
>>                 if (!(IS_ERR_OR_NULL(*ppath)))
>>                         coresight_release_path(*ppath);
>>                 *ppath = NULL;
>> -               coresight_trace_id_put_cpu_id(cpu);
>> +               coresight_trace_id_put_cpu_id(cpu, coresight_trace_id_map_default());
>>         }
>>
>>         /* mark perf event as done for trace id allocator */
>> @@ -401,7 +401,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>>                 }
>>
>>                 /* ensure we can allocate a trace ID for this CPU */
>> -               trace_id = coresight_trace_id_get_cpu_id(cpu);
>> +               trace_id = coresight_trace_id_get_cpu_id(cpu,
>> +                                                        coresight_trace_id_map_default());
>>                 if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>                         cpumask_clear_cpu(cpu, mask);
>>                         coresight_release_path(path);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index 9d5c1391ffb1..4149e7675ceb 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -465,7 +465,8 @@ int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
>>          *
>>          * trace id function has its own lock
>>          */
>> -       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
>> +       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu,
>> +                                                coresight_trace_id_map_default());
>>         if (IS_VALID_CS_TRACE_ID(trace_id))
>>                 drvdata->traceid = (u8)trace_id;
>>         else
>> @@ -477,7 +478,7 @@ int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
>>
>>  void etm_release_trace_id(struct etm_drvdata *drvdata)
>>  {
>> -       coresight_trace_id_put_cpu_id(drvdata->cpu);
>> +       coresight_trace_id_put_cpu_id(drvdata->cpu, coresight_trace_id_map_default());
>>  }
>>
>>  static int etm_enable_perf(struct coresight_device *csdev,
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index a0bdfabddbc6..f32c8cd7742d 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -241,7 +241,8 @@ int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
>>          * or return the one currently allocated.
>>          * The trace id function has its own lock
>>          */
>> -       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
>> +       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu,
>> +                                                coresight_trace_id_map_default());
>>         if (IS_VALID_CS_TRACE_ID(trace_id))
>>                 drvdata->trcid = (u8)trace_id;
>>         else
>> @@ -253,7 +254,7 @@ int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
>>
>>  void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>>  {
>> -       coresight_trace_id_put_cpu_id(drvdata->cpu);
>> +       coresight_trace_id_put_cpu_id(drvdata->cpu, coresight_trace_id_map_default());
>>  }
>>
>>  struct etm4_enable_arg {
>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
>> index 19005b5b4dc4..45ddd50d09a6 100644
>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>> @@ -12,7 +12,7 @@
>>
>>  #include "coresight-trace-id.h"
>>
>> -/* Default trace ID map. Used on systems that don't require per sink mappings */
>> +/* Default trace ID map. Used in sysfs mode and for system sources */
>>  static struct coresight_trace_id_map id_map_default;
>>
>>  /* maintain a record of the mapping of IDs and pending releases per cpu */
>> @@ -152,7 +152,7 @@ static void coresight_trace_id_release_all_pending(void)
>>         DUMP_ID_MAP(id_map);
>>  }
>>
>> -static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>> +int coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>>  {
>>         unsigned long flags;
>>         int id;
>> @@ -195,8 +195,9 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>>         DUMP_ID_MAP(id_map);
>>         return id;
>>  }
>> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id);
>>
>> -static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>> +void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>>  {
>>         unsigned long flags;
>>         int id;
>> @@ -222,6 +223,7 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
>>         DUMP_ID_CPU(cpu, id);
>>         DUMP_ID_MAP(id_map);
>>  }
>> +EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
>>
>>  static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
>>  {
>> @@ -250,19 +252,11 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
>>         DUMP_ID_MAP(id_map);
>>  }
>>
>> -/* API functions */
>> -
> 
> Rather than remove the existing default trace ID functions, simply add
> a few new ones...
> 
> e.g. given the existing...
> 
> void coresight_trace_id_put_cpu_id(int cpu)
> {
>     coresight_trace_id_map_put_cpu_id(cpu, &id_map_default);
> }
> EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
> 
> add:-
> 
> void coresight_trace_id_put_cpu_id_map(int cpu, struct
> coresight_trace_id_map *id_map)
> {
>     coresight_trace_id_map_put_cpu_id(cpu, id_map);
> }
> EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id_map);
> 
> This avoids a whole lot of churn in exposing the default map to
> external functions, putting it in there and then removing it later.
> When any location that was using coresight_trace_id_put_cpu_id() needs
> to supply its own map, change the function name at that point to
> coresight_trace_id_put_cpu_id_map()
> 
> Mike
> 
> 

Yeah I was on the fence about this one when writing it, but I agree I
can make this change.

James
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
