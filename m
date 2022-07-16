Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83F5770D4
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jul 2022 20:48:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AB9AC64108;
	Sat, 16 Jul 2022 18:48:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05585C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 18:48:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 p26-20020a1c545a000000b003a2fb7c1274so2415471wmi.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbvtEGsMnEuUqxalVZhu5nqYG6ItmLh575xNRmd1EY8=;
 b=GPeiZoczfDK/M7OA6cgPAdDEQuy7q4oQ4/J0Jx+QD9pT2oclHHBVr8Lz1ShjwExYaF
 YWjfhslIg1G1XIe1UJLW9PzeAeBFxjz849F6WFNrnRzxOaZmOX/3xgMsO1rXu2YNpw1c
 m2oPJJPFnjC1cCZ4tJqbCAdFUgCaDippl5q5h9uKkVk/ARzxtQthiIADCrN7KwijKqVx
 ZLngAKi/21m3hyGJlfhFgRbqh55LttD+4GPrQlM/rWRo1bw9oEtGMWuxbNBB5s2fKbk3
 korWpZ54MDYm8eZHrd/jE7O/cFgfTdjczol+2/fF/p3NzpevJ/bkyVLeK3VukOqjoV8V
 X8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbvtEGsMnEuUqxalVZhu5nqYG6ItmLh575xNRmd1EY8=;
 b=rq/HU/5AENdLFbbX2LoCbgSWOJ6r+gUp6d6akKG5OI3/KKLDh2qbn084IxK4mWaUKj
 Uaqqisg2KrUZlGLSDz6z3wzRmD3a5O4I+b5klG7yi2XFUk3E/xse2q2+MsihEJ84rnwL
 2UiCu/TcbaVN7R7sN6G4dDNJrJDUk3wXFhqJcUHVI4dwwzVbyqdRCuTIWCosdtbpyaUG
 dCrmqfWxQu/1zgAhaCfKvR2wvmZb4PEyGm5NOnyIXhHGXH5+H9yAOuz/Nj2T1o48JI6T
 Bfp1NT92sVXBeCCibN4IF3gk+Itd9P9hWfUtAwvfW9LsDbImjT/wEHnqMlAtXxT/2Rrp
 YEWQ==
X-Gm-Message-State: AJIora+AzY8cVP4J53X53MGFyIMiVcfqiamN8uim3/ECXMyogPmoK37g
 YelORO+RdwYbfK4xNjSUjpc=
X-Google-Smtp-Source: AGRyM1vp2hOuXQMemE8ele8pYLWZe5OAq75JOZbJjs6K+cujKRd6tR/8rnpOTd/sTSJ1znaSXShsVQ==
X-Received: by 2002:a05:600c:34c4:b0:3a2:e259:925b with SMTP id
 d4-20020a05600c34c400b003a2e259925bmr19241509wmq.99.1657997280501; 
 Sat, 16 Jul 2022 11:48:00 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 u18-20020a05600c19d200b003973c54bd69sm13649961wmq.1.2022.07.16.11.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 11:48:00 -0700 (PDT)
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
Date: Sat, 16 Jul 2022 20:45:33 +0200
Message-Id: <20220716184533.2962-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220716184533.2962-1-ansuelsmth@gmail.com>
References: <20220716184533.2962-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 5/5] net: ethernet: stmicro:
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
