Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FD9B7ACB
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 13:39:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81CCEC78036;
	Thu, 31 Oct 2024 12:39:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06B0C78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 12:39:21 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-720b173a9ebso689756b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378360; x=1730983160;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=OgB0Asf8/QITJo1dI4YZyXmzZMbx8DLQsvwGu+8QonwxVL9jrpiVjT6dMIqwnHKmO1
 80kynEV9ThVmtgFkliehX3InZIH4HX3WFf4pAgckF07IJvOiRHaGfviqaDlvw8nnS3e7
 JLjrhoNa4P4pLnX7RD1nwwzaWrbu64F+WIp1Y85HOcaMwgUJHB2YlEJY0GuPJMu0mVKB
 0gGbCCTj8VkyYp5nrX9RR+CW+sEK10j+l0KnqRcn6UpIPPfolvwxnuMiidd7kjOTrZwd
 yaYnpmWNDbgGvu4wvFwBxWfzN9IC1NUL4sIpyp+ZA5xCI16+7kujVg6yhjm6gM+EGH0s
 fmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378360; x=1730983160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=UNttDM55kA6PT0m8xsx/iiO694W8A7C1EMkndr7CfmV06CO7lziMCXPMG9EDwTpCWD
 lvMcKXOTXrnlzq52bH0YnlWkSR5mp3IWXOusPJjhM3dGS09imfyX7uY63Jgs0XWZpLhw
 VUBmzWBE1uV57s3Ob+iFOyZotxaOdt6V4nhCj8/rZx5p7Hay23dMq+ebzu30T4zCnlGX
 yynMxGgmFRohfGRDfXvYkAXvoPxorBvSWY/yKHaVhltn+GdQmgg1hYgPuBhADRbcPsEy
 3O2QFM1esMv7+PIqD5WSPOv1zYbOas90cZ0qqmC/UDOviMS6GtXx5QisKaOLLf19PstF
 8g3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWraVRh4yqbmJY25+KKlNrZ1+jxdcS4pJQ5+15GZ+i/tTO+38GyYwoaiF57XAKpOfWis+rbtcHp9zzDpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywvjt0SmXBddZxIvqrYYIfaipLLPG347hWGPBEkFW4ipGS+iP5Q
 Q5eYjorqwXl2++9UZmphe1YJN5ospQTgqpsXXbsz42PatrlvQI05
X-Google-Smtp-Source: AGHT+IEYepYTbWzaNjZB6/WykZo7JXNjSOPeC4faI93w6dXeeMLicqGen6Mz6ACbQEadzKBbhQtzhg==
X-Received: by 2002:a05:6a00:1397:b0:714:15ff:a2a4 with SMTP id
 d2e1a72fcca58-720b9c96d0emr4011140b3a.13.1730378360174; 
 Thu, 31 Oct 2024 05:39:20 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:39:19 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 20:38:02 +0800
Message-Id: <527799d9e4e28fbd51eb37754f130b037bc0f6ea.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v7 8/8] net: stmmac: xgmac: Enable
	FPE for tc-mqprio/tc-taprio
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

The FPE on XGMAC is ready, it is time to update dwxgmac_tc_ops to
let user configure FPE via tc-mqprio/tc-taprio.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 75ad2da1a37f..6a79e6a111ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
 	.setup_cls_u32 = tc_setup_cls_u32,
 	.setup_cbs = tc_setup_cbs,
 	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio_without_fpe,
+	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_mqprio_unimplemented,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
