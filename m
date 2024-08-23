Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C214C95CAF4
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 12:51:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A1F1C7128A;
	Fri, 23 Aug 2024 10:51:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B216C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 10:51:03 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2d46f2816c0so1411022a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724410262; x=1725015062;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fiEKr3Im0ZGEfo9i68gRMgx3Qhz/6RSfaQwwnzsVeF0=;
 b=NVt1bKwP1+Twlj7b/R+3AH0t5sMLV/3w641Fo55lWsS1OHL5PfyH1MxBsOVroWDJ6m
 HEA5n61JuDamlg2joDNIfQ4NcJ14oMbYXj/5FuG+gt5T9IPGEq1uWlw/DgFZRZESjlmB
 OUrvUdP0CL8zHjdJUHqTBJapWrfZ4/4kBG0ncmMQoK267vforKYYZZHdC0JRo72Urlkp
 0Ue4d25IjAmX4lj6i16anDlltRij9yyBclopplrFfe+hUh3cF1Rtu1Ax5v3rImpoZK3U
 //2B4+8cCA5RrHFG2RCHKB0fU1HxWXnyhLXB1Tcl4YRvEQAmSohgzt7hXath922KajXY
 nA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724410262; x=1725015062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fiEKr3Im0ZGEfo9i68gRMgx3Qhz/6RSfaQwwnzsVeF0=;
 b=K8qsoE5tgOIZwSYKaP8EvibGqBy7/QgEoX6JSxFxz5rIzeYtEanC8SZ6n7FwmLwkbJ
 k3ZMuTgBM5ceSO36NcZriIP256KZKX0NKOQwQ5SDUl11GUPE8BsXqjeGK8TydeaKQcSh
 St/P4KKcQ1+duHJtmEJhiKryJ6n+IZ8QqBgyz9rA8sxkJLMqgI5gxWSXLrRK/p5bB9A9
 tsDAVkQlqLFrVwLDNrdFi7xcOuseBY/HKyxjmMxlFlqsnnbkXMzTRxwPZJPloWJn2xSI
 xPfaVa4OLxolMcyEEHo+5eisi5xemAtpeB0LFz+VyC5i0CId75DlqC/KRA2oVTyWhWAW
 pyAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+y3abclRcUrI1VHvXHb+7DVhVSp2Q0hAKUU9/w8yp67W856bE+MjstfeLfE3DwrVhXuPwnWpccjlGwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy9Gp0NUyQAhvY2sGuzZuw/IUGxd7kfbntFn7JZZ+cCVULV1TSJ
 G93PGCIWnAzTlbtsElyww+2Oeb1DvUgtdqoLgN60g7EIBQ/m4zhf
X-Google-Smtp-Source: AGHT+IFlcZxDDc8zTi3Ls4lOUz/9fcP+qE+s4ousiGEEgEdTZ3V9E6rQ5lfcHKW6Y+CTb5xFPC2YOA==
X-Received: by 2002:a17:90a:55ca:b0:2d3:c3e5:b51a with SMTP id
 98e67ed59e1d1-2d646bbc075mr1719026a91.9.1724410261707; 
 Fri, 23 Aug 2024 03:51:01 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d5eb8d235esm6074344a91.6.2024.08.23.03.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:51:01 -0700 (PDT)
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
Date: Fri, 23 Aug 2024 18:50:14 +0800
Message-Id: <74b2ab45a3a93a7cf85ce563a8d64fe44e782c80.1724409007.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724409007.git.0x1207@gmail.com>
References: <cover.1724409007.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 7/7] net: stmmac: silence FPE
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
index 96667e81eebd..39021e2868d9 100644
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
