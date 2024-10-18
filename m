Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 372359A359E
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:40:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E66DCC78037;
	Fri, 18 Oct 2024 06:40:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C7EAC78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:40:20 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ea7e250c54so1237915a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233619; x=1729838419;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XoXtS/KGKf23o7SadlNvmNMchc09V1cBlERiDv3SWtA=;
 b=RHF3F0eE7fnjQvzxoZpjs2QhPZCApqqZw/39NdG3+7FlvVI0NMstZHkkLoBZW3e6jl
 Yjkghtcv3/VsO3nzWJfP1JnY5IRdYoEMhHKHaR5zk9xPGQScWjy+Gvkl2Mfpnj05X0Gn
 QOadgNOPm+kduHESzEVh0uajH3HGoMbS3pOW1/XjfVujyTGGi2cS//tPHInf9humY6Tl
 iD7rlkWsIfZy6FHiOLSRvvfaY1ZIxZQ5tXILFiZmOC2WsglYVDFhyoxvwty0v0SVB/c4
 fRfzT5wdIDvdgiddUzpYkvwyj6xAcXrZhvDQphfY8w1rw3VNTRGtXxqgTIQQqA0/fzot
 LHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233619; x=1729838419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XoXtS/KGKf23o7SadlNvmNMchc09V1cBlERiDv3SWtA=;
 b=pXosmTlIT4Kad1sVn2jrFxpuKpv9FyskRZPS2kPCdt7JOvgc8S7LiqgT8kyp9sl4jF
 WmDQk7taYNrSeq1biqKU+UvV2bEWZvgDefM0TNoPEI0AvdyiS8vnchDUDnHEtarBsg3D
 EbFLlIJG0PYI7SbZltXbfadUjnUJ2YyoUdryKzBTZHxZY5R1GGL+gpwnsOrrlBsTcyLc
 YPDkpibIs57nn8lTWIh2hV5n8IuAFcDiX4sZnMxn2/xVDw9IDBor7yfdsl0946Qo5uNn
 hlSn706hZoqeo+Na/X7e2CWcYZFdmUj7ORkWNM8DC+e94F0sj6E4YCfKVDpFi6Q1FtFH
 pUMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsTdrWfpV5h6dWTgD3PZ/RvgJVGRcnR7OMXnZhdgBjnQJG+f7ZsN1RL2XAK6BlpOu3c0tWIRKuY1Ajxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCpwSp7eBPqXXpg3HI8n+0vpj3XTqiZnsuQ1TLXWJSbdKx0vDV
 0FkRrnMfYD+xMwQkvqsTIbjUBSl792HfSYtKnc+xjwTOOJ5vPPj6
X-Google-Smtp-Source: AGHT+IFFaWqo8s2PogDyWr1TfL5kF7TPRLJZblqmXL/T96wFz/6aJcEDmf7jOlIVt8f2REax0Z2yew==
X-Received: by 2002:a05:6a21:3987:b0:1d0:7df2:cf39 with SMTP id
 adf61e73a8af0-1d92c49fc2bmr1883151637.7.1729233618398; 
 Thu, 17 Oct 2024 23:40:18 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:40:17 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:12 +0800
Message-Id: <21491b72dfbd0d396425505b6d3e2680caf5a3da.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729233020.git.0x1207@gmail.com>
References: <cover.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 6/8] net: stmmac: xgmac: Switch to
	common_fpe_configure()
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

Drop the redundant code and share the common one.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 28 +++++++------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index c66fa6040672..e1c54f3a8ee7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -96,6 +96,7 @@
 #define XGMAC_LPIIS			BIT(5)
 #define XGMAC_PMTIS			BIT(4)
 #define XGMAC_INT_EN			0x000000b4
+#define XGMAC_FPEIE			BIT(15)
 #define XGMAC_TSIE			BIT(12)
 #define XGMAC_LPIIE			BIT(5)
 #define XGMAC_PMTIE			BIT(4)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 9245e360109f..dfe911b3f486 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -360,25 +360,17 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
 				   u32 num_txq, u32 num_rxq,
 				   bool tx_enable, bool pmac_enable)
 {
-	u32 value;
-
-	if (!tx_enable) {
-		value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-
-		value &= ~STMMAC_MAC_FPE_CTRL_STS_EFPE;
-
-		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-		return;
-	}
-
-	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_FPRQ;
-	value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
-	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
+	static const struct stmmac_fpe_configure_info dwxgmac3_fpe_info = {
+		.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
+		.fprq_mask = XGMAC_FPRQ,
+		.fprq_shift = XGMAC_FPRQ_SHIFT,
+		.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
+		.int_en_reg = XGMAC_INT_EN,
+		.int_en_bit = XGMAC_FPEIE,
+	};
 
-	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
-	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
+	common_fpe_configure(ioaddr, cfg, num_rxq, tx_enable, pmac_enable,
+			     &dwxgmac3_fpe_info);
 }
 
 const struct stmmac_fpe_ops dwmac5_fpe_ops = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
