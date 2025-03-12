Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DEA5DD1F
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 13:54:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66511C7801E;
	Wed, 12 Mar 2025 12:54:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E491C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 12:54:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22548a28d0cso43707895ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741784093; x=1742388893;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P41L4c+Opb1IQnEi9LDyI8HBaw91mzMN/9HEGsnySy8=;
 b=EAXgHleNowy0dMZHrQrqpoNX2sU1i8wPUxvAfAw9R4zn1CTgub9FJQPHeGOYsXwfTE
 +U4DKilHRzbu9dNuzJbGS/QFR+NicAV8jkX13GNaKxkvbDws+LyLn4BE8F0ovr/YM+BQ
 0oNFdcBDJTStWmRjWAIwjzWkO40WwO8uEnI8ULFTKmSEJ3GOr9GsQgP3zByIntixYNAn
 Kcv714t15u2HOl6CjLHz5wrKGFD6bKe5RsCKYUfhgDMh5OcJfo13hDRnJTaDu+qojrHJ
 iqda1RhmqhcKIvsrF+MboooMjlK6uFoe2oqRIEAo2qQTWIxKSTuLV+nNXCXvF4OcWKNn
 NYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741784093; x=1742388893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P41L4c+Opb1IQnEi9LDyI8HBaw91mzMN/9HEGsnySy8=;
 b=hA1ySPESB33VDmDyUnztaRhEtMosfF9yilbocUPnhdjEMMPvvqOTzFu0BEKVPAmgFT
 g1DHY4xc4qpAW15ZlgL4UmTfJFiYC2TG0mAqi9cBjlh5bPOza7neXLzEKHclV0eFmhg+
 PAPY0T2nuZFkK9rRT4QexZcBn92evsXqEYdPlmhFI+Sc2RADGjWAlwxtK1QKh1dIvlqv
 23I6AWiU8P2WwO4QrV+s26c5mI8hcUKiGTniS/6lttv8FmbmGCQMzNb5r2VmGpolUoIL
 y3Bx2NEA5cF4GnEudYg0ikvokVgJUa93CvLgFEzhf0219g644rOVkz0YhIH6fDgi7A+p
 UxhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGu0f99yc6h8pA0E2F7l4xEyl77v9G1ZsGtSohexi5F2FO/6lp5YJCmkkN71ZoZJqEIDlUdie7hIYeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxujVPz0P4M4dMnJx4TBMQ8l3uxtqcfd+CUaNK1btvevVZAIWf/
 vjduElWNq6B0RRhPBnQOlGIYVqQKEu0s1B2phRvaJP8irdVkFtfGTpjV/Zgwxag4kLb4T4dJYUK
 iUXKce/vzOq4QrKmHW0kmImUDLWExd6xCvXGmvg==
X-Gm-Gg: ASbGncvLMfnWGyCWgsZl3T+OPMPHNRc5VrCLOLN9X7lrqlbZ0sssGskjqBfk0qg0y74
 gdiaFngMGjttlWZ0etvEStJfmLKzon5iAYUOU2o54AJZE1ls/DNOiDrPXwbDrJKzyzWDYwaJznJ
 dcMFdSlxcJC0ipsltH/scheAaqEPg=
X-Google-Smtp-Source: AGHT+IEmvzgsrnWJ3LS9iuiefnI5/Y1q51JDiJPKEl1YavKMn2nS0Mp6TQ/OYLWI5gnSPzE5ELMRM9TgS5WSMkJCuv0=
X-Received: by 2002:a05:6a00:194b:b0:736:5e6f:295b with SMTP id
 d2e1a72fcca58-736aaa5d6c4mr32299739b3a.12.1741784092687; Wed, 12 Mar 2025
 05:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-2-quic_jiegan@quicinc.com>
 <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
 <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
In-Reply-To: <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Mar 2025 12:54:41 +0000
X-Gm-Features: AQ5f1JrjHjNAhBmSqhZ9QdvfeDjrNBtawx-M2q_IwgCWoudUHO1tG95UqLFNpqQ
Message-ID: <CAJ9a7VhDD3813LtH_5AYyM-2mhCNP+vRmqXn4RWqg5F8FEe-Mg@mail.gmail.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/4] coresight: tmc: Introduce new APIs
 to get the RWP offset of ETR buffer
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

Hi Jie,

