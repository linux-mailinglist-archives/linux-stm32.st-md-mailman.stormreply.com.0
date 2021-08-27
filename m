Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6803F930C
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 05:48:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EECCC597B3;
	Fri, 27 Aug 2021 03:48:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0F9BC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 03:48:18 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id w6so3098143plg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ailO7mWThdrVL8blMHbd6DHGx3BHyfc6JT8C/AVCxTw=;
 b=hGJNel52AB4HPlmab7Q3dYqidGZHRqIPtSwUqem6ds0ejfoHDhxaaR6BoLtvxjoh93
 9DKRxXcivLvrT8A676B8xOo7YSnxaI/+H9euY8Zd/SCci9enXb9uPvo/ivUeb6rsraiu
 awqubFC1VqYB9lHNkjjidBkt3HOnilq4N2lYJo5U58KbGvohFMaqqm2MmbgOo6G4/gAe
 RhEzBuiXHAr7i6sVmYtzkc0KJTZa3TDgWhxKUJPudU3PCmdl1Oq9VCtQp0rJbfuzQexY
 HzokXmhQ6qCAPU+CjT2pAOUWshUlxxdCdi5tmIkZW6pAQMeew+3NJ/25Uhm+4hrASQUK
 JpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ailO7mWThdrVL8blMHbd6DHGx3BHyfc6JT8C/AVCxTw=;
 b=PV/CY0Pn+If1IF0wOoEnnkpwpFoF0IpJ11kZ/lM/PswTlrLpxWjNqjafFlWKmdypiE
 OrkqSxaf6yZyfKFucLNpQHIC44lNKeo11oWteqRMcHJ/czTJQsJssqo1mVjtMCb0H8u+
 gfhNTtufTvMV7+aYMpLXuRaq9stNlR/wsTyLgXzbhVfVxcoJaXsKCsjIzv6pmmrZkgce
 KH8yHs13rPQ1IyJrz/AXvKRVNaTuCztY1L53A1g6XNuCqvOXXS+TKF50QDPVMYE2HqAH
 x+jb2g4s1NPRFDnabjBkLJAPU7G1KhnvXtWG50lPF/RFx7jEODIp32NTzNmhsPjeor6e
 WKbg==
X-Gm-Message-State: AOAM530PnpDf+4YZisRhukEW53nVw99CmUXPgUvUx+ZpiSBFI4p1mUaG
 j2PlFS5+7DOtIk9WnR1Qv3s=
X-Google-Smtp-Source: ABdhPJz6HSG/IOmN4K3PSxmGRWXA6Onvhl/sDmrN61R87mNnnixTGMgF40yfuAJdfhNNRbLMD8iNXQ==
X-Received: by 2002:a17:90a:49cb:: with SMTP id
 l11mr1353505pjm.142.1630036097608; 
 Thu, 26 Aug 2021 20:48:17 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id o6sm4364693pjk.4.2021.08.26.20.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 20:48:17 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 27 Aug 2021 12:47:45 +0900
Message-Id: <a111c8905c467805ca530728f88189b59430f27e.1630031207.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630031207.git.vilhelm.gray@gmail.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v16 01/14] counter: stm32-lptimer-cnt: Provide
	defines for clock polarities
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

The STM32 low-power timer permits configuration of the clock polarity
via the LPTIMX_CFGR register CKPOL bits. This patch provides
preprocessor defines for the supported clock polarities.

Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 6 +++---
 include/linux/mfd/stm32-lptimer.h   | 5 +++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 13656957c45f..7367f46c6f91 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -140,9 +140,9 @@ static const enum counter_function stm32_lptim_cnt_functions[] = {
 };
 
 enum stm32_lptim_synapse_action {
-	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE,
-	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE,
-	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES,
+	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE = STM32_LPTIM_CKPOL_RISING_EDGE,
+	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE = STM32_LPTIM_CKPOL_FALLING_EDGE,
+	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES = STM32_LPTIM_CKPOL_BOTH_EDGES,
 	STM32_LPTIM_SYNAPSE_ACTION_NONE,
 };
 
diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
index 90b20550c1c8..06d3f11dc3c9 100644
--- a/include/linux/mfd/stm32-lptimer.h
+++ b/include/linux/mfd/stm32-lptimer.h
@@ -45,6 +45,11 @@
 #define STM32_LPTIM_PRESC	GENMASK(11, 9)
 #define STM32_LPTIM_CKPOL	GENMASK(2, 1)
 
+/* STM32_LPTIM_CKPOL */
+#define STM32_LPTIM_CKPOL_RISING_EDGE	0
+#define STM32_LPTIM_CKPOL_FALLING_EDGE	1
+#define STM32_LPTIM_CKPOL_BOTH_EDGES	2
+
 /* STM32_LPTIM_ARR */
 #define STM32_LPTIM_MAX_ARR	0xFFFF
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
