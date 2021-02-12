Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E025E319DFF
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA6E5C57B5B;
	Fri, 12 Feb 2021 12:14:30 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D8CEC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:29 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 81so65356qkf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BjJkilAOMGiWiSD9J4QR2aEeHu+r/1qYrSNyG3boNpc=;
 b=BLt4sjlCky7CbAc9/dLfGcwAvsWUzPTf4qP6jWbY9HDc4vxvHbqwfw2gO5Yb8HOjf6
 rkst6aD34iVSCEHlOGhRA3Yn8niNgmuNNuu6RoICNh9W+VjiTpdSd+SB+i32v3pHjPZr
 HAg1MwfATZpc6EcnxaUdfEZHfs4ZSE8O0oZtiZOvC3dIzl4es1cUiFXTc60qjE6tn7/V
 /LwRKPjXtzfhMbSyMkJuDNEY+/JMupnGIj0Y5XmcpZvDcH9EkjMSsJkYM3zlwjfJwQsk
 r8ZQuH9ohwU6xO6YH41XKAn41CX5Viei5boWdFpNW43QCp0+cYQkxzM6eTkcpqZZGI4c
 dmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjJkilAOMGiWiSD9J4QR2aEeHu+r/1qYrSNyG3boNpc=;
 b=J6yUq30Ju9SsVSixpcGe1DlZn8h2cFbZm2HycvvyPWBnrhI/+xfoAzaXjZUkf5c+z+
 XwsgYetuBhFZzV6Eg6Qv65gbmo2R0tg+RQhIR7XF53hYCZ+GfwSJmMZ660islAO7K4I4
 MFXXIEjOUquFpTwDyVEteF7sQR7yms7DIMjS5iLCbDIO4CATFPpRuvLtI2d54+4qKmzS
 EGaSALpQVI4lrRxNcXmvZgWmQ6SSPodlLugaCNE80HJLnkch4ZQSljeFQkIkI7kQCY1d
 lENI119GxSzZOURQyyBFd5j9R6FFpuFSI9Y51fLSk28H82cSDCt3+r5ais9m99t/56a8
 zKkA==
X-Gm-Message-State: AOAM533MsedNegk9wU6ID5vl82eEd0+GXREcwA36zseTpVxuW0L1bflL
 94J8g/Ylx89YyJTpnl6O6Uc=
X-Google-Smtp-Source: ABdhPJzGvQvyQZE7dX5RO3K9tktCugN52yaK4b68hwIqb2DyJmUOu4SVpRBxm3I5s1tE3VfsUB2Hig==
X-Received: by 2002:a05:620a:38e:: with SMTP id
 q14mr2251979qkm.239.1613132068379; 
 Fri, 12 Feb 2021 04:14:28 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:28 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:29 +0900
Message-Id: <92f7ef2bc516c1f9d54b3904bf78b908497a1978.1613131238.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 05/22] counter: 104-quad-8: Add const
	qualifiers for quad8_preset_register_set
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

Add some safety by qualifying the quad8_preset_register_set() function
parameters as const.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 37551d3016de..70383b792ec6 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -632,8 +632,8 @@ static ssize_t quad8_count_preset_read(struct counter_device *counter,
 	return sprintf(buf, "%u\n", priv->preset[count->id]);
 }
 
-static void quad8_preset_register_set(struct quad8 *priv, int id,
-				      unsigned int preset)
+static void quad8_preset_register_set(struct quad8 *const priv, const int id,
+				      const unsigned int preset)
 {
 	const unsigned int base_offset = priv->base + 2 * id;
 	int i;
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
