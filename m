Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C6ADBC1D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 23:46:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 850D1C349C7;
	Mon, 16 Jun 2025 21:46:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A392C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 21:46:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16EC34AE77;
 Mon, 16 Jun 2025 21:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F29C4CEEF;
 Mon, 16 Jun 2025 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750110414;
 bh=JAcWr9Lih1V6trC/l9AqcHpRyK4rtZChF4W18X2kJtw=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=LZ7oP5exlRpixAW6HVjAqfY+3PptnMakliboKTugLspswvoEDL/EukMV2JsfYOT5/
 w57Fhfhl0LySHKbwvConyb5AY76ec7Fggrh3gNEenDMX504qP0ZIoe9U3ctUURG26m
 3dDP7uVBb44FRvIqSTyWk6y5aXxuV6vGCfOSWL/9zNrLa80D6KY2oS7JmG02eR24yx
 3OZ4RsepWa7iXOZN1onUHDOhlhGbuJep56coCNxRilnLrrlRr3wagwmqsiAzq5IVfm
 Dw23FOMsjP0WG/MDPvSGbhC95gL61NBnQpy9tBar52S1rZOf6US23NECnenujSEpWT
 mg3uO/8AT9f2Q==
Date: Mon, 16 Jun 2025 16:46:52 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
In-Reply-To: <20250613100255.2131800-1-joy.zou@nxp.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
Message-Id: <175011005057.2433615.9910599057752637741.robh@kernel.org>
Cc: imx@lists.linux.dev, peng.fan@nxp.com, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, will@kernel.org,
 xiaoning.wang@nxp.com, kuba@kernel.org, ulf.hansson@linaro.org,
 pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ye.li@nxp.com, mcoquelin.stm32@gmail.com,
 linux-pm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 0/9] Add i.MX91 platform support
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


On Fri, 13 Jun 2025 18:02:46 +0800, Joy Zou wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> - i.MX91 has updated to new temperature sensor same with i.MX95.
> 
> ---
> Changes for v5:
> - rename imx93.dtsi to imx91_93_common.dtsi.
> - move imx93 specific part from imx91_93_common.dtsi to imx93.dtsi.
> - modify the imx91.dtsi to use imx91_93_common.dtsi.
> - add new the imx93-blk-ctrl binding and driver patch for imx91 support.
> - add new net patch for imx91 support.
> - change node name codec and lsm6dsm into common name audio-codec and
>   inertial-meter, and add BT compatible string for imx91 board dts.
> 
> Changes for v4:
> - Add one imx93 patch that add labels in imx93.dtsi
> - modify the references in imx91.dtsi
> - modify the code alignment
> - remove unused newline
> - delete the status property
> - align pad hex values
> 
> Changes for v3:
> - Add Conor's ack on patch #1
> - format imx91-11x11-evk.dts with the dt-format tool
> - add lpi2c1 node
> 
> Changes for v2:
> - change ddr node pmu comaptible
> - remove mu1 and mu2
> - change iomux node compatible and enable 91 pinctrl
> - refine commit message for patch #2
> - change hex to lowercase in pinfunc.h
> - ordering nodes with the dt-format tool
> 
> Joy Zou (8):
>   dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
>   arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi
>   arm64: dts: imx93: move i.MX93 specific part from imx91_93_common.dtsi
>     to imx93.dtsi
>   arm64: dts: imx91: add i.MX91 dtsi support
>   arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>   arm64: defconfig: enable i.MX91 pinctrl
>   pmdomain: imx93-blk-ctrl: mask DSI and PXP PD domain register on
>     i.MX91
>   net: stmmac: imx: add i.MX91 support
> 
> Pengfei Li (1):
>   dt-bindings: arm: fsl: add i.MX91 11x11 evk board
> 
>  .../devicetree/bindings/arm/fsl.yaml          |    6 +
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |   55 +-
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../boot/dts/freescale/imx91-11x11-evk.dts    |  878 ++++++++++
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h |  770 +++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  124 ++
>  .../boot/dts/freescale/imx91_93_common.dtsi   | 1215 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 1412 ++---------------
>  arch/arm64/configs/defconfig                  |    1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |    2 +
>  drivers/pmdomain/imx/imx93-blk-ctrl.c         |   15 +
>  11 files changed, 3166 insertions(+), 1313 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> 
> --
> 2.37.1
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-6-g8a22d9e79cf0 (best guess, 6/7 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250613100255.2131800-1-joy.zou@nxp.com:

arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /soc@0/bus@44000000/thermal-sensor@44482000: failed to match any schema with compatible: ['fsl,imx91-tmu']





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
