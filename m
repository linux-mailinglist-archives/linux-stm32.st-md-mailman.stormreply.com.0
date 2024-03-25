Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D388A9F6
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 17:48:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A7F7C6B444;
	Mon, 25 Mar 2024 16:48:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55541C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 16:48:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1dffa5e3f2dso28273245ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711385291; x=1711990091;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0Li9ePBDN5kdTzO/p/pyUro/E5ONNdjRLMyuXA5qxWs=;
 b=P4TSbqHm4fHq+Gl1LcWU7KpDDEObFqMWSKyxOZdKwxdSu4dNZTPQ2i8He2dd/tkbuY
 QRMhhqAT7c1codWmYDQdV63u1LMVf67moY2lRhvaFC72NSKdOfoKGIGbQaukSYdqD5/l
 dUpGmYxTA0+z+5bihv6n+mHUQWHSQVcc2x/qbuv7HY9RnSiK12JOQKvQH+Y1AdnSmvLn
 8+fVO8zsykuJVSGA5cGlF1YsPTMuz1Ca46ERDd2WZD3aEnrwJSYFePJ20YyvJ4PjQjWm
 PD3dwB90rD0JK3WJ0e+vYZOpUIydmUIfXnKRIhFfqJCF8K/ZAgmHU3lclkyKtKMfPhTZ
 QJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711385291; x=1711990091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Li9ePBDN5kdTzO/p/pyUro/E5ONNdjRLMyuXA5qxWs=;
 b=WphHqwx/wHlKgBQ11yhVxVhOFlDVZqyTdNpWqvJINfjy8d1ffRDil0ODlHtu/q2SfK
 K1gR529xYNEADEISgKWIV4VoK6QJbVUCF7OTu0+acOmP50gs7AuuZEQTPyHSWGFcPXXO
 92bHT1Q7/U17dRzPl7VIPADpmJNQn0ZdgQ9e3mQEHVIiwVLOgVmxnxm7UQsFku28apIq
 xuxCB1SE2nqmtYelluL/tfUziA8tmNzzlqLjSX0nkH3J5b+1L5xoFzsFPi5RvuRlBROu
 bRZ+3QPrqqm53O7LzmB2yIGcltSr1An7rgX2bgkPKQqu/iIDvzSnYMKtnia90iT1jSvL
 FeUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeUnk0xeOQD6R5Ic05hYI7tsstlFfazjts3J4uI545a6H+su4hZOv3JfZRbBg+nkmJa9Euyrwelqb+uX9wPhO8TSTpUeQGNjCYwNBelFtZ76DNu+RwQbRD
X-Gm-Message-State: AOJu0YzVSuiflWNYLS3RX3fTFZL7JttmbVIMgBv03YT5zoIeS4Fn+2TE
 IjllTA/D2+06prAwwzLHnImj/sBpBdQL2v7KWMPaZ4f07K7DlsQp2lD3g2CywDI=
X-Google-Smtp-Source: AGHT+IFBoBsSglPKHUxyixrU3Fl2cREElqaGHFDUAzOeeEFm+j/qwqzea0cL8fVxvarsqHFodVnMMw==
X-Received: by 2002:a17:903:192:b0:1e0:bddf:7ed0 with SMTP id
 z18-20020a170903019200b001e0bddf7ed0mr3942884plg.27.1711385290761; 
 Mon, 25 Mar 2024 09:48:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4a22:28de:eba3:89d1])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902b70900b001ddbd9ac28bsm4893178pls.142.2024.03.25.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:48:10 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:48:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZgGqx0Lg9FH217Wc@p14s>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308144708.62362-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/4] remoteproc: stm32: Create
 sub-functions to request shutdown and release
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

On Fri, Mar 08, 2024 at 03:47:07PM +0100, Arnaud Pouliquen wrote:
> To prepare for the support of TEE remoteproc, create sub-functions
> that can be used in both cases, with and without TEE support.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 84 +++++++++++++++++++-------------
>  1 file changed, 51 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 88623df7d0c3..8cd838df4e92 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -209,6 +209,54 @@ static int stm32_rproc_mbox_idx(struct rproc *rproc, const unsigned char *name)
>  	return -EINVAL;
>  }
>  
> +static void stm32_rproc_request_shutdown(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int err, dummy_data, idx;
> +
> +	/* Request shutdown of the remote processor */
> +	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
> +		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> +		if (idx >= 0 && ddata->mb[idx].chan) {
> +			/* A dummy data is sent to allow to block on transmit. */
> +			err = mbox_send_message(ddata->mb[idx].chan,
> +						&dummy_data);

Why is this changed from the original implementation?

> +			if (err < 0)
> +				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> +		}
> +	}
> +}
> +
> +static int stm32_rproc_release(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	unsigned int err = 0;
> +
> +	/* To allow platform Standby power mode, set remote proc Deep Sleep. */
> +	if (ddata->pdds.map) {
> +		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
> +					 ddata->pdds.mask, 1);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set pdds\n");
> +			return err;
> +		}
> +	}
> +
> +	/* Update coprocessor state to OFF if available. */
> +	if (ddata->m4_state.map) {
> +		err = regmap_update_bits(ddata->m4_state.map,
> +					 ddata->m4_state.reg,
> +					 ddata->m4_state.mask,
> +					 M4_STATE_OFF);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set copro state\n");
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -519,17 +567,9 @@ static int stm32_rproc_detach(struct rproc *rproc)
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, idx;
> +	int err;
>  
> -	/* request shutdown of the remote processor */
> -	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
> -		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> -		if (idx >= 0 && ddata->mb[idx].chan) {
> -			err = mbox_send_message(ddata->mb[idx].chan, "detach");
> -			if (err < 0)
> -				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> -		}
> -	}
> +	stm32_rproc_request_shutdown(rproc);
>  
>  	err = stm32_rproc_set_hold_boot(rproc, true);
>  	if (err)
> @@ -541,29 +581,7 @@ static int stm32_rproc_stop(struct rproc *rproc)
>  		return err;
>  	}
>  
> -	/* to allow platform Standby power mode, set remote proc Deep Sleep */
> -	if (ddata->pdds.map) {
> -		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
> -					 ddata->pdds.mask, 1);
> -		if (err) {
> -			dev_err(&rproc->dev, "failed to set pdds\n");
> -			return err;
> -		}
> -	}
> -
> -	/* update coprocessor state to OFF if available */
> -	if (ddata->m4_state.map) {
> -		err = regmap_update_bits(ddata->m4_state.map,
> -					 ddata->m4_state.reg,
> -					 ddata->m4_state.mask,
> -					 M4_STATE_OFF);
> -		if (err) {
> -			dev_err(&rproc->dev, "failed to set copro state\n");
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> +	return stm32_rproc_release(rproc);
>  }
>  
>  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
