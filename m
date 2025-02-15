Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BAA39507
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 09:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E6E1C78F87;
	Tue, 18 Feb 2025 08:21:20 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F7EC78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2025 16:44:20 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21f3c119fe6so73226445ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2025 08:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739637859; x=1740242659;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zen24IcM3djM9YgCwghgtHtMwzQ4LV/2qqQkL+b6/N0=;
 b=Z/qbCCJWgRLtIylB/FGBiplmKMeP1GIcILWqQVl4yPmVqj9+vqB/qb6XOsklOWcPc8
 a1IkCrdQNtft0PlHubZhbE9T0tZOnmVNeA+CWSfYht0tHBM9ccja/D+0DJ59xTamZfrC
 Nv4G5LDrpXxYXe7yaSXmuG8p5aFP57Koa96kESwP5gqYDX1qxjX7nGp5QrAaqRBBfZVS
 XOjklFAZl4nQEExLuuz50Knn6A8Sz8h9I96tlkKEUkNa07Qbm8iAJKYat0hidBzI16dc
 +rb8qk85A+IxEn2YFrTN0Ldi/UELuYurVLVWh0AOfVrmBLUvAG+IvT3YoMqN1jzUrsTZ
 YOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739637859; x=1740242659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zen24IcM3djM9YgCwghgtHtMwzQ4LV/2qqQkL+b6/N0=;
 b=IXUsFwSP4kMZJwcPDxzMowUdo+Ibd7LMpnG9VKNHjLO9JGCXT/a5udw7wenrnIF1jy
 giTuFNyN3z0Xqyhs41HQbne2uKLrgUQl/mkJWdT1ra7WZxRLBlwIjZLbjfVXLdq6xaBi
 NxXkLluRISw5ZBkg3/Ro4BVJpVCOvOhvL9Ga4BrQHTgV1xtLF6f7YJ4e/KshDYUef2c/
 Q2DaKEhXq4Nqu65rRntDgDayOH9vEz3Q19FMcRQp29T44NWPaPTua+PFxHMFA4y9TAWe
 kGRbTIksVebEEmV3cg+FKPD+gjq4NT7U04w9NHFUVJS+oJ/yOy/nKsRFXTZtXRubk7o9
 eeAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXySraR7npIcmgrR9ovM5TSF7rHptYuwx2wyslkPjdxsTsYO9WXD+EuCjt4gx2OzhS75fmJntnTc7PeXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEejbSIlE6eZvTrJUHrhnw2IcL44NZI24asR7kf8VQez/sY48m
 23pefX6QGYEhB0pkIbeJZflaF8WV5HaUdkLKKagMYvIB4bxA6Ozp
X-Gm-Gg: ASbGncv3QTcjRksAawBv/0pGQojGaxwVfhyUV82q92gUQDufT5Th+V0XRraJzoAzy9C
 inW+sDSaAMwJE9l1RoxZK0zHS+edfkBODbnYb+dZBWUPYS8rhzwM2WscRruo8YtohayocTaBqLb
 UgPM7TJ3ti+YhiVI/mt4s9GwOSXrY7mtBwJk8XGAwXAm+S/baNNVb9PqM1qp0M/N5kFt5JWOERp
 eiXEtLVLcpaoFTvMXfb3I6KCFQ1wEUtQvqyiAbT9Gtrkqc4FPrMpiHzwxt/Zj9zIjzGGJHBsqSA
 ofIf82uWzoPAVdLAGp0g
X-Google-Smtp-Source: AGHT+IEB5/OkP6MlT6rURyfDn95k/vC4OmFIg6jcwrba1EZXG0N0SK2ZbXoBU4WJ2hpKhgmrU7THSQ==
X-Received: by 2002:a05:6a00:c9:b0:732:6221:7180 with SMTP id
 d2e1a72fcca58-732622171dfmr3553434b3a.5.1739637858885; 
 Sat, 15 Feb 2025 08:44:18 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7326dba6585sm483348b3a.14.2025.02.15.08.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 08:44:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Sun, 16 Feb 2025 00:44:12 +0800
Message-ID: <20250215164412.2040338-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2025 08:21:19 +0000
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org, visitorckw@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: Use str_enabled_disabled() helper
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

As kernel test robot reported, the following warning occurs:

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)

Replace ternary (condition ? "enabled" : "disabled") with
str_enabled_disabled() from string_choices.h to improve readability,
maintain uniform string usage, and reduce binary size through linker
deduplication.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 96bcda0856ec..3efee70f46b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 #include "stmmac_ptp.h"
@@ -633,7 +634,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		}
 
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
-			   on ? "enabled" : "disabled");
+			   str_enabled_disabled(on));
 		writel(tcr_val, ptpaddr + PTP_TCR);
 
 		/* wait for auxts fifo clear to finish */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
