Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBB6F8734
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 19:04:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A65C6A60D;
	Fri,  5 May 2023 17:04:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60E96C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 17:03:59 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1aae46e62e9so14425135ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 May 2023 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683306238; x=1685898238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JMDVesgAKasFsor4GeKqlCagXQ7DH3+AoXUlf3OElm8=;
 b=bR6gi0lcTDkNWyn7wz8u78OloJBPQ6KfsiLCSKJtSrf/mwTyj4RnLq3ZZsQz1dPnbt
 YK9sctpzPhvjPa52msOKNb71MrX9QuGHxcjpZuU8MGICBCkBa6eWB9EHqDkaXzxExAeW
 FPSm1Tea8e42GTKd966cAYYcdLDWPu6xE/hQeQUEo8fWlHBrOmBhtHxUicyfTT6TJWZj
 gdLsXFigde8hbfEGXnwwZxx8j5oUZBhL4nJhOrzEA9MpP5f51RJbStN4VgCurhtsSYua
 lGPxMvVeQXhWZLel1UYlHTqXLmtDeCWCBZJiBnr6VZn0Ox3VVAsNLkc8agKkEFCtkjTl
 ZLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683306238; x=1685898238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JMDVesgAKasFsor4GeKqlCagXQ7DH3+AoXUlf3OElm8=;
 b=BU+wzInlWVQYyYufjTJy+cDlwl2rx4PQwF2ITZIcEGYi2I3HcNWG8BI+yuEsY/ClDJ
 OoqjwXZnOOBUsgdAjp/jnnstjkOnj7ASL+Kt4gIBCm1VKvfl3DoJK3R7J1M8kY+uzSAD
 ACilyavW9cnX9SfebanmoBOLxKAcYNqxzaGT53NZxLFVw/uo65uN1i4zWvDPZxhOAnz4
 yf6PfvSTkc4wRSscJuEeUFXtc6deu9W1WjYWfquJ2lRh7jslJRPxIwjm2filAhDiGjpV
 sSqNtqqgkukYjlIN/09pfb+sA7JWpKSLIKVRRmHIKcncGxukk7pZdY8nGAXCBlLhP+Ag
 A7JA==
X-Gm-Message-State: AC+VfDxmEIIoShNn9flznnnlwPjRwA8E+GokaFeAFQwLJYYA+3NJ7qSn
 quUOPpysnyQuRgcqLJPgtVOuiQ==
X-Google-Smtp-Source: ACHHUZ6UMaUB3IhahmbRyxKYzoTmEg9HFyUQpdd2o5G9PGG44utHoVF+53YsCBC0g19omuVtmiHoaw==
X-Received: by 2002:a17:902:6901:b0:1a1:956e:5417 with SMTP id
 j1-20020a170902690100b001a1956e5417mr1763516plk.22.1683306237785; 
 Fri, 05 May 2023 10:03:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd16:b4b6:ee7c:e4e5])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902d48d00b001994fc55998sm2013388plg.217.2023.05.05.10.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 10:03:57 -0700 (PDT)
Date: Fri, 5 May 2023 11:03:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZFU2+ni/tKOIIHbq@p14s>
References: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
 <20230504094641.870378-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504094641.870378-3-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] remoteproc: stm32: Allow hold boot
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

Hi Arnaud,

