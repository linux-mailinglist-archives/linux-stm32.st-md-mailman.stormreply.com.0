Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C7341AB4
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B83C0C58D5B;
	Fri, 19 Mar 2021 11:02:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01EC9C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:40 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e33so3425324pgm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPb+gWSSK34KYiB/GIEQN8ZRP7v+HVonTQM6Ywh1zp8=;
 b=GbwBST6OLctHRPpje6CQQ6A0Etw7HHv1ibi/PtZt9dyNRoMGuT/crP0iLQKj+aLj6I
 K/IwLftAjimPHfvY9mp3porI9HYjP7YXlIOnP1uJkPtYFabbNtskz2nJXNmU/rnVqQ2x
 6HKZl7I0BLC//HE9GOXCad+5TGP1HsfWiGMnmOdcxhxnFB7qLpBLLEh5OiojaBuHNPUz
 ARmLhaNGvylVdtTbIT0UTfCa5UdaEJ2GwiQGtRgh3J0tbKxm6RjyhHxIkhkg8psrUO0m
 M/WP+Jnw1swX2FmDEitAolGz7NkD0SupqG/Y9GOTNuL5ZYt1Jq2JigRVC+rrdrnu8nq9
 yXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPb+gWSSK34KYiB/GIEQN8ZRP7v+HVonTQM6Ywh1zp8=;
 b=dgVdTudFdFDhMLmNJBhZ7AK7dlAE3BkSVS+FM2KMbB9vgScECUHrlweWZEFiFEj0qq
 wXsPgM9Y9XGR8bcIeRK4rOvjdRRC+J+HIMfUkC3UDM8esWft+u9GKQeRsol+xNvRfshH
 NvccptDgzRQlRtVsbxA3JuXk/CwZd6cjbAfwclVPRQCVBeMs8SHrsCMOWPCs3CN/aycJ
 tbwRg23C4ddTDapNUyAWFDGLkTAIJCdhmm6IFd/ATaQ00soYZTAWaEGWnq5AuhjD7fJp
 0peNIf1qTOhnJN3u65fXH9aNMIoKD5KWFzULYrhZE4FPprkaC0ssKZkyx/4T0fArLxnu
 6r+w==
X-Gm-Message-State: AOAM5326fe9IkVu/WW8/ufcFkfaWZEMxtGrz0OVdqWm2LmaZmuWTA+bT
 bK0kBquvwnXchI0mCkId9/A=
X-Google-Smtp-Source: ABdhPJw5U90GgbXrwB9X3j7ERBM6UKrmDzqcszz+pkiLkuNCUFc69EhY4Lrh6+GU35xS6cCocLbUcA==
X-Received: by 2002:a65:520d:: with SMTP id o13mr10970910pgp.57.1616151758644; 
 Fri, 19 Mar 2021 04:02:38 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:38 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:38 +0900
Message-Id: <f09068dd8b89aa81c4310ea39cbdb0d631dddf98.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 19/33] counter: Standardize to ERANGE for
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

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c        | 6 +++---
 drivers/counter/interrupt-cnt.c     | 3 +++
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index b7d6c1c43655..0409b1771fd9 100644
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
 
diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 0e07607f2cd3..f27dea317965 100644
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
