Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF386F6A3
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Mar 2024 20:03:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAD45C6C83A;
	Sun,  3 Mar 2024 19:03:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3924DC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Mar 2024 19:03:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-412d501fb96so8958265e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Mar 2024 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709492623; x=1710097423;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Q6tqq+YHMrtRDD0QwVDNeMhXDLukwoqe/1azYB8u5U=;
 b=mFd1HPyz4oR+4nKgAcEuMldDuIYlcT/YKf7LGN6F5fLeQcmWPzqsaY9kKPK9HH8D6Q
 GlTtJmX8aqoXve26jun8M+J+9CbsRutBzSHunQydiJuy1h38j4XxJZzY4fwEXNnk/EZO
 2Ba7CvJSqYZcompEMpRI9TpSEZ56D11k0fVXLN9MuqMgym9cljv5U/Yg9NkDUzME+0hq
 03tLObqo4FlHdKwxuVbrySTNBUwB5T9EDR7yDgtMpJ/TXTvrx95JIvUe8jU4X9DKCgLT
 qF2zpR2MfDdoWdFp2pFmV2/86RJpYOZjbvY1jogaUbkCck36sfNV5v2s2Ma0SzQpJUo2
 +fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709492623; x=1710097423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Q6tqq+YHMrtRDD0QwVDNeMhXDLukwoqe/1azYB8u5U=;
 b=hRRKpaWqRGIjofIJeVtD1C9yuAaCZBmbzo9ImZfI42bzw3trqKrGyl60f6bDXEuap0
 IYEq135EHrTcIo2T5n7H82Mywbo5lHdNXRZ28aKG9vZzKjGxyeFhYZjvneD9QTlQ/8YP
 o5P9FDwCzfptkfUWMeHSYlKkWfdOKhkLMVF/d9HOja1pS0lZHw45m2VcF1qHnesOnSJK
 68gsofcAmlmc4qh25nTjRg8hHV4PRQbElo4hwYLzVbkvN/7KX4T71rCE09um0GXUg5la
 8wgXOZuWAP/0Y/3wYuxnsdUg8QFT+Hsf+o1dMiig6ukANce8fOJYprs9VUkchoCbupuR
 r0NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY4LywxyMAhkSiKqj0IE89yi9mMdXxq6/owHndYkqByyeAKR7KxtN0YaXwLmqHt0f7hjztisdfHSVTIP11I3kAEG1AVZnuYer4w1MXkbFhSLmPOYmPNHXN
X-Gm-Message-State: AOJu0YzipSvLBU2PPAC/nxsKBuaHF+9IvAFUVdKlwb0FvCmArB+NO/R4
 n9bV7RGDMe1Xue20QjY7MveTDz/Yen/JVGmvAY05wO7NlK//0Xkt
X-Google-Smtp-Source: AGHT+IGg4+GTgKpcocRSHWqddDrc+rrpm/34o839Hkj+OJRCyujj5Z/0OpTcDzfW6PMDiFO0ZbZYoA==
X-Received: by 2002:a05:600c:354b:b0:412:bca2:1680 with SMTP id
 i11-20020a05600c354b00b00412bca21680mr5891715wmq.35.1709492623332; 
 Sun, 03 Mar 2024 11:03:43 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:a92:c660:e318:3b1a:c27a:9905])
 by smtp.gmail.com with ESMTPSA id
 fk6-20020a05600c0cc600b00412e2ccdc97sm1265674wmb.17.2024.03.03.11.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 11:03:42 -0800 (PST)
From: Piotr Wejman <piotrwejman90@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  3 Mar 2024 20:03:38 +0100
Message-Id: <20240303190339.52496-1-piotrwejman90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Piotr Wejman <piotrwejman90@gmail.com>
Subject: [Linux-stm32] [PATCH v3] net: stmmac: fix rx queue priority
	assignment
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

The driver should ensure that same priority is not mapped to multiple
rx queues. Currently rx_queue_priority() function is adding
priorities for a queue without clearing them from others.

From DesignWare Cores Ethernet Quality-of-Service
Databook, section 17.1.29 MAC_RxQ_Ctrl2:
"[...]The software must ensure that the content of this field is
mutually exclusive to the PSRQ fields for other queues, that is,
the same priority is not mapped to multiple Rx queues[...]"

