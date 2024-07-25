Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7493BFEB
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2024 12:31:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38D05C78015;
	Thu, 25 Jul 2024 10:31:49 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D24DC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2024 10:31:46 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so38754566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2024 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721903506; x=1722508306;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
 b=Zn9rQvElv+Cvpy1XQc2z5OosxSgJ6l9SDztLMq7pwhO9VE3JpDJAl8DMzwevMQ4Rny
 OYoBgP8BkbzFcsqlBhRTP1AzU4S6M2YBpfcg+d4wRTdBQnK+VK/HrZvi5TzqjLzemDLv
 LFT08kdndEmv3XSyc0pbhrhgKJSKHwTYUDFSBUaZUuIy4tKZUvramvPPeJQDEOOdk2BO
 DL3T1uqjfbw78SHKoOYikPf61v9Uu3Qsr7dTnA1hJVwdDvq/23q3Zn8ikY6W5YvHC9Z9
 zWnBQigmPAwn1l1Yk1CIreZ4GsCa0HE7ELN4TAAwdiDnu/IkVcWYk0u1pV0q46FMGm+A
 xyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721903506; x=1722508306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
 b=sTIrr2P+KD/2BWPk4WmRqpjQlbpzcRAp+gOunPNKbkHX7Hmm0ECNDh3FQbW2/Sepsn
 zXnc13FczWq9Y4z5sIsC1FkfnMz5/jPi6sRE3scy+guOhgODjTZnSHZ+rNcZ+UZMV37y
 cIgW9NlHyNGLo1uL6Zdt6iOg1LC/JahliOQWLcLEWHVMo8wOrLUD91j3PlV+nwdgudt6
 0iufKVVPMQ/KajOI0qwEyNEW1NMjpk3dWngpIx1jfp0XTzwP8KHAQi5NJUbfadv0ufv+
 jfwwdWsBBnN9+I8owg9FtJRLHuYQ1DWZj4CeMVlKp4VLF9De2IwTJWAdplpx1SKfORrA
 WGDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBRTD3u7Plcci3NEIpt79hYsg6PrsukxLH9d5uzfXghLvEYAQ6xZud2cZlz0rgA923dVNmcSSs4LQd7g6QO4akGCVJQ3svO0S+vo5cFgkMWuG0YcHdvhYT
X-Gm-Message-State: AOJu0Yzo4u+LpzVothCcYxink7E9ZzKZHyq0IYV8SJXSYJ0++bk71G33
 2X3jETz39KhppUE2KHIk8rNvoPy51BIoHr8nkCYE/5Evd6WhqxEU
X-Google-Smtp-Source: AGHT+IE0/hpUdAcQx4dLRlMWzDI99oBJN7+P7fRlBEFw3PDOuVabqJfYozkGN3UY2efNKiho/QNr+Q==
X-Received: by 2002:a17:907:2d0a:b0:a7a:a212:be48 with SMTP id
 a640c23a62f3a-a7ac5087e56mr177990766b.56.1721903503189; 
 Thu, 25 Jul 2024 03:31:43 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:31:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 25 Jul 2024 12:31:39 +0200
MIME-Version: 1.0
Message-Id: <20240725-const_snd_soc_component_driver-v1-1-3d7ee08e129b@gmail.com>
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
In-Reply-To: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=g+GwinB2Om+/QI19eL/QDvSqsxnmXjF9gdTgw9VQo6YTUwrcAxKL/wFe4IHNNaaiUzHHdXQ29
 T8cWG+KHnUBDrYJ+zT75Qz2Wr485h9ieY+INwWbKf+ktYVDL378CLex
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: alsa-devel@alsa-project.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] media: i2c: tda1997x: constify
 snd_soc_component_driver struct
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

`tda1997x_codec_driver` is not modified after its declaration, and it
is only passed to `devm_snd_soc_register_component()`, which expects
a constant `snd_soc_component_driver`.

Move `tda1997x_codec_driver` to a read-only section by declaring it
const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 58ce8fec3041..3b7e5ff5b010 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2514,7 +2514,7 @@ static void tda1997x_codec_remove(struct snd_soc_component *component)
 {
 }
 
-static struct snd_soc_component_driver tda1997x_codec_driver = {
+static const struct snd_soc_component_driver tda1997x_codec_driver = {
 	.probe			= tda1997x_codec_probe,
 	.remove			= tda1997x_codec_remove,
 	.idle_bias_on		= 1,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
