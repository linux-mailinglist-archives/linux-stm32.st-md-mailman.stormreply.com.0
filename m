Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5CC6DF33
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 11:23:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 771AEC62D37;
	Wed, 19 Nov 2025 10:23:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E8A8C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0nTWHIx4Dctv5EXusL1J/hHr97kNJ1bSy5pO5kUUQNg=; b=Kbo/jik9svCmqoRmpP0yr7EOGi
 e7mn2hLsU/nfP59SJ6YVT2GlwEr7QtVKCH1mke1HI8yUQt+fUeUWpkNyvSOVhiAf7cDPO2cnP1zlC
 FO7tXuQ1vKMdcVEbHGn3f6MkV8ehvP/2ROpHmk84ly3GprTovc8fpQFJ4ci1FiXFGqMTg0Kc3B+Sq
 tCKqj7zT55Q3m7gxf6RvL9kJ4qYrQx43ezZYrC4AWezez1CdU+uot2sJKotPSs7dkl5AFGFUBqqrP
 E8L0WfWEWaKPMww/gDmyJu+CaupqR2S0PA6mftc0oU9s6PfD3PSZOEDFxqfWXq46E7VN6AEPGIyF2
 PeMwlKuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52102 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLfLH-000000004Uf-2TZr;
 Wed, 19 Nov 2025 10:23:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLfLG-0000000FMai-3fKz; Wed, 19 Nov 2025 10:23:14 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLfLG-0000000FMai-3fKz@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:14 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: dwc-qos-eth:
 simplify switch() in dwc_eth_dwmac_config_dt()
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

Simplify the switch() statement in dwc_eth_dwmac_config_dt().
Although this is not speed-critical, simplifying it can make it more
readable. This also drastically improves the code emitted by the
compiler.

On aarch64, with the original code, the compiler loads registers with
every possible value, and then has a tree of test-and-branch statements
to work out which register to store. With the simplified code, the
compiler can load a register with '4' and shift it appropriately.

This shrinks the text size on aarch64 from 4289 bytes to 4153 bytes,
a reduction of 3%.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
v2: remove "the the" in commit description
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index c7cd6497d42d..e6d5893c5905 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -84,29 +84,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	device_property_read_u32(dev, "snps,burst-map", &burst_map);
 
 	/* converts burst-map bitmask to burst array */
-	for (bit_index = 0; bit_index < 7; bit_index++) {
-		if (burst_map & (1 << bit_index)) {
-			switch (bit_index) {
-			case 0:
-			plat_dat->axi->axi_blen[a_index] = 4; break;
-			case 1:
-			plat_dat->axi->axi_blen[a_index] = 8; break;
-			case 2:
-			plat_dat->axi->axi_blen[a_index] = 16; break;
-			case 3:
-			plat_dat->axi->axi_blen[a_index] = 32; break;
-			case 4:
-			plat_dat->axi->axi_blen[a_index] = 64; break;
-			case 5:
-			plat_dat->axi->axi_blen[a_index] = 128; break;
-			case 6:
-			plat_dat->axi->axi_blen[a_index] = 256; break;
-			default:
-			break;
-			}
-			a_index++;
-		}
-	}
+	for (bit_index = 0; bit_index < 7; bit_index++)
+		if (burst_map & (1 << bit_index))
+			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
 
 	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
