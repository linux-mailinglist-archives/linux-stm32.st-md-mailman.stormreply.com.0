Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E758B95649C
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5321C71289;
	Mon, 19 Aug 2024 07:26:42 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36FDCC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:26:42 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70eaf5874ddso2926301b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052401; x=1724657201;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Udk+s3Obbj80Cans5TjOJ2DULPf1NEhrOug0bVeCQAQ=;
 b=eiaJFQFpoSR0/aeyDHXtAVNmZVZBvS4+UtZ+uJzfzxFYvr3bcymWV/dgJ4s0FMjQP/
 zLbDL1byh+KeUv99eBpe9wrZDxB5DeA1oKmpwBFu8VeuAHjB0+RAx6I4UA6xollcETPu
 rmC1Ib3iVz59sqo4Ahhm9L7w2pQko4Dyhe7eXAiUO7AjiuNy2OuaLrT2/J5ZogLXOrbP
 US16xwBoEf7z0+QU3xUFnaYIx64PZc39gJa+A8Dr1P0ru62DPDbKJRvEmyCElvvNouiP
 c/s/GvLugGVFJH6miItvL8vdjOtdH9HHUPLScXo7h1/wvDPMMl8+jcHqxmvWPmoIpqkE
 GEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052401; x=1724657201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Udk+s3Obbj80Cans5TjOJ2DULPf1NEhrOug0bVeCQAQ=;
 b=iDyCHL3a0Ga7QM7rI52CiB9aab9dgYRiz33BSx6nV9cebEWtn8t+wX96qAv80Z++DN
 OyW77yLBAhVgXEIDPtPKsx8gglm28BvWR5UiOByPJSNECzPJyCnlxLACZgqZT1NfSChI
 gSnC6RnzjPvJA74OL0HJFdqw8dgzG/MtYvaIvJ/W6Lflj7W9GDTKsPFDgHxnKEfiq77K
 kqsb49vEygCM//CWmpS8b7p5fiqERXa3fNIx+650NYD7B64p70pkRko0mVU2HYTdvEeO
 7mr4+WXYKUr+nKWJg1J0HoxS9k56IGSCFwumuOA/RAGeDr+ZtSRulael2QG5stdEvS7A
 zX8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW68qaOxckut39Ll1+aam9tEQOplqzMDYIJAcz/SmrO/5qp/PFDqttfh1xwG8zxvP8S2AowcZbx0Aynep5JQYnn8tG33i8PQoYWmwM/rTCuPWGLG8Bq56aP
X-Gm-Message-State: AOJu0YwrDB8iXkEM4KMPjBkTRdBlTxvrutHQZKU+BaKMgP+1gv6x+fvd
 yFtousI9DHmcPVvQbY/roud2WEC48p2HKkgnGQFhddW+00lrzcn4
X-Google-Smtp-Source: AGHT+IGIrHqMvl9AmE+Jvkoggw+jp0THIJUSZAYGIWSoj/Vjl1XvI9jSe7HM5SVRQljCKll/m9DsNw==
X-Received: by 2002:a05:6a21:1693:b0:1c4:b927:1ffb with SMTP id
 adf61e73a8af0-1c904f91af0mr8704520637.17.1724052400562; 
 Mon, 19 Aug 2024 00:26:40 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:26:40 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:20 +0800
Message-Id: <375534116912f13cb744c386e33c856c953b258b.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724051326.git.0x1207@gmail.com>
References: <cover.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 7/7] net: stmmac: silence FPE
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
Those kernel logs should keep quiet.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index b6114de34b31..733163c52f97 100644
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
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
