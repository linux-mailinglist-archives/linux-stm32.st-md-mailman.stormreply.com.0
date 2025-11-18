Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E733C68FFA
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 12:11:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07160C628CF;
	Tue, 18 Nov 2025 11:11:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F374C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTa574HkLl4KDyxXIf08bFd9xl+XV9qO5xzIy1sFatA=; b=MN7DkEzlF9+jrfcda8eoCuAWTg
 miq3i3aKDlP0/sdtc+vjbQetJZgk9k45Q2DZnklKivliniL5MAZTrdN5q9rElBpEQnx/lqltbwHyz
 bvWJyVXi3qwVel5+kBhTFWuopUs4zX8YY8SwAoxlvNx1ORI9m2RbxL+wargpl2Gf8uPaHLunF3f0D
 F6vDfvDOelOB9epaE47cruDj62iEKLAm4KmxOcp6WZT5khdFJzTNPh10ELPLMnVbDSXP800kOOwcf
 z+zLZ/xpPVhLAcVFy0YsllPxOQdosG+AcIA6jMAioH+OBtY9P6Ret55y34w1QfGc1N8y23zzCKKAq
 +uqzD8tQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58818 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLJcL-00000000380-3It2;
 Tue, 18 Nov 2025 11:11:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLJcL-0000000ExBL-0GFe; Tue, 18 Nov 2025 11:11:25 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 11:11:25 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next] net: stmmac: document (buggy?)
	maximum MTU setup
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

Add documentation for the ndev->max_mtu determination. I'm not sure
this is currect - specifically, having the "everything else" case
depend on the kernel's page size, which is a build-time choice for
some architectures and could be e.g. 4KiB, 16KiB or 64KiB.

E.g. when standard descriptors are used (enh_desc is false) and the
core is younger than v4.00, the buffer length is limited to 11 bits by
the format of the buffer size fields in the descriptors (TBS1/TBS2 in
TDES1 and RBS1/RBS2 in RDES1). So, when page size is greater than 4KiB,
a packet of max_mtu will not fit.

Also, dwmac4 cores (indicated with core_type == DWMAC_CORE_GMAC4) use
the descriptor format in dwmac4_descs.c, even when priv->synopsys_id
is less than DWMAC_CORE_4_00 (see the first DWMAC_CORE_GMAC4 entry in
the stmmac_hw table in hwif.c.)

So, I think this max_mtu is buggy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 15b0c08ebd87..644dccb29f75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7813,6 +7813,12 @@ int stmmac_dvr_probe(struct device *device,
 	/* MTU range: 46 - hw-specific max */
 	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
 
+	/* Set the maximum MTU.
+	 *  For XGMAC cores, 16KiB.
+	 *  For cores using enhanced descriptors or GMAC cores >= v4.00, 9kB.
+	 *  For everything else, PAGE_SIZE - NET_SKB_PAD - NET_IP_ALIGN -
+	 *   aligned skb_shared_info.
+	 */
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
 	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
