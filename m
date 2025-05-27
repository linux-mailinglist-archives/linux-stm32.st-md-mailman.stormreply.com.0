Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B9AC596C
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 19:56:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F92C36B19;
	Tue, 27 May 2025 17:56:33 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE3ADC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 17:56:31 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c58974ed57so344065285a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748368590; x=1748973390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=IPUtRZCUnFZ7fKGOw1Jpk2HWn1qQCq7jH3D4oTNvVwdo3VBn0PP0b9C1K8oVGSMS7L
 gHcL8mjbnO6CbKOk4QGGg0SwH0At9HTDvCF35tT23oM9/Lq3qV9FY9/flTdNWbMkjxEv
 YfAekRt2mt9dHpx4yXHgGzGflogLlbbt30YVsPFQR5HnJZmGPL7Y48RJGrZPq7l7pl/z
 RhBGIHlkhWe4prPqPu+ZlN95uHPKyx4Jg4rhfsJsP/4sDtFd+c7AAJ2bjHAysCWqjh/l
 TM/Vjyfr+MTkE0nl0jfxesqVhYXce87WxZd7FykMrg8nIM8oAoZphsPxcsWRFsAUufYM
 enJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748368590; x=1748973390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
 b=ECQGHfK6jNrxCOqfMl/Zdu+xhjCCF3is5sMoT470g/Sq1lCK6bd9Rd3yTH3BX+6STK
 pJ2JWbIDrmqtypeKlvnE3VL5AI/N92DNO2bwM5+9OZjD3yrY//ff8nk7bc9BxuP5F9k6
 Lt6uGsZTp6yLMsJfCpWC/RzHDGh/cqdzvm9iSrmncoHXQyNjG+gr2dkDsUOaDt6AIPvT
 bwYlUVFEa5vnZanjckMx2AVN8rd+wlnGW7PmbJKgcpGCM1Gz8UG67PkB/Drt1l53RDJk
 PIM2dTCCoB1a5Iesn48Ytw3tR2mDv54gywVI5fJuKmTTspMcY0TfXOUZaj+HbG4Fh2So
 QUnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUDvy3MfZeuzDfUVn335vI132t72bbMk759o0hachhkGoxYn1DlBCL9XRJvCc4halljRbBu+TyhBXDMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxE88e0iWGTbNyVnG4sp3pePLXia4MU9AUqf7u6c2HQQZYuBVyG
 7FQ9n/4jZFV7uQuMwlez3DGrejx6YBAPTSIgaxvZi2Sx3fDMKs8CkeCk37om+Hi9T1A=
X-Gm-Gg: ASbGncu5inAg/4FkTuaMuMef66/gmSCpw6pBTD45arOR9xVwCS6uAvpl1Hk7CgoZCya
 fqkD6d7j/vYyIIgnwjZeU0JLgXjKA4+wY0kMvOn3dGCm1nlfzi8BZjE2Wi64962W4wP28ophLoj
 6kRbiA8Cy7Z642E4gJRfZMNAei4Etj397syfmGhT7CqBbk1u6Zpe1FsmBJN6i9QpnWaWtpBVlnC
 x1XaPJu+TnVQjT+0r6/dMRTHM3CK2+Gg09MP4SF20RTFP5mUATv6d4smm2ta3oP+vQYiGfXpDC1
 hg6d3O6gzN18gjrI2oZOX7KzpM+IQCkaf60uo/f4FNfcpFleRkOdnozT/rR427mBA8Uv2sQpCHI
 3LvQM3TzQmwU6o+cdXF6CTIjHyCSmxA==
X-Google-Smtp-Source: AGHT+IFLIO0D64jUevJ/lz7zQvSZw2ntrY7H7wTTGXZU+ByFDYJ39AXVKInapU4LgwZEqDykU4orhg==
X-Received: by 2002:a05:6e02:154e:b0:3dc:87c7:a5b5 with SMTP id
 e9e14a558f8ab-3dc9b67fdd9mr138337085ab.3.1748368579606; 
 Tue, 27 May 2025 10:56:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:56:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Tue, 27 May 2025 11:55:54 -0600
Message-Id: <20250527175558.2738342-1-james.hilliard1@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
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
