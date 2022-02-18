Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB64BB5E7
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 10:46:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5ADAC6046A;
	Fri, 18 Feb 2022 09:46:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51AC7C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 09:46:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id p9so13515311wra.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TNPs3XUIKSJGHFJT31aKb5KrR4RIhs82BSGaW6p5+r8=;
 b=aMnVyUqa2iZNrnxcPBcAiBODjipAWB0m4PbyPEvAMm+dWL6d9x5uyTW2u76utu6bLk
 Ac0vPLp8pDxRVjmI1e+T8dQ6LmVsJSOnsSXvLXWVcz8kbZr+eNbQfdQ0dfzNcQWp7N/k
 mN9n/YgIb4eu+SY76EihV15a2Qm7HwADUzWPQ9cwJ/Bj8dAxBq0hbFCl66YLxWOOG+jj
 D3NLR5KJ4hYzhc//UhA0kqw8PSzm4TBFJVe5iqhk+d/t8L5l4nJqxEcb/ZG+W9uU13jI
 oUKolYaAoX4iTb1eCrmV1sAhc3KMqKNauyUiNbVxufjW2XOKe1cL8xOlMKEUrvZdCUcC
 7uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TNPs3XUIKSJGHFJT31aKb5KrR4RIhs82BSGaW6p5+r8=;
 b=7/QtgqXQNJj5GzhuvgudggV+1RwKXLhHe7sElR/BNlZM9poauRCxU+rlHwxm5Xjk8G
 xWSQWLcNFQ+91iZCnXBYuFmsfU5A2FZYwEUlY7a3i7apRR2RuBocaCnLpQxt3GuQ4Sf7
 AmG7N1zji0koto/EyeE29vOh6TGszxgl7hBTQXRUYJN+vXBij/+Z+ZWN18Hqwh+kMQJZ
 gZNRlsN8gQaFHUvU5w+YqIQ46S9Auu3PWjEIg8WuHwP7fB2xymNlNS/cLm6n8jqwvQxs
 DLgG9dXSJYOQJBtewF3avDx5ZDKvSLSteAdWsa/Dxps7M/kA11XutLs1LE4hZ4yhyf6E
 yvgg==
X-Gm-Message-State: AOAM533eetitRpov6wBzbUbHaBG7gRRxsgcTEIbTU35nPtKLlZCN6nie
 yvOMrgq43IjmOXzlNLqOHf17gw==
X-Google-Smtp-Source: ABdhPJz+D9bmvjgoT8qq45YSNK+QUrJSJSkPVo+OcczsyGu5pCnQnNkzQok/8IEwR4pVbDWeRIo2Og==
X-Received: by 2002:a5d:42ca:0:b0:1e6:2bf3:5c17 with SMTP id
 t10-20020a5d42ca000000b001e62bf35c17mr5254344wrr.621.1645177577821; 
 Fri, 18 Feb 2022 01:46:17 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id g22sm3649606wmh.12.2022.02.18.01.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:46:17 -0800 (PST)
Message-ID: <f44ae992-5408-6f4c-2d03-6c0c64336fb1@linaro.org>
Date: Fri, 18 Feb 2022 09:46:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v3 4/4] mtd: core: Fix a conflict between
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

Hi Miquel,


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
> A new Boolean flag named ignore_wp has been added in nvmem_config.
> In case ignore_wp is set, it means that the GPIO is handled by the
> provider. Lets set this flag in MTD layer to avoid the conflict on
> wp_gpios property.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org
> ---


There seems to be already an mtd core patch [1] that is planned to go 
via nvmem tree, do you want me to take 3/4 and 4/4 via nvmem tree as well?
Or
you can pick up both the series via mtd tree?

Am okay either way.



[1] 
https://patchwork.kernel.org/project/linux-usb/patch/20220104133843.44272-4-andriy.shevchenko@linux.intel.com/

--srini


> Changes in v3:
>   - add a fixes tag
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.
> 
>   drivers/mtd/mtdcore.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 70f492dce158..eef87b28d6c8 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	config.stride = 1;
>   	config.read_only = true;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
>   	config.priv = mtd;
>   
> @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
>   	config.owner = THIS_MODULE;
>   	config.type = NVMEM_TYPE_OTP;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.reg_read = reg_read;
>   	config.size = size;
>   	config.of_node = np;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