On Wed, 12 Mar 2025 at 01:21, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 3/12/2025 12:49 AM, Mike Leach wrote:
> > Hi,
> >
> > On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
> >>
> >> The new functions calculate and return the offset to the write pointer of
> >> the ETR buffer based on whether the memory mode is SG, flat or reserved.
> >> The functions have the RWP offset can directly read data from ETR buffer,
> >> enabling the transfer of data to any required location.
> >>
> >> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> >> ---
> >>   .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
> >>   drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
> >>   2 files changed, 41 insertions(+)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> index eda7cdad0e2b..ec636ab1fd75 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
> >>   }
> >>   EXPORT_SYMBOL_GPL(tmc_free_sg_table);
> >>
> >> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
> >> +       u64 rwp;
> >> +
> >
> > It is not valid to read RWP if the TMC is running. It must be in the
> > stopped or disabled state - see the specifications for TMC /ETR
> >
> > It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
> > the spinlock that protects drvdata
> >
> > See the code in coresight_tmc_etr.c :-
> >
> > e.g. in
> >
> > tmc_update_etr_buffer()
> >
> > ...
> > <take spinlock>
> > ...
> > CS_UNLOCK(drvdata->base);
> > tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
> > flushed to memory - essential to ensure full formatted frame is in
> > memory.
> > tmc_sync_etr_buf(drvdata); // this function reads rwp.
> > CS_LOCK(drvdata->base);
> > <release spinlokc>
> >
> > This type of program flow is common to both sysfs and perf handling of
> > TMC buffers.
>
> Hi Mike,
>
> I am fully understood your point here.
>
> The function is designed this way to read the w_offset (which may not be
> entirely accurate because the etr buffer is not synced) when the

Why would you ever base memory access on a pointer that is not
entirely accurate?

The manuals for TMC/ETR all state that reads to both RWP and RRP when
the ETR is running return unknown values. These cannot be used to
access the buffer, or determine how much of the buffer has been used
on a running ETR.

The ETR specification specifically states that it is not permitted to
read the buffer data while the ETR is running, when configured in
circular buffer mode - which is the mode used in the TMC-ETR linux
drivers.

Reading the buffer while ETR is running is only permitted if
configured in Software FIFO mode 2 - were the ETR will stop on full
and stall incoming trace until some data is read out, signalled to the
ETR via the RURP.

I also note that you are reading back the etr_buf data without doing
any dma_sync operations that the perf and sysfs methods in the driver
do, after stopping the tmc.

> byte-cntr devnode is opened, aiming to reduce the length of redundant
> trace data. In this case, we cannot ensure the TMC is stopped or
> disabled.

The specification requires that you must ensure the TMC is stopped to
read these registers.


>The byte-cntr only requires an offset to know where it can
> start before the expected trace data gets into ETR buffer.
>
> The w_offset is also read when the byte-cntr function stops, which
> occurs after the TMC is disabled.
>
> Maybe this is not a good idea and I should read r_offset upon open?
> The primary goal for byte-cntr is trying to transfer useful trace data
> from the ETR buffer to the userspace, if we start from r_offset, a large
> number of redundant trace data which the user does not expect will be
> transferred simultaneously.
>
>

It is difficult to justify adding code to a driver that does not
correspond to the specification of the hardware device.

Regards

Mike

> >
> >> +       rwp = tmc_read_rwp(drvdata);
> >> +       return rwp - paddr;
> >> +}
> >> +
> >> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> >> +       struct etr_sg_table *etr_table = etr_buf->private;
> >> +       struct tmc_sg_table *table = etr_table->sg_table;
> >> +       long w_offset;
> >> +       u64 rwp;
> >> +
> >
> > Same comments as above
> >
> >> +       rwp = tmc_read_rwp(drvdata);
> >> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
> >> +
> >> +       return w_offset;
> >> +}
> >> +
> >> +/*
> >> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
> >> + * the memory mode is SG, flat or reserved.
> >> + */
> >> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> >> +
> >
> > As this is an exported function, please ensure that the inputs are
> > valid - check the pointers
>
> Sure, will do.
>
> Thanks,
> Jie
>
> >
> > Code to ensure TMC is flushed and stopped could be inserted here.
> >
> > Regards
> >
> > Mike
> >
> >> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
> >> +               return tmc_sg_get_rwp_offset(drvdata);
> >> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
> >> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
> >> +       else
> >> +               return -EINVAL;
> >> +}
> >> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
> >> +
> >>   /*
> >>    * Alloc pages for the table. Since this will be used by the device,
> >>    * allocate the pages closer to the device (i.e, dev_to_node(dev)
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> >> index b48bc9a01cc0..baedb4dcfc3f 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> >> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
> >>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> >>                                     enum cs_mode mode, void *data);
> >>   extern const struct attribute_group coresight_etr_group;
> >> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
> >>
> >>   #endif
> >> --
> >> 2.34.1
> >>
> >
> >
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
