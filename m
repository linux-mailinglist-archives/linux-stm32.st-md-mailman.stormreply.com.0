Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997593814F
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jul 2024 14:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F79CC78017;
	Sat, 20 Jul 2024 12:35:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AB47C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jul 2024 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rfT+wKS03QStuvsuw2Ht5YxWdDs9N54bvyBHm404z5w=; b=WU4TZjUm0bIk6ItpC+MpNQFEM9
 TZXiGliWrbvUMBLpGi5W6q7W31VrLCwMq0U4hsYt0AVFJ3Ar5G/nVIjMeuSYQwevUR9KqHh4kEnRg
 g0Qm4nW8G0JmJxnQrDJbRdXFSqHJRuWorLKdVJX9DGSTHW7bofogfD1J/gPMVV6LyVIc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sV9J8-002tkI-JM; Sat, 20 Jul 2024 14:35:26 +0200
Date: Sat, 20 Jul 2024 14:35:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Message-ID: <0c5f35c1-cf3a-4759-ac17-54e6f8c22c69@lunn.ch>
References: <20240720040027.734420-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240720040027.734420-1-zhouzhouyi@gmail.com>
Cc: linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com,
 netdev@vger.kernel.org, linus.walleij@linaro.org,
 wangzhiqiang <zhiqiangwang@ucas.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 "zhili.liu" <zhili.liu@ucas.com.cn>, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix the mistake of the
 device tree property string of reset gpio in stmmac_mdio_reset
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

On Sat, Jul 20, 2024 at 04:00:27AM +0000, Zhouyi Zhou wrote:
> From: "zhili.liu" <zhili.liu@ucas.com.cn>
> 
> According to Documentation/devicetree/bindings/net/snps,dwmac.yaml,
> the device tree property of PHY Reset GPIO should be "snps,reset-gpio".
> 
> Use string "snps,reset-gpio" instead of "snps,reset" in stmmac_mdio_reset
> when invoking devm_gpiod_get_optional.

Have you found the current code does not work on a board you have, or
is this by code inspection?

https://elixir.bootlin.com/linux/v6.10/source/drivers/gpio/gpiolib-of.c#L687
https://elixir.bootlin.com/linux/v6.10/source/drivers/gpio/gpiolib.h#L93

See how it appends -gpio and -gpios to the name.

I also randomly check a few users of devm_gpiod_get_optional() and non
of them include the -gpio in the name, leaving the GPIO core to do it.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
