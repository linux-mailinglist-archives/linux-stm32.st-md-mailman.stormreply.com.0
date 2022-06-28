Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6355BCFE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 03:34:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F819C60465;
	Tue, 28 Jun 2022 01:34:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C84E5C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 01:34:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id pk21so22697477ejb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFjFynZy6Y6LV26469hAz6HcHpk+ATW9nFKisizAaS0=;
 b=HxBQCz+7pRrd8vYnRhzxjsYUhYVbh2740UtczLVj5Qadg66MxqD6v7B1UGENMsXSIh
 NZ95KoNdnEnToocmddB8hVQm3umvd7EQ4umzgQcF+7ZKMGvwj21qIm4vl50UEADmBO8W
 z/n9v0ZYxB6fIIjOLkTK7wQB9KorIFItL/CT/BUqj8or+kBD0Nu6JTxuVmz9x5N9Wrd3
 Xvxps116OsXXejOkFAw3yct++Gvjy8/h29Uqxo0JpQx+hftir5R5vHETuPWv2Xepgycf
 2xEUyuNHXxB0rkSuRMiahmG8E7kIlZRTSqiNp3yYJc/aCPu7xpb21I6Fji6+dgEIKsTG
 NsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFjFynZy6Y6LV26469hAz6HcHpk+ATW9nFKisizAaS0=;
 b=JMoXMfHwTewpWUJKdcnkQ+rKv8UJ1OhE6LtfX5vh5MgII2Ji9jkWt1AyU70fhieP2Z
 fgIn16H3TW1Z1r39GXWYdhVY3EYsacKr20W3DR6XAa+aUAU2PedlzhAlk8YK3VsxFY4p
 Rbch5uu9ka7qrngyMJTQPNx9HbGB4cSJxNnF+V9dxVqppXNUMI6ucOubPUp+p48U4LUF
 RUnVkbEzfx5ZGBmCqDgCh5jSTej+Sl01hNIEHWkHSuMfR0B7/GMr5MAatBT049YCXRCV
 vttFy+Ubiwz5iKxdUqNju51Jgx3975IzRFwSnwLJQ7WB4I/abxAObkIF7GkQxM4m9h8C
 QRpg==
X-Gm-Message-State: AJIora+EugVs5TLbGIwQh8/HGuVEMBWvgYSL8Hwfcim3DcLCLDMCDMN7
 K6ta6Pa5qnbHVD9n+rhYcE4=
X-Google-Smtp-Source: AGRyM1uPYb3BGEYytx9I9d6gFT5JgkCfrvivXpMHCUnwEbmD4KdUhvJMfNpU409V+fTN58hTaPKq2A==
X-Received: by 2002:a17:907:7251:b0:723:dc32:aefb with SMTP id
 ds17-20020a170907725100b00723dc32aefbmr15069172ejc.91.1656380051539; 
 Mon, 27 Jun 2022 18:34:11 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 x13-20020a170906b08d00b00724261b592esm5693492ejy.186.2022.06.27.18.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:34:11 -0700 (PDT)
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
Date: Tue, 28 Jun 2022 03:33:42 +0200
Message-Id: <20220628013342.13581-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628013342.13581-1-ansuelsmth@gmail.com>
References: <20220628013342.13581-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH RFC 5/5] net: ethernet: stmicro:
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
index 330aac10a6e7..2e08be895cde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5549,18 +5549,15 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
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
@@ -5572,8 +5569,27 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
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
