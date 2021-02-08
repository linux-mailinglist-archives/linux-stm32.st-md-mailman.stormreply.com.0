Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B973133E3
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B16ADC57B53;
	Mon,  8 Feb 2021 13:56:13 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05068C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:11 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>
Date: Mon, 8 Feb 2021 16:55:44 +0300
Message-ID: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/24] net: stmmac: Fix
	clocks/reset-related procedures
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

Baikal-T1 SoC is equipped with two Synopsys DesignWare GMAC v3.73a-based
ethernet interfaces with no internal Ethernet PHY attached. The IP-cores
are configured as GMAC-AXI with CSR interface clocked by a dedicated
signal. Each of which has got Rx/Tx FIFOs of 16KB, up to 8 MAC addresses
capability, no embedded filter hash table logic, EEE enabled, IEEE 1588
and 1588-2008 Advanced timestamping capabilities, power management with
remote wake-up, IP CSUM hardware acceleration, a single PHY interface -
RGMII with MDIO bus, 1xGPI and 1xGPO.

This is a very first series of patches with fixes we've found to be
required in order to make things working well for our setup. The series
has turned to be rather large, but most of the patches are trivial and
some of them are just cleanups, so it shouldn't be that hard to review.

The series starts with fixes of the PBL (Programmable DMA Burst length)
DT-property, which is supposed to be defined for each DW *MAC IP-core, but
not only for a Allwinner sun* GMAC and DW xGMAC. The number of possible
PBL values need to be also extended in accordance with the DW *MAC manual.
Then the TSO flag property should be also declared free of the
vendor-specific conditional schema, because the driver expects the
compatible string to have the IP-core version specified anyway and none of
the glue-drivers refer to the property directly.

Then we suggest to refactor the "snps,{axi,mtl-rx,mtl-tx}-config"
properties/nodes declaration, so the configs would be able to be defined
as the sub-nodes of the DW *MAC DT nodes. The reason is that the DW MAC
DT-schema doesn't validate them at the moment and having them defined as
separate from the DW MAC nodes isn't descriptive at all. (Please note the
patch log, since the DT-schema tool needs to be fixed in order to make the
change working).

Another big modification of the DW *MAC bindings file is the generic
DT-properties and generic DT-nodes schema splitting up. So in order to
improve the DW *MAC bindings maintainability we suggest to leave the
generic DW *MAC properties definition in the "snps,dwmac.yaml" file and
move the bindings for the generic DW *MAC DT-nodes validation in the
dedicated DT-schema "snps,dwmac-generic.yaml".

Another concern has been related with the System/CSR clocks. We have
discovered that currently the "stmmaceth" clocks are considered by the
driver as the combined system+CSR clocks, while in fact CSR interface can
be equipped with a dedicated clock source (this is our case). If so then
the clock with "pclk" can be used to define the later one. But neither
bindings are descriptive enough nor the DW *MAC driver is fixed to support
that feature. So first we suggest to elaborate stmmaceth/pclk description
in the bindings file and then fix the MDIO-bus clock selection procedure
so pclk would be used there if specified. The DW QoS Eth MAC driver is
also fixed in accordance with that modification.

The biggest part of the series concerns adding the generic Tx/Rx clocks
support to the DT-schema and to the DW MAC drivers and with fixed related
to that. It is really a good decision to add the generic Tx/Rx clocks,
because a lot of the glue-drivers expect them to be specified in the
DT-node. So first we add the "tx"/"rx" clocks declaration in the generic
DW MAC DT-schema. Then the glue-drivers like
dwmac-rk/dwmac-sti/dwmac-stm32 remove() callbacks need to be fixed to call
stmmac_remove_config_dt() otherwise the resources allocated in the
stmmac_probe_config_dt() won't be freed on the device removal. A small
modification needs to be provided for the cleanup-on-failure path of the
stmmac_probe_config_dt() method in order to improve its maintainability.
Then we've discovered that the "stmmaceth" and "pclk" clocks while being
acquired and enabled in the stmmac_probe_config_dt() method are disabled
in the stmmac_dvr_remove() function, which is erroneous for every
cleanup-on-failure path of the glue-driver probe methods. Finally before
adding the Tx/Rx clocks support we provide a set of optimizations of the
"stmmaceth"/"pclk"/"ptp_clk" clocks and the "stmmaceth" reset procedures
by removing the manual optional resources acquisition/enable/disable
implementation with the one provided by the corresponding subsystems.
Since the generic Tx/Rx clocks have been added we can freely remove the
similar clocks handling from the glue-drivers.

