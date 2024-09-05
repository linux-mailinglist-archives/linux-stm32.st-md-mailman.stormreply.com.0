Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9C96D002
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 09:03:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E9A6C7801A;
	Thu,  5 Sep 2024 07:03:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA64AC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 07:03:39 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7cd967d8234so381894a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725519818; x=1726124618;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfapUPCdk+siVEwgEq3PbpS5y/HhD3hQ8rgnXlxCpW0=;
 b=D8COOxkfC/8/syE0CtfPutQwsvkhLH24jWvv58tA3YPS/0ae5JfVTYi4UEp9yGfeCv
 SSgI12YwbbkyCHSqoe38lIPeHqIhGC4rL9ThlSoDVLyyHLJgzPXXaojXNpa/AAcAAZHr
 FIi8kAHvV+KSPucNGfb9FB6FUgVKfrr07SH4mktVOw5YgeqSXAvk7bKrHpTU++yZSzLI
 wrRfMfVUhcKgVxs/Z2OqkQ+Fe2hfgcKLLnml7RWJyr6HGscs+FFfvFJ4JWgDfC3zKJmi
 oq+vv/JVv7JawWQbuemKlKAuKlVoUYDjB97f0a9S42AKrisyTS3b9E46QRX2P64M5tMD
 V/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725519818; x=1726124618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfapUPCdk+siVEwgEq3PbpS5y/HhD3hQ8rgnXlxCpW0=;
 b=U6fjFqLf5Gb4iAYxm6Slanc5u4Z1G4mts9jhxi2HHH05yZUYNOEz1MHTPxgFtJg9BO
 8JmTuUZVRBRP/sVVcfRSjdnq29URaELuxxARPlJ7r76Kgor84iHnXvdJqyKsVd6izl2A
 EmGO06HWFXEFRDnD1LH9RaGFxxDq0jjTGURQkJ+yCnkYBdmalFomNd3g4OB5AzrNdAf2
 GDx9yUAGoG3PcsBMRZ5hvi9fVUYlN56HzdA+iN2x6aoDlWUMJc79FHUdei7f1TgVCIU5
 W5KMjYQvR7U1Gx2J7v1psCLxN2Ah2Dqp/eGhMWoY3a37sUKJloLbmj6owjoSm0SKdK84
 NO7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO8K0fFL3FDzX/cJ9w53mwoOl8dZVFpLd83OKT6pWI9YGfJj6yf0lbTfCLtq6e4ECPmN4E+40uDPIYtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNU2qVgA52n0fJ1E3zeT/74lViciBVWnLO/XW3IYRCte+kI3g4
 tXlm02Dpr/FdCbUCHR53kNH3LinWXZ0ooPn96DslUBgyt13U0xeT
X-Google-Smtp-Source: AGHT+IGii6PtVv9KvmKGnq1WevztWTEPtDxorA0y/riP75ryI+hbpR1PSKa2hS+6paAGe1PFO+09fg==
X-Received: by 2002:a05:6300:4041:b0:1ce:cde2:4458 with SMTP id
 adf61e73a8af0-1ced053ba33mr16509365637.35.1725519818235; 
 Thu, 05 Sep 2024 00:03:38 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71778595107sm2604897b3a.150.2024.09.05.00.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:03:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Thu,  5 Sep 2024 15:02:28 +0800
Message-Id: <508ae4f14cf173c9bd8a630b8f48a59a777f716e.1725518136.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725518135.git.0x1207@gmail.com>
References: <cover.1725518135.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 7/7] net: stmmac: silence FPE
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
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c    | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index dd9583968962..580c02eaded3 100644
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
