Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EF83C298
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 13:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13753C6B476;
	Thu, 25 Jan 2024 12:34:44 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D902C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=O99d2OhA5yD9439wbiGDNw8gbQ6j47VNjuChaGpSepE=; b=sGzqxBb73IUlg1OF5UY4xH9Z5F
 AysdrkIa0xJpoLD8gMXgkc/z5ha1KwdVV70NGn5p3Dh+kUkcO77WgN+qRvnRcxFoMfOXPTHxuSBQH
 uVZVmh4+4NRKVv4XnENVG4mX0vp7nORlguxiznDauOvXjdY8I5wpV9o5+zwSaA5DBWAqdvHQdX/6E
 DzlIA7SjLnFbKzdxDh4LfscplRPCKXcbCl6sHBWda0fjBDge9cS4Po29celBW83U+Vy5Dth535GqM
 c60paXmj8wDQd5j4JcPSLw6by9EabOYS24CdkV3ildwunOpoQvv1rL4gKLgBNoXiSQu3e7SMPI8Je
 miA9LTbw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rSywH-0007Q2-4N; Thu, 25 Jan 2024 13:34:37 +0100
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rSywG-00028s-9l; Thu, 25 Jan 2024 13:34:36 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Date: Thu, 25 Jan 2024 13:34:33 +0100
Message-ID: <a1d6f5ca9aad795dfc8e0bbb9bb06d8bb7b46649.1706184304.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706184304.git.esben@geanix.com>
References: <cover.1706184304.git.esben@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: do not clear TBS enable bit
	on link up/down
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

With the dma conf being reallocated on each call to stmmac_open(), any
information in there is lost, unless we specifically handle it.

The STMMAC_TBS_EN bit is set when adding an etf qdisc, and the etf qdisc
therefore would stop working when link was set down and then back up.

Fixes: ba39b344e924 ("net: ethernet: stmicro: stmmac: generate stmmac dma conf before open")
Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b334eb16da23..25519952f754 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3932,6 +3932,9 @@ static int __stmmac_open(struct net_device *dev,
 	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
 
 	buf_sz = dma_conf->dma_buf_sz;
+	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
+			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
 
 	stmmac_reset_queues_param(priv);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
