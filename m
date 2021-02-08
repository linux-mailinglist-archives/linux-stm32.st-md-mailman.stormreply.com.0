Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB231347A
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCB69C57B55;
	Mon,  8 Feb 2021 14:08:23 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A4F4C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:22 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>
Date: Mon, 8 Feb 2021 17:08:04 +0300
Message-ID: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 00/16] net: stmmac: Add DW MAC GPIOs and
	Baikal-T1 GMAC support
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
ethernet interfaces. There were no vendor-specific alterations provided
for the synthesized core, but aside with standard configs which can be read
from the DMA-capability registers the GPI/GPO ports were activated. Alas
hardware designers have actively used them to implement the events detection
and to reset PHYs attached to the MAC. So we had no choice, but to somehow fix the
standard STMMAC driver so one would safely support these GPIOs usage.
This series is mainly about introducing the GPI/GPO ports support into
the STMMAC driver and finally adding the Baikal-T1 GMAC support. The later
merely means having a corresponding compatible string added to the OF IDs
list of the Generic DW MAC glue-driver and having the Baikal-T1 GMAC
DT bindings defined in the kernel.

The series starts with fixing the bindings as it was said above, because
the bindings/doc-related patches are supposed to go before the changes
they have been created for.

Then the patchset proceeds with a set of preparation changes, so the
driver would correctly register, work with and de-register the GPIO-chip
in the kernel. The alterations are connected with two problems that made
using the embedded into the MAC GPIOs very hard or even impossible:
(1) MAC/DMA/etc software reset on each network device open.
GPIO-chip is a device which state must be deterministic no matter whether
some network device is opened or released. At least Linux kernel expect it
to act like that. So after the DW MAC GPIO interface is registered in the
kernel we can't let the GPI/GPO stochastically change.  The situation is
getting worse on the platforms (like Baikal-T1 SoC), which can't even
temporarily detach the GPIO pins from the core while for instance the
reset is in progress. To cut it short the only possible solution for such
chips, which also don't have a vendor-specific GPIO-safe reset procedure,
is to get rid of the resets. In the framework of this patchset we suggest
to replace it with MAC and DMA registers manual cleanup in case if MAC
GPIOs are intended to be used. Of course such solution isn't equivalent to
the SW-reset because it doesn't imply the internal state machine reset.
But at least the CSRs state will be as the rest of the code expect them
to.
(2) Main IRQ was requested and unmasked only while network device was opened.
Indeed if we want to use MAC GPIs in the kernel, we must make sure the
input state change is detected by the IRQ handler no matter whether the
network device is opened or not. Of course we could just request the main
IRQ in the probe method and mask all the network-related IRQs while the
corresponding network device is closed. But turned out it wasn't that
easy. Due to a very strange DW MAC IRQs subsystem design we can't
disable/enable and clear/check all the device interrupts in a single CSR.
MAC, DMA, MTL, Safety feature, GPIO subsystems each can generate IRQs and
have got its own CSRs to set the interrupts up. Alas the STMMAC driver
didn't have IP-core-specific callbacks to just disable/enable IRQs from
each of them.  Instead the interrupts were enabled in the framework of the
subsystem functionality setup procedures. So in this patchset we've
introduced a set of MAC, DMA, MTL and Safety feature IRQs enable/disable
callbacks to be able to manually switch on and off all the network-related
interrupts when it's required.

After all of the denoted above problems are fixed we need to get the code
a bit more prepared to adding the GPIOs functionality. Since the driver
ISR will be used to handle both network- and GPIO-related events, it needs
to have a way to determine a time when the network is up and running to
permit the network-related IRQs handling. The best candidate for it is the
STMMAC_DOWN flag which has already been defined in the STMMAC driver. But
the flag semantics was a bit misleading and couldn't be used for our case
out-of-boxi (see the patches log for details). We suggest to fix it by
converting the flag to be STMMAC_UP and being set all the time the network
device is opened.

Finally the GPIOs functionality is introduced. First patch adds a generic
DW MAC GPI/GPO driver, which can be used for any currently available types
of DW *MAC GPIO interfaces. Please see the patch log and its body for the
implementation details (like a reason of the configuration cache usage, a
set of callbacks required to be defined for each GPIO-available DW MAC,
etc). Secondly we've created a set of GPIO-related callbacks to access DW
GMAC GPO/GPI ports so the STMMAC driver would be able to register the
corresponding GPIO-chip for Baikal-T1 GMAC. Note the similar set of
callbacks can be created for DW XGMAC GPIOs, since the GPIO driver has
been designed to be independent from the GPI/GPO CSR implementation. But
aside with them the MAC and DMA cleanup methods need to be introduced to
work around the problem (1) described above in this text.

The series is supposed to be applied on top of the last revision of the
next patchset:
Link: https://lore.kernel.org/netdev/20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru
otherwise a few patches won't get merged in cleanly.

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

Serge Semin (16):
  dt-bindings: net: dwmac: Add DW GMAC GPIOs properties
  dt-bindings: net: Add Baikal-T1 GMAC bindings
  net: stmmac: Introduce MAC core cleanup method
  net: stmmac: Introduce DMA core cleanup method
  net: stmmac: Introduce MAC IRQs enable/disable methods
  net: stmmac: Extend DMA IRQs enable/disable interface
  net: stmmac: Introduce MTL IRQs enable/disable methods
  net: stmmac: Introduce Safety Feature IRQs enable/disable methods
  net: stmmac: Disable MMC IRQs in the generic IRQs disable method
  net: stmmac: Convert STMMAC_DOWN flag to STMMAC_UP
  net: stmmac: Add STMMAC state getter
  net: stmmac: Introduce NIC software reset function
  net: stmmac: Request IRQs at device probe stage
  net: stmmac: Add Generic DW MAC GPIO port driver
  net: stmmac: Add DW GMAC GPIOs support
  net: stmmac: Add DW MAC IPs of 3.72a/3.73a/3.74a versions

 .../bindings/net/baikal,bt1-gmac.yaml         | 150 +++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  17 +
 .../ethernet/stmicro/stmmac.rst               |   4 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   2 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-generic.c   |   3 +
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  33 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  11 +
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 101 ++++-
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |   6 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   5 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  57 ++-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  17 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  51 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  36 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  38 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  76 +++-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  35 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   3 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  55 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  22 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_gpio.c | 400 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 323 ++++++++++----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   5 +
 include/linux/stmmac.h                        |   1 +
 30 files changed, 1271 insertions(+), 207 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_gpio.c

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
