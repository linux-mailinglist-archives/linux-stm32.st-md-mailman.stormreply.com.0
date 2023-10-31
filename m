Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB87DC468
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 03:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278F0C6B44B;
	Tue, 31 Oct 2023 02:28:22 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3412C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 02:28:20 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ce532451c7so3014300a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 19:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698719299; x=1699324099;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mG+0u22Ez5LjKbUHwcGY134sP+y1ufdTeN3lJfckGbU=;
 b=PvfF0zttgeJLim0Z0Hde2FmgqVaRuCMZ7kMJVNSTAZ4YId3R9BctRPwD1K/YApZoV5
 YBzR7D5RH6KxHxDtXmP8/F3SoTsexT76rrT5k1cv+g7hz6/WUZUdTGia0ZHQG6LCBTVT
 5hA33bOYiimL2CYPXmS8bM5HjVDantS8U/90SzoWveYYMx/7kO7CDwU70TL4/p7Bxerk
 U2PhxfWvzlyzXNfzlTKPj7pJoasGiTZuqoN9USOSeAcw1DwXoAEuHSHbUV896I2SWvM9
 KmTJJc4SO12CWAlmo2ZfnYqtfS1FQ1vM+Pw5H3Hk1MMM/1QASOK1T2yqYk2LswU3ACN4
 9zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698719299; x=1699324099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mG+0u22Ez5LjKbUHwcGY134sP+y1ufdTeN3lJfckGbU=;
 b=UXz63zoH+RHK1kKIveGBEXMCYfUnwFZc8kMkKciqV20RTRIA2YuvfvfVPMBf9ccQbM
 VDzABoqkLOOP69pmBQ5heYbVjluyd/MVWo85ZNIDS/Ih/seXA3URMxDYRivi+UK4BW8N
 ehV4Ay2QHRLWnpfNdHfXDE/tmCshvGyEtEO1jH8ISgb8wE3JkBE5UtqNa4WuDBGfNskX
 7sNCZvtoOSFkHFOVMZds2Bp9nRNzh8kQJqo3CEPfCaaFDpB2mypA4W8kQ/GGL5JAMNpv
 lIvKnVQS0tQj8EQSH51IVZc/PwmtW3d5Kut3aubeTBPgsalbXeTV2jc6mCRfrWX8MYdX
 plLg==
X-Gm-Message-State: AOJu0Ywe6H5hQT9CuMdMBraZGWduqHiGZvx6BNQ04AzRmydOWyfl7/Fd
 2NLfD4Xb4UOPll3uyMsx6IM=
X-Google-Smtp-Source: AGHT+IHMXqpHgXM+A1WEBm92w/REB6KgbFUhbItfXimyIXXQ0jypN6c3gADLq5Fd9BbKM7xnIBxl4A==
X-Received: by 2002:a05:6830:22c8:b0:6b8:7d12:423d with SMTP id
 q8-20020a05683022c800b006b87d12423dmr10440748otc.18.1698719299250; 
 Mon, 30 Oct 2023 19:28:19 -0700 (PDT)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 fa9-20020a056a002d0900b0068fece2c190sm178510pfb.70.2023.10.30.19.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 19:28:18 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Tue, 31 Oct 2023 10:27:29 +0800
Message-Id: <20231031022729.2347871-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: Enable support for
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
XGMAC Core prior 3.20, only PPSEN0(bit 4) is writable. PPSEN{1,2,3} are
read-only reserved, and they are already in Flexible mode by default, our
new code always set PPSEN{1,2,3} do not make things worse ;-)

Fixes: 95eaf3cd0a90 ("net: stmmac: dwxgmac: Add Flexible PPS support")
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
Changes in v3:
  - Tagged Fixes: and sent through net instead of net-next, thanks Jacob Keller.

Changes in v2:
  - Add comment for XGMAC_PPSEN description among different XGMAC core versions.
  - Update commit message, thanks Serge Semin.
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

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
index f352be269deb..453e88b75be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1178,7 +1178,19 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 
 	val |= XGMAC_PPSCMDx(index, XGMAC_PPSCMD_START);
 	val |= XGMAC_TRGTMODSELx(index, XGMAC_PPSCMD_START);
-	val |= XGMAC_PPSEN0;
+
+	/* XGMAC Core has 4 PPS outputs at most.
+	 *
+	 * Prior XGMAC Core 3.20, Fixed mode or Flexible mode are selectable for
+	 * PPS0 only via PPSEN0. PPS{1,2,3} are in Flexible mode by default,
+	 * and can not be switched to Fixed mode, since PPSEN{1,2,3} are
+	 * read-only reserved to 0.
+	 * But we always set PPSEN{1,2,3} do not make things worse ;-)
+	 *
+	 * From XGMAC Core 3.20 and later, PPSEN{0,1,2,3} are writable and must
+	 * be set, or the PPS outputs stay in Fixed PPS mode by default.
+	 */
+	val |= XGMAC_PPSENx(index);
 
 	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
