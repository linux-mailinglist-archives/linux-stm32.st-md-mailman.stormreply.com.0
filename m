Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B062604B
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Nov 2022 18:18:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88753C65068;
	Fri, 11 Nov 2022 17:18:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F9EAC65066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Nov 2022 17:18:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p16so3289457wmc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Nov 2022 09:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eHjCnmp13pT1HR3U4EDOAxZovpCqISuhgyVM/uvGaJ4=;
 b=BUAzrxCZRoo8p0y6YpE+a14HGZSIZxVjezOXAr43JkrUiWKifk59ruSfDEukXR+Y7H
 fMlbl7pMMQilWyzvyin52mdhjsi/woaSLS05rW6ZM3LKAKt+VrV4Y/5FqqDjKCMcZ+Ap
 Ms0sSkqmDg69kRC9Aan4UBh6uHnbxKz/21ydj9yoczoZI79cIvlAQ8tDmfVZuq0tq6z7
 5Yuv2iw5pPQYE0tgz4RJFkGO+E2H1P7yXKBGJPgh3IaW5hvV8PbZ++uQizqXnPEN61R0
 7t0gTKBP4y4BbqqwU6BE/xrO1VYa7/0IkTV4SOoyRt1hgJfiPWT6FgG5Uy3lVaYYuyGn
 oeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHjCnmp13pT1HR3U4EDOAxZovpCqISuhgyVM/uvGaJ4=;
 b=BWjtNScahCGBKHeeHDIiesr7Tn57M+BfQMsa3F/XTOmpTE3ZXbC0sOOLuf6IsTgu8n
 zWygPCglPgFiDluDnamjOjvSp6szcPQIx4rldsUm4EBSr+TNdPaei562gVW54f6z/tL8
 xn7VSVc5EQBajiqBzsJIwosgpyvxImoIVfT6aOpEt5jjHM7Wi8QvTf/7cyAheo5D414u
 ZuV7itwKxUE/Pc4xnrGeGJluTY8FUImxzaCAsTAEmL0aHSuxPES3h16EeY7YpXBGr7Ab
 llFwtjpV3ro1twen9SOUEg9qRY2QK2IdlgdhAm8uADxqkbDOK/lQKo60i8/V8/wa/Rjo
 BeYQ==
X-Gm-Message-State: ANoB5pk8QxXWeubCxnV8epVJoUSxdaAb+PPYeCn40L12a4p3OFbuoEhj
 wUJfMpTQHq5DjYqFuVBxhxkktw==
X-Google-Smtp-Source: AA0mqf4j8GHZnp455NdE3OYo701UiMaHA2o4LPHoeNXYkSXK/FXNXmz+QEbC/CqDkLD7TxOU3YqTtw==
X-Received: by 2002:a05:600c:384d:b0:3cf:c907:a05a with SMTP id
 s13-20020a05600c384d00b003cfc907a05amr1921237wmr.177.1668187113874; 
 Fri, 11 Nov 2022 09:18:33 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 n13-20020adff08d000000b002364c77bcacsm2314310wro.38.2022.11.11.09.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 09:18:33 -0800 (PST)
Message-ID: <46a5151e-73e4-e1e3-cb3a-7b36ef34221c@linaro.org>
Date: Fri, 11 Nov 2022 17:18:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221110154550.3220800-1-patrick.delaunay@foss.st.com>
 <20221110164329.v2.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221110164329.v2.2.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] nvmem: stm32: add OP-TEE support
	for STM32MP13x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 10/11/2022 15:45, Patrick Delaunay wrote:
