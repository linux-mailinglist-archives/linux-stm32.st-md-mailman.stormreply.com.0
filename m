Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819F349C5B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 23:38:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83A2C57B60;
	Thu, 25 Mar 2021 22:38:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF009C57B5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 22:38:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1536478pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 15:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SPJBpRy3R9mFfMF6pdvZDady42C+XlqArOxVCK6oVWM=;
 b=GzjcNL0W6qznBEXmz0l/PS0tZuqWqpIbM+EHd/fQjdQjR/jyzcS3HTWKo/fqBj/qna
 JTe4dWoj1S+mkS1xITOVLOWjomCs8AoPIIJyX9yXn9YbzP9nvmsk6Qu94mAolpJgH8MA
 YQedl3lq8dvhSNcer0VHSrpU0F9vzDyB3cSWvzvL2EcG/3f9j/Im6Lxl1XorjpyzgO+I
 eNHn0kKqeyEqdzpawXZIJObBlfEosHaYMEesZE2uFy30pKK7sJQSfMGpBj50IbfWs9Cf
 Gx2DeVGYe6UMhrsB1MLFobFuVtuyShnvEt5hdm0ZIlntlRBXggH4vOjhPnLUM+thJgPX
 nr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SPJBpRy3R9mFfMF6pdvZDady42C+XlqArOxVCK6oVWM=;
 b=QgUqVXx2KjR8PhuX0EMw2hhO05XoGcYIfTdd58dxFCWt6uBkvpW69r4fTg4jlvJMzf
 yAsM1cgowvCqbKtwY5C3m2gZhzsJ55OtYvQdzzFf6xZMLzxigBuGXkKWy4bsBPxvE10X
 wa/fdaKtoCd0O0a8WVFVw8KfbHyuStPjsyPC/QLvyVPYlOOm06gz7+hwKjaIRKcFd9tg
 9G5nUdaAkT1io6cBG2of047GzoS7Nhl4j4gKCiTVvUentI3jQwYuup3Hv8/e7ff29B/9
 Yw/KxHrlRJ+665uCSruu1Me2FguaZPB/U3hw6c6D45JsiDJorXsg9w0XcqdMuj6KBJvA
 nG7g==
X-Gm-Message-State: AOAM533Fz674oFombk7012f8+xf1KF5zLQy6jQrBv8flxQrEEbbDZnnS
 MZQ9nqTT/hGZeB68y8AltT40NA==
X-Google-Smtp-Source: ABdhPJwSTTvB+/mfFyZ/jzgZP1pixjpzWPTWjiITbCA01sUAFTOJI+RnFl1vErKNPTHHu85TUYQKcw==
X-Received: by 2002:a17:90b:1651:: with SMTP id
 il17mr11050782pjb.16.1616711898276; 
 Thu, 25 Mar 2021 15:38:18 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id p3sm6494878pgi.24.2021.03.25.15.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:38:17 -0700 (PDT)
Date: Thu, 25 Mar 2021 16:38:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210325223815.GA1982573@xps15>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-3-arnaud.pouliquen@foss.st.com>
 <20210323211911.GA1714890@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323211911.GA1714890@xps15>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] remoteproc: stm32: add capability
	to detach
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

