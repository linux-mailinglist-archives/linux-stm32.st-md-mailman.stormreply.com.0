Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2D332676
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3E2BC57B78;
	Tue,  9 Mar 2021 13:20:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 721DFC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:28 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g4so8755816pgj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8tDypyv5ahTAAMuxI8NeVKXWRsIZA+Poj3szWZsqgo=;
 b=AYFaivlvQ/oLIjqJsJ/oehFS2L+56XUaU6sHt6nqOxr8FYpHMoGpDayLhwbo+RksWm
 m7Gdt+fW7hkOkEmzec0TM8IDtMPPmzEbDFvYQ+YT0XYHv66cHlTmoL1ghMEgsCalRPZB
 Es2RSKI/6Bj1qBz5P7gFOivsQoQCTuTIGUo2z8IupngTF9Jx0J4Zrc9WtdNTTQ2UoRqS
 dApjEniHKrL/jhZukBBhOnIZX2SNyrhB/at8RH6/sL/hBbFJWuJbPnQH6zzoM3bixpPG
 r8ZJe2EXD/nkza8KiXAtWxFAvgr9II1Xfmr0u1gQkwUeGo8voIN4det8zp4pwRs6K5Vv
 FBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8tDypyv5ahTAAMuxI8NeVKXWRsIZA+Poj3szWZsqgo=;
 b=Kx8kj8RIl3OPTC49x+4KNa/Qu8IZOWeipiR5/kkxVVSS7cR/GtTqh0KyHBgp9oBgCC
 ScitbrIBM0ivZKW8uQLyl9UVYdu2w2DBQaNnWsU9btA95LucoyhLdOVsnZhLw8C1xvfA
 J/swTE3I2nIfSVMzTra8ADB18/gXVZWKIPcYFbgSdWsNZxDGxuOKO5/6kXFZuOD/qNjG
 pL9P54x42aGIUf8NDjrdcQGO7Z6EXGnaHl2OPhlIOY3bKhvPk0KfyRFmtYHdP0c4SF7F
 5Of62VtMoinPsFfmCyPchaJiEoTnn7asNSbLnKPoheDr7f5Cs69nPmUE6/gKGc4nyD4a
 OxTA==
X-Gm-Message-State: AOAM532ZJZ70PjFvXkERUp4EZVwDIh+XrY+ocl7ElQ8FzlR+8KK1szR0
 J72A90nF3oOOGIw7YW5YDBI=
X-Google-Smtp-Source: ABdhPJxZKUUTrkGax8iWT8D8hxgyat5r+1Lghh1cpjR/93ysYtEmj5xKbxB+lyQOaaMyj9VgK4pDiA==
X-Received: by 2002:a63:2441:: with SMTP id k62mr24161252pgk.332.1615296027115; 
 Tue, 09 Mar 2021 05:20:27 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:26 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:16 +0900
Message-Id: <75913055bea8c4200f35727c03dd090d84f46c51.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 03/33] counter: 104-quad-8: Remove
	pointless comment
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

It is obvious that devm_counter_register() is used to register a Counter
device, so a comment stating such is pointless here.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 9691f8612be8..4bb9abffae48 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -1082,7 +1082,6 @@ static int quad8_probe(struct device *dev, unsigned int id)
 	/* Enable all counters */
 	outb(QUAD8_CHAN_OP_ENABLE_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
 
-	/* Register Counter device */
 	return devm_counter_register(dev, &priv->counter);
 }
 
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