On Thu, May 04, 2023 at 11:46:39AM +0200, Arnaud Pouliquen wrote:
> The hold boot can be managed by the SCMI controller as a reset.
> If the "hold_boot" reset is defined in the device tree, use it.
> Else use the syscon controller directly to access to the register.
> The support of the SMC call is deprecated but kept for legacy support.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates vs previous version
> - keep support of the "st,syscfg-tz" property for legacy compatibility
> - rename secured_soc in hold_boot_smc for readability
> - add comments to explain hold boot management.
> - update commit message
> ---
>  drivers/remoteproc/stm32_rproc.c | 78 +++++++++++++++++++++++---------
>  1 file changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7d782ed9e589..e9cf24274345 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -79,6 +79,7 @@ struct stm32_mbox {
>  
>  struct stm32_rproc {
>  	struct reset_control *rst;
> +	struct reset_control *hold_boot_rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
>  	struct stm32_syscon m4_state;
> @@ -88,7 +89,7 @@ struct stm32_rproc {
>  	struct stm32_rproc_mem *rmems;
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
> -	bool secured_soc;
> +	bool hold_boot_smc;
>  	void __iomem *rsc_va;
>  };
>  
> @@ -401,13 +402,28 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  	struct arm_smccc_res smc_res;
>  	int val, err;
>  
> +	/*
> +	 * Three ways to manage the hold boot
> +	 * - using SCMI: the hold boot is managed as a reset,
> +	 * - using Linux(no SCMI): the hold boot is managed as a syscon register
> +	 * - using SMC call (deprecated): use SMC reset interface
> +	 */
> +
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
> +	if (ddata->hold_boot_rst) {
> +		/* Use the SCMI reset controller */
> +		if (!hold)
> +			err = reset_control_deassert(ddata->hold_boot_rst);
> +		else
> +			err =  reset_control_assert(ddata->hold_boot_rst);
> +	} else if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->hold_boot_smc) {
> +		/* Use the SMC call */
>  		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
>  			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
>  		err = smc_res.a0;
>  	} else {
> +		/* Use syscon */
>  		err = regmap_update_bits(hold_boot.map, hold_boot.reg,
>  					 hold_boot.mask, val);
>  	}
> @@ -705,34 +721,54 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		dev_info(dev, "wdg irq registered\n");
>  	}
>  
> -	ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
> +	if (!ddata->rst) {
> +		/* Try legacy fallback method: get it by index */
> +		ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +	}
>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
>  				     "failed to get mcu_reset\n");
>  
>  	/*
> -	 * if platform is secured the hold boot bit must be written by
> -	 * smc call and read normally.
> -	 * if not secure the hold boot bit could be read/write normally
> +	 * Three ways to manage the hold boot
> +	 * - using SCMI: the hold boot is managed as a reset
> +	 *    The DT "reset-mames" property should be defined with 2 items:
> +	 *        reset-names = "mcu_rst", "hold_boot";
> +	 * - using SMC call (deprecated): use SMC reset interface
> +	 *    The DT "reset-mames" property is optional, "st,syscfg-tz" is required
> +	 * - default(no SCMI, no SMC): the hold boot is managed as a syscon register
> +	 *    The DT "reset-mames" property is optional, "st,syscfg-holdboot" is required
>  	 */
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
> -	if (err) {
> -		dev_err(dev, "failed to get tz syscfg\n");
> -		return err;
> -	}
>  
> -	err = regmap_read(tz.map, tz.reg, &tzen);
> -	if (err) {
> -		dev_err(dev, "failed to read tzen\n");
> -		return err;
> +	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
> +	if (IS_ERR(ddata->hold_boot_rst)) {
> +		if (PTR_ERR(ddata->hold_boot_rst) == -EPROBE_DEFER)
> +			return PTR_ERR(ddata->hold_boot_rst);

Here we know that devm_reset_control_get_optional() has returned an error that is
not -EPROBE_DEFER and as such, I think we should return that error instead of
continuing on with the probing.  Calling dev_err_probe() should be just fine. 

Otherwise I'm good with this set.  Many thanks for the enhanced explanation.

Mathieu

> +		ddata->hold_boot_rst = NULL;
> +	}
> +
> +	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
> +		/* Manage the MCU_BOOT using SMC call */
> +		err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
> +		if (!err) {
> +			err = regmap_read(tz.map, tz.reg, &tzen);
> +			if (err) {
> +				dev_err(dev, "failed to read tzen\n");
> +				return err;
> +			}
> +			ddata->hold_boot_smc = tzen & tz.mask;
> +		}
>  	}
> -	ddata->secured_soc = tzen & tz.mask;
>  
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> -				     &ddata->hold_boot);
> -	if (err) {
> -		dev_err(dev, "failed to get hold boot\n");
> -		return err;
> +	if (!ddata->hold_boot_rst && !ddata->hold_boot_smc) {
> +		/* Default: hold boot manage it through the syscon controller */
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