> For boot with OP-TEE on STM32MP13, the communication with the secure
> world no more use STMicroelectronics SMC but communication with the
> BSEC TA, for data access (read/write) or lock operation:
> - all the request are sent to OP-TEE trusted application,
> - for upper OTP with ECC protection and with word programming only
>    each OTP are permanently locked when programmed to avoid ECC error
>    on the second write operation
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - rebase series on linux-next/master
> - minor update after V1 revue
> - add missing sentinel in stm32_romem_of_match()
> - reorder function and remove prototypes for stm32_bsec_pta... functions
> - change stm32_bsec_pta_find to static
> - add return value in dev_err()
> - cleanups some comments, which can be on one line
> - remove test on priv->ctx in stm32_bsec_pta_remove
> - add missing tee_shm_free(shm) in stm32_bsec_pta_write() when
>    tee_shm_get_va failed
> - return error in stm32_bsec_pta_find when devm_add_action_or_reset failed
> - handle driver_register error in stm32_romem_init
> 
>   drivers/nvmem/stm32-romem.c | 445 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 441 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
> index d1d03c2ad081..0a0e29d09b67 100644
> --- a/drivers/nvmem/stm32-romem.c
> +++ b/drivers/nvmem/stm32-romem.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/of_device.h>
> +#include <linux/tee_drv.h>
>   
>   /* BSEC secure service access from non-secure */
>   #define STM32_SMC_BSEC			0x82001003
> @@ -25,14 +26,401 @@
>   struct stm32_romem_cfg {
>   	int size;
>   	u8 lower;
> +	bool ta;
>   };
>   
>   struct stm32_romem_priv {
>   	void __iomem *base;
>   	struct nvmem_config cfg;
>   	u8 lower;
> +	struct device *ta;
>   };
>   
> +#if IS_ENABLED(CONFIG_OPTEE)
> +/*

...

> +
> +static const struct tee_client_device_id stm32_bsec_id_table[] = {
> +	{
> +		UUID_INIT(0x94cf71ad, 0x80e6, 0x40b5,
> +			  0xa7, 0xc6, 0x3d, 0xc5, 0x01, 0xeb, 0x28, 0x03)
> +	},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(tee, stm32_bsec_id_table);
> +
> +static struct tee_client_driver stm32_bsec_pta_driver = {
> +	.id_table	= stm32_bsec_id_table,
> +	.driver		= {
> +		.name = "stm32-bsec-pta",
> +		.bus = &tee_bus_type,
> +		.probe = stm32_bsec_pta_probe,
> +		.remove = stm32_bsec_pta_remove,
> +	},
> +};
> +
> +static void stm32_bsec_put_device(void *data)
> +{
> +	put_device(data);
> +}
> +
> +static struct device *stm32_bsec_pta_find(struct device *dev)
> +{
> +	struct device *pta_dev;
> +	int ret;
> +
> +	pta_dev = driver_find_next_device(&stm32_bsec_pta_driver.driver, NULL);

This is clearly not representing the dependencies in a proper device model.


If the nvmem provider is a TEE client driver lets model it that way.. 
brining in a additional device and somehow trying to link it with TEE 
driver is  a hack.


> +
> +	if (pta_dev) {
> +		ret = devm_add_action_or_reset(dev, stm32_bsec_put_device, pta_dev);
> +		if (ret)
> +			dev_err(dev, "devm_add_action_or_reset() failed (%d)\n", ret);
> +
> +		return ERR_PTR(ret);
> +	}
> +
> +	return pta_dev;
> +}
> +
> +#else
> +static int stm32_bsec_pta_read(void *context, unsigned int offset, void *buf,
> +			       size_t bytes)
> +{
> +	pr_debug("%s: TA BSEC request without OPTEE support\n", __func__);
> +
> +	return -ENXIO;
> +}
> +
> +static int stm32_bsec_pta_write(void *context, unsigned int offset, void *buf,
> +				size_t bytes)
> +{
> +	pr_debug("%s: TA BSEC request without OPTEE support\n", __func__);
> +
> +	return -ENXIO;
> +}
> +
> +static struct device *stm32_bsec_pta_find(struct device *dev)
> +{
> +	pr_debug("%s: TA BSEC request without OPTEE support\n", __func__);
> +
> +	return NULL;
> +}
> +#endif

ifdefing inside the drvier is really ugly, please move this libary 
functions to a seperate file and add dependecy properly in Kconfig.

> +
>   static int stm32_romem_read(void *context, unsigned int offset, void *buf,
>   			    size_t bytes)
>   {
> @@ -173,15 +561,27 @@ static int stm32_romem_probe(struct platform_device *pdev)
>   	} else {
>   		priv->cfg.size = cfg->size;
>   		priv->lower = cfg->lower;
> -		priv->cfg.reg_read = stm32_bsec_read;
> -		priv->cfg.reg_write = stm32_bsec_write;
> +		if (cfg->ta) {
> +			priv->ta = stm32_bsec_pta_find(dev);
> +			/* wait for OP-TEE client driver to be up and ready */
> +			if (!priv->ta)
> +				return -EPROBE_DEFER;
> +			if (IS_ERR(priv->ta))
> +				return PTR_ERR(priv->ta);
> +
> +			priv->cfg.reg_read = stm32_bsec_pta_read;
> +			priv->cfg.reg_write = stm32_bsec_pta_write;
> +		} else {
> +			priv->cfg.reg_read = stm32_bsec_read;
> +			priv->cfg.reg_write = stm32_bsec_write;
> +		}
>   	}
>   
>   	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &priv->cfg));
>   }
>   
>   /*
> - * STM32MP15 BSEC OTP regions: 4096 OTP bits (with 3072 effective bits)
> + * STM32MP15/13 BSEC OTP regions: 4096 OTP bits (with 3072 effective bits)
>    * => 96 x 32-bits data words
>    * - Lower: 1K bits, 2:1 redundancy, incremental bit programming
>    *   => 32 (x 32-bits) lower shadow registers = words 0 to 31
> @@ -191,6 +591,13 @@ static int stm32_romem_probe(struct platform_device *pdev)
>   static const struct stm32_romem_cfg stm32mp15_bsec_cfg = {
>   	.size = 384,
>   	.lower = 32,
> +	.ta = false,
> +};
> +
> +static const struct stm32_romem_cfg stm32mp13_bsec_cfg = {
> +	.size = 384,
> +	.lower = 32,
> +	.ta = true,
>   };
>   
>   static const struct of_device_id stm32_romem_of_match[] = {
> @@ -198,7 +605,10 @@ static const struct of_device_id stm32_romem_of_match[] = {
>   		.compatible = "st,stm32mp15-bsec",
>   		.data = (void *)&stm32mp15_bsec_cfg,
>   	}, {
> +		.compatible = "st,stm32mp13-bsec",
> +		.data = (void *)&stm32mp13_bsec_cfg,
>   	},
> +	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, stm32_romem_of_match);
>   
> @@ -209,7 +619,34 @@ static struct platform_driver stm32_romem_driver = {
>   		.of_match_table = of_match_ptr(stm32_romem_of_match),
>   	},
>   };
> -module_platform_driver(stm32_romem_driver);
> +
> +static int __init stm32_romem_init(void)
> +{
> +	int rc;
> +
> +	rc = platform_driver_register(&stm32_romem_driver);
> +	if (rc)
> +		return rc;
> +
> +#if IS_ENABLED(CONFIG_OPTEE)
> +	rc = driver_register(&stm32_bsec_pta_driver.driver);
> +	if (rc)
> +		platform_driver_unregister(&stm32_romem_driver);
> +#endif
> +
> +	return rc;
> +}
> +
> +static void __exit stm32_romem_exit(void)
> +{
> +	platform_driver_unregister(&stm32_romem_driver);
> +#if IS_ENABLED(CONFIG_OPTEE)
> +	driver_unregister(&stm32_bsec_pta_driver.driver);
> +#endif
> +}
> +
> +module_init(stm32_romem_init);
> +module_exit(stm32_romem_exit);
>   
>   MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@st.com>");
>   MODULE_DESCRIPTION("STMicroelectronics STM32 RO-MEM");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
