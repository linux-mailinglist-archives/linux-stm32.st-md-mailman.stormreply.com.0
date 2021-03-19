Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D134341AB1
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBC63C58D5B;
	Fri, 19 Mar 2021 11:02:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1BACC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:24 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id w8so4472066pjf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSxNdunUcfVjOwF1Ukve+wpGCmUe1GqXnjLiDip7r60=;
 b=Ijjt5X33sHG6VLfr/X33ofH/zw3C83x5jF2PbSQDxSentiAHZIdiWspxk+4wpX/j/k
 dll2UbF/VnvXh89Ud178c7zqeR+G4sJ9kXGUWQys5Xo57/GUxwevKvql1vB2pRI9s2O4
 D8RA3+HfIXxAwA2e9r37NxLzuu0F4RH2HJ9DmslDfOAp/DbJnmv3SEbR0U2UxXmHN7Mh
 saPQ19ko9HehDeewr55u+I6ikxva25/lNvth/kyOEKrC+9aZgJ43NxDjrjcpXa9VJMcJ
 jkHyArhlPzf/2CaRZ/kRVPzG2TZFzLvwSofJeOfhmkx4TFT9uXwU4TAvQfYNxBBCq6a9
 FT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSxNdunUcfVjOwF1Ukve+wpGCmUe1GqXnjLiDip7r60=;
 b=Qj+ccrjc86j0qKBRZZ0OxUTfJwjBxBBgnWykeaD2MM+x0oKbWvl3nWxfcRA+KwzXbw
 llL58//ZuST2H2+pXCb9reLjCni8V+Fq96DG+9LajoxwQkCcmACYIISIxnaB1pkpWoDr
 DQ5rm4eU0zlC5YDztBH060f3VXWB/j4AKi+VLKRye62tfOLcmyQfFlMovOK0r9Ki9rlR
 K3NCUi46Sd8vMf0twxrT/oNH7WFlQYVBkoVmquyWjE2lr+YSUGHrh8NmWMwB2HJ5zG9a
 yWdbtmxbPbQVGwyonMmnCz+I194TeHsftw/jM0ysTK6Xy6i5J+piwuCHLY0fXFGMEgY3
 RKkw==
X-Gm-Message-State: AOAM533LOCd8bsnKmumoI9TZ76pn5PzMhjJW6RmGMWpZe8XDqz68EerZ
 ntVvKeQJyTB5T9fQjP9fpcU=
X-Google-Smtp-Source: ABdhPJxakjll3igoMgwm09QbKi+PEN8Sji9wqQ7cN5cp5slUO1v+w3Ri5WLxTByTWvLWd5tA36ZOJQ==
X-Received: by 2002:a17:90a:1b0e:: with SMTP id
 q14mr3596346pjq.41.1616151743496; 
 Fri, 19 Mar 2021 04:02:23 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:22 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:35 +0900
Message-Id: <1a454675b256daed71e0c0053377f36475f920d3.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 16/33] counter: stm32-lptimer-cnt: Add
	const qualifier for actions_list array
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
stm32_lptim_cnt_synapse_actions to match actions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 0f7d3f1ec1b6..c19d998df5ba 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -146,7 +146,7 @@ enum stm32_lptim_synapse_action {
 	STM32_LPTIM_SYNAPSE_ACTION_NONE,
 };
 
-static enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
+static const enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
 	/* Index must match with stm32_lptim_cnt_polarity[] (priv->polarity) */
 	[STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
