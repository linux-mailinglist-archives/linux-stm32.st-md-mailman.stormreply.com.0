Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E8332677
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40F1CC57B78;
	Tue,  9 Mar 2021 13:20:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D5ADC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:33 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id j6so6547949plx.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uo8aZJ7uFJm9IN0X5m8O12CJstLR4Mg3ThLr0VJ0OLA=;
 b=iyVwdDeb0d9ar/SgQS8NCqCJF8zBmbqYEU7YVIcfERfeXU9rRk+X9zQwpng9qVLZda
 d1yQFwkRQ8moVuHOC4RaL4Eo+CI1Jg13S3Hg6IASCNLMFxuYym7guA7qAb4WPvmIhWn6
 P/fdq6zIxxYWhKwBGjfuOapE0xGM0vv5wE20G+6Ri5Twoc+Wx5yUlWsdz13BfRWUowNs
 saUOHkge4Z82XVoDKISrpPzLWDywMrP/a+UBj+RSFBKZNgXdtK1ZH2UiUnola7ptT952
 yBn8kK5z87O+8qTLztPBkh6iP7/J+wmtH/wZUR+UVgqVXKcvt1/VcQUQF/CG6wjMMSJy
 lFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uo8aZJ7uFJm9IN0X5m8O12CJstLR4Mg3ThLr0VJ0OLA=;
 b=rzS+5zEN5Rd2iUnaxMigcXds3V+5ZgD/vNbHrHq3jcV1rGzpdJQGCL8ctDzBW1zqTL
 QtncdU9oTu9tzwvTgGIjk6WrAO0j6KPcpuvWnKSyYo2nCmZmrAa+cV+peoCd/tqr53MJ
 cMkHjazaAlWsiRQdglV2IHw0QCMIbUqG1OnmhjjnVEiijUslxweEICbWJuwSrbct75wb
 dL8EfiywXl7BvK64oFPIOw+vcd2D2RFW03ARP3q3xIej7FXCqubGh9+wZM7//0j6AS8/
 bOrgIPOsFlPssaaXOwOA3Fa8JnAXxn0U0GcW72DxW7UH1yzc0w50dmzRwWPuQ5AsAH0a
 CxGw==
X-Gm-Message-State: AOAM531/nYApz4W+3IA+0QBU0BwKq1zBYsaYlIIcYZnAKaeTnXkLBQ16
 c/lXYwK2Bs1rNU6j16sw2bY=
X-Google-Smtp-Source: ABdhPJzztWhpH23pplZlKp2maeyt5sWNUAAE2Am8BwuwOdJ/qsjqY345MQI6zfkVfbAY+PYd8TblmA==
X-Received: by 2002:a17:90a:cca:: with SMTP id
 10mr4613485pjt.103.1615296032134; 
 Tue, 09 Mar 2021 05:20:32 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:31 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:17 +0900
Message-Id: <ab32428600ac501761775f65a69f103859166d55.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 04/33] counter: 104-quad-8: Return error
	when invalid mode during ceiling_write
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

The 104-QUAD-8 only has two count modes where a ceiling value makes
sense: Range Limit and Modulo-N. Outside of these two modes, setting a
ceiling value is an invalid operation -- so let's report it as such by
returning -EINVAL.

Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic interface")
Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 4bb9abffae48..233a3acc1377 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 	switch (priv->count_mode[count->id]) {
 	case 1:
 	case 3:
+		mutex_unlock(&priv->lock);
 		quad8_preset_register_set(priv, count->id, ceiling);
-		break;
+		return len;
 	}
 
 	mutex_unlock(&priv->lock);
 
-	return len;
+	return -EINVAL;
 }
 
 static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
