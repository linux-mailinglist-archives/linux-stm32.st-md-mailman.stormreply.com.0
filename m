Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE988B88DF
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 13:07:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3491AC7129F;
	Wed,  1 May 2024 11:07:43 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E554C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 11:07:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f28bb6d747so5614089b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714561660; x=1715166460;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ek5F3YPIQaz7pVJGDrpZC6fIvMvYFFyBjkRJozj7mhk=;
 b=WsXMURoLSqCLCDePXB1fiMiM25CLp2+93jnTo1/4uUq7pWESNGL3r1O6Nvpg5CCRHv
 7KNIuydYbiBcNFSt0XZg8qGtQq8T7Gy8khScxIcuH3Tkg8UjpIAK8mm2mzC6FLZZJ3Jz
 DuyAkZdCcfWEwBSM7VglZ1LGsgkfIxft/Sl3pSarXdemGXj8mE3gq2PNYvsEdFx5Mm5e
 LfNTKDFfYjVNkS6Zm1l/K+B4wrwJDp3fHVpbo6yHjUxV8cQ2JU9WJ1L9zt6BR+n6g9Rb
 dijm3pJ7hRPz2/U2yzOvL9uGV/29I6MvQ9xzij2uYywjan1hYH/Pcg3BwScq7ohWcsfH
 J/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714561660; x=1715166460;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ek5F3YPIQaz7pVJGDrpZC6fIvMvYFFyBjkRJozj7mhk=;
 b=nAdqDmW1tnwzllCTuokrxt/uypjd2VSvalOVNhTwqRzmxytanNMW76iUo/4SsXHR+y
 CyD2mjTfqlA01zSFk8LFESS6LjWl+HPHRZrjPXMzjpnCa6oNh9JKRnMTNVXdTxIEM5zH
 +15euRJmokx9FarVRF+makg63JoW2LN6DD9QCuwEk1+Lljjg/F1jEL2JFu6ELqr2wbbo
 CbBxOhFDCdrtZMLyXaSliNwPPFhQZFEp/JcoOaS5PPeYgBTzoBcsahbJXzbjIvZBNU2M
 /ZoywNJARJVyXyf+iPfYxnTJ0h74l+DkBhx9GUQI/a2S2Jq0FxKZB8vIgV0KOrCKTdXH
 kDfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgjfY6G/mT8Qo5tiq/3aBqViqUfLL8r709XlnZGVhtcC+QYqWDvQdsp4R4O03QOxrWJ7iJYrlV1KJyGNC3mKtuXy+lvtzDQmuhYeaLESO4Y1FYxOFnpiIH
X-Gm-Message-State: AOJu0Ywlzvp2VzfN2DcYrRtQr73T+5INoxHEkejROVZE2J6c4EYzX0z4
 anECvrWzGjN8u7/BKvII1K391W4O0tv/h2IB+cRPsG3+uZ/wB4POxvChwe1FGcOGk47zrONXv00
 fTHewbNuARs4H87BfpS/aHC1WaTuFg2HeprrBiQ==
X-Google-Smtp-Source: AGHT+IE/tyinAuqC8y5bBreMEgtKVRNCzWBS/7la0SOC/SOUmFsQmilGpTeNNFJve+JepEwqeq9sMzFbKUfoY4RzIdo=
X-Received: by 2002:a05:6a20:3213:b0:1a9:c757:a22d with SMTP id
 hl19-20020a056a20321300b001a9c757a22dmr2167796pzc.14.1714561659976; Wed, 01
 May 2024 04:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-10-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-10-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 May 2024 12:07:29 +0100
Message-ID: <CAJ9a7Vgvdjz9peyDzRzAJ3DDGFfjVD0dNXgcJ7b+g-WvCwZ1QQ@mail.gmail.com>
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

On Mon, 29 Apr 2024 at 16:24, James Clark <james.clark@arm.com> wrote:
>
> "Process being monitored" and "pid of the process to monitor" imply that
> this would be the same PID if there were two sessions targeting the same
> process. But this is actually the PID of the process that did the Perf
> event open call, rather than the target of the session. So update the
> comments to make this clearer.
>
> Signed-off-by: James Clark <james.clark@arm.com>
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
>   * @drvdata            - The ETR drvdaga this buffer has been allocated for.
>   * @etr_buf            - Actual buffer used by the ETR
> - * @pid                        - The PID this etr_perf_buffer belongs to.
> + * @pid                        - The PID of the session owner that etr_perf_buffer
> + *                       belongs to.
>   * @snaphost           - Perf session mode
>   * @nr_pages           - Number of pages in the ring buffer.
>   * @pages              - Array of Pages in the ring buffer.
> @@ -1662,7 +1663,7 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>                 goto unlock_out;
>         }
>
> -       /* Get a handle on the pid of the process to monitor */
> +       /* Get a handle on the pid of the session owner */
>         pid = etr_perf->pid;
>
>         /* Do not proceed if this device is associated with another session */
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index c77763b49de0..2671926be62a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -171,8 +171,9 @@ struct etr_buf {
>   * @csdev:     component vitals needed by the framework.
>   * @miscdev:   specifics to handle "/dev/xyz.tmc" entry.
>   * @spinlock:  only one at a time pls.
> - * @pid:       Process ID of the process being monitored by the session
> - *             that is using this component.
> + * @pid:       Process ID of the process that owns the session that is using
> + *             this component. For example this would be the pid of the Perf
> + *             process.
>   * @buf:       Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:   details of buffer used in TMC-ETR
>   * @len:       size of the available trace for ETF/ETB.
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
