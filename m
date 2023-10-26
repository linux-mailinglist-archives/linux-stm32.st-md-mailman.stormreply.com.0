Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E57D7FF5
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Oct 2023 11:49:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C36E9C6C857;
	Thu, 26 Oct 2023 09:49:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4634EC6C83F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Oct 2023 09:49:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1cacde97002so4977755ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Oct 2023 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698313752; x=1698918552;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=trQmZAbaoRQLYbgSGHo4E3o4LgBwFck38x5wYn9EorM=;
 b=JHczQMaVQbQfxpa0EZ02yx3Zb5AT1ExPS++BBjJ5+X3fKcckFP+UvGbPTHPVuuqBLG
 +FT8DJKwTKwiKalsBhe/ipnuxeglST0Vzt2vC5usRbv/ocgUtbNFbTBgeGqJ+EAhwbL2
 WU1ymFZN4v8sXZPeZ4NgD+xnL9r+ylMNLmJsIryy6Rs3mjCwCJsM5qhmz79wjOJZzIWI
 GKbdvvsKqCkMRLeTp2srWvhA0ny/EPkA6BFzmZyxYgmyn5TsZEQelWm7jG2s14oOyboM
 k4Qu6APLgdOGMIIP50tSutMI7WZtp8dQOUciEPMQLkpg708FQqTQhRaivZ/Hu66Bz3bg
 Ci2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698313752; x=1698918552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trQmZAbaoRQLYbgSGHo4E3o4LgBwFck38x5wYn9EorM=;
 b=eUwy0Fj61Gi6GOuIJJroM/vd2mBv78RVsjG5CLQLLedNhEnfgSSIRjkyMp2OzqmGVv
 M+b8xT/LAn/McMA5GaLiVQkSZVJSJkEzaEw5uVtia7OtkhY1GyQMwKcVf4SxUJu6BIFg
 Ni+GTVAh/n8B25S931w+HbGagp5o7kK7PZD4qmEBtQMJ4zvZw7GfPPdymIIkg5kw9tVc
 72R84KsSkkAFfCv7qrxKCCIZGdnkXRZaZzuDjO1NEWho+xwbVEh+rkOP2DWxXl1C4scU
 6kdj23HThOwJ3cJPwZ9hZFLuR+u7bWHAjJTZW+xoc50mkq0ooB7giBaDM0S7J3q/dWvC
 WNIQ==
X-Gm-Message-State: AOJu0YzoFNTEI9s+G+PXolExYGWjwHn8lmauSva+lLFFSBO2l7x11Zh9
 kQAuSo6tKVv9izygjGF1b3I=
X-Google-Smtp-Source: AGHT+IEY6OtenDK7uCoSvT5qxvLDxbjXEYrpn2zBZno+Rv6P5yQzWR32ht2pgfIh/xPY2jg4eMpn8A==
X-Received: by 2002:a17:903:41c7:b0:1ca:b26a:9724 with SMTP id
 u7-20020a17090341c700b001cab26a9724mr17622651ple.12.1698313751680; 
 Thu, 26 Oct 2023 02:49:11 -0700 (PDT)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 ji5-20020a170903324500b001b06c106844sm10674264plb.151.2023.10.26.02.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:49:11 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Thu, 26 Oct 2023 17:48:56 +0800
Message-Id: <20231026094856.986796-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: xgmac: Enable
	support for multiple Flexible PPS outputs
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

From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
in Fixed PPS mode by default.
XGMAC Core prior 3.20, corresponding PPSEN bits are read-only reserved,
always set PPSEN do not make things worse ;)

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 7a8f47e7b728..a4e8b498dea9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -259,7 +259,7 @@
 	((val) << XGMAC_PPS_MINIDX(x))
 #define XGMAC_PPSCMD_START		0x2
 #define XGMAC_PPSCMD_STOP		0x5
-#define XGMAC_PPSEN0			BIT(4)
+#define XGMAC_PPSENx(x)			BIT(4 + (x) * 8)
 #define XGMAC_PPSx_TARGET_TIME_SEC(x)	(0x00000d80 + (x) * 0x10)
 #define XGMAC_PPSx_TARGET_TIME_NSEC(x)	(0x00000d84 + (x) * 0x10)
 #define XGMAC_TRGTBUSY0			BIT(31)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f352be269deb..53bb8f16c481 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1178,7 +1178,7 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 
 	val |= XGMAC_PPSCMDx(index, XGMAC_PPSCMD_START);
 	val |= XGMAC_TRGTMODSELx(index, XGMAC_PPSCMD_START);
-	val |= XGMAC_PPSEN0;
+	val |= XGMAC_PPSENx(index);
 
 	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
