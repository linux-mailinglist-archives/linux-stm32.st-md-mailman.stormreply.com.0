Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC58FC5EB
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 10:19:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D85DC6C855;
	Wed,  5 Jun 2024 08:19:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08AC0C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 08:19:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81375DA7;
 Wed,  5 Jun 2024 01:19:55 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 BF1BF3F762; Wed,  5 Jun 2024 01:19:26 -0700 (PDT)
Message-ID: <e0434947-4fe9-43f8-87dd-91e6eb491341@arm.com>
Date: Wed, 5 Jun 2024 09:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Hunter <adrian.hunter@intel.com>
References: <20240604143030.519906-1-james.clark@arm.com>
 <20240604143030.519906-3-james.clark@arm.com>
 <12c09d40-788d-4af1-9eb6-0f5699875d70@intel.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <12c09d40-788d-4af1-9eb6-0f5699875d70@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 John Garry <john.g.garry@oracle.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, mike.leach@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, anshuman.khandual@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com, suzuki.poulose@arm.com
Subject: Re: [Linux-stm32] [PATCH v2 02/16] perf auxtrace: Allow number of
 queues to be specified
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



On 05/06/2024 06:26, Adrian Hunter wrote:
> On 4/06/24 17:30, James Clark wrote:
>> Currently it's only possible to initialize with the default number of
>> queues and then use auxtrace_queues__add_event() to grow the array. But
>> that's problematic if you don't have a real event to pass into that
>> function yet.
>>
>> The queues hold a void *priv member to store custom state, and for
>> Coresight we want to create decoders upfront before receiving data, so
>> add a new function that allows pre-allocating queues. One reason to do
>> this is because we might need to store metadata (HW_ID events) that
>> effects other queues, but never actually receive auxtrace data on that
>> queue.
>>
>> Signed-off-by: James Clark <james.clark@arm.com>
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> Again ;-)
> 

Oops yeah I should have picked that up. This one was already applied to
perf-tools-next as well.

Thanks

>> ---
>>  tools/perf/util/auxtrace.c | 9 +++++++--
>>  tools/perf/util/auxtrace.h | 1 +
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
>> index 3684e6009b63..563b6c4fca31 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -218,15 +218,20 @@ static struct auxtrace_queue *auxtrace_alloc_queue_array(unsigned int nr_queues)
>>  	return queue_array;
>>  }
>>  
>> -int auxtrace_queues__init(struct auxtrace_queues *queues)
>> +int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues)
>>  {
>> -	queues->nr_queues = AUXTRACE_INIT_NR_QUEUES;
>> +	queues->nr_queues = nr_queues;
>>  	queues->queue_array = auxtrace_alloc_queue_array(queues->nr_queues);
>>  	if (!queues->queue_array)
>>  		return -ENOMEM;
>>  	return 0;
>>  }
>>  
>> +int auxtrace_queues__init(struct auxtrace_queues *queues)
>> +{
>> +	return auxtrace_queues__init_nr(queues, AUXTRACE_INIT_NR_QUEUES);
>> +}
>> +
>>  static int auxtrace_queues__grow(struct auxtrace_queues *queues,
>>  				 unsigned int new_nr_queues)
>>  {
>> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
>> index 55702215a82d..8a6ec9565835 100644
>> --- a/tools/perf/util/auxtrace.h
>> +++ b/tools/perf/util/auxtrace.h
>> @@ -521,6 +521,7 @@ int auxtrace_mmap__read_snapshot(struct mmap *map,
>>  				 struct perf_tool *tool, process_auxtrace_t fn,
>>  				 size_t snapshot_size);
>>  
>> +int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues);
>>  int auxtrace_queues__init(struct auxtrace_queues *queues);
>>  int auxtrace_queues__add_event(struct auxtrace_queues *queues,
>>  			       struct perf_session *session,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
