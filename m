Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B2341AB2
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0603AC58D5B;
	Fri, 19 Mar 2021 11:02:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9116C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:29 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id y27so3427620pga.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecJ7k92m0DfcFt1BeccNAFge0TH40D/RcDRWwVj9l7I=;
 b=ZuFxGxChMhbMQg9PTqZGvyF/6ZSct7w2HVa1tbkOA+RI4ELbrcroE/QsWUJ8FWGtav
 VAH9QUmbHgYiMQddnw8ql5IxvAxD7TgqqgnG8Hs19A7eXklWhQ5xK8IzhhEhQYtccTt3
 uQ97mMm1YymTR/PXHxCeXl6rgwDy/JVPf/TJpgM0KSs8XSbx97yInEYiw849KHrcfSq1
 j22A4M8j2yf60az58Pvgi/61KLi1C+dnQS46BWdpD8yeV8hyKSAhHVYFIW8VLVCT1Hmw
 U96wffI+Doe05LNhBAKYs2nvluOuk7rlCkcXwrv33GNw8Nv8Bzp6y33TN+KJN59ldWhS
 K6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecJ7k92m0DfcFt1BeccNAFge0TH40D/RcDRWwVj9l7I=;
 b=WAqgDsRu/PgMnVYrb8Fjnj61AKeZqJNfq85nTsq/WDtoRO5Mx5m5WhZwmXvt9iBAFe
 edGckkC+w/hB5YfvzZnFm7QCGPCpPVQWCPvT7ffw4T3cd7HtmsjWXXX3+8BUDFYB4Y4t
 sI2pAfjsIbpbZ0jvTz2Ut/JrG02YgO4sP7DzkgZ4WmJnbeFDaEzPXccYnk+PBE/Q6Li+
 tqECzX+pTThTDDP5lgSG3jboAm+ZleJ2c+rpBhvsQrXf42AndUv8ocnOlGFWDId0y+HJ
 td13+HWOgdyb3TAd9lsPRXAF/ZSn1qGq+HNKV0afzoEmqukx10HOkh7f+08qmaHrbgWd
 /yjg==
X-Gm-Message-State: AOAM533QE6kDaIneyUeyzS8zDeLUGvMcmfcLmqHyS4H5Jvm2pcqMmPxy
 HJueBxsRTKS5fj0+QryGQEG9Gdq2Gqqqcw==
X-Google-Smtp-Source: ABdhPJyZPrMcXR4vbb26JH5SvHP8Hfz8rE8wKT84uf2aNvKA1Glc39Sz/S7jRC1NXOOl/uy6/t8c4w==
X-Received: by 2002:a65:6a43:: with SMTP id o3mr6751137pgu.297.1616151748594; 
 Fri, 19 Mar 2021 04:02:28 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:28 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:36 +0900
Message-Id: <87c00aa93ef03c058cbefefd5b8ab26ed51098f4.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 17/33] counter: stm32-timer-cnt: Add const
	qualifier for actions_list array
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

The struct counter_synapse actions_list member expects a const enum
counter_synapse_action array. This patch adds the const qualifier to the
stm32_synapse_actions to match actions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 0c18573a7837..603b30ada839 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -267,7 +267,7 @@ enum stm32_synapse_action {
 	STM32_SYNAPSE_ACTION_BOTH_EDGES
 };
 
-static enum counter_synapse_action stm32_synapse_actions[] = {
+static const enum counter_synapse_action stm32_synapse_actions[] = {
 	[STM32_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[STM32_SYNAPSE_ACTION_BOTH_EDGES] = COUNTER_SYNAPSE_ACTION_BOTH_EDGES
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