(Please note I have also discovered, but didn't try to fix the Allwinner
Sun8i cleanup-on-failure path implemented in the DW MAC probe() procedure.
It has been broken since don't know what time and it's a bit too
complicated to be fixed with no hardware at hands.)

That's it for now. The next series will concern the GPIOs support and
Baikal-T1 SoC specific bindings.

Link: https://lore.kernel.org/netdev/20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru
Changelog v2:
- Discard "snps" vendor-prefix from the new AXI/MTL-Tx/Rx config
  sub-nodes.
- Add the new sub-nodes "axi-config", "mtl-rx-config" and "mtl-tx-config"
  to the DW *MAC bindings describing the nodes the now deprecated
  config-properties were supposed to refer to.
- Fix invalid identation in the "snps,route-*" property settings.
- Discard the patch
  [PATCH 15/25] net: stmmac: Use optional clock request method to get pclk
  since the corresponding functionality has already been integrated into
  the driver.
- Rebase on top of the kernel 5.11-rc7.

Fixes: d2ed0a7755fe ("net: ethernet: stmmac: fix of-node and fixed-link-phydev leaks")
Fixes: f573c0b9c4e0 ("stmmac: move stmmac_clk, pclk, clk_ptp_ref and stmmac_rst to platform structure")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (24):
  dt-bindings: net: dwmac: Validate PBL for all IP-cores
  dt-bindings: net: dwmac: Extend number of PBL values
  dt-bindings: net: dwmac: Fix the TSO property declaration
  dt-bindings: net: dwmac: Refactor snps,*-config properties
  dt-bindings: net: dwmac: Elaborate stmmaceth/pclk description
  dt-bindings: net: dwmac: Add Tx/Rx clock sources
  dt-bindings: net: dwmac: Detach Generic DW MAC bindings
  net: stmmac: Add {axi,mtl-rx,mtl-tx}-config sub-nodes support
  net: stmmac: dwmac-rk: Cleanup STMMAC DT-config in remove cb
  net: stmmac: dwmac-sti: Cleanup STMMAC DT-config in remove cb
  net: stmmac: dwmac-stm32: Cleanup STMMAC DT-config in remove cb
  net: stmmac: Directly call reverse methods in stmmac_probe_config_dt()
  net: stmmac: Fix clocks left enabled on glue-probes failure
  net: stmmac: Use optional clock request method to get stmmaceth
  net: stmmac: Use optional clock request method to get ptp_clk
  net: stmmac: Use optional reset control API to work with stmmaceth
  net: stmmac: dwc-qos: Cleanup STMMAC platform data clock pointers
  net: stmmac: dwc-qos: Use dev_err_probe() for probe errors handling
  net: stmmac: Add Tx/Rx platform clocks support
  net: stmmac: dwc-qos: Discard Tx/Rx clocks request
  net: stmmac: dwmac-imx: Discard Tx clock request
  net: stmmac: Call stmmaceth clock as system clock in warn-message
  net: stmmac: Use pclk to set MDC clock frequency
  net: stmmac: dwc-qos: Save master/slave clocks in the plat-data

 .../bindings/net/snps,dwmac-generic.yaml      | 154 +++++
 .../devicetree/bindings/net/snps,dwmac.yaml   | 578 ++++++++++--------
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  90 +--
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  21 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |   3 +
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |   3 +
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  31 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  85 ++-
 include/linux/stmmac.h                        |   2 +
 11 files changed, 616 insertions(+), 355 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
