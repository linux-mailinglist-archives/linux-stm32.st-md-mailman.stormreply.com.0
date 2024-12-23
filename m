Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE09FB4B6
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 20:35:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89740C78F65;
	Mon, 23 Dec 2024 19:35:28 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90B37C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 19:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDF95108A88F0; Mon, 23 Dec 2024 20:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734982520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WLuHWjZM3VRX7nJ+Pc75I1m4HqNbbSxdu5AhUiwKyg=;
 b=CueH/fD3YFomuQ1LDPTIrV6Y7okJdiQF7ouvXjU8mWrTaaDb1lShPFWDI3w4gTLIoDG15Z
 buFWYSgi5vaRBeWFErPnX9r0BxPiN9/6p8CcnRlH+CQ1l1VTJqM98idg8+PYFh8b6d4rN+
 TRz+EbhHKRqm10eL64RtQIKMrfJ2ejlUugJ6ikp7krKjXyvcAge5Y5ZByn7UDqUYJuYBTR
 k/IUvEBsrKs9vch5/Fx6Q0MOigV4/ZjFg9dRgV9KyeHUtya6HJ67RQVRH4+//L6VpuTP3C
 zOwOVu32xwsi/hQt5B3lLbOYasInFMiGufNsQb4I3X4t/X9ZhpyfVcHvOHKkLg==
Message-ID: <412e65b5-dd91-4982-8b1a-423997da9a28@denx.de>
Date: Mon, 23 Dec 2024 20:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>
References: <20241223020629.3471182-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241223020629.3471182-1-zmw12306@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6] pinctrl: stm32: Add check for
	clk_enable()
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

On 12/23/24 3:06 AM, Mingwei Zheng wrote:

[...]

Shouldn't the clock be enabled before calling 
stm32_gpiolib_register_bank() ? I think the 
clk_bulk_prepare_enable(pctl->nbanks, pctl->clks); should be around here.

> @@ -1646,15 +1628,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
>   			return ret;
>   		}
>   
>   		pctl->nbanks++;
>   	}
>   
> +	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
Aside from that one question, this looks good, thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
