Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A8323F37
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 15:43:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73573C57B59;
	Wed, 24 Feb 2021 14:43:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6480FC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 14:42:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p3so2009027wmc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 06:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4kcaWc3A3e2JpDYvEG1HkJ7RHkTySsh0QGk3axijlk0=;
 b=zAWYfmcRa81N8ayfCtv7YISYLImGL3DtFIgXnH8YZ82jEbqtH8t1om/1yRzEU80h8S
 uv5Y98HkbEi/Mb/lBNbhpZa931kwWUymnps+vlG0AsrbjF4qB8d77f6R9s1pR14nfDy3
 NQBi6DnKQRCqNEna/JcrzS8YAdLVnkiThf/49nhLv7kTFLJzHt5Wh1rUpjp0caU4M5V3
 4C7hGu6Yfonujcxtycnfrka4VAEYXKUV+SFES403HdoKD50OPG5cUJeXOSqfx/bhKRG0
 eltMsneu9FwwFUEzgJv1vAOO/WprVJWcEe+lVtkdzDXQVUgU2GYyr/EAVOmYPx2mVJwW
 RQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4kcaWc3A3e2JpDYvEG1HkJ7RHkTySsh0QGk3axijlk0=;
 b=d2F5I0QI/XDZRuZWATNSFC3xLKSg82heWqq7Of8fNeZ9Ecuva3Eaz+y8klUVshrVIk
 eSVjtBgitTJHk2IUsTGuNSDru+oYwN7UawUabTQI8MdP+dvFHvSRngOBrcdGIFMtL/bQ
 aUXB05jULbFnWf/7kHEcU71OFWv0YqzLDrrRMn9IZFs3AfQD5+JbtROogs4EsPerIc24
 05mzoTnagfMRx6rcRwaIdBVgOsYwkqOQ80BKVXlemFJ7yae5k/19k9yWxGiAth2ZLkS6
 CeRDZ6I0xZ+QZNb4ZcwoAGmkBm4Eal4TtPmHzlj3Ik9UicFO0PQG0NSveHiY39Y46mbC
 feqQ==
X-Gm-Message-State: AOAM530XlJWrujihLAQQH+fGsNT6g+6FB0LXfwURnl7GptaHyPa/R0SZ
 AHZYyoYBE1xOsWgaQ9+0hmrcbg==
X-Google-Smtp-Source: ABdhPJyZD7BW+LIu4wbjkLZsjSoMWfexoyGfPB8WVBh3k+PENCICivX461RCP92G6r8IrNnAdG9zrw==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr4037793wmb.88.1614177777616; 
 Wed, 24 Feb 2021 06:42:57 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-157-252.adsl.proxad.net. [82.252.157.252])
 by smtp.gmail.com with ESMTPSA id p3sm4170669wro.55.2021.02.24.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 06:42:57 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	andriy.shevchenko@linux.intel.com
Date: Wed, 24 Feb 2021 15:42:19 +0100
Message-Id: <20210224144222.23762-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224144222.23762-1-daniel.lezcano@linaro.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v2 9/9] phy/drivers/stm32: Use HZ macros
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

HZ unit conversion macros are available in units.h, use them and
remove the duplicate definition.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index a54317e96c41..02dd12bb4692 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -14,6 +14,7 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/reset.h>
+#include <linux/units.h>
 
 #define STM32_USBPHYC_PLL	0x0
 #define STM32_USBPHYC_MISC	0x8
@@ -48,7 +49,6 @@ static const char * const supplies_names[] = {
 #define PLL_FVCO_MHZ		2880
 #define PLL_INFF_MIN_RATE_HZ	19200000
 #define PLL_INFF_MAX_RATE_HZ	38400000
-#define HZ_PER_MHZ		1000000L
 
 struct pll_params {
 	u8 ndiv;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
