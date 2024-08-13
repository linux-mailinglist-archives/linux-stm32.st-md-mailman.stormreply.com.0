Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF695041B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2024 13:49:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB855C78018;
	Tue, 13 Aug 2024 11:49:26 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E36EFC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 11:49:18 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7105043330aso4341904b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723549757; x=1724154557;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Udk+s3Obbj80Cans5TjOJ2DULPf1NEhrOug0bVeCQAQ=;
 b=mM+ofHtMveVu+GSkpjKcxsm6Kpd21MM+4XeV3wDvwGgXumUAbCi7BY6SujoeZLPWhb
 vtx0uij2MwFCiYhjbzYIvyS/0zfzej6wpMUkuM5lQblEg8DhTeQfXps8lj++6wp3Gw3n
 4doC3zIVeGt6GxkYGGu3Vulox3ck/Pm63jXwoxiDy2Ow4pIrJ6Y8+6Dss9yuDlZIs4pc
 oU49JtrKVwQcKFFKBvlQAvu7MazZP1Uc8KYL0iFVNmRdzcAPW5U76Cz5aYubWpG6gYME
 KzctEhHHxG7YDnjOcHVVvPNk1wOnIrY7DWUYn+KsmA8tA2hePxvqbAiHd4xAPpPTxTHT
 DObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723549757; x=1724154557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Udk+s3Obbj80Cans5TjOJ2DULPf1NEhrOug0bVeCQAQ=;
 b=vh4KoATRGaNmJ+2UyDOldIimHMYyHUfv4GHgfHlQAxRD2QVji/rxUo9iE+brbjKm98
 9ssW++Tycy7iq+gj5b359hKOs+2+sKirS3i/KT40YkpxKRCyBluULfY+daGsaYk1gPJl
 k9+Nzx4vBTVren2yPb98V8wQOtvwLJJOf6l4NkSKPLGnFO5i2kAgUuU1uJI4Xm1hTeUU
 g7N3bMSA2bT4lhYZ6Qe0zSucPRKc+Ohn/aipTVU8S/ZmpGc4hy5XSNW3GsyR30dOqV6N
 cJp3wEHn739dEA+RsvkKSS0vLyjX6aAF+pL7vSWdbuzLYDaWgMP83n5PXKmYH7hj5lay
 5ySw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUomr3Ts9gfE5He2YwfjIzTfGloXvfnaZgx6MPssW6ZepS3RSziNJbfeMvN63PD5Qer6/i0ReoIqNM2a1yB8YVtM2acSC0Uw8glD7yt7L8+cZusC5r40nhR
X-Gm-Message-State: AOJu0YxTJGOJcve5yMdtXfZjPrNk+LB++IzzR4hmMTWJCozI01FQHQPr
 rp2Q7kwDbtBpNEvaY9w5WPazbYIHdgPZhWevUOFje2aPgC03Qqvb0ECJ7g==
X-Google-Smtp-Source: AGHT+IFKROSujLrymeUcrrT4jAx0Zh7mXt92lrH7p0RVaXCHTQS+/rEiU4KU+PTGuOa6NaJsz1t0pQ==
X-Received: by 2002:a05:6a21:e8b:b0:1c4:98f8:9ccb with SMTP id
 adf61e73a8af0-1c8d75865d7mr4302526637.34.1723549757391; 
 Tue, 13 Aug 2024 04:49:17 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710e5a562bbsm5548755b3a.111.2024.08.13.04.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 04:49:17 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 13 Aug 2024 19:47:33 +0800
Message-Id: <103f008b17dba3e1a0267e5dfb84075fc9c494fb.1723548320.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723548320.git.0x1207@gmail.com>
References: <cover.1723548320.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 7/7] net: stmmac: silence FPE
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
