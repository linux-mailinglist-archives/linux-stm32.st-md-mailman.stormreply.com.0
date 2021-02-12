Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9220319E04
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:15:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 794D1C57B5B;
	Fri, 12 Feb 2021 12:15:01 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 193CBC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:59 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id p6so4033314qvm.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMBo1ioqzSWP/+ctxewh1wOwLDNrQeon20dNDOAUAHw=;
 b=hQ0Mp5RpZlnJ4z7vBeY7wfDFk7YmZgacLz9RZUwVCSvVP3N1CQLZvJ2TvXO7rCvuvV
 z37Fi3XcatNtV1SOTkawn4TtfwGaU0t66rIF5Q88q+Z4YdrjF6leoL7K3RLGZs5ZTEua
 LKq7PBLsjiZJUH8F5/BV8At8laep9rTiJD32bLubMRVrySWSYtbN+8uIuS15dy52UAsx
 w6xlOJC0BJN/Y2gKGEnU3NSSFzAyCS9paLiv97kmnL6iLz/CMM8zB+BKbeQB6YkLsSAz
 rqvNntr3HKHG1VNCd7aNL3Rr0iqsf24x/qITyyj75jWXaplyVeD1Dzyhc/m4Q6K80u5o
 OWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMBo1ioqzSWP/+ctxewh1wOwLDNrQeon20dNDOAUAHw=;
 b=exuVgQnN9Hrv9hksBXtqTmlUlU9BYo7iQrB1nHVsRhcY6jLcVdTM89U0WiguJoRQku
 i2ZevNXDcP+ekoA6QkQ6uhz6myfN2Md4i7dqcUdS8aBrzfgZ1qwZAWdpw9aylynonSVF
 EDYOJ050zEgVHwUnOqC+cYnBIaq+0Wz+IVGrhPFHHFb2LMJ0Y/15YhgDoh0DkDsqCT0S
 hoYZB7YpTeoNyGzKZXfGXURdsFp5yNg92pEGlX3Ec9b3/IFa7h5CxEWcZMEISVUbbNJI
 3kYe0u4NKnnquhVHTh+E0MBcBJfJ6SsGROfdzePriy7u1L81IU73kVAkqQi14hAISE0a
 HBXw==
X-Gm-Message-State: AOAM531vZPsqTgNSv/YppCH8WuUxyr3riZhlLE3RIkdJESJ/YXvdP7J9
 GF8PUs+EfwlpgjoYzQNtj19CaVgEZ7Q=
X-Google-Smtp-Source: ABdhPJyz0q+/nPHNN5O8M7RjDuPNfxOYsgS2grh/B4LOITzmnACa6UfxzpaYY/SEWbBLqAPpQ27sYA==
X-Received: by 2002:ad4:4693:: with SMTP id bq19mr2242483qvb.43.1613132098140; 
 Fri, 12 Feb 2021 04:14:58 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:57 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:34 +0900
Message-Id: <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 10/22] counter: Standardize to ERANGE for
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
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c        | 6 +++---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 674263b4d2c4..a2cabb028db0 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -154,7 +154,7 @@ static int quad8_count_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (val > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
@@ -671,7 +671,7 @@ static ssize_t quad8_count_preset_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (preset > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
@@ -716,7 +716,7 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 
 	/* Only 24-bit values are supported */
 	if (ceiling > 0xFFFFFF)
-		return -EINVAL;
+		return -ERANGE;
 
 	mutex_lock(&priv->lock);
 
diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index daf988e7b208..d5f9d580d06d 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -283,7 +283,7 @@ static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *counter,
 		return ret;
 
 	if (ceiling > STM32_LPTIM_MAX_ARR)
-		return -EINVAL;
+		return -ERANGE;
 
 	priv->ceiling = ceiling;
 
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
