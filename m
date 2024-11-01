Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FA9B9213
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 779D3C78034;
	Fri,  1 Nov 2024 13:32:41 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F12CEC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:32:39 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2e59746062fso1640409a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467958; x=1731072758;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=DTkI+2XyiZpIiZrGahX7bdkJq6HAHtIPRcA/E72YMw3Bml91WhsGpUlX7VrT6pyC5J
 FsKUw33O4AFLfUlwz1MToYjPD2I3NSeJ+ANzU5St9BR0dn5mmujofsG/ceRZOnytdBHF
 Ob9VMxsKdQ8/Z5qUR1++ZvMCqkop90WD4nZAey9qBjOUf6kb22P571fvVFQwtNVLR8yj
 p77b/FrB3Lck81cX7W1/0niUVhOTvfWNwoDIe04MitU/jWIYLn3M+O+jy0He/ppBPwiu
 PTNghK8eXQiPuYAA4+UTjN3VkSae3p4m/i2WcV+grm+ycIFi2WlNeX9eoTikye5y1Pa9
 IMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467958; x=1731072758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=gkGTB/gYxuHy0YeH+g/AlQVkLKTpfpghGhdcEJ/zc3Ep45w3W5vrsERrTKBjjZVJ2S
 EmkcLI9NMm8x4fT6tDZnqzIHB+XxWlFeLGo8yEEY340qNNUlahQrjE4grMM/z6kcYdoh
 YWAfnARhazsIQJZUCqlrnObgMkZDXHUn9m6ecd7q1zh5bPAV+fJgGzVR1NWbJLgSsqOG
 kqcld8jq8jQY1MItRQlathQmSB7A0nyX69eoZ771fRHnMQF5xs8FMoQFpOY2jnd6Ngpb
 tqDmEoGTQ8YCzKNiN5U6dit+4OTm1LFL+rw46HHR0SADx1wy5st4Nd8KlaAd54hT+R0x
 ar/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVQaAtOktUIk2pt4og6Xm027zP032VSLLxnRfPTIrFsKhnAfeoJQMR22sl04VuTKP2JgXHG7ck9U5R7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY99o46qSL39zswIiJlAyVh3/w8/1uxljjxr7ub7OuGBmFzNTo
 8cBjzS0dxoQ7ujCPRiVY+FYoB16cbeZrpt7v4zZ6t5gN+x6pSfy3
X-Google-Smtp-Source: AGHT+IHTARvDrrbplxN/Ao00eWN31nXbIywcdD4rM9k0ODO/JUtkFyG0XgpgcHwQj45NcT/QvLH8bw==
X-Received: by 2002:a17:90b:38ca:b0:2e2:cf5c:8ee8 with SMTP id
 98e67ed59e1d1-2e93c186141mr8591363a91.12.1730467958001; 
 Fri, 01 Nov 2024 06:32:38 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:32:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:35 +0800
Message-Id: <0575ef1553d572b7c8bc1baafa3fb7ac641073e0.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v8 8/8] net: stmmac: xgmac: Enable
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
