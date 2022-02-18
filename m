Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3F4BBA10
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 14:24:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32081C60474;
	Fri, 18 Feb 2022 13:24:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFC39C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 13:24:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x5so9740589wrg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 05:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujmj8PwbJSvu47uw+CyCbxAA/eAxR/7pr/uKWTwQSVI=;
 b=d/5iEdmNQi1OPG/+LIV6gWpQUkUjCSHGIgH1D0FcX7ZyEgs8jS7MoQa4IJgJ2B6eqL
 FM4kzf/QUxUrCwUX2eIFNVmfzlNT63GrIWDj9FwpDaARAILH0RZ1/01qjCG0zSPh3dMJ
 HwvWOd6S8DF2OOneBoSwvAs0UzTJqknCOwwyfC3Om1DfojnRR+YPwbLY4hRuChuD+GNI
 TFnxA8s6wH7tGfns7Ivf21N8LvzoaL1LzjpjnDvBoGnfvN4KW+wm2FHcmLsKNwNcGnrB
 rOOOIDwBR598nXeua7jBinj0xTnuNLzO/uTX1BAaIh+fIw844Mqko7SZF1pi/5Zii1xs
 S8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujmj8PwbJSvu47uw+CyCbxAA/eAxR/7pr/uKWTwQSVI=;
 b=zlZ6sopAN1TGFIUOTH7YYYOoH/5EcMnQuI8HeQTqOWaxUgqGp6BjDk3mVEFD1Uyy+S
 yN5lWFQeSRSQw8WyGwNueGb+ytj3c1NoEruGdTX/cI6ueSf1Rq68gc7BCKIzkqwakjtL
 9x298dMHYlAoXp5xtRZVOc/kzqYWxZH40fwjSZYNbg25ISYeuwEDanX1jX9hYE38l7J/
 LhNUg5FCVdftEX90LekJWYrelIHfnYcBE9HXpwLRgU3OPiw+H3z3GpuXt+UySnoiymp3
 2HACbNSNC/gW1Q3WFyBIQOOXGZuiCZqWqnzdTxGkMzMA0yR6cdjqX4+LozlkRx7UeTIq
 vIWQ==
X-Gm-Message-State: AOAM531r9OC3Lvy1qBDc8oVDOxkMms4s6L7sj9eDESH5xpzgwzT545LM
 oTYVUjp7DEB0WCtel6R7R1f/bA==
X-Google-Smtp-Source: ABdhPJy2nDo7yTxFYdHgagsn3pqhYbisII2MeTUOZhN6jb5RjapXtp3DM5vozRRBVGB3r4CtEsesrg==
X-Received: by 2002:a05:6000:1e04:b0:1e4:9b64:8cab with SMTP id
 bj4-20020a0560001e0400b001e49b648cabmr6038845wrb.608.1645190687489; 
 Fri, 18 Feb 2022 05:24:47 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id x18sm41464215wrw.17.2022.02.18.05.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 05:24:46 -0800 (PST)
Message-ID: <6f3ff8f3-82fb-1bb1-d854-bb48f1ea9b1d@linaro.org>
Date: Fri, 18 Feb 2022 13:24:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-4-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-4-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v3 3/4] nvmem: core: Fix a conflict
 between MTD and NVMEM on wp-gpios property
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



On 17/02/2022 14:47, Christophe Kerello wrote:
> Wp-gpios property can be used on NVMEM nodes and the same property can
> be also used on MTD NAND nodes. In case of the wp-gpios property is
> defined at NAND level node, the GPIO management is done at NAND driver
> level. Write protect is disabled when the driver is probed or resumed
> and is enabled when the driver is released or suspended.
> 
> When no partitions are defined in the NAND DT node, then the NAND DT node
> will be passed to NVMEM framework. If wp-gpios property is defined in
> this node, the GPIO resource is taken twice and the NAND controller
> driver fails to probe.
> 
> It would be possible to set config->wp_gpio at MTD level before calling
> nvmem_register function but NVMEM framework will toggle this GPIO on
> each write when this GPIO should only be controlled at NAND level driver
> to ensure that the Write Protect has not been enabled.
> 
> A way to fix this conflict is to add a new boolean flag in nvmem_config
> named ignore_wp. In case ignore_wp is set, the GPIO resource will
> be managed by the provider.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org
> ---
> Changes in v3:
>   - add a fixes tag.
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.

Applied thanks,

--srini
> 
> Changes in v2:
>   - rework the proposal done to fix a conflict between MTD and NVMEM on
>     wp-gpios property.
> 
>   drivers/nvmem/core.c           | 2 +-
>   include/linux/nvmem-provider.h | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 23a38dcf0fc4..9fd1602b539d 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -771,7 +771,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	if (config->wp_gpio)
>   		nvmem->wp_gpio = config->wp_gpio;
> -	else
> +	else if (!config->ignore_wp)
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(nvmem->wp_gpio)) {
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 98efb7b5660d..c9a3ac9efeaa 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -70,7 +70,8 @@ struct nvmem_keepout {
>    * @word_size:	Minimum read/write access granularity.
>    * @stride:	Minimum read/write access stride.
>    * @priv:	User context passed to read/write callbacks.
> - * @wp-gpio:   Write protect pin
> + * @wp-gpio:	Write protect pin
> + * @ignore_wp:  Write Protect pin is managed by the provider.
>    *
>    * Note: A default "nvmem<id>" name will be assigned to the device if
>    * no name is specified in its configuration. In such case "<id>" is
> @@ -92,6 +93,7 @@ struct nvmem_config {
>   	enum nvmem_type		type;
>   	bool			read_only;
>   	bool			root_only;
> +	bool			ignore_wp;
>   	struct device_node	*of_node;
>   	bool			no_of_node;
>   	nvmem_reg_read_t	reg_read;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
