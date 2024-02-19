Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDD85A152
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 11:49:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 427DCC6B45E;
	Mon, 19 Feb 2024 10:49:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21DD3C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 10:24:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41264195d5cso7651935e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708338265; x=1708943065;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BUKAB7sb5czIBMBlNuCagdfu4VWTGp2m4SsAnQpFoNI=;
 b=XpWUw//pVIG1mwdcXeG+2E224Rf+NEFGv/SoN2dJVQeX1HYIbza1ZSLxXn1JLeYFL6
 i4Ob8Nx1NWnTcKSstjKo9U2wzTYvDxvOQi3D57tPI5mYJ3E2pzNubnHRtn6eNmuCtENf
 VgdimacKXf4whb3FNobtOcb25+amK0v2nou6vtXZwaE3YPOVR7vNsGsYLwA+0EK6IB8l
 Bb0eRxRc7aj94ykCCr4hkVW1t7dKKYlznDLye90hCBjLQLor1JW8la8DCxvO76uZLwXJ
 b8+VjDLiqmbaqhfzJd3ZOaWW6EF9/pLlVGaOzGwDn4D2JZrZ4sfQ6QF+TFDR1ybsR0FB
 NLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708338265; x=1708943065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUKAB7sb5czIBMBlNuCagdfu4VWTGp2m4SsAnQpFoNI=;
 b=NI79p4+fyofYWzJSs16o7zPZP4aPq+Hx3GPSs8MO2b8QsV78aGnTeGayE2s2VnMprj
 1Q8nU1w5vH6jWBVn2X2onLVtN+liPlsybt246551ltPB7grx1wdw1TEAikHO4M+wfLFf
 NWZDu38MJ2ZXlHzCqFFORq3MKKUUkdrqz307SSbgBY+oCEYL0u/EmN/DxZnyAidj60ki
 Xz7FCJEYsFMJMYUNXXeHbOLJRRviqVvJUJP1HvxX69JREefLpWTcu7QQ9+k8Ke9fxXCi
 A/w/xnhOTlQ8UHlMkvIRpb2g7GDf6RwDwbQtauYzzioInqyc7bQfXRh3LTN40I4yCUVM
 kaHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMIcgQM2b4nTIfltrMLr6BPu99DwFBMIiarXhXMCLyMTS7FvnNJIVLSmVpSFWntoMMqtAn15SUg5nnuHw5j0/6bEPe/K/jwfRq88Fk5q3Uw0w6UakbI/zs
X-Gm-Message-State: AOJu0Ywfl3WQ1h7MXMRm+YOJHGPQ+qxGaMDLBnAC0+orChlQoDH5VV4z
 36oHGFS/UuWecgk465DmvSDfpNjwM1Z3nnCKZCt+NVyusX4Yvvby
X-Google-Smtp-Source: AGHT+IF2g+ewN6RzWmlzDcSLZzfEMtoVfx31tsuHwChkjg0cogBD03go0OpotKFKhvIk+IC5hhds6A==
X-Received: by 2002:adf:ea47:0:b0:33d:32fe:cb49 with SMTP id
 j7-20020adfea47000000b0033d32fecb49mr3310387wrn.3.1708338265299; 
 Mon, 19 Feb 2024 02:24:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:a92:c660:d7e1:869b:1148:64e8])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d6daa000000b0033d170a5d6dsm9986328wrs.98.2024.02.19.02.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 02:24:24 -0800 (PST)
From: Piotr Wejman <piotrwejman90@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Feb 2024 11:24:05 +0100
Message-Id: <20240219102405.32015-1-piotrwejman90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Feb 2024 10:49:33 +0000
Cc: Piotr Wejman <piotrwejman90@gmail.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: fix rx queue priority assignment
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
rx queues. Currently dwmac4_rx_queue_priority function is adding
priorities for a queue without clearing them from others.

From DesignWare Cores Ethernet Quality-of-Service
Databook, section 17.1.29 MAC_RxQ_Ctrl2:
"[...]The software must ensure that the content of this field is
mutually exclusive to the PSRQ fields for other queues, that is,
the same priority is not mapped to multiple Rx queues[...]"

After this patch, dwmac4_rx_queue_priority function will:
- assign desired priorities to a queue
- remove those priorities from all other queues
The write sequence of CTRL2 and CTRL3 registers is done in the way to
ensure this order.

Also, the PSRQn field contains the mask of priorities and not only one
priority. Rename "prio" argument to "prio_mask".

Signed-off-by: Piotr Wejman <piotrwejman90@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 36 +++++++++++++------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6b6d0de09619..6acc8bad794e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -89,22 +89,38 @@ static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
 }
 
 static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
-				     u32 prio, u32 queue)
+				     u32 prio_mask, u32 queue)
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
+	for (i = 0; i < 4; i++)
+		clear_mask |= ((prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
+						GMAC_RXQCTRL_PSRQX_MASK(i));
 
-	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
-	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+	ctrl2 &= ~clear_mask;
+	ctrl3 &= ~clear_mask;
+
+	if (queue < 4) {
+		ctrl2 |= (prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
-	writel(value, ioaddr + base_register);
+
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+	} else {
+		queue -= 4;
+
+		ctrl3 |= (prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
+						GMAC_RXQCTRL_PSRQX_MASK(queue);
+
+		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
+		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
+	}
 }
 
 static void dwmac4_tx_queue_priority(struct mac_device_info *hw,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
