Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBA8A2FC8
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 15:46:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7443C6B47E;
	Fri, 12 Apr 2024 13:46:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAF71CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 13:46:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6926C6033C;
 Fri, 12 Apr 2024 13:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2156C113CC;
 Fri, 12 Apr 2024 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712929603;
 bh=23t1wc48Z7qjQUHxpMlFdirQHFa5WZ1akQpPogYgwdY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Lln+cZkzg/nxbwSrjo5hvvxfOWZKMcLDjlh30TDb4jnAQxuTd7nn4mXkaH8/CSB1t
 9cazUiXc+ryK7SXp7hHtMkc3fon+HFW2OSNJf3hsQ/qCftZFkfkn9dpU+xXXRr5TSE
 Ts+Mx7UbGuqyXwYeHDmxf46VpJ6uv98hvirgIzpiX5m7DoC67NTYHLnWeFLfMBy5Vs
 Th04fTu+CfEuq9qGCqU1jHzJmbQw5R0eeaz7DnOG6ZFsAXVW2ahOuq8jaXuYkid9fA
 08+qhK6jBLexOgO/e7O/PYWJ9RcnsK0AlUdD8orRta+tWoiWVVybtVG5VbN84wk1Nh
 g5ZNxTNb6ElJg==
Date: Fri, 12 Apr 2024 08:46:41 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
In-Reply-To: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
References: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
Message-Id: <171292930694.2308702.12108714635472172661.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/11] Series to deliver Ethernets for
	STM32MP13
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


On Thu, 11 Apr 2024 16:36:47 +0200, Christophe Roullier wrote:
> STM32MP13 is STM32 SOC with 2 GMACs instances
> This board have 2 RMII phy:
>   -Ethernet1: RMII with crystal
>   -Ethernet2: RMII without crystal
> Rework dwmac glue to simplify management for next stm32
> Add support for PHY regulator
> 
> Christophe Roullier (11):
>   dt-bindings: net: add STM32MP13 compatible in documentation for stm32
>   dt-bindings: net: add phy-supply property for stm32
>   net: ethernet: stmmac: rework glue to simplify management for next
>     stm32
>   net: ethernet: stmmac: add management of stm32mp13 for stm32
>   net: ethernet: stmmac: stm32: update config management for phy wo
>     cristal
>   net: ethernet: stm32: clean the way to manage wol irqwake
>   net: ethernet: stmmac: stm32: support the phy-supply regulator binding
>   ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
>   ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
>   ARM: dts: stm32: add ethernet1 and ethernet2 for STM32MP135F-DK board
>   ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
> 
>  .../devicetree/bindings/net/stm32-dwmac.yaml  |  83 ++++++-
>  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  71 ++++++
>  arch/arm/boot/dts/st/stm32mp131.dtsi          |  31 +++
>  arch/arm/boot/dts/st/stm32mp133.dtsi          |  30 +++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  48 ++++
>  arch/arm/configs/multi_v7_defconfig           |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 235 ++++++++++++------
>  7 files changed, 421 insertions(+), 78 deletions(-)
> 
> --
> 2.25.1
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


New warnings running 'make CHECK_DTBS=y st/stm32mp135f-dk.dtb' for 20240411143658.1049706-1-christophe.roullier@foss.st.com:

arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48003000: 'ethernet@5800e000' does not match any of the regexes: '^adc@[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
