Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C106E9B5B4C
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 06:37:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87191C78020;
	Wed, 30 Oct 2024 05:37:19 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D66C1C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 05:37:17 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-71817c40110so3167716a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730266637; x=1730871437;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=StpnpUgcMo+4GwLWRJeSgbWy8NnNQDA1oGskRzFeELJRNITBA/XePtQw41uQz7aABA
 IFF/WV7vP5/wqebyq3oArqyM6QTPcBFS1A5YMeLDMkaA3VvzvrK0RF2UPLTbn6G3YVUP
 dhZXegOSWmt9T+j7gAv/AnMV2lXfPfQoxvK1rhkGRN5hdvzAtit3SRU9f36SSYMFTdrs
 C5sly1T9wHodu6f0EUR/+lTopAoWS+dOFxfLRTg+3dvAaHjlr9ussdcpG3VKZU59CRIK
 SMd3+p8QaaBY2JwPXyukepNeXnFck1GW81tAxNoiNFWeyL+91Btxuv5vMdZaOW6n7fjb
 QqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730266637; x=1730871437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=PFgR4DCJ+cGBU5PpiH9RegX1h5fOt2am3TxaJvA2qJLufeegKtT35kGGpYXDjRzcvF
 3feimoi+DgLbWcTlIOANnPmNhIQnp7cs+KvbCNUfbO3lZSTVfb04KBEnP1tiTKbY1uE4
 zYNHKAtUpGufoUeKCjnEbtPaDNS7S05gyixdubXhdjpSMQWxBgCESY2o3qtKHiFcTxdN
 Z5rOAzV+lM1Hg8sc7qY/lAGnqoiV4ammqpwWkx4dle6F2L1axSgnlWboVV+YoZmT2W58
 0eIQtxuiCGsN3qI2gRrk/rwoUMLXF8veUGjjT5dgcP1tdrs3vSc54jcAqH3yR2eLQgzh
 5rUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIUFdlr0Cv4+soHcaab5NJZsHMk294IQtEx0e6i1whUgXV4n78WX1JSLe5gvcBSSc2IrC4PfU/V7pWiQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQGkp05UBhwnoOz+2raYcNFtZuiJxMqoyACbVjkjJl7rExGTvK
 S0PvgFo/Qd5gPV1cBuptKCx2DbRKPr+2zjCkKC8EtRH85uN7uG3X
X-Google-Smtp-Source: AGHT+IGMcZP86Gb9PnWt4RuHGD9rvSbLa8zwQO6JV3gjbDXZLVASBGbVFvRNeULnympjKkTbrbfaPg==
X-Received: by 2002:a05:6830:43a7:b0:710:f74c:1b2d with SMTP id
 46e09a7af769-71891ffc758mr2049461a34.2.1730266636633; 
 Tue, 29 Oct 2024 22:37:16 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 22:37:16 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 30 Oct 2024 13:36:15 +0800
Message-Id: <661aeb8658f53e71814d204da393968b998a9939.1730263957.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v6 6/6] net: stmmac: xgmac: Enable
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
