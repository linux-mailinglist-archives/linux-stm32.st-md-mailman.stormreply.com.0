Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AED866E92
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 10:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46865C6B46B;
	Mon, 26 Feb 2024 09:34:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA94CC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 09:34:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412949fd224so13331095e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708940048; x=1709544848;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yLtF7BizwZvfZN5GuZUignuLCSNDd+sax5JxYiM+LhA=;
 b=mbcsJB/s1alUEsVi6ICMtSs+p4w6d9cTWYkVtj01aw9jbD4LIGKrP8k3Qgc9YcYxuw
 eFg2ozap4NMQ5OFpPR3rFRGsnZ7uXuweWtfcE3oec87TFyrIUuDU/CntAeijmUmv8OWa
 HaQnDQjRqt+GgpgiVPodq++JjA+nZt/hVF//4B4yiabH4TihM5JpPTOmRapKgWLsNgT6
 Y5qaOPP99OlNjvTVdSKTDgWib0GhNMY9dn/nKNuzf4Z+sM3Tk320DwOTYuewcZtL5sIe
 1FiadTO/qBMusevlJiTEdrI4RBgb8mWLmJSt9LPXAcQaHSnFaKmfeJSq+GltKclYRp63
 QItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708940048; x=1709544848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yLtF7BizwZvfZN5GuZUignuLCSNDd+sax5JxYiM+LhA=;
 b=asmRkAM6tUEOXfFdIym0T2FOKxshi/qUFncPnHG3z/OV5XheSTuDjmiAPrx5HCwv0E
 fftWr9k5pHEXjjed6RKelMaKutO3LPAcjvboK38i2mkSVjl75Tltprmc8nGFty5WlIjh
 3Sz+SpjJZfev65B2H/KKbMRxtS0aJ2znz54Jm/lpPL/BI85FLPczFXHcS8jdsq+fT3GX
 BF1s2Q53yzEzOkTbJxmklF2eTbP5+GF1n3blLaus1VRAMRhae+TdTMxKuhOGt3Jo0ys2
 hyKiwNP24m3EHMG/JZC8l00xZD15nbGhe/J7i56k8pGcoej9/CSnE444qkUynWgVXQax
 9uIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF9ZDsjB+QbRaXAh6TNr1J++h1d25kvBwXdq6pzVy7w9fsaU5vWEEDqbRyP6vy4kBLsrPWF3PIoplFG5vxg0X1myOXP0EnSjF5T6ngCPjk+FFfbyJjOwhF
X-Gm-Message-State: AOJu0YzEakwapYzpVSPOGovNajKv7MPo/iStBiyHHSha0fpb0+NZPIy+
 mSmCwNPxqnVVBk+iufbPpjh7x3x6K4Aig5BZo63AAVO6UkF56Q59
X-Google-Smtp-Source: AGHT+IEi6GB9us55+eZ6PLrMscsWzljtbO5rOv8g03rm2DGHxEr4TSML+Pwaf/AFQXl8ljBVN2nDEQ==
X-Received: by 2002:a05:6000:1752:b0:33d:3cd3:5ffd with SMTP id
 m18-20020a056000175200b0033d3cd35ffdmr5624541wrf.22.1708940047938; 
 Mon, 26 Feb 2024 01:34:07 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:a92:c660:e2e4:db7a:f447:614])
 by smtp.gmail.com with ESMTPSA id
 bj20-20020a0560001e1400b0033db0c866f7sm7749527wrb.11.2024.02.26.01.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 01:34:07 -0800 (PST)
From: Piotr Wejman <piotrwejman90@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Feb 2024 10:31:44 +0100
Message-Id: <20240226093144.31965-1-piotrwejman90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Piotr Wejman <piotrwejman90@gmail.com>
Subject: [Linux-stm32] [PATCH v2] net: stmmac: fix rx queue priority
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

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 42 +++++++++++++++----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 40 ++++++++++++++----
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6b6d0de09619..76ec0c1da250 100644
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
+	
+	/* The software must ensure that the same priority
+	 * is not mapped to multiple Rx queues.
+	 */
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
+						GMAC_RXQCTRL_PSRQX_MASK(i));
 
-	value = readl(ioaddr + base_register);
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
 
-	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
-	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+	/* Assign new priorities to a queue and
+	 * clear them from others queues.
+	 * The CTRL2 and CTRL3 registers write sequence is done
+	 * in the way to ensure this order.
+	 */
+	if (queue < 4) {
+		ctrl2 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
-	writel(value, ioaddr + base_register);
+
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+	} else {
+		queue -= 4;
+
+		ctrl3 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+						GMAC_RXQCTRL_PSRQX_MASK(queue);
+
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+	}
 }
 
 static void dwmac4_tx_queue_priority(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1af2f89a0504..7ad73e1d353e 100644
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
