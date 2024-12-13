Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9A9F0B89
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 12:45:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA6CC78018;
	Fri, 13 Dec 2024 11:45:28 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65B5FC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 11:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E3731049DA13; Fri, 13 Dec 2024 12:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734090325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkBIlhUGkIaiKofFxUVhr74VClg7J+Yj/5BHdg57D+8=;
 b=WCmUgeosX4tvXaGOiHRdoD6VWNxfDTxSEKj4CLn7/x4aFicr3aW5a8/LadGjHRtv/5575d
 gCmNC2ojQGczCqkDM7MbJZu40HJus9y8cdZSvdjdYc/UysZ/eEF0VD2Xmms4Bk782EGaVq
 GGTVzilaiwLKOWrN6BMM+ZVnB6TR9UFBil3njXfibn6sPYRxHmZJUCXZc5ugdwLsQJITeK
 DxaFNzxIw+E3S5Pqa87fuxAePTuCZnktgamau651x8PqReAS4Z16bvY3Ybml4Q1E+kNe+O
 q+jvIDdzZz3l1EtJwK532EgUamcK35ZbRJFup2FuF1bHw4QWTX6BkjtMpsRbzQ==
Message-ID: <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
Date: Fri, 13 Dec 2024 12:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>, antonio.borneo@foss.st.com
References: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] pinctrl: stm32: Add check for
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

On 12/13/24 2:09 AM, Mingwei Zheng wrote:

[...]

> @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	return 0;
>   
>   err_clk:
> -	clk_disable_unprepare(bank->clk);
> +	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);


Should this be

-clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
+clk_disable_unprepare(pctl->clks[bank->bank_nr].clk);
                                   ^^^^^^^^^^^^^

?

>   	return err;
>   }
>   
> @@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> -			GFP_KERNEL);
> +				   GFP_KERNEL);
>   	if (!pctl->banks)
>   		return -ENOMEM;
>   
> +	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> +				  GFP_KERNEL);
> +	if (!pctl->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < banks; ++i)

i++
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
