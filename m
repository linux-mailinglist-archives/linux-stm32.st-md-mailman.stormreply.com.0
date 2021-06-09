Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EF3A091C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A889C58D5D;
	Wed,  9 Jun 2021 01:32:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23E4AC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:47 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id v12so11670598plo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lJOl39aSDR3XMZTfLJ4I1sJIXKWA+Mc9CKAY9Y1edUw=;
 b=N4BtFt7FKmHJOsOu7wd8wbYhg/V8Iacpd+LoaodYrH47vUearjxlWzr6UXsS90bxNN
 qE3x0WSNUL+PO3Ugc5kt0LAwiszsQi4E1xZbTp1ouAX82RTkCoRY+HTeEIsMkJS497hl
 7pElnbcH23GzUaPNzETgdXVQN0mxQ/nQM+75UUysaQrmmZSjbhDDD+ovl7rA8iEFEfzJ
 jjPCPTx+2YjXJ3D+0l2uFbPOfZaB+uwcDv42iYxs6Dh6Q3Jl3rPwEo1d+ecP8a/iEfPf
 BPdyAzAO71tfgOth5dCS+vdb3G0KYAuxMdnydZ+1/L2qxUYV+nhhdvNW70NHVr371wZc
 CDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lJOl39aSDR3XMZTfLJ4I1sJIXKWA+Mc9CKAY9Y1edUw=;
 b=lNAJ/SE61pKOkvYjt9HfeuGjtI4UxCR/yAyAmwBgHIzXsGxBe1Yf+RHyLtzvmmAxx/
 UMoqOZY/gOAozVnQ6xcS4iai4yRqqdD7+tYVypIycVpddd3p3XilUN2cTD3B//OFGfrz
 xtMrzM6pkRLyTUzx03TkrJ7Om7rSmdvc589yC4YtgDTjmFu2MWwo8IKtlCN3Gst3kIoV
 +4IdvpC8MYaLsLA3IxiSdN4SpeK5p6AbOXbo+ZP4AQ8GjvPFgzNh3dfUQt0Jdk0rS+qS
 hNqo+pUfdlXhWnWQ4TJSTlB6V66OAYcL9L8mbxv8bAxNAw6RV44AnRBLohuQZJ0YUcE1
 vSCg==
X-Gm-Message-State: AOAM533iQr6GlUT3/kQCMQrCrjDEtNfvLcClRcw3oUOXur+48kOzOuYT
 ZY8jQsdUyn7vklQNILJfBnk=
X-Google-Smtp-Source: ABdhPJwDjSkwZmmGs7WYbwxZ9wlvEo3/cwEjTyNpABkfh5ykOFVRM2a3J6ExtQshEWSpp03qwauVMg==
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr29635108pjb.54.1623202365659; 
 Tue, 08 Jun 2021 18:32:45 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:45 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:14 +0900
Message-Id: <46a1e7096dd9280d8f241894186b3c903956a55f.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 11/33] counter: stm32-timer-cnt: Add const
	qualifier for functions_list array
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

The struct counter_count functions_list member expects a const enum
counter_count_function array. This patch adds the const qualifier to the
stm32_count_functions to match functions_list.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 75bc401fdd18..0c18573a7837 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -50,7 +50,7 @@ enum stm32_count_function {
 	STM32_COUNT_ENCODER_MODE_3,
 };
 
-static enum counter_count_function stm32_count_functions[] = {
+static const enum counter_count_function stm32_count_functions[] = {
 	[STM32_COUNT_SLAVE_MODE_DISABLED] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_COUNT_ENCODER_MODE_1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
 	[STM32_COUNT_ENCODER_MODE_2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_B,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
