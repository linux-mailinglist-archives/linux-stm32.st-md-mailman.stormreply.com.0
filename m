Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21558B5CE4
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:12:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87380C71285;
	Mon, 29 Apr 2024 15:12:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F4A3C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:12:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7AE5B881BF;
 Mon, 29 Apr 2024 17:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714403541;
 bh=2p5nwdEe+2tN0rGqm1WvT4Hwj3ZaZuiD6Z+esDiHF+M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T2TZN44aGVZoh5SB5DfU4BXFuTS//WbtfLu99Hrs+8JiTvemwI0DllJmre5L0NlFE
 twBYOJeudC8fJ2CRKDlR11qI4TJnmEiBIJMvy6kk9Z7wpaYfQZrkIB5fXeUp+84Npa
 vj6ARnDb42+Ub4z18jmAJhrkm+5lPNmYOrf0keBquOw99LVSqVEA1YEKNsiq/Xp9ao
 PgHopTfenSmCPZg5pMZLaGD+CnqNTdaB/R9xEC/yMnbEsbfjEdfaTDALdFB3nigVrU
 fz6pSJSjhwwvKsbyuSBSa8pTgfpqRPxo94FvaxMfz7Uzv8tTjpS1xgfhDC+rsXk7OW
 oaulDmE+JIicA==
Message-ID: <ec449ed4-53a9-4fb3-b994-d2079402a26d@denx.de>
Date: Mon, 29 Apr 2024 17:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240427221048.65392-1-marex@denx.de>
 <171440141047.1676474.1900576669579352447.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <171440141047.1676474.1900576669579352447.robh@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Add
 compatible string for DH electronics STM32MP13xx DHCOR DHSBC board
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

On 4/29/24 4:41 PM, Rob Herring wrote:

> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y st/stm32mp135f-dhcor-dhsbc.dtb' for 20240427221048.65392-1-marex@denx.de:
> 
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: /soc/serial@40018000/bluetooth: failed to match any schema with compatible: ['infineon,cyw43439-bt', 'brcm,bcm4329-bt']

This should be addressed in

[PATCH v2] dt-bindings: net: broadcom-bluetooth: Add CYW43439 DT binding

It is already AB'd by Krzysztof, I just pinged that patch to figure out 
what's blocking it.

> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: /soc/sai@4400a000/audio-controller@4400a004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: /soc/sai@4400a000/audio-controller@4400a024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: /soc/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: /soc/sai@4400b000/audio-controller@4400b024: failed to match any schema with compatible: ['st,stm32-sai-sub-b']

This comes from arch/arm/boot/dts/st/stm32mp131.dtsi , i.e. unrelated to 
this patch. But there is a schema for this in 
Documentation/devicetree/bindings/sound/st,stm32-sai.yaml in todays' next .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
