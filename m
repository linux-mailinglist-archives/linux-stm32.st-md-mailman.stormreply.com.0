Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A21238A63F5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62247C78012;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06859C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:05 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6eb8ae9b14eso370010a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209704; x=1713814504;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hZ69zvEi+2hVMHqGREi0s+o1FDmo1qxeLo8vD8Yn8BA=;
 b=JL/EhRQotfRpoMLU1uJJqCxylykE6evmnCks2VxxqJR5Ctx3FL80FmX3YN53RGSkJq
 VJW0LZmtXW0Bp3vmjVCPypOJWFMdZt+mkKbKN/py+Y1mWBflgVTrwCAceMQku2Upo2g+
 XE/nr1UWNW+rgIvnKle0WB0Nf0T++k4cM8K50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209704; x=1713814504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZ69zvEi+2hVMHqGREi0s+o1FDmo1qxeLo8vD8Yn8BA=;
 b=rYcnhdvB7pIt15ARhJRVy5VxKfMQW+vLniTwzC7YwChwCW9rxPwmT7R38EZ3lmdPZM
 Eqi+Ik/wiLcSRtzzzh76+5AQQ3UuUnO6QiC0gmXQ+X5wPvAtc99Twr6I0ZStpTWy3uo9
 YiKQLU2u0qEoDpMl7sXq9XI1MiSPJxBMrMnKdXic2xx/k1VgwsgutO3QeYaqz9Raz6Jv
 LRkmYtUYYELIZvNMV/9yFg8c0wUGlRhGOQuBXLJPbg1eyCz7akEGuvvZvanK4ZRedaXP
 a0PafBbh8Hh9jvCFXmrwl7rQ8d9Poinlyc3RBaQEh4aqJ+Uo5BsjScnfMh4yFVykRr3B
 O/xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzn3AXUy5lAilyrR3LzvwmeuZKQCCLPIYFq7L0uzx0f4/FnB02fl+jl7cFlwPTzJOez9pczSFhlVk1Uq8QrAQIJQkbQGcICRAYR7QZPMHg2CFosQHeXyK2
X-Gm-Message-State: AOJu0YwgblE7cCyR5utcF7UN347MPQRw2n0pp/Wt8/4I60V7NgeInEx0
 3lecjapGAngNF2Jemrmhadxn0yJPJwsMEz4pwf/ESJvTJZcH6eq7zM4+Bzi/hA==
X-Google-Smtp-Source: AGHT+IGR6r574HxBWsbrxXxGaHrf3NXllaDQAZexGaElZz4TGdMFy5/7Wsa4Z+FqqK7nCIYg/Ya87w==
X-Received: by 2002:a9d:77cf:0:b0:6eb:68b7:581f with SMTP id
 w15-20020a9d77cf000000b006eb68b7581fmr7839393otl.22.1713209703885; 
 Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:49 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-32-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Tue, 16 Apr 2024 06:35:01 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 32/35] media: si4713: Refator return path
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/radio/si4713/radio-usb-si4713.c:309:15-16: WARNING opportunity for min()
drivers/media/radio/si4713/radio-usb-si4713.c:360:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/si4713/radio-usb-si4713.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 2cf36c8abdde..0ad1bfe09004 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -306,7 +306,9 @@ static int send_command(struct si4713_usb_device *radio, u8 *payload, char *data
 					0x09, 0x21, 0x033f, 0, radio->buffer,
 					BUFFER_LENGTH, USB_TIMEOUT);
 
-	return retval < 0 ? retval : 0;
+	if (retval < 0)
+		return retval;
+	return 0;
 }
 
 static int si4713_i2c_read(struct si4713_usb_device *radio, char *data, int len)
@@ -357,7 +359,9 @@ static int si4713_i2c_write(struct si4713_usb_device *radio, char *data, int len
 						data, len);
 	}
 
-	return retval < 0 ? retval : 0;
+	if (retval < 0)
+		return retval;
+	return 0;
 }
 
 static int si4713_transfer(struct i2c_adapter *i2c_adapter,

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
