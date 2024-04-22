Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD848AD044
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 17:08:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15832C7128C;
	Mon, 22 Apr 2024 15:08:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F39BAC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 15:08:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C204A60F02;
 Mon, 22 Apr 2024 15:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CF3C4AF09;
 Mon, 22 Apr 2024 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713798491;
 bh=QNpTh7SSEKm5aEurHWCD45AQgT9MI90Hn8igWPVhotQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiuLOtptFHLOeefhxmjlT4jLTL4HLwYlkSOHlscuaJQ+xo5tFcFazaW1VER9jI1Ga
 MQXi2Ez2VvHvIQTReJZ2qhza4NQ7kfKeeUw+Eppv2MaIpMIAoFVywHHHXAfLXs1YSI
 MNI9S+vRySYhe61Tm0h+eGElxBF1Sv5TtQYl5b2VvPIXqozvz7KGwpVMB8rY1ce9dq
 dRdbz0BYE/XbXBbHnysZmT2WSCJbRgj1voHfXDQDZ5svax42zwGxQ57NlfRbaNwOK0
 9DRjm+OUjyYV1PnbP25xMqCjpaOnI9hFtd+eUf6xRTBLLryWnmsppKQ8AUiBbRSafr
 HHvONsJGedWBA==
Date: Mon, 22 Apr 2024 10:08:09 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20240422150809.GA1265252-robh@kernel.org>
References: <20240422002006.243687-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422002006.243687-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/20] dt-bindings: arm: stm32: Add
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Apr 22, 2024 at 02:19:15AM +0200, Marek Vasut wrote:
> Add DT compatible string for DH electronics STM32MP13xx DHCOR SoM and
> DHSBC carrier board. This stm32mp135f-dhcor-dhsbc board is a stack of
> DHCOR SoM based on STM32MP135F SoC (900MHz / crypto capabilities)
> populated on DHSBC carrier board.
> =

> The SoM contains the following peripherals:
> - STPMIC (power delivery)
> - 512MB DDR3L memory
> - eMMC and SDIO WiFi module
> =

> The DHSBC carrier board contains the following peripherals:
> - Two RGMII Ethernet ports
> - USB-A Host port, USB-C peripheral port, USB-C power supply plug
> - Expansion connector
> =

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: "Leonard G=F6hrs" <l.goehrs@pengutronix.de>
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sean Nyekjaer <sean@geanix.com>
> Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Doc=
umentation/devicetree/bindings/arm/stm32/stm32.yaml
> index bc2f43330ae42..7f61223b8ef24 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -59,6 +59,12 @@ properties:
>                - prt,prtt1s   # Protonic PRTT1S
>            - const: st,stm32mp151
>  =

> +      - description: DH STM32MP135 DHCOR SoM based Boards
> +        items:
> +          - const: dh,stm32mp135f-dhcor-dhsbc
> +          - const: dh,stm32mp131a-dhcor-som

Either this or your dts is wrong. Either way, please test your dts files =

against the schemas.

> +          - const: st,stm32mp135
> +
>        - description: DH STM32MP151 DHCOR SoM based Boards
>          items:
>            - const: dh,stm32mp151a-dhcor-testbench
> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
