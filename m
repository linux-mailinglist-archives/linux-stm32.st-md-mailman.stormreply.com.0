Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA87A5CB21
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 17:50:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D3D6C78002;
	Tue, 11 Mar 2025 16:50:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8FE2CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 16:50:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-223a7065ff8so14354715ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741711806; x=1742316606;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=23iOwZdcqMnXiNfXwcY1/saA5o6I48TGQZAkJr6gmPk=;
 b=hNHHRORdIZeU1lzY9LSeRInvljWegIB2UYpGCHVnleixmNDQJHzmVOI2oVm4eEPCD7
 CMFn+tCaWuAUjKzPrNaehuuLWC16G/Qr88YSSdFMCKRRW2svLNIQJ/YCmgWtpZSmilFG
 jAD1mRMP77P4ZvPBbvGU1lDZfOe8N/+aU7Nr9nlxYFtifbSoHz0hptF07VAK/ao30oaR
 +5WD0HpBtMDg3nleJwIU1Hy3KFKnpQRJy544jg3MtcWbfB70zraka1qoV7PWQxhkb4UD
 Ky90cfR4eX7uAIFRffrp22BVYOgllJBS66ZMctMsx84pBYvfgLBWtY+Kd7apdcHdkDm0
 2iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741711806; x=1742316606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23iOwZdcqMnXiNfXwcY1/saA5o6I48TGQZAkJr6gmPk=;
 b=qG5j3TSHo6v4UsUmMvLgH/PQkXr9QcVmeJercaAEslr7m2eEunEVgEc2fKmZYxIUH2
 3RRj7vp5hxkkJ4HvGTRY5axki1MjtyHZVNksQRw3KQcQVQsoaRwb+dNClwSNMhE7SUKk
 8W2dw+nsoYsjtX2stVtBWDTqQcIRdM/DNYWGij1FjjDBede9TZj/lS714CkhdUAsFL/q
 H0jbGUBjnOd+XNrA444zOHoMGEH3uedfOYs4akMWP6d+2wOYMUruOhcW2Y6yZkiU0NAL
 /LjsIOdGcMX9Y6Oc+jj/ip+LuAq0NmxmQH+6+9yTio46m9WOLIWJNfPiIDlBQhqjcbBX
 ohBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY9NhyUAc9dMzoFpb4sejugygi4USySlsbHoiWJc8zvK5D8P1cZRr8QUrogYrjggkAaxSgzcwYDzAyWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+SjUMfcisXZw9Y+L/TdV8cWaZ8MK7CvPfYP/4THd2HYyZjkg4
 eFmyxF6yt+E8siPc5g30DMK/C5KAu4OsHrtc/ym7RvQe/9tSvn8YFMTCFs6wrm4cHOrb/ZKMUZI
 0iXYdiNv//C9Y2Zm9RpEU1bJ3xIGnfP6lsYaoTQ==
X-Gm-Gg: ASbGncv+8UaM/Wne8hUYV90zh1Y5YaqDd+ggT047BYUFs5qjTGC/Dgxd+mgbBJf0OIy
 Zrxf/UWekFru7DulVF5vY8Ev6GKX5sOdtkhNVCvSJJJpYf2iRFJTdkRInhcsDOCCHSh1xRAK2tj
 E49ZezbrB14WUhYG+MZdVsGh4vNvJg3O4HtvdS+nwAwH2ZFvubgebTPjdt7So=
X-Google-Smtp-Source: AGHT+IGRlRimNoESSBKd69bPemttjguo2zF0mTvg+Kb5/5Fg9niMy5gNnw80TuZnQbl3lCDWzV9DtaMCXkkJcAmG5fQ=
X-Received: by 2002:a05:6a21:2d08:b0:1f3:47d6:aa05 with SMTP id
 adf61e73a8af0-1f5449336e0mr29284989637.0.1741711806206; Tue, 11 Mar 2025
 09:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-2-quic_jiegan@quicinc.com>
In-Reply-To: <20250310090407.2069489-2-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 11 Mar 2025 16:49:54 +0000
X-Gm-Features: AQ5f1Jq4RzUPjRD0-Pf4PVjALFGSYlNPIsAlLKRkK0wLgCzuiv55sOjf36seIGA
Message-ID: <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
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

Hi,

On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> The new functions calculate and return the offset to the write pointer of
> the ETR buffer based on whether the memory mode is SG, flat or reserved.
> The functions have the RWP offset can directly read data from ETR buffer,
> enabling the transfer of data to any required location.
>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index eda7cdad0e2b..ec636ab1fd75 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
>  }
>  EXPORT_SYMBOL_GPL(tmc_free_sg_table);
>
> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
> +       u64 rwp;
> +

It is not valid to read RWP if the TMC is running. It must be in the
stopped or disabled state - see the specifications for TMC /ETR

It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
the spinlock that protects drvdata

See the code in coresight_tmc_etr.c :-

e.g. in

tmc_update_etr_buffer()

...
<take spinlock>
...
CS_UNLOCK(drvdata->base);
tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
flushed to memory - essential to ensure full formatted frame is in
memory.
tmc_sync_etr_buf(drvdata); // this function reads rwp.
CS_LOCK(drvdata->base);
<release spinlokc>

This type of program flow is common to both sysfs and perf handling of
TMC buffers.

> +       rwp = tmc_read_rwp(drvdata);
> +       return rwp - paddr;
> +}
> +
> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> +       struct etr_sg_table *etr_table = etr_buf->private;
> +       struct tmc_sg_table *table = etr_table->sg_table;
> +       long w_offset;
> +       u64 rwp;
> +

Same comments as above

> +       rwp = tmc_read_rwp(drvdata);
> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
> +
> +       return w_offset;
> +}
> +
> +/*
> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
> + * the memory mode is SG, flat or reserved.
> + */
> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> +

As this is an exported function, please ensure that the inputs are
valid - check the pointers

Code to ensure TMC is flushed and stopped could be inserted here.

Regards

Mike

> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
> +               return tmc_sg_get_rwp_offset(drvdata);
> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
> +       else
> +               return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
> +
>  /*
>   * Alloc pages for the table. Since this will be used by the device,
>   * allocate the pages closer to the device (i.e, dev_to_node(dev)
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index b48bc9a01cc0..baedb4dcfc3f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
>
>  #endif
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
