Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDBAC43B6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 20:30:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 098E8C36B0F;
	Mon, 26 May 2025 18:30:14 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6BA6C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 18:30:12 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-861d7a09c88so43712639f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748284211; x=1748889011;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=WAogWVieMJyxo/dFCGJtS0J4GR4vYTtMIdHClB0Uwn/IXAhyfGMhH4kYy4yWF4k5q9
 4wvwt54HJgbccZkOyYlZ1RdLieJ45vxDTW0bV1ndPLKtW/LKqfABHfmvmWxDistipKWE
 UOAh6pIFGNrp24aR3Max0kgas0ceO0HthxF7h6FdwlW9iZDWdZ3W8zDjrhK+x8wqP6zg
 K8M7psCMRIrJWqPG0LtmITiwaR4IczpqSDB+Lw5x6yNl8hjKhYowH1gOv+T2oS3SGqN3
 HWpPJcIoq+LGGVVbBUyp+uYwFdH8tqnduQHLNawFvu6iYP4YrywowpcNwA4TxOlsU+k3
 zxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748284211; x=1748889011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=Yq1NwiGZo1X1GJ1i1L53qHqL+hyJc0+FxiLPGCtBTmcRbsrkW+6xPan8pCeoQ1Trvp
 66w77FkzAD//PaUEjkYvlDUJWVM+L9PB/L4hCp6geIeXRdI8a3uBCTwELarm8q2DXhXs
 TFwa+3qpyUlLN0Zzli8BNi6RrGo4bu0rLPqaoS3cSIaUQA1Dvo/P528DHOR4v8wGVM5u
 TwlxkYQWtXWXt+t2jQaGkhZA+K3mIx7UNoSdelnEgOQZ0eQLqsJim1TVdwqFeWyUs2t1
 rFmQR6RcMq+KGYueQDmcw2wVNZfu6AM8vLaGL9GW+9uJtRm27JPAgEFI+YWf0S2XCvOM
 uTJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgajHdmwRkBbkgFyvgwmt/v2m3YM+GtGb/1MbnDURzHTjYZiVet0SYbMrUHiFpVFjveyWkFKB6OQEMWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyq+sI2ekD9oTYHNSGFQfH1tYvyz1QvMaNBn7OW8zWCLVaIsmPj
 LGLjhjnEJy7LKBMI5vSP1RiigJXTQ8/qs2DRaJUqXi1oBdhPg/LIsO2y
X-Gm-Gg: ASbGncs3gAr+UGXm+9r234RuZis4o6OKVaEdwSNtAVs8T5Yzb9pDANNLIeYGzS7hxRn
 cH4IpTbZkLhcoI6k1COGUlze2Ug0uv9WnJR6qXTVI33Yw1HbzT4BWPQbaXefuRGOV65dqYN4+Td
 yzXRT9ylZGq1r28DgUk5BI7OqqU8V5v/SkFLo0GPJjUDeFW/HTuoGRu5RyWGzRRsLw6dcQnWLTO
 xMQZKcPVQKXUpyZ+sp13lbeczEkR55oZi7efSM/B2LOthoovV4qCcdhq/z5Nr3hZWcDWS9w3h1O
 I2/yTdMCkE5Lz1ZY4/jC9bOjgKzqbcrZRxTID0feIVStzd8ZRaxh9cczOXNNR6/QwRpd9iX/ZEE
 np0FWMQmKgJpfJxZwZCJKnl3hpa1pVA==
X-Google-Smtp-Source: AGHT+IF1vt1ugwCJCcgD8FLb9pLv6neLoJcOaXY12NIdGkKI+c6RUDeQIjiCz+L7fEf4ThkwNMlUxA==
X-Received: by 2002:a05:6602:474b:b0:864:48ec:c312 with SMTP id
 ca18e2360f4ac-86cbb7b86c3mr1087224339f.3.1748284211399; 
 Mon, 26 May 2025 11:30:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 11:30:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Mon, 26 May 2025 12:29:34 -0600
Message-Id: <20250526182939.2593553-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-sunxi@lists.linux.dev, Russell King <linux@armlinux.org.uk>
Subject: [Linux-stm32] [PATCH v1 1/3] net: stmmac: allow drivers to
	explicitly select PHY device
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

Some devices like the Allwinner H616 need the ability to select a phy
in cases where multiple PHY's may be present in a device tree due to
needing the ability to support multiple SoC variants with runtime
PHY selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 59d07d0d3369..949c4a8a1456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1210,17 +1210,25 @@ static int stmmac_init_phy(struct net_device *dev)
 	 */
 	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
 		int addr = priv->plat->phy_addr;
-		struct phy_device *phydev;
+		struct phy_device *phydev = NULL;
 
-		if (addr < 0) {
-			netdev_err(priv->dev, "no phy found\n");
-			return -ENODEV;
+		if (priv->plat->phy_node) {
+			phy_fwnode = of_fwnode_handle(priv->plat->phy_node);
+			phydev = fwnode_phy_find_device(phy_fwnode);
+			fwnode_handle_put(phy_fwnode);
 		}
 
-		phydev = mdiobus_get_phy(priv->mii, addr);
 		if (!phydev) {
-			netdev_err(priv->dev, "no phy at addr %d\n", addr);
-			return -ENODEV;
+			if (addr < 0) {
+				netdev_err(priv->dev, "no phy found\n");
+				return -ENODEV;
+			}
+
+			phydev = mdiobus_get_phy(priv->mii, addr);
+			if (!phydev) {
+				netdev_err(priv->dev, "no phy at addr %d\n", addr);
+				return -ENODEV;
+			}
 		}
 
 		ret = phylink_connect_phy(priv->phylink, phydev);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
