Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7A577222
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Jul 2022 01:08:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79351C6410B;
	Sat, 16 Jul 2022 23:08:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C0E4C64100
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 23:08:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a5so11814185wrx.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbvtEGsMnEuUqxalVZhu5nqYG6ItmLh575xNRmd1EY8=;
 b=cEphPFT8NMAhz2OTlbsbTFKS7ThG5Zx3zSRzc3b/JDptIOxxNpJH8Tezp89SGRMQVt
 9meyrRM5jS/nGsmw/1efAc7PRJjkekzvEUz5wZdfbDJyPECoN2+AEXcvHUpdViNaIFuS
 qgatX0Ak3wDZoVz12pAOMZgnNBFthZct0MRiYsQe9b6u+MkyEs7WLnUkrBugk16wWUAe
 bQnOL14h+kVZrLREBzv7CvRd68C1SFvp4mxdKKK6QygLkk2lho2p5F1aRH8C3Io+TLJv
 kD0I8aofEsNzlmbqKmd4pWf3S+Un4bo15dxDjMa4VTDluFcTYfztgKu8Yg5L4RXc1MaZ
 PqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbvtEGsMnEuUqxalVZhu5nqYG6ItmLh575xNRmd1EY8=;
 b=r7h+MR7KRDiCoCZZWpGoui5IttfWAcBDHA02YRDXSgq9f7PeAq7oLKcuoYFgqfWnXs
 f9sxUKbUUsopduASHJf0rXDNwvqw741Qo6EMvE/c5OI/+rQf53io62I68x3VOYY79L4k
 bL8X2+iijYEpBfI8siXADDQduUqTmjuLeZ2eDZ5NAPkY13mKP45nzKfRr1HInbIR/HYB
 CiU33OqEI4hoGHj43W68FOxqj0/yNE8B0OF+L8VY35j1AdT78qu6FWoJbYSpTgjX9UaR
 /wElOFhzzskAaK2JC7UrXx5vm1TTRsW1YCCtOIeGGFkURaPhHGlnxnyEmfRtp9y2aWsv
 ZXmg==
X-Gm-Message-State: AJIora+FXqqUSWKvQOHfrfeURLBqXJqZ+NAbH+QbZzFeRUcmbrKs6tMH
 US7mT274nRSeUSf/RFTlIc8=
X-Google-Smtp-Source: AGRyM1vHXqLPb9/lz3m4XQ3KLxcwl5y1+db4LaiQameOv6ZFahwWeMM4pBVUL/MZglS3L4yfhZEntw==
X-Received: by 2002:a05:6000:1f96:b0:21d:8516:9ec9 with SMTP id
 bw22-20020a0560001f9600b0021d85169ec9mr19150822wrb.359.1658012894474; 
 Sat, 16 Jul 2022 16:08:14 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm15150755wmc.45.2022.07.16.16.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 16:08:14 -0700 (PDT)
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
Date: Sun, 17 Jul 2022 01:08:02 +0200
Message-Id: <20220716230802.20788-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220716230802.20788-1-ansuelsmth@gmail.com>
References: <20220716230802.20788-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 5/5] net: ethernet: stmicro:
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 53e9dbff30ae..7425941fbb40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5551,18 +5551,15 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
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
@@ -5574,8 +5571,27 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
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
