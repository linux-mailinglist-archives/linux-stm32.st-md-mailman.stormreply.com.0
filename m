Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1769A359B
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:40:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC453C78037;
	Fri, 18 Oct 2024 06:40:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52515C78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:40:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20cf6eea3c0so14394135ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233613; x=1729838413;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEyaQIcaSa5+mb094OvjW2KqzXq/V2wwCSsdaWimUtA=;
 b=j6ypLz/XLM4sPsBTwsdCUj3ckXdeBFlb7p5lm8Dl+RNsC8/JokK/7J9/qRIaxob/aa
 9+AZfxjRwumbROKNcfejKCXN91IBvglDLwdMQaputNLLI11rkVvr5eC7gmhGZi7MgRNu
 zm2CSBBG8ofOyGMWHDJ4t/RE7qe0fwV63gviH2FKghla5D/bt8MmMqZouD1zeo6Utlx+
 R8yw+7Lb95UK4mD2uiCZ7oGuPMBbCoTfjxnktacO2cLJXTi4lWqknQNutBtzgMQOKFbS
 2HROM4NmDAFFuU7/xcWawgAHNK4a/31hPhj6TR8rvK86hgDW/SkrJpDjZR2MJOKO7sEN
 +1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233613; x=1729838413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEyaQIcaSa5+mb094OvjW2KqzXq/V2wwCSsdaWimUtA=;
 b=ArvI4Zofb3LXUIZmc9/X7NzqVhz9cvJ5B6IBN4g02OaT0krBNd7UxVhtxAv9Cq6nB8
 Zw8aTeEPHP3Cgvc65115vwRo4boJLRxmsruPYmxm22AOEtWvLbjIx7qBhfi0lfJYmCIs
 O1xAP1HPEa/xW9IyQ/ogyOeZcPSS3RWhR9uKcHOBMO4d69UR1OGWKICKvJl6jH84564u
 bydbXgVSVuLxzG3zq4YG9lxaxqQ29gnr/Ai1Yyi6HrbG2oTGpNTZZRb88UNszL4ISBez
 tMd7rXouB4dj/2gpv8NqUdlXrG4c77Pm9+7EaxvUMAX8pyVp+t5DjT4aytocyCgatoWe
 T6MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUXy2kf1Jo34bUZbUCUQvD1bUKJ3zs1bxbEWrv8b0TBxBQdNoenmwTIUAa9C3ngCuILCjf+AaapjONoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJ5AVtuwopP2Ww3WSbGPRDoLfiP2g1eTHtKykJeGQeNyMnlLbQ
 NM7th24yOIEATZuEy6mb5/XqC8OtKxHie4SLeiImF9rjRa6/6aOJ
X-Google-Smtp-Source: AGHT+IGOxD5tfJSh2f087iD/w7KV+RKu1IaYQSlM8m+sKzV2CR4NX/4iBMMPRNAoT4F+qgJB9qds/A==
X-Received: by 2002:a17:902:cf11:b0:20c:bb35:dae2 with SMTP id
 d9443c01a7336-20e5a89fbdbmr18335085ad.28.1729233612791; 
 Thu, 17 Oct 2024 23:40:12 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:40:12 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:11 +0800
Message-Id: <c22faea09a3f240a84ee9e7f95329d860134d832.1729233020.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 5/8] net: stmmac: xgmac: Rename
	XGMAC_RQ to XGMAC_FPRQ
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 917796293c26..c66fa6040672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,8 +84,8 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
-#define XGMAC_RQ_SHIFT			4
+#define XGMAC_FPRQ			GENMASK(7, 4)
+#define XGMAC_FPRQ_SHIFT		4
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 8ac9aff101e8..9245e360109f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -372,8 +372,8 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
 	}
 
 	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_RQ;
-	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
+	value &= ~XGMAC_FPRQ;
+	value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
 	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
 
 	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
