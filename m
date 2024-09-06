Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC7696E8D8
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 06:57:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B98C7801A;
	Fri,  6 Sep 2024 04:57:21 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A483C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 04:57:20 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7093c94435bso877522a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 21:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725598639; x=1726203439;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRhWJrEYy3VMtGEOiJyga7bTazzfIqhRdV1t7XTzZag=;
 b=RxYTA2OvKFxzWir7dYxvm8jCeDoVti1WAvqiizOfQA1DHrGNm8cI0JwnQZJiMrmXn6
 lrZrjFYZuhek+6hHoORpyOJ1Nt0+7F+fPRT0Xkye4Hl2AV6Am55nIg3bUdbMSkCU4LtA
 3BiNAqOobf0x8vuthrEA7ylF6yNK4o9UbABgszcAKdjM5wcaNiZXKUMJ0S7fp50SSSRN
 XjyvbNKKgdtLcqV+n+3Kw+pd4vTRLAKj84GjB8bh1ABTA00Cx1G5ruoyJjzAGY90jf9i
 l1kooQ4j22ByI5NvJMfQQqVs+mwTG/AKlmeMzlrLUwYV3nwTc/cM7oxAQAS+8Ib4sYjw
 X9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725598639; x=1726203439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRhWJrEYy3VMtGEOiJyga7bTazzfIqhRdV1t7XTzZag=;
 b=JlGkPZtFBnVDzBHjI7/TnLXL3kLdMs4H4el1MXPXS/6sX0fs/rZVKL/UeYuJWBRyNc
 QvcYwqN94PvDWuDGWw761uef5aRbSSUp2XiQCnHRHX/xrQCxWx7A3KFmspfRl8OahfCI
 ruPnU+QWB1S7W7DwpA3xNZJ961H14EXR2wPySoyKvfUyhB4PqHtlSAHm68/zBA4clqDn
 X1kjYVKCpGCF6xhbKcQKMPh6nC4kAt+5IqhcS+i2P36CD7b+PTZ02/idWLFiX+lpL4jd
 g3gMUaCBlKNlrbH58y4iV2F5QTqN70jlL6xZaXXF8B69SNKZZUNM5kKyqXHmB7tsGOfO
 MxVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNy35crRUl6AryMXprTZcXHpajnaDugLTfMTfVQDER7MkSWRQpngvfkhZuhL7N0luSqpaSdAiB+4yKNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSkpg5X9VjkaLb4DUcMblibj1mvzDIuuLPyRCEukAlv7L6sxq3
 pOyXh6PWTuQAKjyCOultKlq6H5+WRZjDVnVIaOrF0JM+aKiT177d
X-Google-Smtp-Source: AGHT+IFCUKUTtjgKr3GIy0Uy986g8UvKVqkWYYM5qB832p7WPOQoTiQsAlcR/uJnyiSROeb2fH9mEA==
X-Received: by 2002:a05:6358:5498:b0:1b5:eda9:963f with SMTP id
 e5c5f4694b2df-1b603ccaed3mr2990635155d.29.1725598638878; 
 Thu, 05 Sep 2024 21:57:18 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71791e54585sm1704002b3a.182.2024.09.05.21.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 21:57:18 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 12:56:02 +0800
Message-Id: <5d4fabe80145cb6779bf8ccc3f0624c61e9666be.1725597121.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725597121.git.0x1207@gmail.com>
References: <cover.1725597121.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 7/7] net: stmmac: silence FPE
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
