Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD79EDDEE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 04:34:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 323D3C6DD9D;
	Thu, 12 Dec 2024 03:34:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C17DBC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 03:33:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-728f337a921so166204b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 19:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733974437; x=1734579237;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7pzYjRDOZjwQLGfG7tztY2fF9MD2eQ633kRSm3R85gQ=;
 b=NRZ3EMuCKllJKag8wep8biOUmFk46FpXi3vt04B/gGTbDoJUYGF6aInWASH1AEbJs2
 6Xr6U91hIF55/L+O59FNUK9cK8vj2mLirRWewVi4yfY6lkCh4inztjB4Q1D/chkc11Fv
 hRA84GYR1yHl2vLcjA7W7U11jB6WmL/3ob8Atwx5xPeGrLaeEl/G+4W/PBy6GVsNuVVX
 B/QBf9Xz/7ZJJnTbIKFOx3JP+vJWA/d2yW12ptaNe6KXZGz/j0WHBkoQ2c+zdkGELIbp
 3IEBFKA2LJ5t5lX1XvYKVtdE0nn11pN5IcC1fIHvSc/PzqyRkxcOm5ZpTEf7wn6BjK1Z
 QBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733974437; x=1734579237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7pzYjRDOZjwQLGfG7tztY2fF9MD2eQ633kRSm3R85gQ=;
 b=PPAn/VRhbaI3RqMgJiVg/RC/lUOMNjijivS3H8P+JUwYKNFSWQmL7rboxQe+xY3PsK
 FQ2PvoBjFYAHsLKdfvwQotN/y/fX4IIgV5yh1Xn4A1va6vkKL4ZEHFKmmbh/sVo1mJzD
 Yzkev3rhDvfO/KMdwb/gwbhZcVUMO6d52a8qzX6IZg0IdYJE+lq95kA8dma1rg1Xgiyd
 DU7QteQ0WzDa/v++k6dNbE8BCqaaDmxuIuFyji6re7g2NswsJKO4mPW+uNOT8FzIH3FB
 U8lfZK40aVP7nqbkm+YfsIKWoopW0WHKz95lF1GSXEpvzxKzDdfqwug6mODc5paZe7Or
 wRhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkoKrOOIvbq86DsQBe9sibmZMND24y5QGPoAPQG62RdlMcvMWM01yYyumeU52ju6XIP9s1vijefqeh1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEOvcHym7aq4k17Wqcxc9kpDmIvc/tZWiGOCPsPNaEaubR8cSP
 WlEy+U0RRzFAVtacswLC5i0y2X4aWrz/ZJ+5rvI0iePblCFJQh5X
X-Gm-Gg: ASbGnctzH5zlhkQTpO/Wtc9mdGfK+m7Z4ocXHsl/1S8VBsfaBX9XLqHsKZ9cp2ZNSmF
 UqQxkGXwi54Lox9uVyh4G71Jk9v/ZdsKf8kitu7rszkXC3sEKVeM95znPdO8mxNXTJ72sUaynH+
 rvkISoXk4yBhL55MOuXl5++Lt0Ccgiq86KAfCZK9ekNVIvtTsUn3bpP0rFj/TPt9Q2R4uCMXgFP
 W7638pUMWYh2xbhZJuNWhpQ8Qp4QCUDp1q6iiGUGzoHX1sSw1WT1urxVAMek60cLR5YDw==
X-Google-Smtp-Source: AGHT+IF2HUGVgJTHXHp2yZPxjGH98+Grs5GenuoQqTTyxoTeHaymmzl37DBT8/NhlfehPqg/7Ou6EQ==
X-Received: by 2002:a05:6a00:17a7:b0:725:df1a:27c with SMTP id
 d2e1a72fcca58-728faa2e5a2mr2417893b3a.14.1733974437292; 
 Wed, 11 Dec 2024 19:33:57 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-725f03a0ca4sm5879236b3a.113.2024.12.11.19.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 19:33:56 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Dec 2024 11:33:25 +0800
Message-Id: <20241212033325.282817-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop redundant
	dwxgmac_tc_ops variable
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

dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
keep dwmac510_tc_ops to provide better backward compatibility.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 4bd79de2e222..31bdbab9a46c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -267,7 +267,7 @@ static const struct stmmac_hwif_entry {
 		.hwtimestamp = &stmmac_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
-		.tc = &dwxgmac_tc_ops,
+		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxgmac2_setup,
@@ -290,7 +290,7 @@ static const struct stmmac_hwif_entry {
 		.hwtimestamp = &stmmac_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
-		.tc = &dwxgmac_tc_ops,
+		.tc = &dwmac510_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxlgmac2_setup,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e428c82b7d31..2f7295b6c1c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -685,7 +685,6 @@ extern const struct stmmac_dma_ops dwmac410_dma_ops;
 extern const struct stmmac_ops dwmac510_ops;
 extern const struct stmmac_tc_ops dwmac4_tc_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
-extern const struct stmmac_tc_ops dwxgmac_tc_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 6a79e6a111ed..694d6ee14381 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1284,14 +1284,3 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
 	.query_caps = tc_query_caps,
 	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-
-const struct stmmac_tc_ops dwxgmac_tc_ops = {
-	.init = tc_init,
-	.setup_cls_u32 = tc_setup_cls_u32,
-	.setup_cbs = tc_setup_cbs,
-	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio,
-	.setup_etf = tc_setup_etf,
-	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_dwmac510_mqprio,
-};
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
