Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6609FE00F
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 18:37:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E846C78013;
	Sun, 29 Dec 2024 17:37:54 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E1A6C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2024 17:37:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4757104811E4; Sun, 29 Dec 2024 18:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735493865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfwoFskvac32DMGJaG2VVgg3dFe4kwMlCOX61uyPLDE=;
 b=KSVapUJBrd09Vwg/G5+Osz47EjxrzwoxxD5bJljCnJ4m92W0MeUuf1j+hai1P7q0slT5GP
 RUjHqtEWsRcmOt1I4s9LjHm5zamXHQRDFRQGMikQWFBE0dlNkAgIN0Knp5A6sphx2WPdCe
 cD9FYRmBHKO+wftSdPT05Nl+L0y4hH5DoGcg4DHucURTM2Fnsl1QJJ4G47V3o4FjZrhfWL
 OtkpJdAJh3wsPiDcyA9QWTmQWdneCSg5xlS7am2yVWQ0LBuSbVPmMtFCVV1whF7YvGZwTY
 M4EWyP0bUsES0SioAUSu2CVz/1iUdlVavxMwoRJiy/NWH+GJBp1WoObhj9xkYg==
Message-ID: <b2f2f1e6-a539-4d1b-876f-6715c126ac3e@denx.de>
Date: Sun, 29 Dec 2024 18:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>
References: <20241224200608.84923-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241224200608.84923-1-zmw12306@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v7] pinctrl: stm32: Add check for
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

On 12/24/24 9:06 PM, Mingwei Zheng wrote:

[...]

> @@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	err = gpiochip_add_data(&bank->gpio_chip, bank);

There is one other nasty problem here -- this gpiochip_add_data() needs 
to be undone (*) below, otherwise ...
...

> +	ret = clk_bulk_prepare_enable(banks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	for_each_gpiochip_node(dev, child) {
>   		ret = stm32_gpiolib_register_bank(pctl, child);

... if this stm32_gpiolib_register_bank() fails for second or later bank 
, then ...

>   		if (ret) {
>   			fwnode_handle_put(child);
> -
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
> -			return ret;
> +			goto err_clk;
>   		}
>   
>   		pctl->nbanks++;
> @@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
> +
> +err_clk:
> +	clk_bulk_disable_unprepare(banks, pctl->clks);

... this clk_bulk_disable_unprepare() will disable all bank clocks, 
including the clocks for the banks which got successfully registered.

Before calling clk_bulk_disable_unprepare(), it is necessary to 
unregister the GPIO chips again, i.e.:

i = 0;
for_each_gpiochip_node(dev, child) {
   struct stm32_gpio_bank *bank = &pctl->banks[i];
   gpiochip_remove(*bank->gpio_chip);
}
clk_bulk_disable_unprepare(banks, pctl->clks);

Otherwise I think the patch is pretty good, thank you !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
