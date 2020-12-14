Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193F2D951C
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:25:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9323C57163;
	Mon, 14 Dec 2020 09:25:20 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7BD0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:25:19 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:25:16 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Message-ID: <20201214092516.lmbezb6hrbda6hzo@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC] net: stmmac: Problem with adding the native
	GPIOs support
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

Hello folks,

I've got a problem, which has been blowing by head up for more than three
weeks now, and I'm desperately need your help in that matter. See our
Baikal-T1 SoC is created with two DW GMAC v3.73a IP-cores. Each core
has been synthesized with two GPIOs: one as GPI and another as GPO. There
are multiple Baikal-T1-based devices have been created so far with active
GMAC interface usage and each of them has been designed like this:

 +------------------------+
 | Baikal-T1 +------------+       +------------+
 |   SoC     | DW GMAC    |       |   Some PHY |
 |           |      Rx-clk+<------+Rx-clk      |
 |           |            |       |            |
 |           |         GPI+<------+#IRQ        |
 |           |            |       |            |
 |           |       RGMII+<----->+RGMII       |
 |           |        MDIO+<----->+MDIO        |
 |           |            |       |            |
 |           |         GPO+------>+#RST        |
 |           |            |       |            |
 |           |      Tx-clk+------>+Tx-clk      |
 |           |            |       |            |
 |           +------------+       +------------+
 +------------------------+

Each of such devices has got en external RGMII-PHY attached configured via the
MDIO bus with Rx-clock supplied by the PHY and Tx-clock consumed by it. The
main peculiarity of such configuration is that the DW GMAC GPIOs have been used
to catch the PHY IRQs and to reset the PHY. Seeing the GPIOs support hasn't
been added to the STMMAC driver it's the very first setup for now, which has
been using them. Anyway the hardware setup depicted above doesn't seem
problematic at the first glance, but in fact it is. See, the DW *MAC driver
(STMMAC ethernet driver) is doing the MAC reset each time it performs the
device open or resume by means of the call-chain:

  stmmac_open()---+
                  +->stmmac_hw_setup()->stmmac_init_dma_engine()->stmmac_reset().
  stmmac_resume()-+

Such reset causes the whole interface reset: MAC, DMA and, what is more
important, GPIOs as being exposed as part of the MAC registers. That
in our case automatically causes the external PHY reset, what neither
the STTMAC driver nor the PHY subsystem expect at all.

Moreover the stmmac_reset() method polls the DMA_BUS_MODE.SFT_RESET flag
state to be sure the MAC is successfully completed. But since the external
PHY has got in reset state it doesn't generate the Rx-clk signal. Due to
that the MAC-DMA won't get out of the reset state so the stmmac_reset()
method will return timeout error. Of course I could manually restore the
GPIOs state in the stmmac_reset() before start to poll the SFT_RESET flag,
which may release the PHY reset. But that seems more like a workaround,
because the PHY still has been in reset and need to be reinitialized
anyway. Moreover some PHY may need to have more complicated reset cycle
with certain delays between RST assertion/de-assertion, so the workaround
won't work well for them.

To sum it up my question is what is the right way to resolve the problem
described above? My first idea was to just move the MAC reset from the
net-device open()/close() callbacks to the
stmmac_dvr_probe()/stmmac_dvr_remove() functions and don't reset the whole
interface on each device open. The problems we may have in that case is
due to the suspend/resume procedures, which for some reason require the
MAC reset too. That's why I need your help in this matter. Do you have any
idea how to gently add the GPIOs support and don't break the STMMAC
driver?

One more tiny question regarding the DW *MAC drivers available in kernel.
Aside of the DW GMAC Baikal-T1 SoC has also got DW xGMAC v2.11a embedded
with XPCS PHY attached. My question is what driver should we better use to
handle our xGMAC interface? AFAICS there are three DW *MAC-related drivers
the kernel currently provides:
1) drivers/net/ethernet/stmicro/stmmac
2) drivers/net/ethernet/amd/
3) drivers/net/ethernet/synopsys/
xGBE interface is supported by the drivers 1) and 2). In accordance with
https://www.spinics.net/lists/netdev/msg414148.html all xGMAC related
parts should have been added to 2), but recently the XGMAC support has
been added to 1). So I am confused what driver is now supposed to be used
for new xGMACs?

Regards,
-Sergey
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
