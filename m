Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FF9ABFC2
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 09:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D0FFC6DD9F;
	Wed, 23 Oct 2024 07:06:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21369C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 07:06:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so60380985ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729667208; x=1730272008;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=QdjmCp/5S8SV9kx92LJh76h7strcErPkHp3ep7WM0LLhEgvzr9Uc9O9tofvxy5+bPu
 gTcq4DlN3+FUnWFQqxcZpLmU5ulCq9mOj8vWBwRMVoH/krfENsszfDQztkYQ0siYThLy
 TTznOKeuvFU6zIWvLGcaS/XzQriqTi/id8bpGgepXvpuazGtiBLA5KUEHYhJzeGjSCa+
 8tgq8n3pFSo3V33xVc+CwuCoqkWcsJfJHpAHVWjaSnpDN4EM69mskGZLqJ9DL8/OogG2
 8rcOuJLhtgJ3k4ZWKBbGcxzLKkp0OeT0FP2qf2x8sUmm4yXK4+iyDfuvLDIuPASL2Pjv
 eeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729667208; x=1730272008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=p+6C7sp7W8SQVaCQD1pLZc9eqje6brWHXvF//hnUDARoq5c6C+jjXKXh9KiW2EYA0N
 xI2hNpyRN+8PEihs22GoJTQKioaEdfrO2Ov18uhyuTEDybqCFSAVnybShjs4kck0EH+m
 S6Lj25z+Qsr+GNCLzOnyVPySBsQ8Qv3PQoEGLbTBJA+1vDt+PzofxxeKkqwnxjPhdNOe
 i9fOQHbTqc5j5uMxPCUz5BlLKA1qNiHA/WPl1IbA1zJaBLsmJwDjDc03AbyrY6cNRYHQ
 RhZ66dRIv80AXkPc5lmmxvmGVFC5hDFr214qoQwadhg3DKHchxt//K5hivFDysWKPjrK
 m5/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQgry9ujJ/RZPBST+BEvD2651zvJ37joTb+heHGPP9VmmWwhrfnRDLnfq/UbPTd7XaAw5ih4TcWJ8ltw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrpGC2NmGlmcA8K5GaUzb9R6gqc3dt7IR0klR0Fqq80X344xKr
 4zx7dfaeHbgExXi3xc6pQ7Ou81pNSAwFhjRjE2iAqebEZsZyyJAT
X-Google-Smtp-Source: AGHT+IELOcrvReuVJG0FMMFGeSqbhWhh+ymRjXHqXoFCyW7Ap1f6pPPW/73rvH7E6LiAd4sPjI6cXQ==
X-Received: by 2002:a17:903:22d1:b0:20c:cd14:a7f3 with SMTP id
 d9443c01a7336-20fa9e3cdf0mr20205475ad.22.1729667207634; 
 Wed, 23 Oct 2024 00:06:47 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e7f0c167bsm51981745ad.140.2024.10.23.00.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:06:47 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 23 Oct 2024 15:05:26 +0800
Message-Id: <8ef55767b07be558f89e8a9959e24c87270ec451.1729663066.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729663066.git.0x1207@gmail.com>
References: <cover.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 6/6] net: stmmac: xgmac: Enable
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
