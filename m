Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDF9ADF32
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 10:32:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A390FC78F64;
	Thu, 24 Oct 2024 08:32:19 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C702C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 08:32:18 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e2ed59a35eso565734a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729758737; x=1730363537;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=Z15fwqEAmv9qhIpAscZsxYt8o7F7Z1CTiQ7Bmi9Jqa8Qf4d8wfsDnGfSRgnG4XcmM/
 4mboKWulrvfCu7D4vbPPO6qi5HFDc5n2CMbzu0s6XJVYZGaUdvfFAHr//aJSaVmnCVX+
 VERr4xSqVuNlM0PzFlz/Dg5nJvISdKAYMrWTy/QlyLVIIGDgXqDe6J/42qBC1cjafVER
 HH/9jkTzkls5URIXkplNDgh/FrcQad8Jvxg2Fn8LcX5FmJm9toAb4O7I0+3HQvKV8JAA
 LPtc3ovj0McZ957hdedmQkTked2binacO4gog/71Z2dTF8ywtj8+CakLb43pxRXIN/9A
 9hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729758737; x=1730363537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=rRiUzNDrmcuAESFMNUWMQN5y4g20fdsNiklQ/6bw3KUAxAHG/rxxu05LwtCTFP3toe
 +Jw/reZvP/3+C0v9pTrNsj/qCS6Mzihqb6t+gmoB3l/ylZwBkQN4lJcSiuPm4qhSsOfx
 smydt7YLQ+biz2Sx9Y3eS/nTeON6xN3FqUYgHMcF6/VkIlk5i5wy7AKlVw3KqYad6k22
 9VdKZmw8bPI+sYQCtXmZrHuJGe5g8Jdze4nEcMuJydHFq7g43ioD63k8PE7xl1hKYLwO
 JfJQVq3ynkuyccj2Sf+AfdRnWqsHULE/ebalqv85LjvNAf4A9Dp+iZY937KiTOUEgFFd
 /VBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv1RW8kL9+AmUYaWzmcjwlFn5miNe1DEHMeQfEeSmZvFJYVjsoKtRs4triBSVkir7TAITiirblPGvnGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+bN2XKZOr47CTz73fe//bsF8nVemYsfKvAl/ucnJ6ODTxnBVh
 Di3aX996EJX7576OhUyDxu73ve4R16W4s18umMreSqoieqBauj0N
X-Google-Smtp-Source: AGHT+IGxeqb9FJneLkOG4JiyKKdDqgjaUa5zcOHcKRWNDzxb+oLM2QjS6gqg9VGE59w8X6F7T8e92A==
X-Received: by 2002:a17:90b:380c:b0:2e0:d693:7884 with SMTP id
 98e67ed59e1d1-2e77f322767mr1337661a91.5.1729758736720; 
 Thu, 24 Oct 2024 01:32:16 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 01:32:16 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 16:31:21 +0800
Message-Id: <e26a39e2b8f1165b855f03fc767efd83cb554993.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729757625.git.0x1207@gmail.com>
References: <cover.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v4 6/6] net: stmmac: xgmac: Enable
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
