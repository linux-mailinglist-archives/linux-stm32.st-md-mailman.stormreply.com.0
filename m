Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD261CA03D
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 03:46:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5285FC3FACA;
	Fri,  8 May 2020 01:46:47 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22F11C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:46:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 145so77557pfw.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YPET1s2LAGhUOXmbuGCWG2lOM9gQW5zcHOoGqo8jUto=;
 b=gSsPcfh/FmLMFO8F/e1XknD3JIM2pA62uVJim6lR2mvj0H1qriC2lddSShZQTFLpbY
 ALw0zklxxW1C0syHhLZO2+HYLZng52g4CfsVoJ3VW6AHVJm7uDAOKY1flF+qs3Wf4Bm3
 eYVMWT+7t8DVeBipQXFDhXGzYD0K5D05DbdOKzIciLjmKU3zbXSojG+zQhsapme9TtBo
 MQjQyMNYSaK+W7ffUF/dJgIoVxP+jeLbxOdzrVzRrioPKheevGY/2FpVBSHWY141IHyo
 9qMhhKzSM+Hbij//nWhXsryAL1LwtW1EC7hJXAkv0WFfynXz+yrvWmBVhTwDL56YQXWD
 E8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YPET1s2LAGhUOXmbuGCWG2lOM9gQW5zcHOoGqo8jUto=;
 b=V9O+dYomj/Xs6NplmheWUY3LRNcbBxrqy5r1yxZmtNleBzS19UrTLyYgU0Ua8q6Nci
 AeaNPvThyivj6jtShtMFQDLkGAmH4Xg4UwC0DzSSFyu5JsVGrLoQ0nIZABzMgq59biAM
 ESiBeEL6CozgAG5PSqgjPkP9GymF0dPPWpMuh09FbfA4ueZxcyAPbx6YvGK0rbLjTo1D
 9/WSvL7QUGuwJxSOk1TLdT+W9jYc140X/lEA7+8abKZCRlStwQzY1Nf/Pe/AZYspwRPT
 6G09APY1NalVpfZ/4qKp83V9JtG0xK9W9IscztX3/0toZVRsS8MISVuBXq9xVFhsjpk1
 r3/w==
X-Gm-Message-State: AGi0PuaRU2ZTaKSgBFD4XsWz6+U+OLckYZSGN6Z96K1Ejzp2UA65m1OZ
 DOxrsQ2vhE56eIXDg7uu12U=
X-Google-Smtp-Source: APiQypJTjw+dOAM1QqLaOQi5CNvwAe4OCmBIbk8z5yExLAvE6gesJhmfV1ZtLIG3s6h+kBM4io2Szw==
X-Received: by 2002:a63:6cf:: with SMTP id 198mr128652pgg.59.1588902403750;
 Thu, 07 May 2020 18:46:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id f74sm9270816pje.3.2020.05.07.18.46.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 18:46:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Fri,  8 May 2020 09:46:28 +0800
Message-Id: <1588902388-4596-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
References: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 4/4] i2c: stm32f4: Fix stmpe811 get xyz
	data timeout issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

as stm32f429's internal flash is 2Mbytes and compiled kernel
image bigger than 2Mbytes, so we have to load kernel image
to sdram on stm32f429-disco board which has 8Mbytes sdram space.

based on above context, as you knows kernel running on external
sdram is more slower than internal flash. besides, we need read 4
bytes to get touch screen xyz(x, y, pressure) coordinate data in
stmpe811 interrupt.

so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
in xip mode, have to adjust 'STOP/START bit set position' from last two
bytes to last one bytes. else, will get i2c timeout in reading
touch screen coordinate.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index d6a69df..83004f2 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -439,7 +439,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 	int i;
 
 	switch (msg->count) {
-	case 2:
+	case 1:
 		/*
 		 * In order to correctly send the Stop or Repeated Start
 		 * condition on the I2C bus, the STOP/START bit has to be set
@@ -454,7 +454,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 		else
 			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 
-		for (i = 2; i > 0; i--)
+		for (i = 1; i > 0; i--)
 			stm32f4_i2c_read_msg(i2c_dev);
 
 		reg = i2c_dev->base + STM32F4_I2C_CR2;
@@ -463,7 +463,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 		complete(&i2c_dev->complete);
 		break;
-	case 3:
+	case 2:
 		/*
 		 * In order to correctly generate the NACK pulse after the last
 		 * received data byte, we have to enable NACK before reading N-2
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
