Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038AEC0616E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 13:50:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0266C5F1D8;
	Fri, 24 Oct 2025 11:50:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B2E0C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 11:50:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.trumtrar.info)
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1vCGJ3-0002FG-Sl; Fri, 24 Oct 2025 13:50:05 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:49:52 +0200
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOBn+2gC/43Ny27DIBCF4VeJWJdqGMwlXfU9qi4wDA5SZSxwk
 avI714SqcqiUdPlfxbfObNKJVFlL4czK9RSTXnuoZ4OzJ/cPBFPoTdDwEGABN40F8jXvCTPa/Z
 xmRx3U/qgTfEjxCCDjUcLnnVhKRTTdtXf3nufUl1z+bqeNXFZ/+c2wYGPOGpjLJAGel1onj7Xk
 ue0PQdiF7zhDRSo/gaxg1YPqDR5b0a8C8obiPAAlB1EZ32IRkYF7i44/IAKHoJDB2mMYIAQjIq
 /wH3fvwGz4zOWvgEAAA==
X-Change-ID: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, "Tham, Mun Yew" <mun.yew.tham@intel.com>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, netdev@vger.kernel.org,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Austin Zhang <austin.zhang@intel.com>, kernel@pengutronix.de,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 00/10] arm64: dts: socfpga: agilex5: enable
 network and add new board
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

Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
needed patches to support the network on current mainline.

Currently only QSPI and network are functional as all other hardware
currently lacks mainline support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v5:
- remove binding conversion
- rebase to 6.18-rc1
- add sofpga_agilex5.dtsi patches
- add stmmac patches
- add dwxgmac compatible to have usable network
- Link to v4: https://lore.kernel.org/r/20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de

Changes in v4:
- extract gmii-to-sgmii-converter binding to pcs subdir
- fix dt_binding_check warnings
- rebase to v6.13-rc1
- Link to v3: https://lore.kernel.org/r/20241205-v6-12-topic-socfpga-agilex5-v3-0-2a8cdf73f50a@pengutronix.de

Changes in v3:
- add socfpga-stmmac-agilex5 compatible
- convert socfpga-dwmac.txt -> yaml
- add Acked-bys
- rebase to v6.13-rc1
- Link to v2: https://lore.kernel.org/r/20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de

Changes in v2:
- fix node names according to dtb_check
- remove gpio 'status = disabled'
- mdio0: remove setting of adi,[rt]x-internal-delay-ps. 2000 is the
  default value
- add Acked-by to dt-binding
- Link to v1: https://lore.kernel.org/r/20241030-v6-12-topic-socfpga-agilex5-v1-0-b2b67780e60e@pengutronix.de

---
Adrian Ng Ho Yin (1):
      arm64: dts: socfpga: agilex5: Add SMMU node

Austin Zhang (1):
      arm64: dts: socfpga: agilex5: smmu enablement

Steffen Trumtrar (6):
      net: stmmac: dwmac-socfpga: don't set has_gmac
      dt-bindings: net: altr,socfpga-stmmac: add generic dwxgmac compatible
      arm64: dts: socfpga: agilex5: add dwxgmac compatible
      dt-bindings: net: altr,socfpga-stmmac: allow dma-coherent property
      dt-bindings: intel: add agilex5-based Arrow AXE5-Eagle
      arm64: dts: socfpga: agilex5: initial support for Arrow AXE5-Eagle

Teoh Ji Sheng (1):
      net: stmmac: Use interrupt mode INTM=1 for per channel irq

Tham, Mun Yew (1):
      arm64: dts: socfpga: agilex5: dma coherent enablement for XGMACs

 .../devicetree/bindings/arm/intel,socfpga.yaml     |   1 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   4 +
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  31 ++++-
 .../boot/dts/intel/socfpga_agilex5_axe5_eagle.dts  | 146 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   3 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  10 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  20 +++
 include/linux/stmmac.h                             |   2 +
 10 files changed, 214 insertions(+), 5 deletions(-)
---
base-commit: f67859cf0b6d21bf3641e7dec9e99edba91e0829
change-id: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
