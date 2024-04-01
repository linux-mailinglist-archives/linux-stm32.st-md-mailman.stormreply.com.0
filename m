Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D142E894574
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 21:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79EC6C69067;
	Mon,  1 Apr 2024 19:25:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550ACC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 19:25:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so3251415f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Apr 2024 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711999521; x=1712604321;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lbATZVSwtVFCc38UdteT0WxrSxfowo8TkRKmuWEvy1c=;
 b=fTDFvnLavRxOPdP/9s4jlgKcGtgrB645Ih6U4iVXCsyzAyDU8ohpEMykRE+Oj2S1Mh
 vYdJQPLcaJEbnRX3W/m/Rv3//cZwbWgaDJyJ6bKaban+7KDT4OWpStDboJeetVhNKoNH
 bIsrrsxh8Z2Dg/N/RgGrpjIADgxHaXu5xDkhY/SZYGb2dUz0VtbTzK/EHAoEEyqimzoD
 mRiDvWsPj+gPli9YnzOmimEFI/GFvxNlJZ44KdzsQSLgflN/j82kuDNlYz3jzJI4c+UU
 cT3MSs4J26Ozw5O+vSMkIqxHJ9RmpaDbLiwo/tZUBD69cSZKXYfniO63zmfkc/wMFq46
 MvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711999521; x=1712604321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbATZVSwtVFCc38UdteT0WxrSxfowo8TkRKmuWEvy1c=;
 b=By8UcyI3EqU2xeKTptIhrSDEtltXti298Ja9ufPHogOUDf6EAMYoui/sASt8EYsycr
 wL3O8wPSZktoMF+uKOQAWZlSpcs9ZYiOjjNFnB6l4eFDxWtenSnCzLmn6w7dYYaNIprS
 0+dHRtRtId5+1rDF/HH2eK7apw6N23BsDDTOj8q6gp/VdwdAwnB7rhObM3xB88mSOM05
 I1b9lIfmRt1IwEff9bJ+LUcj4YOgUkPwev7sTbPaGpYYf2XYYqHSttj3vcoK0rLUadAa
 kKvqskzbDbDKOaA+B4ufmYdHk89vQ8pkzUkqfKENDH6+yK3jW0bPykPCL9XnBXla+zCc
 ft2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwrnlJ/uG7ICP7MKD/rsKLFjRZsszpVzji6F1LOgNzH51Nb4ZJZSndXk1Cl5LYtSwsoH7MaPZJOypkie6axGD1FPqMTCMJJXFYlVlO5kWAHIV4ULh6x9dr
X-Gm-Message-State: AOJu0Ywt7i6BiJ0bTYkHcGhJjOVoQ5g/Afgi/yJP8ZavKZQSgIH2FqHC
 LUqDW6OO9np9rU1iwVgVt8vm2taIdtzr1pbmeg7+WhxNm++ikMvI
X-Google-Smtp-Source: AGHT+IFKo0GgVDkY7Zy7nJekIuEkhWVnxNxEK6NrznEjLdMqIaCn/ECvU1iVX2nGEqSYcSNB4vTQvA==
X-Received: by 2002:a5d:47c4:0:b0:343:44cd:7d1e with SMTP id
 o4-20020a5d47c4000000b0034344cd7d1emr5650181wrc.17.1711999520491; 
 Mon, 01 Apr 2024 12:25:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a92:c660:38e3:78b9:48eb:4246])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b0034335e47102sm10319848wrc.113.2024.04.01.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 12:25:19 -0700 (PDT)
From: Piotr Wejman <piotrwejman90@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  1 Apr 2024 21:22:39 +0200
Message-Id: <20240401192239.33942-1-piotrwejman90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Piotr Wejman <piotrwejman90@gmail.com>
Subject: [Linux-stm32] [PATCH v4] net: stmmac: fix rx queue priority
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
rx queues. From DesignWare Cores Ethernet Quality-of-Service
Databook, section 17.1.29 MAC_RxQ_Ctrl2:
"[...]The software must ensure that the content of this field is
mutually exclusive to the PSRQ fields for other queues, that is,
the same priority is not mapped to multiple Rx queues[...]"

Previously rx_queue_priority() function was:
- clearing all priorities from a queue
- adding new priorities to that queue
After this patch it will:
- first assign new priorities to a queue
- then remove those priorities from all other queues
- keep other priorities previously assigned to that queue

Fixes: a8f5102af2a7 ("net: stmmac: TX and RX queue priority configuration")
Fixes: 2142754f8b9c ("net: stmmac: Add MAC related callbacks for XGMAC2")
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

Changes in v4:
  - amend comment and commit message
  - Link to v3: https://lore.kernel.org/netdev/20240303190339.52496-1-piotrwejman90@gmail.com/

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 40 ++++++++++++++-----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 38 ++++++++++++++----
 2 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6b6d0de09619..eb2d0976d010 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -92,19 +92,41 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
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
+	 * is not mapped to multiple Rx queues
+	 */
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
+						GMAC_RXQCTRL_PSRQX_MASK(i));
+
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
+
+	/* First assign new priorities to a queue, then
+	 * clear them from others queues
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
index 1af2f89a0504..2bc05173884e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -105,17 +105,41 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
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
+	 * is not mapped to multiple Rx queues
+	 */
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio << XGMAC_PSRQ_SHIFT(i)) &
+						XGMAC_PSRQ(i));
+
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
+
+	/* First assign new priorities to a queue, then
+	 * clear them from others queues
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
