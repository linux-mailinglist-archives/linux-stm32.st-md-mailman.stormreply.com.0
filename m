Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A912AD46AE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 01:31:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B71C8C32EA8;
	Tue, 10 Jun 2025 23:31:44 +0000 (UTC)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80838C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:31:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1749598302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yoolCrktKrQ0DqzoLMe7SabSkDhHjeFchBm7FftX1xY=;
 b=Lya1RBkMqPAplov5/wq9KnKWKpPNxT78Xgh7Frue1nyDqCNCS1y7c1Wq//j8whdODOTAv6
 dZPLiApe9kgLw7J5RNfVuLVnN6ke8tImnQqXNZQeBy1jxYG8PNxMIBQ9cLNt/JK3bvgh//
 G06LFbN5rXVss5iole/8asmRl1ZKwtQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Date: Tue, 10 Jun 2025 19:31:24 -0400
Message-Id: <20250610233134.3588011-1-sean.anderson@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, imx@lists.linux.dev,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Daniel Golle <daniel@makrotopia.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Lei Wei <quic_leiwei@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v6 00/10] Add PCS core support
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

- The Lynx PCS (and all of its users) is converted to this system
  (patches 4-5)
- The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-7)
- The Cadence MACB driver is converted to support external PCSs (namely
  the Xilinx PCS) (patches 8-9).

Care has been taken to ensure backwards-compatibility. The main source
of this is that many PCS devices lack compatibles and get detected as
PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
the devicetree to add appropriate compatibles.

There is another series [1] with the same goal by Christian Marangi. In
comparison, I believe this series

- Implements a simpler and more-robust method of PCS access.
- Provides a more-direct upgrade path for existing MAC and PCS drivers.

[1] https://lore.kernel.org/netdev/20250511201250.3789083-1-ansuelsmth@gmail.com/

Changes in v6:
- Define lynx_pcs_of_match only when OF_MATCH is enabled
- Fix use of spin_lock instead of spin_unlock
- Introduce config for compatibility helpers
- Move axienet_pcs_fixup to AXI Ethernet commit
- Reduce line lengths to under 80 characters
- Remove duplicate include of phylink.h
- Remove unneccessary Kconfig selects
- Use an empty statement for next label
- Use guard(srcu)

Changes in v5:
- Export get_phy_c22_id when it is used
- Expose bind attributes, since there is no issue in doing so
- Rebase onto net-next
- Use MDIO_BUS instead of MDIO_DEVICE

Changes in v4:
- Add a note about the license
- Adjust variable ordering in pcs_find_fwnode
- Annotate pcs_wrapper.wrapped with __rcu
- Fix PCS lookup functions missing ERR_PTR casts
- Fix documentation for devm_pcs_register_full
- Fix incorrect condition in pcs_post_config
- Fix linking when PCS && !OF_DYNAMIC
- Fix linking when PCS && OF_DYNAMIC && PHYLIB=m
- Re-add documentation for axienet_xilinx_pcs_get that was accidentally
  removed
- Reduce line lengths to under 80 characters
- Remove unused dev parameter to pcs_put
- Use a spinlock instead of a mutex to protect pcs_wrappers

Changes in v3:
- Add '>' modifier for paragraph to description
- Adjust axienet_xilinx_pcs_get for changes to pcs_find_fwnode API
- Drop patches destined for other trees, as they have either already
  been applied or are no longer necessary.
- Edit description to reference clocks instead of resets
- Remove support for #pcs-cells. Upon further investigation, the
  requested functionality can be accomplished by specifying the PCS's
  fwnode manually.
- Select PCS_XILINX unconditionally

Changes in v2:
- Add fallbacks for pcs_get* and pcs_put
- Add support for #pcs-cells
- Change base compatible to just xlnx,pcs
- Change compatible to just xlnx,pcs
- Defer devicetree updates for another series
- Drop #clock-cells description
- Drop PCS_ALTERA_TSE which was accidentally added while rebasing
- Move #clock-cells after compatible
- Move update to macb_pcs_get_state to previous patch
- Remove outdated comment
- Remove second example
- Remove unused variable
- Remove unused variable lynx_properties
- Rename pcs-modes to xlnx,pcs-modes
- Reorder pcs_handle to come before suffix props
- Reword commit message
- Rework xilinx_pcs_validate to just clear out half-duplex modes instead
  of constraining modes based on the interface.

Sean Anderson (9):
  dt-bindings: net: Add Xilinx PCS
  net: phylink: Support setting PCS link change callbacks
  net: pcs: Add subsystem
  net: pcs: lynx: Convert to an MDIO driver
  net: pcs: Add Xilinx PCS driver
  net: axienet: Convert to use PCS subsystem
  net: macb: Move most of mac_config to mac_prepare
  net: macb: Support external PCSs
  of: property: Add device link support for PCS

Vladimir Oltean (1):
  net: dsa: ocelot: suppress PHY device scanning on the internal MDIO
    bus

 .../devicetree/bindings/net/xilinx,pcs.yaml   | 114 ++++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/kapi.rst             |   4 +
 Documentation/networking/pcs.rst              | 102 +++
 MAINTAINERS                                   |   8 +
 drivers/net/dsa/ocelot/felix_vsc9959.c        |  15 +-
 drivers/net/dsa/ocelot/seville_vsc9953.c      |  16 +-
 drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
 drivers/net/ethernet/cadence/macb.h           |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 229 ++++---
 drivers/net/ethernet/freescale/dpaa2/Kconfig  |   1 +
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  11 +-
 .../net/ethernet/freescale/enetc/enetc_pf.c   |   8 +-
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   1 -
 .../freescale/enetc/enetc_pf_common.c         |   4 +-
 drivers/net/ethernet/freescale/fman/Kconfig   |   2 +-
 .../net/ethernet/freescale/fman/fman_memac.c  |  25 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |  13 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 160 +++--
 drivers/net/pcs/Kconfig                       |  47 +-
 drivers/net/pcs/Makefile                      |   4 +
 drivers/net/pcs/core.c                        | 628 ++++++++++++++++++
 drivers/net/pcs/pcs-lynx.c                    | 113 ++--
 drivers/net/pcs/pcs-xilinx.c                  | 427 ++++++++++++
 drivers/net/phy/phy_device.c                  |   3 +-
 drivers/net/phy/phylink.c                     |  24 +-
 drivers/of/property.c                         |   2 +
 include/linux/pcs-lynx.h                      |  13 +-
 include/linux/pcs.h                           | 205 ++++++
 include/linux/phy.h                           |   1 +
 include/linux/phylink.h                       |  27 +-
 34 files changed, 1931 insertions(+), 296 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xilinx,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-xilinx.c
 create mode 100644 include/linux/pcs.h

-- 
2.35.1.1320.gc452695387.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
