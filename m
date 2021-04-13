Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99F35E7D0
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 22:51:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00405C57B78;
	Tue, 13 Apr 2021 20:51:29 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31802C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 20:51:27 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so12263691otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BADcf3smBQPBGql3mN7VdZeMYEdWGQAgGXkly2TDUSE=;
 b=uuxDg30ZNvq808mIE+x2+zZ9PmfAzxWCz4NaEpIgfbIUetY6YxRh4dz1U5PkEkv6rs
 zrhgGwEISnucLuHbcK1lxvIqsr4iL+b0g8nWSASoFVLKTEzq2gqgN2r0EwrUjLi7qYws
 LQIaNmOmF4BnXZ8ddWRq4PVsCWduKxXPxHLGWhFOAMin3tsWQVm0pp0S2b3zNbBn40MS
 o+rboo+H051Xqzb6GW99Tf+gUT3dcZ6TQ48KB/fCBVUdpELFvD7RrjiVmHMV8qomgt98
 bLrJS36gRoL8N/IayVzcWGtaieCS5MDET8EEvy75rpZIyIxx9XmNG7ux0gEFb+54le6q
 DR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BADcf3smBQPBGql3mN7VdZeMYEdWGQAgGXkly2TDUSE=;
 b=E+L7NcJmdFCL/HAGl/jFVJ5HlkUlBvoJynDBaxwMTvHwSM0PFaKRpPfo2ivcUtqT8H
 4oCeI517gNYjSmUCjSNEt1nBhVXu59wtT29WLpZZBBuKdoDgGDTISykpOYIjSqW8lvmz
 ieHL3uaEY//NReMcK9QvmkLSwaHeNRk4DuaBcJrnLHJN7S/uWs0Eb3VB+0gHjTNER4e/
 z8BLj0FdkXuAKqyI2IOUTlqn7dNoTPx9gHQqhTXdRsHXG2tB4E+k76jEjviG9YTEqmy0
 PJrHCARSGjdGIPXSM1kBgiE7nUaLDwsFa9HqSHOUJNHQv6Hi0i0b8p+REh5wTMlBqq6G
 MM1Q==
X-Gm-Message-State: AOAM530hqCqzCzTNpFX4OigOEMKPPkQskWQkG1gofMqAzSTiFEAX0YZn
 UrniXQh41iOlVmFGROAh1ujW1Q==
X-Google-Smtp-Source: ABdhPJwbNaUu3jAxfv+aYheVOyvNkyEbnvYzugss7653tdjcZHAMyHlw4VIFLPcaReZqg9136rHWRA==
X-Received: by 2002:a9d:928:: with SMTP id 37mr24297744otp.98.1618347086349;
 Tue, 13 Apr 2021 13:51:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w5sm2433153oos.43.2021.04.13.13.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 13:51:25 -0700 (PDT)
Date: Tue, 13 Apr 2021 15:51:23 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YHYESxThXVnVH3q8@builder.lan>
References: <20210318145923.31936-1-arnaud.pouliquen@foss.st.com>
 <20210318145923.31936-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318145923.31936-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] remoteproc: stm32: add capability to
	detach
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

On Thu 18 Mar 09:59 CDT 2021, Arnaud Pouliquen wrote:

> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> 
> A mechanism similar to the shutdown mailbox signal is implemented to
> detach a remote processor.
> 
> Upon detachment, a signal is sent to the remote firmware, allowing it
> to perform specific actions such as stopping RPMsg communication.
> 
> The Cortex-M hold boot is also disabled to allow the remote processor
> to restart in case of crash.
> 
> Notice that for this feature to be supported, the remote firmware 
> resource table must be stored at the beginning of a 1kB section 
> (default size provided to the remoteproc core).
> 
> This restriction should be lifted in the future by using a backup register
> to store the actual size of the resource table. 
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 3d45f51de4d0..298ef5b19e27 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -28,7 +28,7 @@
>  #define RELEASE_BOOT		1
>  
>  #define MBOX_NB_VQ		2
> -#define MBOX_NB_MBX		3
> +#define MBOX_NB_MBX		4
>  
>  #define STM32_SMC_RCC		0x82001000
>  #define STM32_SMC_REG_WRITE	0x1
> @@ -38,6 +38,7 @@
>  #define STM32_MBX_VQ1		"vq1"
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
> +#define STM32_MBX_DETACH	"detach"
>  
>  #define RSC_TBL_SIZE		1024
>  
> @@ -336,6 +337,15 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  			.tx_done = NULL,
>  			.tx_tout = 500, /* 500 ms time out */
>  		},
> +	},
> +	{
> +		.name = STM32_MBX_DETACH,
> +		.vq_id = -1,
> +		.client = {
> +			.tx_block = true,
> +			.tx_done = NULL,
> +			.tx_tout = 200, /* 200 ms time out to detach should be fair enough */
> +		},
>  	}
>  };
>  
> @@ -461,6 +471,25 @@ static int stm32_rproc_attach(struct rproc *rproc)
>  	return stm32_rproc_set_hold_boot(rproc, true);
>  }
>  
> +static int stm32_rproc_detach(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int err, dummy_data, idx;
> +
> +	/* Inform the remote processor of the detach */
> +	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
> +	if (idx >= 0 && ddata->mb[idx].chan) {
> +		/* A dummy data is sent to allow to block on transmit */
> +		err = mbox_send_message(ddata->mb[idx].chan,
> +					&dummy_data);

Isn't it the stm32_ipcc driver on the other side of this call? In which
case I believe "data" is ignored, and you would be able to just pass
NULL here.

As long as "data" isn't dereferenced it's probably better to send some
bugus value, than an address to this variable on the stack. If on the
other hand you pair this with one of the mailbox drivers that
dereferences "data", you should initialize it...

Apart from this, I think the patch looks good!

Regards,
Bjorn

> +		if (err < 0)
> +			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
> +	}
> +
> +	/* Allow remote processor to auto-reboot */
> +	return stm32_rproc_set_hold_boot(rproc, false);
> +}
> +
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -597,7 +626,11 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	}
>  
>  done:
> -	/* Assuming the resource table fits in 1kB is fair */
> +	/*
> +	 * Assuming the resource table fits in 1kB is fair.
> +	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
> +	 * firmware for the resource table. A clean of this whole area is done on detach.
> +	 */
>  	*table_sz = RSC_TBL_SIZE;
>  	return (struct resource_table *)ddata->rsc_va;
>  }
> @@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
>  	.attach		= stm32_rproc_attach,
> +	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
