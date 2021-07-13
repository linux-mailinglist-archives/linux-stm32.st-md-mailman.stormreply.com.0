Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15303C6DD4
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:53:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9262C58D7F;
	Tue, 13 Jul 2021 09:53:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A785FC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:53:57 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id p36so9350852pfw.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stljVzismgi0bhtAbjcWPPl7QduNl8XesIvoC90of/Y=;
 b=XbqbBYt2KAlG3Au5ST8HktTGY8nR/iVlmTPfNPtKlHejTMWpvIAi1rty+h5f4iQLHE
 nJXvg3R96ugxInztBlrgyDUwlPlR8ZR5+vE3DyTuJXpEDGLMoNAMNIe3anaw7IVwY34n
 qhNu4yWR1zY7b30U6/xItFlqhZjMtoXQ5Khn8oFPSRh5rtjQ0zxTZKBzdBRTlNH9By5/
 uamK3z3t43yzWYuCUGqARsrkq/8Xoko0odTVsqujpwIqPA2El8XxDGHnMJ6Ih5ocfxHw
 RmY/qkUpRLzFfdkEACjgeuKNf4NsXjwh5qGJUPrXsziVCPNvzdenTIGHvLndzj41MPFZ
 utUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stljVzismgi0bhtAbjcWPPl7QduNl8XesIvoC90of/Y=;
 b=Ms3VrG5h/WmEGoIWz88Nl/RR4cJOSjiJaW1aAalQ1Hil20nhMdNl4MAIQyJJTgupem
 ZIIgetjleNyzt972Eom0adleUlacZRGcjgbQZI/v2iv5mds0t3w8frYUskABpMuwXq//
 YtyndZBsIzGUKhgGTzkPMTUlPJaO1+UZl+7GKlxr1fvgGGKYsIj9YdRx6acQGTvE6Th+
 +7dsbheaG28E/bvk1bOG0P9pokqxnEUUFXNBYmiAB2fxF0tpcq7Hx2h9fizWAJwlm56b
 3Mjdp6rvZd51lXuKi0Kgjt41UoR9Ecf+hT1sKUGN/UOU7Jhg30vyK+fndfqxyzT/TdTg
 rOpg==
X-Gm-Message-State: AOAM530F66RoTowaUOk7cqEaEqifonLyDug6XwEwZ3fRbjIB1WA7DzPc
 HoZNKV3/g35EHr4ybA1TkBc=
X-Google-Smtp-Source: ABdhPJwvrFfpLw+74Tmy0kgPix7l+4vhDX9i+6oMqVqeiHrrv4/yf8ifuQ/AwxIDzsU9gxJ8SiZ6Eg==
X-Received: by 2002:a62:87c6:0:b029:327:8be4:978e with SMTP id
 i189-20020a6287c60000b02903278be4978emr3659746pfe.50.1626170036164; 
 Tue, 13 Jul 2021 02:53:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id f6sm18153854pfj.28.2021.07.13.02.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:53:55 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue, 13 Jul 2021 18:53:07 +0900
Message-Id: <275a0de80b2eb272f5dc1641c511ed601c9f5848.1626165765.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626165764.git.vilhelm.gray@gmail.com>
References: <cover.1626165764.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v13 03/17] counter: Standardize to ERANGE for
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
index 8d7ae28fbd67..85dd328ae1f6 100644
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
