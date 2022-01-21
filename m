Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DF4979AE
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 08:41:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D3C1C60467;
	Mon, 24 Jan 2022 07:41:14 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1079CC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 16:54:35 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id t9so14291840oie.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMvwDdKHz8SxD4XNsSXi0ifYKZbrqBGSjCLlHvwqADI=;
 b=bFxWZzsGiGVdBe5x6szZZuz5pjdNt6E15NqjGO8IZpJRKXyU1CUVtQfiS7nQ85w9Hr
 a2F1y2md9h0rVZQajdIrclWiJ+nPA3vP/ZbKGqY1iQ5LhRK5axOYZFH1PI5vO/zWWhHl
 Eor7nYxkOYgUmAvJXNbqMrfjOckjduoYsdX4Y6JNRzNb3G1lgccNCs7Y980we11ot3UN
 XHQSZwNj5VD7/nnNJ8r4qN9vTm6Bj+G85IZM4HPdO+1G2RHVJXmzMRqb+7g60TcsjCK4
 wuMh1c/1/kQbcrDd8GS8Jj8JzJYBPQdU0Ypn6G0fz+xx25Wr4xWQNsmqWf1XxJQQbtiZ
 KVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMvwDdKHz8SxD4XNsSXi0ifYKZbrqBGSjCLlHvwqADI=;
 b=JazBT7R2riOaeyvDIPAQ1FIEd40D2e2yTjulCAztnjLkfv9uslHm9E6Qs3r3SfY7FZ
 o/f5318WCvzV0g5zmFrCnxogjOy+JJkYa/lDiNQhLoWRbpEYP2UmUN/JQVPHfmxZTGqE
 95Vdj5+hX02EKpAMakQXb/IMfkct6XBW1TfaFl6qcz2OdNx0QuCqGQReYsxPF5Q6mvVN
 TbTCHbLpRLGEUWc+2PF1KtUUg8zWw/2YfCCI4lCj4221T/ZfKW74GmgLf3HNzwdVlGl+
 6P1FY+CqYjg/Q5Vw5TNDfqXnzm1QlYjmIt4zVZhaYxG9+UrkohRNt3E5mAUyg0ssp3vc
 jYzw==
X-Gm-Message-State: AOAM532v/79B59USuLOsBbWO3dD78CHg18rx1ulersvfLHR5v7sUyy5w
 F4AMDOWa+joo+RZLRXaJY2CXj82mJHk=
X-Google-Smtp-Source: ABdhPJynqGcrSez4vywi3ZAwZ9c1EdrO57Z15fp5aZAFGlBkrVlL1jMCkHBNN5fSrWBvd5Uebtem0g==
X-Received: by 2002:a05:6808:171c:: with SMTP id
 bc28mr1273461oib.102.1642784073967; 
 Fri, 21 Jan 2022 08:54:33 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:cf72:4317:3105:f6e5])
 by smtp.gmail.com with ESMTPSA id
 y8sm1089271oou.23.2022.01.21.08.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:54:33 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 21 Jan 2022 13:54:12 -0300
Message-Id: <20220121165436.30956-8-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121165436.30956-1-sampaio.ime@gmail.com>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jan 2022 07:41:13 +0000
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [Linux-stm32] [PATCH 07/31] input: touchscreen: changing LED_* from
	enum led_brightness to actual value
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

The enum led_brightness, which contains the declaration of LED_OFF,
LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
max_brightness.
---
 drivers/input/touchscreen/stmfts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index bc11203c9cf7..7e7cb5f4d6d3 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -608,8 +608,8 @@ static int stmfts_enable_led(struct stmfts_data *sdata)
 		return PTR_ERR(sdata->ledvdd);
 
 	sdata->led_cdev.name = STMFTS_DEV_NAME;
-	sdata->led_cdev.max_brightness = LED_ON;
-	sdata->led_cdev.brightness = LED_OFF;
+	sdata->led_cdev.max_brightness = 1;
+	sdata->led_cdev.brightness = 0;
 	sdata->led_cdev.brightness_set_blocking = stmfts_brightness_set;
 	sdata->led_cdev.brightness_get = stmfts_brightness_get;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
