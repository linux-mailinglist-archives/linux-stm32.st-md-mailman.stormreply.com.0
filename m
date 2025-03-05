Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0FA50724
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 18:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A34C78F68;
	Wed,  5 Mar 2025 17:54:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22CE6C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f3zqw2rI6Ot+kpRpJsM9K8AbmzF/0A2htE0cEidTpwI=; b=BRg5SuOYfwKsjDO94VckjEKjz5
 Ix65H73pJlKNe7luPxaNcX4eqWu7crJuCOa07l32YnztoTnFcszvQF799kmicI6+LVlKjCd/qS8l/
 6vPFgHs8ibT5mX+HA6VCN022smM4U44xs11Nhw8krI5dSGCslmHUbAv8GuRPml///U4sGXRJLENbK
 TT39/QO57epGGhM4P7WURBqh+LKTVULrRNr6Pt3ZJam02MNMB2Hyz2p0QXu9Q5rA3ivWR+70YOBn2
 6YryLZLlFlL2pSzlqEdtyMO47+H0M1GCcp4Ogn//lMZ4YyyRcfTemLukqJ7//+h3LLfgKaUWNfPZJ
 dwROq5Ow==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51332 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tpsx8-0004ff-09;
 Wed, 05 Mar 2025 17:54:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tpswn-005U6I-TU; Wed, 05 Mar 2025 17:54:21 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Mar 2025 17:54:21 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mostly remove "buf_sz"
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

The "buf_sz" parameter is not used in the stmmac driver - there is one
place where the value of buf_sz is validated, and two places where it
is written. It is otherwise unused.

Remove these accesses. However, leave the module parameter in place as
removing it could cause module load to fail, breaking user setups.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cb5099caecd0..037039a9a33b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -101,6 +101,7 @@ static int tc = TC_DEFAULT;
 module_param(tc, int, 0644);
 MODULE_PARM_DESC(tc, "DMA threshold control value");
 
+/* This is unused */
 #define	DEFAULT_BUFSIZE	1536
 static int buf_sz = DEFAULT_BUFSIZE;
 module_param(buf_sz, int, 0644);
@@ -218,8 +219,6 @@ static void stmmac_verify_args(void)
 {
 	if (unlikely(watchdog < 0))
 		watchdog = TX_TIMEO;
-	if (unlikely((buf_sz < DEFAULT_BUFSIZE) || (buf_sz > BUF_SIZE_16KiB)))
-		buf_sz = DEFAULT_BUFSIZE;
 	if (unlikely((pause < 0) || (pause > 0xffff)))
 		pause = PAUSE_TIME;
 
@@ -4018,7 +4017,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	buf_sz = dma_conf->dma_buf_sz;
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
@@ -7973,9 +7971,6 @@ static int __init stmmac_cmdline_opt(char *str)
 		} else if (!strncmp(opt, "phyaddr:", 8)) {
 			if (kstrtoint(opt + 8, 0, &phyaddr))
 				goto err;
-		} else if (!strncmp(opt, "buf_sz:", 7)) {
-			if (kstrtoint(opt + 7, 0, &buf_sz))
-				goto err;
 		} else if (!strncmp(opt, "tc:", 3)) {
 			if (kstrtoint(opt + 3, 0, &tc))
 				goto err;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
