Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E451A7D44D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 08:38:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB57EC7A824;
	Mon,  7 Apr 2025 06:38:54 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B0BC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 18:19:23 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743704362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QQ9ehOHdnNhPXlhSQHsn/YYloB24QsMZgMcRBGUNIcw=;
 b=oqJjLXicDLB2K2GOySnF9TOdTFATrWvb4Yu0Uym/Yvvbqo8wb2O/9nyu/3cfIgWnCgK1hR
 5oGoOyc+pNZhKhE/DpxQtt2NKVH10DMj5/VWwcJoT1hJWj81a7OBX0yIUtc8sGk/q42wcm
 QZOhFDml4siMzAGqTEOdE4tCtJ0IT9w=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Date: Thu,  3 Apr 2025 14:18:54 -0400
Message-Id: <20250403181907.1947517-1-sean.anderson@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 07 Apr 2025 06:38:53 +0000
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Saravana Kannan <saravanak@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, linux-doc@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Clark Wang <xiaoning.wang@nxp.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 imx@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [RFC net-next PATCH 00/13] Add PCS core support
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

This series adds support for creating PCSs as devices on a bus with a
driver (patch 3). As initial users,

- The Lynx PCS (and all of its users) is converted to this system (patch 5)
- The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
- The Cadence MACB driver is converted to support external PCSs (namely
  the Xilinx PCS) (patches 9-10).

The last few patches add device links for pcs-handle to improve boot times,
and add compatibles for all Lynx PCSs.

Care has been taken to ensure backwards-compatibility. The main source
of this is that many PCS devices lack compatibles and get detected as
PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
the devicetree to add appropriate compatibles.

This is technically a v3 (with [1,2] being v1 and v2, respectively), but
there have been so many architectural changes that I didn't bother
maintaining the series changelog. I think it is best to review this
series independently of its past iterations. I submitted this as an RFC
since net-next is closed, but I believe this series is fully tested and
ready to be applied.

[1] https://lore.kernel.org/netdev/20211004191527.1610759-1-sean.anderson@seco.com/
[2] https://lore.kernel.org/netdev/20221103210650.2325784-1-sean.anderson@seco.com/


Sean Anderson (12):
  dt-bindings: net: Add binding for Xilinx PCS
  net: phylink: Support setting PCS link change callbacks
  net: pcs: Add subsystem
  net: pcs: lynx: Convert to an MDIO driver
  net: phy: Export some functions
  net: pcs: Add Xilinx PCS driver
  net: axienet: Convert to use PCS subsystem
  net: macb: Move most of mac_config to mac_prepare
  net: macb: Support external PCSs
  of: property: Add device link support for PCS
  arm64: dts: Add compatible strings for Lynx PCSs
  powerpc: dts: Add compatible strings for Lynx PCSs

Vladimir Oltean (1):
  net: dsa: ocelot: suppress PHY device scanning on the internal MDIO
    bus

 .../devicetree/bindings/net/xilinx,pcs.yaml   | 129 ++++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/kapi.rst             |   4 +
 Documentation/networking/pcs.rst              |  99 +++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  48 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |  54 +-
 .../dts/freescale/qoriq-fman3-0-10g-0.dtsi    |   3 +-
 .../dts/freescale/qoriq-fman3-0-10g-1.dtsi    |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-0.dtsi     |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-1.dtsi     |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-2.dtsi     |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-3.dtsi     |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-4.dtsi     |   3 +-
 .../dts/freescale/qoriq-fman3-0-1g-5.dtsi     |   3 +-
 .../fsl/qoriq-fman3-0-10g-0-best-effort.dtsi  |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi     |   3 +-
 .../fsl/qoriq-fman3-0-10g-1-best-effort.dtsi  |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi     |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-10g-2.dtsi     |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-10g-3.dtsi     |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi     |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi     |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi      |   3 +-
 .../boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi      |   3 +-
 drivers/net/dsa/ocelot/Kconfig                |   4 +
 drivers/net/dsa/ocelot/felix_vsc9959.c        |  15 +-
 drivers/net/dsa/ocelot/seville_vsc9953.c      |  16 +-
 drivers/net/ethernet/altera/Kconfig           |   2 +
 drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
 drivers/net/ethernet/cadence/macb.h           |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 229 ++++--
 drivers/net/ethernet/freescale/dpaa/Kconfig   |   2 +-
 drivers/net/ethernet/freescale/dpaa2/Kconfig  |   3 +
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  11 +-
 drivers/net/ethernet/freescale/enetc/Kconfig  |   2 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   |   8 +-
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   1 -
 .../freescale/enetc/enetc_pf_common.c         |   4 +-
 drivers/net/ethernet/freescale/fman/Kconfig   |   4 +-
 .../net/ethernet/freescale/fman/fman_memac.c  |  27 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   3 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 104 +--
 drivers/net/pcs/Kconfig                       |  51 +-
 drivers/net/pcs/Makefile                      |   4 +
 drivers/net/pcs/core.c                        | 701 ++++++++++++++++++
 drivers/net/pcs/pcs-lynx.c                    | 115 +--
 drivers/net/pcs/pcs-xilinx.c                  | 481 ++++++++++++
 drivers/net/phy/mdio_device.c                 |   1 +
 drivers/net/phy/phy_device.c                  |   3 +-
 drivers/net/phy/phylink.c                     |  24 +-
 drivers/of/property.c                         |   2 +
 include/linux/pcs-lynx.h                      |  13 +-
 include/linux/pcs-xilinx.h                    |  36 +
 include/linux/pcs.h                           | 122 +++
 include/linux/phy.h                           |   1 +
 include/linux/phylink.h                       |  27 +-
 70 files changed, 2104 insertions(+), 358 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xilinx,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-xilinx.c
 create mode 100644 include/linux/pcs-xilinx.h
 create mode 100644 include/linux/pcs.h

-- 
2.35.1.1320.gc452695387.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
