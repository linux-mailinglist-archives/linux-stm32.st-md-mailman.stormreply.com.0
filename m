Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869D675BC7
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 18:42:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F086FC6904C;
	Fri, 20 Jan 2023 17:42:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4EEC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 17:42:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id n7so5510261wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDZkhqwFOsgIMnr1ffA8Wl9YS35ktcX3ijiYmPNgJyc=;
 b=oB2RYPntMat4uRWwi//YXNXL76SLyz8fEv0Jznjb62D98tEATsMU/ZDIdky+Fq7wKl
 Uze/1ee3DQzUZZcX6Hpc52V/VC+NHN6QonF5LYdHcKKjiWI0uVxZApwCFsGBS8PxU3fa
 sO741v5i66XxXjJAlw8pufEXnPVF6WWfr598Xwdjs8T+/xD7qObRf60hpZxl01QPePng
 1OftdfPiHPJSMwoZ8X12u4IT2F9MXwBH9ytf0o9GYNsmiUu0BVHZdgZR3S2R5Bftzo+6
 xg9Lyc2z+e1kMkxWVFmfcahlZCPCqVTcr3jdi4/cgaHKe0JxtmJ/QkM0P0m5xfhbql6R
 sY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDZkhqwFOsgIMnr1ffA8Wl9YS35ktcX3ijiYmPNgJyc=;
 b=w6WfGm68eGRlDKywbwH6cQgww2WJBXjv4uK0aFkspAvovlpG98EqaMxEZg7SnspQHE
 fAzF0B2E2e359JTS9xwE0tgdMhB8O+Qm8d7OQ7LIO0opemiaGclIWcbYuPwCLyY35X3E
 mg1akAok3hqXURENXEPQVyvhEixkg42I6X5jsdPDPNgLdpAiIdADn5i42EXJnFfUT8XD
 AiZlb8uwWgAgMwVxbwCBciDkt5lgOzcdaSaH5+2O6mYkzSpnnsbh1pGHn+Jz0IqKlRXv
 zFsF2gO37XXygA8dI5Na3GunuBlYQimxGiBpUmrdib9Q/wX2CdMjMWUs2ig4Sgc+AA96
 dfUQ==
X-Gm-Message-State: AFqh2kro4+2DLItFjPJS7vos2I2RYJ85YOj9TMWgy4E366FL/1Ek8I5u
 c1XbJNjP2bra6zESkuGvZH9Lzg==
X-Google-Smtp-Source: AMrXdXvfmB6jJvru/xlfNUOX0PYXnlRnAIySB/9Oaj3KA00ntii9qjhOJPKti8muOdsK1HdA5OI10A==
X-Received: by 2002:a5d:4a51:0:b0:2be:57b5:d50b with SMTP id
 v17-20020a5d4a51000000b002be57b5d50bmr2802921wrs.3.1674236537252; 
 Fri, 20 Jan 2023 09:42:17 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 l5-20020adfe9c5000000b002238ea5750csm22416303wrn.72.2023.01.20.09.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 09:42:16 -0800 (PST)
Message-ID: <2b77d20c-efe4-a0f3-4260-5817f3068eb0@linaro.org>
Date: Fri, 20 Jan 2023 17:42:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
 <20230118182856.v6.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230118182856.v6.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
Cc: linux-kernel@vger.kernel.org,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 3/3] nvmem: stm32: detect bsec pta
 presence for STM32MP15x
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



On 18/01/2023 17:29, Patrick Delaunay wrote:
> On STM32MP15x SoC, the SMC backend is optional when OP-TEE is used;
> the PTA BSEC should be used as it is done on STM32MP13x platform,
> but the BSEC SMC can be also used: it is a legacy mode in OP-TEE,
> not recommended but used in previous OP-TEE firmware.
> 
> The presence of OP-TEE is dynamically detected in STM32MP15x device tree
> and the supported NVMEM backend is dynamically detected:
> - PTA with stm32_bsec_pta_find
> - SMC with stm32_bsec_check
> 
> With OP-TEE but without PTA and SMC detection, the probe is deferred for
> STM32MP15x devices.
> 
> On STM32MP13x platform, only the PTA is supported with cfg->ta = true
> and this detection is skipped.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---


Applied thanks,

--srini

> 
> Changes in v6:
> - added reviewed by Etienne Carriere
> 
> Changes in v5:
> - update the BSEC SMC detection logic in stm32_romem_probe()
>    after Etienne Carierre review to support NVMEM probe after OP-TEE probe
> 
> Changes in v3:
> - use of_find_compatible_node in optee_presence_check function
>    instead of of_find_node_by_path("/firmware/optee")
> 
> Changes in v2:
> - Added patch in the serie for BSEC PTA support on STM32MP15x
>    with dynamic detection of OP-TEE presence and SMC support (legacy mode)
> 
>   drivers/nvmem/stm32-romem.c | 38 +++++++++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
> index 978a63edf297..ba779e26937a 100644
> --- a/drivers/nvmem/stm32-romem.c
> +++ b/drivers/nvmem/stm32-romem.c
> @@ -159,6 +159,31 @@ static int stm32_bsec_pta_write(void *context, unsigned int offset, void *buf,
>   	return stm32_bsec_optee_ta_write(priv->ctx, priv->lower, offset, buf, bytes);
>   }
>   
> +static bool stm32_bsec_smc_check(void)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* check that the OP-TEE support the BSEC SMC (legacy mode) */
> +	ret = stm32_bsec_smc(STM32_SMC_READ_SHADOW, 0, 0, &val);
> +
> +	return !ret;
> +}
> +
> +static bool optee_presence_check(void)
> +{
> +	struct device_node *np;
> +	bool tee_detected = false;
> +
> +	/* check that the OP-TEE node is present and available. */
> +	np = of_find_compatible_node(NULL, NULL, "linaro,optee-tz");
> +	if (np && of_device_is_available(np))
> +		tee_detected = true;
> +	of_node_put(np);
> +
> +	return tee_detected;
> +}
> +
>   static int stm32_romem_probe(struct platform_device *pdev)
>   {
>   	const struct stm32_romem_cfg *cfg;
> @@ -195,11 +220,16 @@ static int stm32_romem_probe(struct platform_device *pdev)
>   	} else {
>   		priv->cfg.size = cfg->size;
>   		priv->lower = cfg->lower;
> -		if (cfg->ta) {
> +		if (cfg->ta || optee_presence_check()) {
>   			rc = stm32_bsec_optee_ta_open(&priv->ctx);
> -			/* wait for OP-TEE client driver to be up and ready */
> -			if (rc)
> -				return rc;
> +			if (rc) {
> +				/* wait for OP-TEE client driver to be up and ready */
> +				if (rc == -EPROBE_DEFER)
> +					return -EPROBE_DEFER;
> +				/* BSEC PTA is required or SMC not supported */
> +				if (cfg->ta || !stm32_bsec_smc_check())
> +					return rc;
> +			}
>   		}
>   		if (priv->ctx) {
>   			rc = devm_add_action_or_reset(dev, stm32_bsec_optee_ta_close, priv->ctx);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
