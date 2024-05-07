Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83E8BDA27
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 06:25:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6F61C5E2D2;
	Tue,  7 May 2024 04:25:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86477C5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 04:25:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAFD21042;
 Mon,  6 May 2024 21:26:02 -0700 (PDT)
Received: from [10.163.33.37] (unknown [10.163.33.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A323F762;
 Mon,  6 May 2024 21:25:28 -0700 (PDT)
Message-ID: <3fa5f992-b758-4928-9bf9-0c6e82db1f65@arm.com>
Date: Tue, 7 May 2024 09:55:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-10-james.clark@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240429152207.479221-10-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/17] coresight: Clarify comments around
 the PID of the sink owner
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



On 4/29/24 20:51, James Clark wrote:
> "Process being monitored" and "pid of the process to monitor" imply that
> this would be the same PID if there were two sessions targeting the same
> process. But this is actually the PID of the process that did the Perf
> event open call, rather than the target of the session. So update the
> comments to make this clearer.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

This indeed removes the ambiguity that the PID belongs to the perf session
owner rather than the monitored or target process.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 5 +++--
>  drivers/hwtracing/coresight/coresight-tmc.h     | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index e75428fa1592..8962fc27d04f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -36,7 +36,8 @@ struct etr_buf_hw {
>   * etr_perf_buffer - Perf buffer used for ETR
>   * @drvdata		- The ETR drvdaga this buffer has been allocated for.
>   * @etr_buf		- Actual buffer used by the ETR
> - * @pid			- The PID this etr_perf_buffer belongs to.
> + * @pid			- The PID of the session owner that etr_perf_buffer
> + *			  belongs to.
>   * @snaphost		- Perf session mode
>   * @nr_pages		- Number of pages in the ring buffer.
>   * @pages		- Array of Pages in the ring buffer.
> @@ -1662,7 +1663,7 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>  		goto unlock_out;
>  	}
>  
> -	/* Get a handle on the pid of the process to monitor */
> +	/* Get a handle on the pid of the session owner */
>  	pid = etr_perf->pid;
>  
>  	/* Do not proceed if this device is associated with another session */
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index c77763b49de0..2671926be62a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -171,8 +171,9 @@ struct etr_buf {
>   * @csdev:	component vitals needed by the framework.
>   * @miscdev:	specifics to handle "/dev/xyz.tmc" entry.
>   * @spinlock:	only one at a time pls.
> - * @pid:	Process ID of the process being monitored by the session
> - *		that is using this component.
> + * @pid:	Process ID of the process that owns the session that is using
> + *		this component. For example this would be the pid of the Perf
> + *		process.
>   * @buf:	Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:	details of buffer used in TMC-ETR
>   * @len:	size of the available trace for ETF/ETB.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
