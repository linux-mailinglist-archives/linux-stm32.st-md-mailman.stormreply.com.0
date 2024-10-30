Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2309B5B47
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 06:37:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 738CBC78020;
	Wed, 30 Oct 2024 05:37:06 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAC29C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 05:37:04 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3a4e58e3f9bso18575515ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 22:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730266623; x=1730871423;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFXbwqz75x0dcmhtSdDEARZ9DfDgZuyYgYubYl4uDMY=;
 b=fR/n5ggKlOKuWz3qFnd0cb1F4LJ+AqVbe6Vk1CYp6GfjngM5cHVd9oJHrVgOvdS+g/
 ysVDcfMogPf/W1Ujrl2HWIPjluTRjENY7VW4pBYnTLQqs4iTd9/a+xJnqunkh2YdCLI2
 CbR+xa03i37QZ+vlNl3UjuGXnsKV+xTXtbkPlcKj+zhq8HeFM7dmOU1/+czCJFu9fHW4
 WCTsvBK+D/HTCTHKeiFCdCGES+AjdjXlj/A8EyFxiWmikXicXdZBjkGnqU/+RlFVazUp
 XmXeL5u0tDMUuRvc5xjLQ28ZSYl7EEMuHzkUXdKIfHzL5dBbHzCitJKvJV1vjYDnwKpS
 5hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730266623; x=1730871423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFXbwqz75x0dcmhtSdDEARZ9DfDgZuyYgYubYl4uDMY=;
 b=KpTc/bOmh6XYhgoDCit5nsgK9oImNNOmhoBh5POVktgo1xY2rNF/9tBUPTwSBLr6ED
 Bbxx3B7zrRbZH3LQ12kZB/i80W8Z/8xxUZTnuaIIuxpm46N5FwcKNt6eGL5buIr60OO1
 d6DIr2TLWUlWS/CwAgR1YSw37qb0kbyLUZePvlZNswB5kVxuksbwLpVqdAwmNWw+MPkV
 7MGM4uSXH6s7jWLfZohWDe4lGP5o2WqojRB0IJylHZxLDF0RVgy3hEIlK2/tXMRev4Ea
 P5ZE1TaE8pbSirxru0AFna7h5c+/YFz0zVTwwzppYgvwOno1iUkgrLewpOyOyRfpTHdN
 2OMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYMZWrTk4c0rzghvk9pQdOx63qC39FwB1uR2zNekV6WGdMig1VHPg0uV1q6VXueh5ZowWkivWBMk01yA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzD7HlFjYh9BCMC878mqelxgJnSPn3m9STnk8XCQ73EG3hF6RwQ
 jP7Z5yqXXWfy8Q1g2YOG7nQfRRwS3pAbGJuhaOZoNBPDNkAnzUIh
X-Google-Smtp-Source: AGHT+IGlk7MCTYOqLt8nKHysJ7yCgLJD39sJP78kc8zMKZandqcgyCERDYvDZvq5YlTQ37RKXLzqJA==
X-Received: by 2002:a05:6e02:1a25:b0:3a3:f86f:2d0f with SMTP id
 e9e14a558f8ab-3a4ed27a9a1mr143587155ab.3.1730266623427; 
 Tue, 29 Oct 2024 22:37:03 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 22:37:03 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 30 Oct 2024 13:36:13 +0800
Message-Id: <b3e99ec1e53bdeddaca3d018f8217aac0986287e.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v6 4/6] net: stmmac: xgmac: Rename
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
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index efd47db05dbc..a04a79003692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,7 +84,7 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
+#define XGMAC_FPRQ			GENMASK(7, 4)
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index ee86658f77b4..46a4809d5094 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -356,7 +356,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
 	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
 	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
-	.fprq_mask = XGMAC_RQ,
+	.fprq_mask = XGMAC_FPRQ,
 	.int_en_reg = XGMAC_INT_EN,
 	.int_en_bit = XGMAC_FPEIE,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
