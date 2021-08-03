Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD403DED66
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 14:07:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA48AC5A4D0;
	Tue,  3 Aug 2021 12:06:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08094C5A4CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 12:06:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l19so29447070pjz.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q8bVpT2MoqkjornEKoFHBVMieEPYdCJK4XzKGZdm4q8=;
 b=Kf9Q6e/v4hWfe77Y24cfiGiGqTODHtRYxB1tCVdydcmX5UNAj7w6A39opK3yK3Ai9v
 iMTVgUSzDwMw+bV9wewAjZlqmiGdIuZXrlq+QnpF3D64R1aRhi1d+QKYOIBnKG0287Mm
 4QZWYPojQsqGzN7vUCrtO/oQXktRPfOyGEn+Y5CJCkCHdU4faVaxBKv+1P5lBTYBhWxo
 hm4yKkqf16BJAGfHmGq3GyK6KK8isVKHOT5kuAiYYPt3HTaKuvTZVwLmTqKCFJzHEVVH
 vFaIGLz0+pv7q1tAoJFyZnJcc2Pmkt1aknOB3zN1p02v6aOjEUr+ES8JEQ4MnyI6YiAU
 3/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8bVpT2MoqkjornEKoFHBVMieEPYdCJK4XzKGZdm4q8=;
 b=LT10JuygrbHWatp7vSVcOrhGZYFJKQ6l1xItufzxxo0HcTs4tMvydJpYOJLeMCLPsf
 DZP8gwbrFei2lrfGcJJvtnd4me//YAEVOxQ5fxzOGNhRr+7MK2cmnffx+x4tHs9m8C6S
 jhBmEjg859W8sFmtDrq971DKmSnUYBwcW935PHKWZy5LGZ0JZpi3DYhsRAQIKAyHFzvF
 GL8AJW494ffgB5rkYIl8+Ws70Z/8oV+FIlnlBG5xgbkIFLbuhf8eqoLerqa8QSAR2eZz
 M8368S9CQLirOUoIp++7UWAFd86A8cdXi+IyzZzAezBxl38D9nZR2CbonY4tSk2U4yCW
 pCUA==
X-Gm-Message-State: AOAM533YcVDCcKvzNWwaFYS25RskUuxEpJcM/HZTzXS7dz7QrcNn3SiD
 +DqjojSWHZAUrUKLHtPznhY=
X-Google-Smtp-Source: ABdhPJwgpyAbzc4kf8j39thCjtzGOlp7fsbR9hmxUuzl8miA1+X2WXqDT4AtOywTmcvluefg4GROhQ==
X-Received: by 2002:a17:902:e544:b029:12c:58ea:2e1f with SMTP id
 n4-20020a170902e544b029012c58ea2e1fmr18103971plf.45.1627992416780; 
 Tue, 03 Aug 2021 05:06:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n35sm7197502pfv.152.2021.08.03.05.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:06:55 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  3 Aug 2021 21:06:13 +0900
Message-Id: <ae8d3b20b8b02c96b1c9898ffa2f9fa5d99edc81.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v14 03/17] counter: Standardize to ERANGE for
	limit exceeded errors
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

ERANGE is a semantically better error code to return when an argument
value falls outside the supported limit range of a device.

Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Reviewed-by: David Lechner <david@lechnology.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c        | 6 +++---
 drivers/counter/intel-qep.c         | 2 +-
 drivers/counter/interrupt-cnt.c     | 3 +++
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index b358b2b2b883..d54efdb8d393 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -154,7 +154,7 @@ static int quad8_count_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (val > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
@@ -669,7 +669,7 @@ static ssize_t quad8_count_preset_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (preset > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
@@ -714,7 +714,7 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (ceiling > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
diff --git a/drivers/counter/intel-qep.c b/drivers/counter/intel-qep.c
index 1a9512e28519..204f94577666 100644
--- a/drivers/counter/intel-qep.c
+++ b/drivers/counter/intel-qep.c
@@ -319,7 +319,7 @@ static ssize_t spike_filter_ns_write(struct counter_device *counter,
 	}
 
 	if (length > INTEL_QEPFLT_MAX_COUNT(length))
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&qep->lock);
 	if (qep->enabled) {
diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 5df7cd13d4c7..66cac4900327 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -107,6 +107,9 @@ static int interrupt_cnt_write(struct counter_device *counter,
 {
 	struct interrupt_cnt_priv *priv = counter->priv;
 
+	if (val != (typeof(priv->count.counter))val)
+		return -ERANGE;
+
 	atomic_set(&priv->count, val);
 
 	return 0;
diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 78f383b77bd2..49aeb9e393f3 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -283,7 +283,7 @@ static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *counter,
 		return ret;
 
 	if (ceiling > STM32_LPTIM_MAX_ARR)
-		return -EINVAL;
+		return -ERANGE;
 
 	priv->ceiling = ceiling;
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
