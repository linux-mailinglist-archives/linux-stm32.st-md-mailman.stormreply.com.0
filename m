Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8349B1CF
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 11:44:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF5F9C60465;
	Tue, 25 Jan 2022 10:44:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA2C1C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 10:44:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1285714wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gue0fJwwcgJTZVNdeX+6H9YxIr2uToB8WYyhrif8Zgg=;
 b=sfzTb+mBqz0CAb/NiDVYEy4M/U6s+cmQivYUZ8T8HCXtmf47TqVlQa1MVrKhdPAMHN
 +6sUu1m8cJkI2leNd7KOBhsW/75lhMRZXi2RgH1od2b4BisBeAPZq26RZk0ojhIeqAvU
 E7sfVfSgMK3D0+Ao8mZk7tESb0rO1VWhWnEa0+IehTUyxqK6eNAffYdfKIAYHypoFwiD
 pGadS7fcpBpZh2iYufU8CZlSmVr6I+ufZREvlxdmNgy/3VdzFUfs4xUN6DJI2EOWZVZx
 sR3jFsHtIpGYVQ+FGBhHrmI6E2cPmgy9vVR/gtFq5LoHmrCwZU65QghzCIWNfZ1cV36o
 INDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gue0fJwwcgJTZVNdeX+6H9YxIr2uToB8WYyhrif8Zgg=;
 b=wM5wC3Ak4DGSEGz1vW25gCVHl7NjuAHKOVXJS5i9fp4iCmUVxoDpUXK3yBjk0+claw
 zoaZ3OG9IxGdCZbiC12DM1+fDKBQBji2YxfgowV+geoTRpLgDB9TUxBmxYU24jx9nuE9
 OaO3iV32CnlifqxxfndDKJvRnC/s923jJpvpRNB0rXiMJVT4MXECDwXVcRNQcwVtCqOL
 DKIzHP/KkIh5xOyytMP8aOU/NpcROvviVHyuoCyuF5NthYSVF/oOs9nHErH6tQL4AHL+
 GjtPdVuVzUwsYw+iLg9awwf6C0vNiQvYsrlXkF/pdqX/tWktC+W0IlMEsR/lTY9lcjhR
 biXw==
X-Gm-Message-State: AOAM531PdNjSmuYh0Bii08isnKUrG61UDT75G8hx53w0S41hlZdE2BCU
 2rtPMkhgdFHeFzRMIWoQz2VL5g==
X-Google-Smtp-Source: ABdhPJwyyIe2jBpAoerujDirbO4rY9Xe5Cophwwo1PvJt0DtwWdDxkzOGYMcccAJJqr8guZLIXQUMQ==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr2337930wml.174.1643107481389; 
 Tue, 25 Jan 2022 02:44:41 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id o14sm5657228wry.104.2022.01.25.02.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:44:40 -0800 (PST)
Message-ID: <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
Date: Tue, 25 Jan 2022 10:44:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220105135734.271313-4-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, chenshumin86@sina.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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



On 05/01/2022 13:57, Christophe Kerello wrote:
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index e765d3d0542e..e11c74db64f9 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -769,7 +769,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	if (config->wp_gpio)
>   		nvmem->wp_gpio = config->wp_gpio;
> -	else
> +	else if (config->reg_write)
This is clearly not going to work for everyone.

A flag in nvmem_config to indicate that wp gpio is managed by provider 
driver would be the right thing to do here.
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);

--srini

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
