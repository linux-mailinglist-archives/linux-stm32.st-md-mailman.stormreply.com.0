Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE8341A94
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26353C58D5B;
	Fri, 19 Mar 2021 11:01:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B835C58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:35 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id v2so3423899pgk.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eeVMUELsSRVxeUS6ro8QPXwbMLileU2G6rPw+jVjGYk=;
 b=X24pb7+dYFtj2mM5k/2cLtbb+JoOMN6PVCV5K2nU1mFYA8HUghz240ARKjWBo2R6oL
 nW3SfEKupdMjFc4Y0HVfnVTWQEyUQ/h9gsR+JfPJ3XLjBcpfyioM5fKW0TnxZsSVAGQh
 SiTcftcT+mI5TJYGdvMP05FD/OdACJVIqc9uQE4jw6CM99rbxmSW9z9W+egHJAFsoBTZ
 xP2D4Hg5yIRu2d0zTN6+xtaMgcC4aSnOmZy3JwRVmoAh97w5cZFQqLEypsXsRcftXWRA
 MInGS+KjZhIElejzH+LUouoOZ7dahXxwuu4lSxlM87f7rucczOA6HD3qWbHKq0m5VldZ
 5UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eeVMUELsSRVxeUS6ro8QPXwbMLileU2G6rPw+jVjGYk=;
 b=D68ju/1/k9bmb/i2khg5vSqODcsFAZo9S3MkJUgQh7tuyeFGah6w/ZcbGcCC/K2/ZO
 FmMwBjQir+O9rfJPMwFkm00fNlfQxovUbGdB8UBYYbaEoiU2aTF8A1qayj8440Q7yASV
 ufw/jQNrt/KJEY8eT+yjZUyY+SdgW7F8FgjdoFoKA2aUebn18gaAOKCRVTYkGOHW7nho
 9BBykhkLzdHLsopIZCD/O0BivhmHLYqtFLQFUVegFiScI7UWyB/X7rmltofvEllhud01
 4xH7KDNw/DIR/bw9mB/MDd3nyrmsWkcVPqaYszHLNKyAsKakXMeeb8ijXTu5QMzQCWa7
 nMTA==
X-Gm-Message-State: AOAM533mtijt/H3su00ixF8e/UTVx7JyiKIncMy95bjoQCgqov/OjU73
 cCiSUXemlUF4/8csxyh7k4c=
X-Google-Smtp-Source: ABdhPJz8LoFhKaWgFy/KKzChvQwuknU/7/8FINs7N2t4xXiUnnQdM+uove8u0VdoRkUHpy37LHB9Lg==
X-Received: by 2002:a65:4c08:: with SMTP id u8mr10701760pgq.203.1616151693937; 
 Fri, 19 Mar 2021 04:01:33 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:33 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:25 +0900
Message-Id: <4a227eea6fa6aa1648fb0ccba6e924b6f95b2752.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 06/33] counter: 104-quad-8: Add const
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
index 0fd61cc82d30..51fba8cf9c2a 100644
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
