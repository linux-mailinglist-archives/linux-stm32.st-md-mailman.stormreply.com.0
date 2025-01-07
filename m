Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7CFA0391B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 08:55:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AA80C7128F;
	Tue,  7 Jan 2025 07:55:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FD26C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 07:55:10 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-216728b1836so201915285ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736236509; x=1736841309;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fMRSb4dnSsNjNB0J5PZBlf9Y068CCmYN8ovILPTjdbA=;
 b=A0SapOGKiJ/CqJ2fLa8f9f9ZIC3mKVqn5abg7kah71YU50T9M4PNlrCIxfFG/S3dHC
 OOIrMfRZjSwpGm5zfW1+BGyQYSTtWZ8UF209CjIan9BruoPOquDUbcN+DOD0lDoPUbwR
 C4lpV7EBox6TNhAM4KgB9XmRSTWMf0kjxwxD3oAP2D1n0Coss+aki13eEYnSMvzwoUiO
 uVCIoBWs4cMZCzwqcg/V6RuStXfIdUKAuZ+hkVz4n5tbYEr0TzJXcTSmJjEWeme4pJID
 txHyaMhCg1zi9i2C4tODCCGenaHgFW2d0PmL2OlJ9Z8hRqL5HQ4xhflUdd28OUtbOzqH
 OMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736236509; x=1736841309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMRSb4dnSsNjNB0J5PZBlf9Y068CCmYN8ovILPTjdbA=;
 b=nN1gr6leuap8QjhU3OwYWoAo7CxVv8Jxk/E4NW6xNkuGuxgCbLrWvk1QftwG3hmWES
 +Z2Wxkwk/lSlQrIIiD/UTA/fJ3NuZzla0QjLu8FM+ATEyR+T9081ve+RIl/xOpObsf5f
 wY9J07iUV8dRkuS6MAmbUAg30KS/fJZRmToGw6+wymxcLMjpG9w2vd+nDFWMKabR1IBV
 BF3Ov/Zk8rPInbiewefMdvT0bO3wbv5F26Zz/q24ohYgfdZWYx61+GVGhR/tEQ+LqbQT
 FbuolOmwk9NpzyDG1sLZIYuwKklS9A1v+a+tBh7MHKwXurY46TdeFcfmuNDFzG2V5muF
 ocrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj8oInhnt6FCcVwv2++poKRHAgyRaT+16KhczNhC6W23GNskmoyMSG03WxPqA9Ts4qEobL3ECgOo5qWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhCKh0uHIsmEdFwwQCEY8zUJfwNYY+jRrUJDM8Z6lPVxCqUz0s
 BLnGNzIb3zOns8j8gPFqeM+xbYLLTY6+ckb0zjZSIKiY+WirrZ/V
X-Gm-Gg: ASbGncsAh3KnTxCvhCdPJtMQS3wPaQT6W1HCoYm2cLbVu9017DaBjhOxJeCZXguUGDq
 El+zjHvBtg8BvTsqr1X9duiijeF7fIzMR0WHiRhWC94ahl/yYZt6dYgsG3XOdShryyLo598gRAA
 oxWvm2Oqf7QdiL+ngVmZXiEgGxwibNNHI8aVX7z4nqH0QzMk7A3zRDJKrdz+j15Kb8ezk7Drq5D
 3B51T/U44oDVUfQrXMuUbui7P9199mq9ga9Z2TjAQaDtp+NBTdVyz7l+79Rq9R1A9A3nQ==
X-Google-Smtp-Source: AGHT+IHTiLKTTvGlPvf762xL6WD6qZDn+dCSTlEUSBZ2KuE+CZ/5XDACbnpOBQG5E+loF0NezMfxjw==
X-Received: by 2002:a17:902:db11:b0:216:282d:c69b with SMTP id
 d9443c01a7336-219e6f4312dmr754512945ad.50.1736236508633; 
 Mon, 06 Jan 2025 23:55:08 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-219dc9f7e49sm304468635ad.217.2025.01.06.23.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 23:55:08 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  7 Jan 2025 15:54:48 +0800
Message-Id: <20250107075448.4039925-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: Unexport
	stmmac_rx_offset() from stmmac.h
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

stmmac_rx_offset() is referenced in stmmac_main.c only,
let's move it to stmmac_main.c.

Drop the inline keyword by the way, it is better to let the compiler
to decide.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: Drop the inline keyword (Andrew Lunn)
V1: https://lore.kernel.org/r/20250106062845.3943846-1-0x1207@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 8 --------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b8d631e559c0..548b28fed9b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -416,14 +416,6 @@ static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 	return !!priv->xdp_prog;
 }
 
-static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
-{
-	if (stmmac_xdp_is_enabled(priv))
-		return XDP_PACKET_HEADROOM;
-
-	return 0;
-}
-
 void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2f518ec845ec..24cc39d8edbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1315,6 +1315,14 @@ static void stmmac_display_rings(struct stmmac_priv *priv,
 	stmmac_display_tx_rings(priv, dma_conf);
 }
 
+static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
+{
+	if (stmmac_xdp_is_enabled(priv))
+		return XDP_PACKET_HEADROOM;
+
+	return 0;
+}
+
 static int stmmac_set_bfsize(int mtu, int bufsize)
 {
 	int ret = bufsize;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