After this patch, rx_queue_priority() function will:
- assign desired priorities to a queue
- remove those priorities from all other queues
The write sequence of CTRL2 and CTRL3 registers is done in the way to
ensure this order.

Signed-off-by: Piotr Wejman <piotrwejman90@gmail.com>
---
Changes in v2:
  - Add some comments
  - Apply same changes to dwxgmac2_rx_queue_prio()
  - Revert "Rename prio argument to prio_mask"
  - Link to v1: https://lore.kernel.org/netdev/20240219102405.32015-1-piotrwejman90@gmail.com/T/#u

Changes in v3:
  - Fix trailing whitespace
  - Link to v2: https://lore.kernel.org/netdev/20240226093144.31965-1-piotrwejman90@gmail.com/

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 42 +++++++++++++++----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 40 ++++++++++++++----
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6b6d0de09619..a0e6d33ca87e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -92,19 +92,43 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
 				     u32 prio, u32 queue)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 base_register;
-	u32 value;
+	u32 clear_mask = 0;
+	u32 ctrl2, ctrl3;
+	int i;
 
-	base_register = (queue < 4) ? GMAC_RXQ_CTRL2 : GMAC_RXQ_CTRL3;
-	if (queue >= 4)
-		queue -= 4;
+	ctrl2 = readl(ioaddr + GMAC_RXQ_CTRL2);
+	ctrl3 = readl(ioaddr + GMAC_RXQ_CTRL3);
 
-	value = readl(ioaddr + base_register);
+	/* The software must ensure that the same priority
+	 * is not mapped to multiple Rx queues.
+	 */
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
+						GMAC_RXQCTRL_PSRQX_MASK(i));
+
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
+
+	/* Assign new priorities to a queue and
+	 * clear them from others queues.
+	 * The CTRL2 and CTRL3 registers write sequence is done
+	 * in the way to ensure this order.
+	 */
+	if (queue < 4) {
+		ctrl2 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+						GMAC_RXQCTRL_PSRQX_MASK(queue);
 
-	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
-	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+	} else {
+		queue -= 4;
+
+		ctrl3 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
-	writel(value, ioaddr + base_register);
+
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+	}
 }
 
 static void dwmac4_tx_queue_priority(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1af2f89a0504..d15752823d93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -105,17 +105,43 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 				   u32 queue)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value, reg;
+	u32 clear_mask = 0;
+	u32 ctrl2, ctrl3;
+	int i;
 
-	reg = (queue < 4) ? XGMAC_RXQ_CTRL2 : XGMAC_RXQ_CTRL3;
-	if (queue >= 4)
+	ctrl2 = readl(ioaddr + XGMAC_RXQ_CTRL2);
+	ctrl3 = readl(ioaddr + XGMAC_RXQ_CTRL3);
+
+	/* The software must ensure that the same priority
+	 * is not mapped to multiple Rx queues.
+	 */
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio << XGMAC_PSRQ_SHIFT(i)) &
+						XGMAC_PSRQ(i));
+
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
+
+	/* Assign new priorities to a queue and
+	 * clear them from others queues.
+	 * The CTRL2 and CTRL3 registers write sequence is done
+	 * in the way to ensure this order.
+	 */
+	if (queue < 4) {
+		ctrl2 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
+						XGMAC_PSRQ(queue);
+
+		writel(ctrl2, ioaddr + XGMAC_RXQ_CTRL2);
+		writel(ctrl3, ioaddr + XGMAC_RXQ_CTRL3);
+	} else {
 		queue -= 4;
 
-	value = readl(ioaddr + reg);
-	value &= ~XGMAC_PSRQ(queue);
-	value |= (prio << XGMAC_PSRQ_SHIFT(queue)) & XGMAC_PSRQ(queue);
+		ctrl3 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
+						XGMAC_PSRQ(queue);
 
-	writel(value, ioaddr + reg);
+		writel(ctrl3, ioaddr + XGMAC_RXQ_CTRL3);
+		writel(ctrl2, ioaddr + XGMAC_RXQ_CTRL2);
+	}
 }
 
 static void dwxgmac2_tx_queue_prio(struct mac_device_info *hw, u32 prio,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
