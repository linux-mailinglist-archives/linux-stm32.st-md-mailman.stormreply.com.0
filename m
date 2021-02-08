Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2829313443
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:03:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6485DC57B54;
	Mon,  8 Feb 2021 14:03:47 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25C57C57188
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:03:46 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Date: Mon, 8 Feb 2021 17:03:21 +0300
Message-ID: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH 00/20] net: stmmac: Obvious cleanups and
	several fixes
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

This series consists of a preparation patches before adding DW MAC GPIOs
and final Baikal-T1 GMAC support. (The later will be done in the framework
of the Generic DW MAC glue-driver though.) It's mainly about cleaning the
code up here and there by removing unused data and macro names, but also
includes several bugs and design fixes.

The patchset starts from fixing the Realtek PHYs driver. In particular it
has been discovered that disabling RXC in LPI (EEE) causes RTL8211E PHY
partial freeze until the next MDIO read operation from the PHY CSRs. We
suggest to fix that problem by dummy reading from the MMD Data register
each time the PC1R.10 bit is intended to be set.

Then the series evolves in a set of bug fixes discovered in the main
STMMAC driver code. First of all the cleanup-on-error path has been
incorrectly implemented in the DMA descriptor allocation procedure due to
which in case Tx DMA resources allocation failures the Rx DMA descriptors
will be left unfreed. Secondly it has been discovered that the MTL IRQs
handling procedure didn't do that quite well, so any MTL RX overflow
errors will be handled for queues with higher order too, which most likely
isn't what the code author originally intended. Thirdly the DW MAC reset
control de-assetion should be performed after the MDIO-bus
de-registration, because the later may need to access PHY registers, which
is supposed to be done via the MAC SMA interface. Fourthly we've found out
that DW MAC v4.x code was using a generic dwmac4_disable_dma_irq() method
to disable DMA IRQs instead of having the dedicated
dwmac410_disable_dma_irq() method utilized. That didn't cause any problem
because the modified bits matches in both IP-core revisions, but for
consistency we suggest to fix that. Fifthly for the same reason of the
naming consistency the GMAC_INT_STATUS_PMT macro constant should be used
instead of GMAC_INT_DISABLE_PMT to check the PMT IRQs status. Finally it's
strange that the problem hasn't been discovered before, but it is most
likely wrong to initialized Tx/Rx DMA descriptors, and then clean them up.
That specifically concerns the Tx DMA descriptors initialization procedure
in the Chain-mode. Please the patch for details.

The patchset then proceed with multiple optimizations and cleanups
performed here and there in the code: fix typo in the XGMAC_L3_ADDR3 macro
name, discard unused mii_irq array from the private data, discard nothing
changing Rx copybreak ethtool setting, discard redundant index variable
usage in the dirty_rx initialization method, discard dwmac1000_dma_ops
declaration from dwmac100.h, move DMA Tx/Rx init methods to the DW MAC lib
since they match for DW MAC and DW GMA IP-cores, discard pointless
STMMAC_RESETING flag, discard conditional service task execution since
it's called from CMWQ anyway (it's also errors prone, since any event
happening during the service task execution will be lost), add 'cause' arg
to the service task executioner to generalize the deferred events handling
interface. Finally in the framework of the code cleanup procedure we
suggest to extend the stmmac_hw_teardown() functionality with all the
necessary hardware cleanups, which for some reason were directly performed
in the network device release callback. That concerns PTP clocks
disabling, DMA channels and MAC Tx/Rx de-activation.

Note the STMMAC driver is having much more weak design patterns and style
problems (like calculating the total number of queues every time it's
needed, or antagonist/cleanup methods absence while having the reversal
code added in the remove/cleanup paths), than what is fixed in the
framework of this series, which make the code hard to read, comprehend,
maintain and extend with new features. Most likely the situation turned to
be like that due to a long history of the driver evolving to support many
different IP-core versions and vendor-specific MAC extensions. Anyway it
would have taken not a single patches series to fix all of the problems.
Since it hasn't been my primary target, here in this series I've
introduced the cleanups and fixes, which prepared the corresponding parts
of the code for easier alterations in the framework of adding the DW MAC
GPIOs and Baikal-T1 GMAC support into the driver.

The series is supposed to be applied on top of the last revision of the
next patchset:
Link: https://lore.kernel.org/netdev/20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru/
otherwise a few patches won't get merged in cleanly.

Fixes: 7bac4e1ec3ca ("net: stmmac: stmmac interrupt treatment prepared for multiple queues")
Fixes: 021bd5e36970 ("net: stmmac: Let TX and RX interrupts be independently enabled/disabled")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (20):
  net: phy: realtek: Fix events detection failure in LPI mode
  net: stmmac: Free Rx descs on Tx allocation failure
  net: stmmac: Fix false MTL RX overflow handling for higher queues
  net: stmmac: Assert reset control after MDIO de-registration
  net: stmmac: Use dwmac410_disable_dma_irq for DW MAC v4.10 DMA
  net: stmmac: Use LPI IRQ status-related macro in DW MAC1000 isr
  net: stmmac: Clear descriptors before initializing them
  net: stmmac: Fix typo in the XGMAC_L3_ADDR3 macro name
  net: stmmac: Discard mii_irq array from private data
  net: stmmac: Discard Rx copybreak ethtool setting
  net: stmmac: Discard index usage in the dirty_rx init
  net: stmmac: Discard dwmac1000_dma_ops declaration from dwmac100.h
  net: stmmac: Move DMA Tx/Rx init methods to DW MAC lib
  net: stmmac: Add DW GMAC disable LPI IRQ mask macro
  net: stmmac: Discard STMMAC_RESETING flag
  net: stmmac: Discard conditional service task execution
  net: stmmac: Add 'cause' arg to the service task executioner
  net: stmmac: Move PTP clock enabling to PTP-init method
  net: stmmac: Move DMA stop procedure to HW-setup antagonist
  net: stmmac: Move MAC Tx/Rx disabling to HW-setup antagonist

 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 20 +----
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    | 20 +----
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  4 +
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 14 ++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  5 --
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 39 ---------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 81 +++++++++----------
 drivers/net/phy/realtek.c                     | 37 +++++++++
 12 files changed, 102 insertions(+), 126 deletions(-)

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
