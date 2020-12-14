Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD02D94A8
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1676C57168;
	Mon, 14 Dec 2020 09:16:26 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49E43C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:23 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>
Date: Mon, 14 Dec 2020 12:15:55 +0300
Message-ID: <20201214091616.13545-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 05/25] dt-bindings: net: dwmac: Elaborate
	stmmaceth/pclk description
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

Current clocks description doesn't provide a comprehensive notion about
what "stmmaceth" and "pclk" actually represent from the IP-core manual
point of view. The bindings file states:
stmmaceth - "GMAC main clock",
apb - "Peripheral registers interface clock".
It isn't that easy to understand what they actually mean especially seeing
the DW *MAC manual operates with clock definitions like Application,
System, Host, CSR, Transmit, Receive, etc clocks. Moreover the clocks
usage in the driver doesn't shade a full light on their essence. What
inferred from there is that the "stmmaceth" name has been assigned to the
common clock, which feeds both system and CSR interfaces. But what about
"apb"? The bindings defines it as the clock for "peripheral registers
interface". So it's close to the CSR clock in the IP-core manual notation.
If so then when "apb" clock is specified aside with the "stmmaceth", it
represents a case when the DW *MAC is synthesized with CSR_SLV_CLK=y
(separate system and CSR clocks). But even though the "apb" clock is
requested in the MAC driver, the driver doesn't actually use it as a
separate CSR clock where the IP-core manual requires. All of that makes me
thinking that the case of separate system and CSR clocks isn't correctly
implemented in the driver.

Let's start with elaborating the clocks description so anyone reading
the DW *MAC bindings file would understand that "stmmaceth" is the
system clock and "pclk" is actually the CSR clock. Indeed in accordance
with sheets depicted in [1]:
system/application clock can be either of: hclk_i, aclk_i, clk_app_i;
CSR clock can be either of: hclk_i, aclk_i, clk_app_i, clk_csr_i.
(Most likely the similar definitions present in the others IP-core
manuals.) So the CSR clock can be tied to the application clock
considering the later as the main clock, but not the other way around. In
case if there is only "stmmaceth" clock specified in a DT node, then it
will be considered as a source of clocks for both application and CSR. But
if "pclk" is also specified in the list of the device clocks, then it will
be perceived as the separate CSR clock.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p. 564.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../devicetree/bindings/net/snps,dwmac.yaml          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 44aa88151cba..e1ebe5c8b1da 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -116,8 +116,16 @@ properties:
     maxItems: 5
     additionalItems: true
     items:
-      - description: GMAC main clock
-      - description: Peripheral registers interface clock
+      - description:
+          GMAC main clock, also called as system/application clock.
+          This clock is used to provide a periodic signal for the DMA/MTL
+          interface and optionally for CSR, if the later isn't separately
+          clocked.
+      - description:
+          Peripheral registers interface clock, also called as CSR clock.
+          MCI, CSR and SMA interfaces run on this clock. If it's omitted,
+          the CSR interfaces are considered as synchronous to the system
+          clock domain.
       - description:
           PTP reference clock. This clock is used for programming the
           Timestamp Addend Register. If not passed then the system
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
