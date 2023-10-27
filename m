Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315C7D8D47
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 04:56:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7258C6C841;
	Fri, 27 Oct 2023 02:56:56 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04362C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 02:56:55 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1e9d3cc6e7aso997530fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Oct 2023 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698375415; x=1698980215;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LDZeSNoT/F6uceX8xPaWwPCrqzVzl/F9opDYqP7fPJg=;
 b=XxILWdioev4z8mlYwVrorhVAvepwyuKhV2wHWEQottTK39u7XOxdSFnoFUQ+MqS4ch
 ViVUhU8IL/kxOiUVLpgrvlWQANgsZXq9MLrv5CKnIg8cg/c7f8WtaM0Fm3lqumS6ioBa
 3IZYGQhDRgbga5lcaAUSFe0XsqtFaRfxwb8jggEIwz8ibWZ+0GZpc3g2FaiO1Kkhrfdh
 3nWTexKGIDnXktTGAgQLcmhqGShu/Hjqr837CgUyP2zm53RXFWSdPnY/4TqklJTJUOqb
 6mTVsjZpFBXRLpjLqHLNmPk1E+cYG1Amcrw/zfhvWsEGC+7pVNbsb71GY/fsE9zppeWa
 u4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698375415; x=1698980215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDZeSNoT/F6uceX8xPaWwPCrqzVzl/F9opDYqP7fPJg=;
 b=KC7WajoRhzruHUIUEMzhRGgu2g+sHbYAHlhygrOT6idtxgVk0yYZYmtcQDTbgQgT19
 UAfoz71XlV2g5s1EYxvSXaWtinu8feDAwUIhuEgQc2SiRWldzWA03OyLvc/p1uU9UMFv
 CikvIBhnNV5ftJebWNi5eSF9zt9pjUIONChr/HJr/gfiJPjoeS2oGQm27zgFKvZm0bDT
 XOJSTVUnOfjiuM1d2a2nzgH7rweEEkzBkjHXPk2dnVE9WenTfqcvKZjVxfKvUSZwuiT4
 MSV4vu3clp3j2Di8LStFOr3OUsD3YliVsJPJLP9souoGMV/ERqtDT6CloyFqEk5zIWzq
 10Fw==
X-Gm-Message-State: AOJu0YxLNvLgdf8WZVWM8VFeIGPKvMgRQB4dP0aZgAZ14hzkGlia7/sd
 1OIznSD9vbeFVefMQoFsPuo=
X-Google-Smtp-Source: AGHT+IGAnGmIB1mQEhtj+QsEa41nDsx78wO2RvvhhYj+HlCbTyldwYFUDGN/YyeLNRYe598RQaKFmw==
X-Received: by 2002:a05:6871:4188:b0:1e9:e063:ca6b with SMTP id
 lc8-20020a056871418800b001e9e063ca6bmr2108233oab.32.1698375414687; 
 Thu, 26 Oct 2023 19:56:54 -0700 (PDT)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 z127-20020a633385000000b005b82611378bsm275339pgz.52.2023.10.26.19.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 19:56:54 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Fri, 27 Oct 2023 10:56:03 +0800
Message-Id: <20231027025603.1035668-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: Fix support for
	multiple Flexible PPS outputs
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

Fixes: 95eaf3cd0a90 ("net: stmmac: dwxgmac: Add Flexible PPS support")
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
