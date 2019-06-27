Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524E5859E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 17:32:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5129BC030CD;
	Thu, 27 Jun 2019 15:32:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57514C3F942
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 15:32:02 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 01763C0008;
 Thu, 27 Jun 2019 15:31:56 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 27 Jun 2019 17:31:42 +0200
Message-Id: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v4 00/13] net: Add generic and Allwinner YAML
	bindings
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

Hi,

This is an attempt at getting the main generic DT bindings for the ethernet
(and related) devices, and convert some DT bindings for the Allwinner DTs
to YAML as well.

This should provide some DT validation coverage.

Let me know if you have any questions,
Maxime

Changes from v3:
  - Added a cover letter
  - Dropped the phy-mode deprecation, and the DT changes moving to
    phy-connection-type
  - Fixed the mdio example node name
  - Deprecated the fixed-link array property, in favor of the fixed-link
    subnode

Changes from v2:
  - Switched to the deprecated keyword to describe deprecated properties
  - Deprecated phy-mode, phy and phy-handle
  - Added patches to switch to phy-connection-type and phy-device for
    Allwinner DTs
  - Changed the A83t GMAC delays to use multipleOf instead of an enum
  - Fix the snps,*pbl properties types
  - Add a generic MDIO YAML schemas

Changes from v1:
  - Move the DWMAC SoC specific bindings to separate documents
  - Mark snps,reset-gpio (and related) as deprecated and fixed the
    Allwinner DTs accordingly
  - Restrict snps,tso to only a couple of compatibles
  - Use an enum for the compatibles
  - Add a custom select statement with the compatibles of all the generic
    compatibles, including the deprecated ones. Remove the deprecated ones
    from the valid compatible values to issue a warning when used.
  - Add a patch to MAINTAINERS for the PHY YAML binding
  - Add missing compatible options for the PHY, and missing phy speeds
  - Add a custom select clause to make the PHY binding validate all phy
    nodes, and not just the ones with a compatible
  - Validate the fixed-link array elements
  - Removed deprecated properties (phy-mode, phy, phy-device)
  - Restrict the number of items under link-gpios to 1

Maxime Ripard (13):
  dt-bindings: net: Add YAML schemas for the generic Ethernet options
  dt-bindings: net: Add a YAML schemas for the generic PHY options
  dt-bindings: net: Add a YAML schemas for the generic MDIO options
  MAINTAINERS: Add Ethernet PHY YAML file
  dt-bindings: net: phy: The interrupt property is not mandatory
  dt-bindings: net: sun4i-emac: Convert the binding to a schemas
  dt-bindings: net: sun4i-mdio: Convert the binding to a schemas
  dt-bindings: net: stmmac: Convert the binding to a schemas
  dt-bindings: net: sun7i-gmac: Convert the binding to a schemas
  dt-bindings: net: sun8i-emac: Convert the binding to a schemas
  dt-bindings: net: dwmac: Deprecate the PHY reset properties
  ARM: dts: sunxi: Switch to the generic PHY properties
  ARM: dts: sunxi: Switch from phy to phy-handle

 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml  |  55 ++++++++++-
 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml  |  70 ++++++++++++-
 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt       |  19 +---
 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt       |  27 +-----
 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt   |  27 +-----
 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml  |  66 ++++++++++++-
 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 321 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/net/dwmac-sun8i.txt                | 201 +-----------------------------------
 Documentation/devicetree/bindings/net/ethernet-controller.yaml       | 204 ++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/net/ethernet-phy.yaml              | 178 +++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/net/ethernet.txt                   |  69 +------------
 Documentation/devicetree/bindings/net/fixed-link.txt                 |  55 +----------
 Documentation/devicetree/bindings/net/mdio.txt                       |  38 +-------
 Documentation/devicetree/bindings/net/mdio.yaml                      |  51 +++++++++-
 Documentation/devicetree/bindings/net/phy.txt                        |  80 +--------------
 Documentation/devicetree/bindings/net/snps,dwmac.yaml                | 410 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/net/stmmac.txt                     | 179 +-------------------------------
 MAINTAINERS                                                          |   1 +-
 arch/arm/boot/dts/sun4i-a10-a1000.dts                                |   2 +-
 arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts                           |   2 +-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts                           |   2 +-
 arch/arm/boot/dts/sun4i-a10-hackberry.dts                            |   2 +-
 arch/arm/boot/dts/sun4i-a10-itead-iteaduino-plus.dts                 |   2 +-
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts                           |   2 +-
 arch/arm/boot/dts/sun4i-a10-marsboard.dts                            |   2 +-
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts                       |   2 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                              |   2 +-
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts                     |   2 +-
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts                             |   2 +-
 arch/arm/boot/dts/sun6i-a31-colombus.dts                             |   2 +-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts                          |   8 +-
 arch/arm/boot/dts/sun6i-a31-i7.dts                                   |   2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                                   |   2 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts                     |   2 +-
 arch/arm/boot/dts/sun6i-a31s-cs908.dts                               |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts                             |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts                     |   8 +-
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts                     |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                             |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts                            |   2 +-
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts                          |   2 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts                           |   2 +-
 arch/arm/boot/dts/sun7i-a20-hummingbird.dts                          |  11 +--
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts                            |   2 +-
 arch/arm/boot/dts/sun7i-a20-icnova-swac.dts                          |   2 +-
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts                           |   2 +-
 arch/arm/boot/dts/sun7i-a20-m3.dts                                   |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts                       |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts                    |  10 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts                       |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts                      |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts                      |   2 +-
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts                        |   2 +-
 arch/arm/boot/dts/sun7i-a20-orangepi.dts                             |   2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts                        |   2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts                             |   2 +-
 arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts                     |   2 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts                          |   2 +-
 arch/arm/boot/dts/sun9i-a80-optimus.dts                              |   2 +-
 59 files changed, 1416 insertions(+), 746 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dwmac-sun8i.txt
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac.yaml

base-commit: 8087b004bd099367c29d3a163950bc4b162ebc3c
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
