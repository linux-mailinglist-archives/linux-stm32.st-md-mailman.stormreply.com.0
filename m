Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E196F6BF
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 16:31:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 157D3C78018;
	Fri,  6 Sep 2024 14:31:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3BD0C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 14:31:24 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-205659dc63aso21018065ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725633083; x=1726237883;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRhWJrEYy3VMtGEOiJyga7bTazzfIqhRdV1t7XTzZag=;
 b=DdxeYmAmGuOLGuGStc9s+P4tSVT8FIlDiKnMsE1cR/ufLv6g4olt7E+T0Fi9t+av48
 RQIliW33LP9curx2VVcRNUQr/7zaT1smeWEbv68JRoHpm6Uo/OkVY0icQihtp7WW5hbP
 4DHKxFt/pt86V4MN50iJJs49FJflweqMiz4xt62QeRHqeaksEN4PUhWSiXTb6USa8Nb4
 QGNWrgLEa2ZVHncM0NXbLEM0JaT/PxhluZ6cvCXFezt4Px3ZKouy+1c7+6EW6xauq9lz
 9b1caCGpKokExQ+4h4Y8DrerHbc6dzMvc+DusreqyOYVvk4wWCjhdwTAzBI+YbTjvDuj
 FwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725633083; x=1726237883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRhWJrEYy3VMtGEOiJyga7bTazzfIqhRdV1t7XTzZag=;
 b=BDTeGU/nFJiPXsLNnrcQ+7DQAtIz+JDuQehM522gqP0GZWLy2cRSlFPBNx6Bm2Zvgy
 XqstJbxRwiu/EHjve+q+q5Fax/IZd58uoGo+99K/XHzwbRcnWNJwfDPCnimfLxLH9NX3
 38Y8BtJWOfn+7nlEzmhT5TYEDiXct7EbOrXtKyA/yaZ7mJtm9mAyCzstNND5lBtcB/Ty
 bkgJZXwCx1LwkEX3cKJO+3TiywtGR3iufEKWlLihTZoxxW9Ug+B3AbALa/hxuhdAnxaa
 Z/VKgQhYXl1w7KrGdc+ZefgQ5m3kHzz132+s+kMUWUBN4CW8X0g0rSdFg/Tct0EdMGek
 9LvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoFl2QdyAE6nuoqLGypT+epw+HRwszAW2r0S6ZZRYWLHHHsgo8OWE2J7g+OPFZlI9P6x9IXe50+dWEiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx80rwfLrIJ5G+/Fk8km8lbe9hl+rSbVZA5FLpnTFO/rYykrs46
 bg57ROsatbq5szc+JtKnX/qkp3j4iMmaV4T3Tx6CrHSirOKWee6/
X-Google-Smtp-Source: AGHT+IHD12G59ybspMl52ExP69orF2krTF1ik13xLU72/3C/hDwxeZAUZl2YwzBjT9cjXIzWG8GICw==
X-Received: by 2002:a17:902:cf0b:b0:202:3e32:5d3e with SMTP id
 d9443c01a7336-206f055d122mr30488055ad.36.1725633083271; 
 Fri, 06 Sep 2024 07:31:23 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-206ae94dcf3sm43951975ad.80.2024.09.06.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 07:31:22 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 22:30:12 +0800
Message-Id: <39943d7967f291674a97ef0572878aca273087e9.1725631883.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725631883.git.0x1207@gmail.com>
References: <cover.1725631883.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 7/7] net: stmmac: silence FPE
	kernel logs
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

ethtool --show-mm can get real-time state of FPE.
fpe_irq_status logs should keep quiet.

tc-taprio can always query driver state, delete unbalanced logs.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c    | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index ab96fc055f48..08add508db84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -620,22 +620,22 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 
 	if (value & TRSP) {
 		status |= FPE_EVENT_TRSP;
-		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
 	if (value & TVER) {
 		status |= FPE_EVENT_TVER;
-		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
 	if (value & RRSP) {
 		status |= FPE_EVENT_RRSP;
-		netdev_info(dev, "FPE: Respond mPacket is received\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
 	if (value & RVER) {
 		status |= FPE_EVENT_RVER;
-		netdev_info(dev, "FPE: Verify mPacket is received\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
 
 	return status;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 05ffff00a524..832998bc020b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1067,8 +1067,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (ret)
 		goto disable;
 
-	netdev_info(priv->dev, "configured EST\n");
-
 	return 0;
 
 disable:
@@ -1087,8 +1085,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
 
-	netdev_info(priv->dev, "disabled FPE\n");
-
 	return ret;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
