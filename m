Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA789EBBFD
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 22:42:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2942C78006;
	Tue, 10 Dec 2024 21:42:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C55AC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 21:42:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B4B45C62CA;
 Tue, 10 Dec 2024 21:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C22C4CED6;
 Tue, 10 Dec 2024 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733866922;
 bh=eMB4BERgg0UcMa0SMSP2cNR/GwixDiZtVw4VPXs5cTE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=CGUlodseObfVPj3hiYJxhiXbZsEPZpsH23S+zoCmMvLMQnnbIU0JLOP9hWJzmuRDx
 RtC8q/UxA4NHet4EyYjfivZBBJB99SuL6jPhTnXBe7jy0S+5xx82g/g0IaHcKeQqG9
 aUc6/dnLbUJxN8ek959LpitRRFEIWtwZ5RrZU37JPTxei3C6AZchUr0OoudUu11py9
 ygJzjUdIhPClcWfe5OjpuItqxWMmLEdR/mfHFnPWsJBTBJsb6RAxqDePbe9Bk80MBR
 GglhVj4D71ZQpTgCUAGsrEPAxLn5Z5bpu8irWqswMkC+z5arwkewHO9fIqL8vI5i2N
 Yo4OuTxOOuOYg==
Date: Tue, 10 Dec 2024 15:42:00 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20241209103434.359522-1-o.rempel@pengutronix.de>
References: <20241209103434.359522-1-o.rempel@pengutronix.de>
Message-Id: <173386568446.497546.553726469163110460.robh@kernel.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, kernel@pengutronix.de,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Add support for Priva
	E-Measuringbox board
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


On Mon, 09 Dec 2024 11:34:30 +0100, Oleksij Rempel wrote:
> This patch series introduces support for the Priva E-Measuringbox board
> based on the ST STM32MP133 SoC. The set includes all the necessary
> changes for device tree bindings, vendor prefixes, thermal support, and
> board-specific devicetree to pass devicetree validation and checkpatch
> tests.
> 
> changes v2:
> - drop: dt-bindings: net: Add TI DP83TD510 10BaseT1L PHY
> 
> Oleksij Rempel (2):
>   dt-bindings: vendor-prefixes: Add prefix for Priva
>   dt-bindings: arm: stm32: Add Priva E-Measuringbox board
> 
> Roan van Dijk (2):
>   arm: dts: stm32: Add thermal support for STM32MP131
>   arm: dts: stm32: Add Priva E-Measuringbox devicetree
> 
>  .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/st/Makefile                 |   1 +
>  arch/arm/boot/dts/st/stm32mp131.dtsi          |  35 ++
>  arch/arm/boot/dts/st/stm32mp133c-prihmb.dts   | 496 ++++++++++++++++++
>  5 files changed, 540 insertions(+)
>  create mode 100644 arch/arm/boot/dts/st/stm32mp133c-prihmb.dts
> 
> --
> 2.39.5
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y st/stm32mp133c-prihmb.dtb' for 20241209103434.359522-1-o.rempel@pengutronix.de:

arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48004000: adc@0:interrupts: 0 was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48003000: adc@0:interrupts: 0 was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
