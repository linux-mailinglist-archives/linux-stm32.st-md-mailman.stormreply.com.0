Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD157EFAE
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Jul 2022 16:30:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E19C57183;
	Sat, 23 Jul 2022 14:30:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95478C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jul 2022 14:30:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so6766922wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jul 2022 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GX0e7m5ZrkPjpxkJdIBL+iV+EyM6eAVNIs5WQVoDC5I=;
 b=GuUs35D+Od53ehyBq7jSWrPuxnPg2k3rYm9X0U1icEB1hrTVCqlqQBL8TjQJp8E9Fu
 UyD0jy55G4vAFxREf4ZMZVOKBCT5oCkzuLx9FMnVNRjKfN3h6OQ2eYIzl0RItI+9XMJr
 vNZ1uImREQXKLyZO9AvoWamfOWSQhYgUSQh1ZxrlAOxZLgYdU3dpew+Cbc+4tvsBPULQ
 8MtbxGJe+v2wSYdspSqQPa8PFQYd685D1/Vwj3nmTOCHo7JlCqSmJ9qL9s2NoxmC+5G0
 5Ho7csQZ/+WVE5zDHwe1NoeSCbh2Wkn43qweWXZNJgS01xQuE7cpYZ74F6srqK4GThyi
 aWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GX0e7m5ZrkPjpxkJdIBL+iV+EyM6eAVNIs5WQVoDC5I=;
 b=il6gKmlEwtedJmHuPulUgXRbnfr1rSwhEOZEtyrrX/jbcGC9FjFKPtQPVnLIDAkRP1
 8FuMq/q5nO5LOkRyRdrsRjk3GFo4SagQ35Gu5aqisv+5/82N2Z07qEdCAGM/4cmHRXd8
 qQIIR04o3VVd3wiylHGG8aBc5kGC4yHBvVNGjFA3Nj058MxtHQuJyBJxXegPumr/nmFg
 N+hFXGiXiyN9RfldoEnafDdTvwhTY9vRvrm+DzRkW0rMYTu1XGKa84h9uyvpy8FLHmAM
 Qi/YzFJJJHvkPmeQBV2OE+T4HFLx2zCGwhIE9HeD7m10Dgim3KvldeEEw7u9WcBc6IwT
 wRwQ==
X-Gm-Message-State: AJIora+OMN5iRGIpcvWCGp9xgzEXMZwpsuK11Qbm6usiiU8l8BtoXsf/
 8nP4ndCjQbdYKWlr2YMOtUw=
X-Google-Smtp-Source: AGRyM1vyEESD+gOYudb18RYonLwuCA9ecgk+Boyi9uzgAedUAyeJVXmG9G/HRzwQjgJRpYQqd/XNAQ==
X-Received: by 2002:a05:600c:3ba3:b0:3a3:5dd:f10f with SMTP id
 n35-20020a05600c3ba300b003a305ddf10fmr3105539wms.185.1658586601145; 
 Sat, 23 Jul 2022 07:30:01 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-7-207-127.retail.telecomitalia.it. [87.7.207.127])
 by smtp.googlemail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm11689717wmq.48.2022.07.23.07.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 07:30:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 23 Jul 2022 16:29:33 +0200
Message-Id: <20220723142933.16030-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220723142933.16030-1-ansuelsmth@gmail.com>
References: <20220723142933.16030-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v5 5/5] net: ethernet: stmicro:
	stmmac: permit MTU change with interface up
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

Remove the limitation where the interface needs to be down to change
MTU by releasing and opening the stmmac driver to set the new MTU.
Also call the set_filter function to correctly init the port.
This permits to remove the EBUSY error while the ethernet port is
running permitting a correct MTU change if for example a DSA request
a MTU change for a switch CPU port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9a927ce17941..083d08b5ab0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5552,18 +5552,15 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int txfifosz = priv->plat->tx_fifo_size;
+	struct stmmac_dma_conf *dma_conf;
 	const int mtu = new_mtu;
+	int ret;
 
 	if (txfifosz == 0)
 		txfifosz = priv->dma_cap.tx_fifo_size;
 
 	txfifosz /= priv->plat->tx_queues_to_use;
 
-	if (netif_running(dev)) {
-		netdev_err(priv->dev, "must be stopped to change its MTU\n");
-		return -EBUSY;
-	}
-
 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
 		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
 		return -EINVAL;
@@ -5575,8 +5572,29 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	dev->mtu = mtu;
+	if (netif_running(dev)) {
+		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
+		/* Try to allocate the new DMA conf with the new mtu */
+		dma_conf = stmmac_setup_dma_desc(priv, mtu);
+		if (IS_ERR(dma_conf)) {
+			netdev_err(priv->dev, "failed allocating new dma conf for new MTU %d\n",
+				   mtu);
+			return PTR_ERR(dma_conf);
+		}
 
+		stmmac_release(dev);
+
+		ret = __stmmac_open(dev, dma_conf);
+		kfree(dma_conf);
+		if (ret) {
+			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
+			return ret;
+		}
+
+		stmmac_set_rx_mode(dev);
+	}
+
+	dev->mtu = mtu;
 	netdev_update_features(dev);
 
 	return 0;
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
