Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19B6D857B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 20:01:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B92C6A606;
	Wed,  5 Apr 2023 18:01:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F34E3C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 18:01:47 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id ja10so35170782plb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Apr 2023 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680717706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=75waTPmE449vmTwTKzJNA/Q/Fgjny/ageb8PalU7Nbg=;
 b=XSAfgzL/n2sc6f/aB0tqEvBb2ICpGzs0ODajpoFxqtO1OfDg6IhIOWU2KVA9lpJgAZ
 qHvP0+0S5RRGpcUudhh+s5kG+y2dSkpyGASIMq8Bmd0lBkQ+BwSQtL3Dske7tABYj2UF
 0spTdKCQMSwx4pLfT+YnVnhmGXQVRwTQYc79B0zvkhWpjQFFhi8Ck9bB8uPHmhlbIv+h
 30nbKZEgIlA+OGdhABt0Map+fqWlrJqnGhiztstUxDrBBUCvfYt78uCfAq8VtoU3ICKc
 ADkC8F7kljihzAZiIvPNtB+NtfVFh066/HIpQ6OYsgnqSKtAslCc+qLCnA3zPWjtB1BK
 xVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680717706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75waTPmE449vmTwTKzJNA/Q/Fgjny/ageb8PalU7Nbg=;
 b=shQk2frpCM2uH+oQkz+LCLS0+Zyx2yT6/1gjsKe5wvRP/TbfPIRD4jgGt7adeCeALk
 jcSrZjl6v66u/EiMIfobNf7+btixjRjfxV4p8AOxw5rAMbnt4+8m7sblinRjdWFr6L1E
 OErZclYlGF9coU4AJ8RA8uPVH+UFvOj3im2OKvdygP+GJlfR3DQN3zOImOdkiliVdwEy
 +ICBYGUgr1MZBCN+sa6ggAybuy6e/H2wLHltj539bwxMLtxeiwe7x00BQvKISSpmZKDE
 SRYhv0y5eKl7gbKU37SO5KChok3rp/ffjBTEEPZU5RmsUPLpOoq2Tnh1ubw1ZKPo3y5q
 wO8g==
X-Gm-Message-State: AAQBX9e0n2fc0+u1IH2Mcclejz3TjYSLSJBflDSV2uLeW5ncutoHon4Z
 fm8ogQxXzIQw9R4n/ChnTQv/Xw==
X-Google-Smtp-Source: AKy350Z8CUgZCFnbEgg9v2OHHpWYWd22mvzU0SHVyTPD74r9IiqlS2c6UZEDHSTFdHFmRKAeh0Vgbw==
X-Received: by 2002:a17:90a:1042:b0:237:3dfb:9095 with SMTP id
 y2-20020a17090a104200b002373dfb9095mr7768981pjd.6.1680717706444; 
 Wed, 05 Apr 2023 11:01:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c807:a26a:a179:b5ec])
 by smtp.gmail.com with ESMTPSA id
 gd6-20020a17090b0fc600b00227223c58ecsm1678869pjb.42.2023.04.05.11.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 11:01:46 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:01:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20230405180143.GD3812912@p14s>
References: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
 <20230331154651.3107173-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331154651.3107173-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 4/5] remoteproc: stm32: Allow hold boot
 management by the SCMI reset controller
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

On Fri, Mar 31, 2023 at 05:46:50PM +0200, Arnaud Pouliquen wrote:
> The hold boot can be managed by the SCMI controller as a reset.
> If the "hold_boot" reset is defined in the device tree, use it.
> Else use the syscon controller directly to access to the register.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 34 ++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 4be651e734ee..6b0d8f30a5c7 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -78,6 +78,7 @@ struct stm32_mbox {
>  
>  struct stm32_rproc {
>  	struct reset_control *rst;
> +	struct reset_control *hold_boot_rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
>  	struct stm32_syscon m4_state;
> @@ -398,6 +399,14 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  	struct stm32_syscon hold_boot = ddata->hold_boot;
>  	int val, err;
>  
> +	if (ddata->hold_boot_rst) {
> +		/* Use the SCMI reset controller */
> +		if (!hold)
> +			return reset_control_deassert(ddata->hold_boot_rst);
> +		else
> +			return reset_control_assert(ddata->hold_boot_rst);
> +	}
> +
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
>  	err = regmap_update_bits(hold_boot.map, hold_boot.reg,
> @@ -693,16 +702,29 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		dev_info(dev, "wdg irq registered\n");
>  	}
>  
> -	ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +	ddata->rst = devm_reset_control_get(dev, "mcu_rst");

Peng is correct - newer kernels won't be able to boot with older DT.

>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
>  				     "failed to get mcu_reset\n");
>  
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> -				     &ddata->hold_boot);
> -	if (err) {
> -		dev_err(dev, "failed to get hold boot\n");
> -		return err;
> +	ddata->hold_boot_rst = devm_reset_control_get(dev, "hold_boot");
> +	if (IS_ERR(ddata->hold_boot_rst)) {
> +		if (PTR_ERR(ddata->hold_boot_rst) == -EPROBE_DEFER)
> +			return PTR_ERR(ddata->hold_boot_rst);
> +		ddata->hold_boot_rst = NULL;
> +	}
> +
> +	if (!ddata->hold_boot_rst) {

Why another if() statement?  The code below should be in the above if()...

This patchset is surprizingly confusing for its size.  I suggest paying
attention to the changelogs and adding comments in the code.

Thanks,
Mathieu

> +		/*
> +		 * If the hold boot is not managed by the SCMI reset controller,
> +		 * manage it through the syscon controller
> +		 */
> +		err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> +					     &ddata->hold_boot);
> +		if (err) {
> +			dev_err(dev, "failed to get hold boot\n");
> +			return err;
> +		}
>  	}
>  
>  	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
