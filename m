Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED58FB71F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 17:29:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77BFCC6B444;
	Tue,  4 Jun 2024 15:29:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CF55C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 15:29:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38D6B6131D;
 Tue,  4 Jun 2024 15:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE64C2BBFC;
 Tue,  4 Jun 2024 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717514942;
 bh=mOFKrU1+xbr+7FRYDRPFe8CRuMGHStfbcrXzy2CW69g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BV1rv3A1+lQV2Ab/cP/MpyUxP6dTV1G+1bnBGzg/vOgsfLGBibmrZk1RkocktwkfT
 f9ISfL49Bb1hy1Hu7webPq85z1U6ZPN83F0M5Hj5LFLRedBFYAsXXB7nnzLJx13cI7
 uEhRzbj2drwz7IhWhs4abuP/n+NNS3y+9284sHuuMDvNz4U9pxVZWgIBhH6GB+p3lg
 EyzbP3SQlM1exPk9/BAJFAKug5F52VXDxJv9+jFZ1MQYT0xwNvNykBxcIJIJ0wXBlN
 rppDhKVis0U8tUn87VNopvcSh2LfMeMICfuctUDhBZIAXAxD1apspg5cSROzuwo0ed
 VpsNJPaw7J9Jw==
Date: Tue, 04 Jun 2024 10:29:00 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
In-Reply-To: <20240604143502.154463-1-christophe.roullier@foss.st.com>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
Message-Id: <171751455073.786330.16354287861829975663.robh@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 00/11] Series to deliver Ethernet for
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


On Tue, 04 Jun 2024 16:34:51 +0200, Christophe Roullier wrote:
> STM32MP13 is STM32 SOC with 2 GMACs instances
>     GMAC IP version is SNPS 4.20.
>     GMAC IP configure with 1 RX and 1 TX queue.
>     DMA HW capability register supported
>     RX Checksum Offload Engine supported
>     TX Checksum insertion supported
>     Wake-Up On Lan supported
>     TSO supported
> Rework dwmac glue to simplify management for next stm32 (integrate RFC from Marek)
> 
> V2: - Remark from Rob Herring (add Krzysztof's ack in patch 02/11, update in yaml)
>       Remark from Serge Semin (upate commits msg)
> V3: - Remove PHY regulator patch and Ethernet2 DT because need to clarify how to
>       manage PHY regulator (in glue or PHY side)
>     - Integrate RFC from Marek
>     - Remark from Rob Herring in YAML documentation
> V4: - Remark from Marek (remove max-speed, extra space in DT, update commit msg)
>     - Remark from Rasmus (add sign-off, add base-commit)
>     - Remark from Sai Krishna Gajula
> 
> Christophe Roullier (6):
>   dt-bindings: net: add STM32MP13 compatible in documentation for stm32
>   net: ethernet: stmmac: add management of stm32mp13 for stm32
>   ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
>   ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
>   ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board
>   ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
> 
> Marek Vasut (5):
>   net: stmmac: dwmac-stm32: Separate out external clock rate validation
>   net: stmmac: dwmac-stm32: Separate out external clock selector
>   net: stmmac: dwmac-stm32: Extract PMCR configuration
>   net: stmmac: dwmac-stm32: Clean up the debug prints
>   net: stmmac: dwmac-stm32: Fix Mhz to MHz
> 
>  .../devicetree/bindings/net/stm32-dwmac.yaml  |  41 ++++-
>  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  71 ++++++++
>  arch/arm/boot/dts/st/stm32mp131.dtsi          |  38 ++++
>  arch/arm/boot/dts/st/stm32mp133.dtsi          |  31 ++++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  23 +++
>  arch/arm/configs/multi_v7_defconfig           |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 172 ++++++++++++++----
>  7 files changed, 330 insertions(+), 47 deletions(-)
> 
> 
> base-commit: cd0057ad75116bacf16fea82e48c1db642971136
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


New warnings running 'make CHECK_DTBS=y st/stm32mp135f-dk.dtb' for 20240604143502.154463-1-christophe.roullier@foss.st.com:

arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48003000: 'ethernet@5800e000' does not match any of the regexes: '^adc@[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
