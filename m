Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13904346AEC
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Mar 2021 22:19:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9026C57B5A;
	Tue, 23 Mar 2021 21:19:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D45DEC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 21:19:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y200so15657143pfb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a2tu+rQXLQBkBPl5r6tVNxPeMVSTHAEY4cUdNiCsFkY=;
 b=JTxHq0+HyD+qx6DhFHeAAsVJYZt79B+q9+j5iwg5H7act/ir116G8CbhRzwOW/iM9M
 dhbpR+G0utc+vE+mfPHbsCPevCDnrhDBdFe+7JPncn/WpypQRrdVks/GdZxsl+3hB1GV
 ylBG3aKheJeRpd2nD/Si3h7gSG11CJKV+qzJGqrAiHV3hmCJVhPBWm7opzidvp1zZ456
 Fb23raCtLvnPoP3AV8v/s3UfcX00jCVkLvralKPJaHzfAs7qZeWP4lbEo1VKjWcNCt3s
 iMbDwhzvIqmWG3guO26igN7RwEoHDvhB1eOE+TMhWON+jRevQsZokwdQBE4GOlYF1COf
 3izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a2tu+rQXLQBkBPl5r6tVNxPeMVSTHAEY4cUdNiCsFkY=;
 b=qqTxWcAkyP/wklE/tj2dR8TRCAJRpS/vkh7LePzQtCD/2mOp96qIPFsSmlgNolkAWV
 1UX76SVntVC3aSVpXlopTnuX+gYOqKpC/J4hl5YGU9UAct7bcqmG1mA8HVbzMO21zQJW
 MNyJz+lUMfuoBCaqkoNsUYXAwyfP+gIO4kTXuVnk1nO4gMgC5X64nuljTA4QIiXWSKR5
 gagMcdOFqDd00LO60X2GsX1bOSifhzKAClMoyCJUSUCgTKjn5mPgKWiIYKJuTERdGuAM
 YAFA4bJTv2vElNyVZIDTPT3w8Gev8FTysO4qsOUxssiWM7dldyfOvcQKMMVv68kagJBg
 xvgg==
X-Gm-Message-State: AOAM532dvqO9v6eRk4HS2/6bngyTR0LVLyq9O8pS6zxkD6wBu+QyPD8f
 wej3bOFHaTHpAuFOBJ6ts5ZXgw==
X-Google-Smtp-Source: ABdhPJwqSaOsLZyQqkMB/0If2mEpHTdwvfZzVbmqM3znH/E1rW86PdBpDy/VxxFUeSx5IPxCjrUDtQ==
X-Received: by 2002:aa7:9a95:0:b029:1f3:4169:ccf2 with SMTP id
 w21-20020aa79a950000b02901f34169ccf2mr253943pfi.14.1616534353979; 
 Tue, 23 Mar 2021 14:19:13 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id r10sm114257pfq.216.2021.03.23.14.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 14:19:13 -0700 (PDT)
Date: Tue, 23 Mar 2021 15:19:11 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210323211911.GA1714890@xps15>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322092651.7381-3-arnaud.pouliquen@foss.st.com>
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

Good day Arnaud,

On Mon, Mar 22, 2021 at 10:26:51AM +0100, Arnaud Pouliquen wrote:
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
> This restriction should be lifted in the future by using a backup
> register to store the actual size of the resource table.

I'm not sure the above two paragraphs add anything valuable to the changelog.
At this time the size of 1kB is fixed and future enhancement are, well, in the
future.  So for now this patch is working with the rest of the current
environment and that is the important part.

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

Can you rework the last sentence?  I'm not sure if it means the M4 will clean
the resource table or if that should be the application processor... I'm also
not clear on what you mean by "clean".  Usually it means zero'ing out but in
this case it means a re-initialisation of the original values.


>  	*table_sz = RSC_TBL_SIZE;
>  	return (struct resource_table *)ddata->rsc_va;
>  }
> @@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
>  	.attach		= stm32_rproc_attach,
> +	.detach		= stm32_rproc_detach,

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