On Tue, Mar 23, 2021 at 03:19:11PM -0600, Mathieu Poirier wrote:
> Good day Arnaud,
> 
> On Mon, Mar 22, 2021 at 10:26:51AM +0100, Arnaud Pouliquen wrote:
> > From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> > 
> > A mechanism similar to the shutdown mailbox signal is implemented to
> > detach a remote processor.
> > 
> > Upon detachment, a signal is sent to the remote firmware, allowing it
> > to perform specific actions such as stopping RPMsg communication.
> > 
> > The Cortex-M hold boot is also disabled to allow the remote processor
> > to restart in case of crash.
> > 
> > Notice that for this feature to be supported, the remote firmware
> > resource table must be stored at the beginning of a 1kB section
> > (default size provided to the remoteproc core).
> > 
> > This restriction should be lifted in the future by using a backup
> > register to store the actual size of the resource table.
> 
> I'm not sure the above two paragraphs add anything valuable to the changelog.
> At this time the size of 1kB is fixed and future enhancement are, well, in the
> future.  So for now this patch is working with the rest of the current
> environment and that is the important part.
> 
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 38 ++++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> > index 3d45f51de4d0..298ef5b19e27 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -28,7 +28,7 @@
> >  #define RELEASE_BOOT		1
> >  
> >  #define MBOX_NB_VQ		2
> > -#define MBOX_NB_MBX		3
> > +#define MBOX_NB_MBX		4
> >  
> >  #define STM32_SMC_RCC		0x82001000
> >  #define STM32_SMC_REG_WRITE	0x1
> > @@ -38,6 +38,7 @@
> >  #define STM32_MBX_VQ1		"vq1"
> >  #define STM32_MBX_VQ1_ID	1
> >  #define STM32_MBX_SHUTDOWN	"shutdown"
> > +#define STM32_MBX_DETACH	"detach"
> >  
> >  #define RSC_TBL_SIZE		1024
> >  
> > @@ -336,6 +337,15 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
> >  			.tx_done = NULL,
> >  			.tx_tout = 500, /* 500 ms time out */
> >  		},
> > +	},
> > +	{
> > +		.name = STM32_MBX_DETACH,
> > +		.vq_id = -1,
> > +		.client = {
> > +			.tx_block = true,
> > +			.tx_done = NULL,
> > +			.tx_tout = 200, /* 200 ms time out to detach should be fair enough */
> > +		},
> >  	}
> >  };
> >  
> > @@ -461,6 +471,25 @@ static int stm32_rproc_attach(struct rproc *rproc)
> >  	return stm32_rproc_set_hold_boot(rproc, true);
> >  }
> >  
> > +static int stm32_rproc_detach(struct rproc *rproc)
> > +{
> > +	struct stm32_rproc *ddata = rproc->priv;
> > +	int err, dummy_data, idx;
> > +
> > +	/* Inform the remote processor of the detach */
> > +	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
> > +	if (idx >= 0 && ddata->mb[idx].chan) {
> > +		/* A dummy data is sent to allow to block on transmit */
> > +		err = mbox_send_message(ddata->mb[idx].chan,
> > +					&dummy_data);
> > +		if (err < 0)
> > +			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
> > +	}
> > +
> > +	/* Allow remote processor to auto-reboot */
> > +	return stm32_rproc_set_hold_boot(rproc, false);
> > +}
> > +
> >  static int stm32_rproc_stop(struct rproc *rproc)
> >  {
> >  	struct stm32_rproc *ddata = rproc->priv;
> > @@ -597,7 +626,11 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> >  	}
> >  
> >  done:
> > -	/* Assuming the resource table fits in 1kB is fair */
> > +	/*
> > +	 * Assuming the resource table fits in 1kB is fair.
> > +	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
> > +	 * firmware for the resource table. A clean of this whole area is done on detach.
> > +	 */
> 
> Can you rework the last sentence?  I'm not sure if it means the M4 will clean
> the resource table or if that should be the application processor... I'm also
> not clear on what you mean by "clean".  Usually it means zero'ing out but in
> this case it means a re-initialisation of the original values.
> 
> 
> >  	*table_sz = RSC_TBL_SIZE;
> >  	return (struct resource_table *)ddata->rsc_va;
> >  }
> > @@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
> >  	.start		= stm32_rproc_start,
> >  	.stop		= stm32_rproc_stop,
> >  	.attach		= stm32_rproc_attach,
> > +	.detach		= stm32_rproc_detach,
> 
> With the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks for the firmware test image:

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> >  	.kick		= stm32_rproc_kick,
> >  	.load		= rproc_elf_load_segments,
> >  	.parse_fw	= stm32_rproc_parse_fw,
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
