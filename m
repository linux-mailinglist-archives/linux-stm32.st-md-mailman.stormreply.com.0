Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B76D8554
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 19:55:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE10EC6A606;
	Wed,  5 Apr 2023 17:55:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2C58C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 17:55:22 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ml21so12829215pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Apr 2023 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680717321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d6KxPEHCGj+2Fji8JCae/W+Ck9cYGQv+bw6pf7dJ+WQ=;
 b=arzRhxzpaOtE/mwpFQDvfgOMalpHYcWt2AqgaokR5CNeTe/o5aWB42B3PC4D84dsIS
 c7uohGH5qf8nmsgoqTHDiFATmD0LWZeE1aFAif3R93vmMGEVQ7T8euXHEVnjt3KJI9Xj
 ElHl8WL9iSa0jERmPDsM96edNA+Nmfi8vnIAyQZBT4kQJydFivxCphfD87qoykZOiD4r
 C51rpD7JwBD39R+tUfEUfgRDlgbyb+r/aL2+MMpQCRsTvPkKipfcqhLb2HxPsVBlMTa3
 t+s6YBg0yyJcTghEkERK0mHTIHaIFLc+mHWZExYVzFc8H6JgykpL0bBybpk4qVS9IeZ4
 FPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680717321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6KxPEHCGj+2Fji8JCae/W+Ck9cYGQv+bw6pf7dJ+WQ=;
 b=6h1VlqfQUi8apoLK1D5FXJtjyHQU8i1KYaws1LQ8cVLakrmQG5/Dl6ZsanQazZbQGF
 PzQS3mHbnGm4swZWZv7b6NNx6KoETf55YZHIQdd8b8a5tVzvmTGZ46IAbiP7WsOUk6a4
 wMGygFf5Hw22rJuPv/yumoJa8Qn8k2x/x/iTJE29ItY3SchLBTio+IpdpggD++jhiNUu
 YhwXYyDr8zpAlvAG0iVnk6VvxwmL5sBWqkmgt593thU4zRnDUM8WL0EnE7Lisb7B+N/j
 +ZugJcN0M+u9ji3wTm6p0wrHG2i+GDpAkwgKb1I9p5CVvLgu9nj1boFzg2OvruOub7nm
 5E/w==
X-Gm-Message-State: AAQBX9epWozBgkI7ucYUsC0/SS0FS0gdDcsQgREk9/0kX8UkMO3s89/V
 7K7p2eJz+gA3tchqIjkSUJm48w==
X-Google-Smtp-Source: AKy350YETHBPS77VZrV0ie2wH9Ou5p0HR+/EmUhx9BAxw/aJ3bY42nyI0GxFakCeEFVsua5Zxms/wg==
X-Received: by 2002:a17:903:2946:b0:19d:138b:7c4a with SMTP id
 li6-20020a170903294600b0019d138b7c4amr6601037plb.3.1680717321492; 
 Wed, 05 Apr 2023 10:55:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c807:a26a:a179:b5ec])
 by smtp.gmail.com with ESMTPSA id
 s37-20020a63ff65000000b0050f7208b4bcsm9536794pgk.89.2023.04.05.10.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:55:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:55:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20230405175518.GC3812912@p14s>
References: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
 <20230331154651.3107173-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331154651.3107173-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/5] remoteproc: stm32: Clean-up the
 management of the hold boot by SMC call
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

Hi Arnaud,

On Fri, Mar 31, 2023 at 05:46:49PM +0200, Arnaud Pouliquen wrote:
> There are two ways to manage the Cortex-M4 hold boot:
> - by Linux thanks to a sys config controller
> - by the secure context when the hold boot is protected.
> Since the introduction of the SCMI server, the use of the SMC call

What SCMI server?  Does this means stm32 is now able to use SCMI to manage the
remote processor hold boot?  If so, that is what I should find in this
changelog.  Otherwise this changelog needs to be re-written. 

> is deprecated. If the trust zone is activated, the management of the
> hold boot must be done by the secure context thanks to a SCMI reset
> controller.
> 
> This patch cleans-up the code related to the SMC call, replaced by
> the SCMI server.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 34 ++------------------------------
>  1 file changed, 2 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7d782ed9e589..4be651e734ee 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -5,7 +5,6 @@
>   *          Fabien Dessenne <fabien.dessenne@st.com> for STMicroelectronics.
>   */
>  
> -#include <linux/arm-smccc.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -88,7 +87,6 @@ struct stm32_rproc {
>  	struct stm32_rproc_mem *rmems;
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
> -	bool secured_soc;
>  	void __iomem *rsc_va;
>  };
>  
> @@ -398,20 +396,12 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct stm32_syscon hold_boot = ddata->hold_boot;
> -	struct arm_smccc_res smc_res;
>  	int val, err;
>  
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
> -		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
> -			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
> -		err = smc_res.a0;
> -	} else {
> -		err = regmap_update_bits(hold_boot.map, hold_boot.reg,
> -					 hold_boot.mask, val);
> -	}
> -
> +	err = regmap_update_bits(hold_boot.map, hold_boot.reg,
> +				 hold_boot.mask, val);
>  	if (err)
>  		dev_err(&rproc->dev, "failed to set hold boot\n");
>  
> @@ -680,8 +670,6 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct stm32_syscon tz;
> -	unsigned int tzen;
>  	int err, irq;
>  
>  	irq = platform_get_irq(pdev, 0);
> @@ -710,24 +698,6 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
>  				     "failed to get mcu_reset\n");
>  
> -	/*
> -	 * if platform is secured the hold boot bit must be written by
> -	 * smc call and read normally.
> -	 * if not secure the hold boot bit could be read/write normally
> -	 */
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
> -	if (err) {
> -		dev_err(dev, "failed to get tz syscfg\n");
> -		return err;
> -	}

If I was to do a bisect here, I would not be able to boot boards that have a
trustzone.  Add the new functionality and then remove the old one.

> -
> -	err = regmap_read(tz.map, tz.reg, &tzen);
> -	if (err) {
> -		dev_err(dev, "failed to read tzen\n");
> -		return err;
> -	}
> -	ddata->secured_soc = tzen & tz.mask;
> -
>  	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
>  				     &ddata->hold_boot);
>  	if (err) {
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
