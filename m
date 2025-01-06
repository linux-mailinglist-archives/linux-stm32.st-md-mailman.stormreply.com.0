Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59CA01F32
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 07:29:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAA5C6C83D;
	Mon,  6 Jan 2025 06:29:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B31CC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 06:28:57 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso20247865a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 22:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736144936; x=1736749736;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tYngp+0tGgTHKQ6I1Sn7h1pVz+z67CiGfUZ8/I0y7MY=;
 b=TQgSD5tdbrny4r24DkofPSiZupQ1jf2hYbv2J/RX+RLec8KlZKG+EfnFjgvHyFkO09
 xpUtFFce4VztVVF5lEo2T+UwssFPIEM3q9MijtA5h3LCfOwFY4rhkM2WjVf+TF/FXSha
 LulGKJyopRpZhS1kgcxTR++luVWl4ZjeP6YzV0A7Rd5mPAIJN7W4awq8KTC2P/48IG6S
 LzLgQdXxjMivh/ZuFc63RVe4LfsmNgxdv6SzgNBP/evdI0GrCTSNLp9jT9hGtP9/bS2x
 Dyb3blvARwkNHsRG6YTmI7nmOzi+GuLQQXuTAgXtOlDq+j7SSl9eEIgDt3PR6qm0YRyZ
 Kzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736144936; x=1736749736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYngp+0tGgTHKQ6I1Sn7h1pVz+z67CiGfUZ8/I0y7MY=;
 b=E8YzprcCtJsXUU8RXQocCID6y2EFA7F9fF5b3CsvRlca3dkKBjkCaIkgoQb4iBG74D
 3LMaivIQh7Ztb+8qQEtnztplpuqtZCtAs0HYumKSZuQibHH/2gkPf9o4vlvavY9DCWPL
 nXr5jgTBC65rswH+o4dHqKuRviRcYak8C8XHqy2L7MaTZxBlbrkgkKTH0tcGDUUmC1kq
 JIIo6ySJeA4VtaGOhjfXC1w32H7qYUHL6E+YDBrogEEneXp3PgquytDgAAM51NzBXT3J
 15YXXQesY64CkdO2jNMFk/Zr8A7JlW+Bz5K8ciXHbrgFNK/uTm5erokp5zVtTd5xb4YL
 xJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULjC5y6L6JqRa687bCeJzPmJa6pbH4uNkqObyS5kTfgRHOLZnL0al+xB+O6HwiCN+W4P90uPQ9OFcbHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw00LTwsatZEfKqa12kZiNPEXx4XTJkzX9Wx5rjilMZA5clgw2j
 eX0jVbUFCMw0ciPhmMSvLPwyl8iauACZTm0ox9abFJ4sxrxWkXry
X-Gm-Gg: ASbGncsdzgPqOfGpaUTRTs/yTOHOHFwSMFsZepv3PFniCptRzegbCxgQ15s23dsHoQ1
 n/eJ1AakSJVysldwjrCCKji/g4Mt3NVsYYd9jJY4YaR/7j8ik7zFbEtYyRGn3DxohXtZjSaZDVF
 y7HpJLFe/DPr92rPBdRmcs4OJnR6O6sevdDyWUye9YdqQeQFk5qhoZYu14z6pEuUKwwuFARiMTn
 Flr0u7WoiDnANcVFqBzPd5jXAiw8z7FZNRWh/w+QUUgG3v4Nx65nyZMAO+iOvOiXlHlGQ==
X-Google-Smtp-Source: AGHT+IGuTNnabIlYRQUcGvQBWWJUxIneQ+plJz0/THIdtZNbQlkm7E3w2PkIyku4BmKuXXI3eBVv5g==
X-Received: by 2002:a17:90a:f950:b0:2ea:5054:6c49 with SMTP id
 98e67ed59e1d1-2f452d258bfmr101856874a91.0.1736144935767; 
 Sun, 05 Jan 2025 22:28:55 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed62cddbsm38807091a91.15.2025.01.05.22.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 22:28:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  6 Jan 2025 14:28:45 +0800
Message-Id: <20250106062845.3943846-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Unexport
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

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
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
index 99eaec8bac4a..37b21d2d6f4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1308,6 +1308,14 @@ static void stmmac_display_rings(struct stmmac_priv *priv,
 	stmmac_display_tx_rings(priv, dma_conf);
 }
 
+static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
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
