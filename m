Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C226E57900A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 03:49:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71E76C640F5;
	Tue, 19 Jul 2022 01:49:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6976CC640F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 01:49:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j1so15054721wrs.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LlfQtelztTsNiTqcVZLiFHCSHDMpr2L71yJcP2UP5Tc=;
 b=ix6JP89EESpFq6vPoyv42Rmw9s1JazmPo2Qt0NnDqNPha4M0FF3HuJ37klC7aI6SLh
 mX/tXnXMA44du9BgEn20TGrV69Re3MCo5lc05ok4xi8mFQPPnpsSbsWF3/aQzkHzBiya
 yw+NdH5j9rB9ph/HTzcuBs3+1qoFGhh4NQQT0mdOmTFSJ0ZvAKcxWoaOsdSCXFvjSV5w
 X/4FUy5YOSiMtP8EDtavKmvLCwhVxX1MZwleusEjpHjn5qTM6gVzBCLrftuWZt2bUL93
 uxih86BRt9YPQ1KPGkO/Dt+OVZ9+wJ17irhzXjCfQ/qbOgtZr1lPV1Qh6jqcy2RrhBNY
 adtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LlfQtelztTsNiTqcVZLiFHCSHDMpr2L71yJcP2UP5Tc=;
 b=u1xAYrn8DCalIyA/QpDTbZbiAxsyLQCaB1lJptscnFraQyOrOO6UkQmRgCj1LM/Ttx
 Aw0AkXcmODFNzHlXQhEBSI7i1Qfgdj9VnbxCUP4RhICH+ru4321nuYAF/MqLhw6j5UqM
 rDuWdO5BQPm20dYjUPrKpucfGKThmhUbu/W/Pk1HaOsvfv40dkg8Azcs43zbJFXYpuJ4
 seC3llRIwVy+A31MQQN6Yyx4oNIrJozTK0q2uQ/co3sjiCWN9ljfrjLCCSRTZbrh2IIq
 lrhEOSGgZxtlSUMJgUdfyCdFIwNnMWPaxhZIKzt5PdDrQvhx7OS6Hsq8YG91vMLyEoTE
 zakA==
X-Gm-Message-State: AJIora/Dok+W/wMGGGJepkB72JR9Wx6dinyX8kBTIQDb+V6Ve5mSAwVN
 k7stmcG8goWWX7DdEWoAzIg=
X-Google-Smtp-Source: AGRyM1sotsOcKG/9pLDZZ7aw8EvbuQ4EGef5Wv/ScQtYnvD7MPxwSRbvCBr70W1/CiFdJdc05vp9sQ==
X-Received: by 2002:a5d:4a8f:0:b0:21e:28a8:f44d with SMTP id
 o15-20020a5d4a8f000000b0021e28a8f44dmr3046841wrq.663.1658195375865; 
 Mon, 18 Jul 2022 18:49:35 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 v10-20020a05600c428a00b003a2fc754313sm16193600wmc.10.2022.07.18.18.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 18:49:35 -0700 (PDT)
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
Date: Tue, 19 Jul 2022 03:32:19 +0200
Message-Id: <20220719013219.11843-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719013219.11843-1-ansuelsmth@gmail.com>
References: <20220719013219.11843-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 5/5] net: ethernet: stmicro:
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
index a3bb132db3a5..1eda1e1038b4 100644
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
@@ -5574,8 +5571,29 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
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
