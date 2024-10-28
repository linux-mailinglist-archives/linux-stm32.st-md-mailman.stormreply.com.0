Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0B9B2369
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 04:08:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD24C78015;
	Mon, 28 Oct 2024 03:08:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA409C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 03:08:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20c8b557f91so33794045ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 20:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084899; x=1730689699;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=HUoQ79z/2IAT2KsayR/evUGUh9oNAJ0e1wKaurI+4sz+8ffQ6AJdzcgecwC1eXSp6S
 c1WQ5RdjppBy8OzENrual5yt+MT+iP/mpgcwvlotQIAaWw/RPO7iXcQWL2exN0ugTBIB
 QdPZIaJrp5AwIQX1Z6C2rByK/NUK4UBKPXax+0+GnCiWbMMFdGdrSiUf1ImxE+3GM8Cy
 MXfqlLLYoPSGGgR1/2HBnr4V2oVcxUpsYgOH/XDbaudacass8XlYwL1SUS3osuObI2rW
 6ze+/KFftlyeqbgNWSLIvcAuVi1IwRieOiwYxa1kakGwjIRd7W/t0ebzANDlGcUJ9jC4
 FW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084899; x=1730689699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=pT6gSxv++OdHDNJDdRXoim0O5DwudtynoFllvhJl7GA+QLTWO2fgJdOwgzcF3ZwSyx
 G3iEp8f/X7LXPYYbBUPfBvwvwqtHGBVIsgSaQb1MdnIPT9xssuH+PXFP9schnT/bt5bf
 6benYsTwhp7yn10H0thQOYOWf77brrhgExxqCF902P5AqQ/SjsRRBoLeTbqepgLpJkGZ
 9IQ1UgQZc61erOciXyHLj5KDfcBvatRwJPUbPZQdL/rldpz0LA3HOEldawqV2QnRPRU/
 VK/RBNIGTMoGS9ajgsJPMiQ4swjtESHLBdZjN9+y+mEFgn2qJg7GlXz5d9NtDbR23DyP
 DUrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tpbuFKveMvCv2SwkvgnHHkqu02wxUV9MS4ixfaRpOZBEytBKWlBe6VvyhqF/zsssXccuc41NUFFo8g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywl1Ut8sVPxRN37Nxy4LGNOIqZAhWv/Vk8dNh7hMCBIm8ZSkiM2
 tgO41yYJUR3Iz16CJpNsM95aPVxd8ks75zamM00wn6YfpcKUjBbNWit1pA==
X-Google-Smtp-Source: AGHT+IFchisKXMXu4T+iCy7SrFqbq7c/JyULflLF19QqNcWyjDqPmVKAegFzkUP62qdTFlLz5UXVQQ==
X-Received: by 2002:a17:902:f607:b0:20b:ab4b:544a with SMTP id
 d9443c01a7336-210c6c6d591mr113535035ad.43.1730084899264; 
 Sun, 27 Oct 2024 20:08:19 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 20:08:18 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 11:07:29 +0800
Message-Id: <aa950a5cea1f7b2ac1ff49c3eb958c01d46ee778.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v5 6/6] net: stmmac: xgmac: Enable
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
