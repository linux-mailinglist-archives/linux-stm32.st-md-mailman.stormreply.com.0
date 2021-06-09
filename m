Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA23A0930
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:33:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ED00C58D5C;
	Wed,  9 Jun 2021 01:33:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1723AC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:33:29 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so437906pjr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahZ4wxqYj8/PnnRsg7CFwjhhCPg4bzL3Iu0oZpPEJNk=;
 b=FDGW5jjxYBl+kKCMS9YTEBDfvxM/0VEtfXATZc65wdNzQmz8UuqkfM92rH3MvullfZ
 eB5WKaO5LuVHMljirIylzAwLp9/nfS0xZWORRdMtt6pYXfQI8IivrXpxvuF0O0BUw3U2
 LvSH8ZAih2PPwFckAIrX+kB13eUfDC1T7vvIy6WJCQWp63cwhuvS7x0Asuwg376kMHVB
 rbrbN0W5Y5rlz/6ye1H1NVBfthjnzKENF5EPMvlUTUeRYIeZeWlX/rD1w/6ClzzKc/ot
 y37OGiw/oZeRMKi9TCaw4T/W/NtGZNjhZZ/kRZPKEZnbI2ZWAWyFPug/lajfXFt3kILP
 bxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahZ4wxqYj8/PnnRsg7CFwjhhCPg4bzL3Iu0oZpPEJNk=;
 b=myx3fO1gtZ1r5GkOThiB+ZF8DQYhPJ169ksdmzWbhDgDbJ6RtYKqC4B0JHY2m1U8Ru
 mg8Tc0NLebb1R8++gViQd8jfxvAmEbfFo/iLsraFP5k2jeW5PDa2JIilVTVRgPVic/w7
 /nthtwCP8trBq092sEjXAJlHR+7s8UrCWmgoyEQe4cLEstqiZbsBZcFwgq9/yCXkGQOZ
 QZG/8ofAisc2IEtVaY89Bw3h2B/jJB+jRqX3hjyX11j7tQ5WQtG1mE5dITAFu4Ov23wl
 NAgCzGLgKECLVG8cyOP5RDy1hGZbH8Ov9APIq08RO9J0AS2yxZY5Z/Hz/Rh51gmQ9Bhb
 jkHw==
X-Gm-Message-State: AOAM533uweNbw+R6QNs8IyjACHfYY+J0zN1XcbtsDP82bqePYPMo/UQM
 vXFfPUdS9dV5uOOqHpXK+3w=
X-Google-Smtp-Source: ABdhPJxU1XV1SNYwMQaNecIVUytIlu6/3AGUsvUMd4zVgD9V/R+wygJf4LJ8zXkl5C6XA7pShIvWtg==
X-Received: by 2002:a17:902:d694:b029:103:ec01:12d5 with SMTP id
 v20-20020a170902d694b0290103ec0112d5mr2979637ply.19.1623202407675; 
 Tue, 08 Jun 2021 18:33:27 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:33:27 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:22 +0900
Message-Id: <c5dbcd525d1c04c474fc3988ded9b509eb12ac9e.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 19/33] counter: Standardize to ERANGE for
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
 
diff --git a/drivers/counter/intel-qep.c b/drivers/counter/intel-qep.c
index ab10ba33f46a..7b4eb8ff8348 100644
--- a/drivers/counter/intel-qep.c
+++ b/drivers/counter/intel-qep.c
@@ -320,7 +320,7 @@ static ssize_t spike_filter_ns_write(struct counter_device *counter,
 	}
 
 	if (length > INTEL_QEPFLT_MAX_COUNT(length))
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&qep->lock);
 	if (qep->enabled) {
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
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
