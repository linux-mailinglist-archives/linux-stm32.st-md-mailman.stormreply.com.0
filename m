Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00B293A68
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 14:00:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C13C424BC;
	Tue, 20 Oct 2020 12:00:23 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C791C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 12:00:19 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 147B4803071D;
 Tue, 20 Oct 2020 12:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6FqHc1ZZjU6; Tue, 20 Oct 2020 15:00:15 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Felipe Balbi <balbi@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 20 Oct 2020 14:59:30 +0300
Message-ID: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Khuong Dinh <khuong@os.amperecomputing.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Rafal Milecki <zajec5@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Wei Xu <xuwei5@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 linux-omap@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 linuxppc-dev@lists.ozlabs.org, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Benoit Cousson <bcousson@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH 00/29] dt-bindings: usb: Harmonize
	xHCI/EHCI/OHCI/DWC3 nodes name
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

As the subject states this series is an attempt to harmonize the xHCI,
EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
framework of the patchset [1].

Firstly as Krzysztof suggested we've removed a support of DWC USB3
controllers with "synopsys,"-vendor prefix compatible string in favor of
the ones with valid "snps,"-prefix. It's done in the controller driver and
in all the DTS files, which have been unfortunate to define such nodes.

Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
been erroneously declared as boolean while having uint32 type. Neil said
it was ok to init that property with 0x20 value.

Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
and DWC USB3 DT nodes name as in accordance with their DT schema the
corresponding node name is suppose to comply with the Generic USB HCD DT
schema, which requires the USB nodes to have the name acceptable by the
regexp: "^usb(@.*)?". Such requirement had been applicable even before we
introduced the new DT schema in [1], but as we can see it hasn't been
strictly implemented for a lot the DTS files. Since DT schema is now
available the automated DTS validation shall make sure that the rule isn't
violated.

Note most of these patches have been a part of the last three patches of
[1]. But since there is no way to have them merged in in a combined
manner, I had to move them to the dedicated series and split them up so to
be accepted by the corresponding subsystem maintainers one-by-one.

[1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
Changelog v0:
- As Krzysztof suggested I've created a script which checked whether the
  node names had been also updated in all the depended dts files. As a
  result I found two more files which should have been also modified:
  arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
- Correct the USB DWC3 nodes name found in
  arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Rafal Milecki <zajec5@gmail.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Benoit Cousson <bcousson@baylibre.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (29):
  usb: dwc3: Discard synopsys,dwc3 compatibility string
  arm: dts: keystone: Correct DWC USB3 compatible string
  arm: dts: am437x: Correct DWC USB3 compatible string
  arm: dts: exynos: Correct DWC USB3 compatible string
  arm64: dts: amlogic: meson-g12: Set FL-adj property value
  arc: dts: Harmonize EHCI/OHCI DT nodes name
  arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
  arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
  arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
  arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
  arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
  mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
  mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
  mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
  powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
  arm: dts: bcm5301x: Harmonize xHCI DT nodes name
  arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
  arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
  arm: dts: exynos: Harmonize DWC USB3 DT nodes name
  arm: dts: keystone: Harmonize DWC USB3 DT nodes name
  arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  arm: dts: omap5: Harmonize DWC USB3 DT nodes name
  arm: dts: stih407-family: Harmonize DWC USB3 DT nodes name
  arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
  arm64: dts: apm: Harmonize DWC USB3 DT nodes name
  arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
  arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
  arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
  arm64: dts: qcom: Harmonize DWC USB3 DT nodes name

 arch/arc/boot/dts/axc003.dtsi                     | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi                 | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi                  | 4 ++--
 arch/arc/boot/dts/hsdk.dts                        | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi              | 2 +-
 arch/arm/boot/dts/am437x-l4.dtsi                  | 4 ++--
 arch/arm/boot/dts/armada-375.dtsi                 | 2 +-
 arch/arm/boot/dts/bcm5301x.dtsi                   | 6 +++---
 arch/arm/boot/dts/bcm53573.dtsi                   | 4 ++--
 arch/arm/boot/dts/exynos5250.dtsi                 | 4 ++--
 arch/arm/boot/dts/exynos54xx.dtsi                 | 4 ++--
 arch/arm/boot/dts/hisi-x5hd2.dtsi                 | 4 ++--
 arch/arm/boot/dts/keystone-k2e.dtsi               | 6 +++---
 arch/arm/boot/dts/keystone.dtsi                   | 4 ++--
 arch/arm/boot/dts/lpc18xx.dtsi                    | 4 ++--
 arch/arm/boot/dts/ls1021a.dtsi                    | 2 +-
 arch/arm/boot/dts/omap5-l4.dtsi                   | 2 +-
 arch/arm/boot/dts/stih407-family.dtsi             | 2 +-
 arch/arm/boot/dts/stm32mp151.dtsi                 | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        | 4 ++--
 arch/arm64/boot/dts/apm/apm-storm.dtsi            | 6 +++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi        | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi    | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi    | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi    | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi    | 4 ++--
 arch/arm64/boot/dts/hisilicon/hip06.dtsi          | 4 ++--
 arch/arm64/boot/dts/hisilicon/hip07.dtsi          | 4 ++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi      | 4 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi          | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi              | 2 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi            | 2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi            | 2 +-
 arch/mips/boot/dts/mti/sead3.dts                  | 2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi            | 2 +-
 arch/powerpc/boot/dts/akebono.dts                 | 6 +++---
 drivers/usb/dwc3/core.c                           | 3 ---
 49 files changed, 84 insertions(+), 87 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
