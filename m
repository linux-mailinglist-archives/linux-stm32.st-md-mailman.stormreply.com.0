Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A87DB259
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 04:56:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2122C6B44B;
	Mon, 30 Oct 2023 03:56:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7B8DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 03:56:14 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1c9d407bb15so36051385ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 20:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698638173; x=1699242973;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y2LKPRDN6GCfDpHNmFLj1e87YJK73PiRp76sihBNMTM=;
 b=PEu49BsYcLlX2n+xAKfi7BlTZQDJLE6mnPOEI2hn5W8nRQT7f4v7CoXaFtuUOL8NGJ
 js0cu5N7hN1MX8tlIVJsBf8a6xGnTziQ2EKbLOQVALKYeX5JU54gKOxEoMcvhAFxvzrC
 hYkLDp1onZAxKnDI1uYkFSboAy1nOMb7NSfVcugKmeh4dpyR9btMfaQvYTY+ylRLxPir
 sxFVXpK4cSnprKAuWHlSLwAHTx+/a8PU8f2HaG1zM5z0X8sFa9ttol3gzZIfOjsVlsOO
 lHsm4k/dtMzivbtAPWUfWgaUrMQq/F1hSk1WkMDdEAEq0+DARmGimvPqP5Zyn1VcN428
 qHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698638173; x=1699242973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2LKPRDN6GCfDpHNmFLj1e87YJK73PiRp76sihBNMTM=;
 b=ghT2xGUF0xBZmUFBXWOMd6DUe6/d3JdPI8vt+5ag+x4b8ZSisVqtoCfw6szwsZMluZ
 aQ0ygVwhy4uEXJeAh/1faXcx1qsG1bkKA3YaP2pvXzKr9NFCcqAr/HW0V1n9V9LARs3R
 efNt6/7pviOJObiZUppOVLXVCZ8A1X4ziVGTjRswetX+y/AnPorX5kPEfIq0xkTSorI9
 t8j6EJjxWg7g/6NVT/vwBqNInuZIfd0FAiKylp4408kSoeWSHpUW+gO4c0Wui0pQu52S
 FHfw8cFzHZgC3eMs8btt6HkQuKQmw4bbTde28JmQ+xeMvM3Qu7xYG3N//5w0VaPtWI3L
 65Qw==
X-Gm-Message-State: AOJu0Yy+7uy3kOIaSsQJ4NMlGYkbQuOWc5dH8qkc6YmecUW1oAL8d5Dt
 GXopYE5LhIiYcZO63+GTS+U=
X-Google-Smtp-Source: AGHT+IFtziW0YEt+qaY773vj4t1QmwQ2WxPAPa4J4C8WbaX4O7OoKTqUrQZRKxurTVOpf3PHJN/cmQ==
X-Received: by 2002:a17:903:2054:b0:1cc:4146:9ecb with SMTP id
 q20-20020a170903205400b001cc41469ecbmr2679315pla.47.1698638173229; 
 Sun, 29 Oct 2023 20:56:13 -0700 (PDT)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 f7-20020a170902860700b001ca773d674bsm5159445plo.278.2023.10.29.20.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 20:56:12 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Mon, 30 Oct 2023 11:55:50 +0800
Message-Id: <20231030035550.2340514-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: xgmac: Enable
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
XGMAC Core prior 3.20, only PPSEN0(bit 4) is writable. PPSEN{1,2,3} are
read-only reserved, and they are already in Flexible mode by default, our
new code always set PPSEN{1,2,3} do not make things worse ;-)

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
Changes in v2:
  - Add comment for XGMAC_PPSEN description among different XGMAC core versions.
  - Update commit message, thanks Serge Semin and Jacob Keller for your advices.
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
