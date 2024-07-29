Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DF93F153
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 11:37:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65924C78001;
	Mon, 29 Jul 2024 09:37:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFF8DC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 09:37:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso5176261e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 02:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722245870; x=1722850670;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
 b=fr5l89bE2tlw7JNoJdrGfFlyjz6UGRpKBdlPZZDytv3QP7hfTp47lBVahVLwklsEEB
 wadKkuM4MCl0C8hHQU9ylolG1aKmlSFBc4h3Vm3H0vo1vQorSayQlLnXhBn6OqwJYtmv
 3Q7WayFc/qE9DeACnch4tC71exMdD3B6gyBIa/hjKP4XlSNQv3BGbRI4UofSwJVsFnlc
 E4NOUTnLxPtwvuPM0U2BlkSSmDpBwWP2w0z5Y2sClXDXeQJ5gPMQEpYeSLHbetNNS27l
 gWw8GJ0pAUZeKSExrnls2gNxjP3/y9W8YRkfcgx8MnIrBUWa/E3T9CG9pSecSzR774yX
 /CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245870; x=1722850670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
 b=cMZppF5QznR+DuSqiBaNtPRJspCiIJwZPKQ4p/qFQtOEDqIEb8Re5fHHnXXF6H12ec
 jB4V20bToD4F3H1ulqziCiccx7Wz5XXciG1Z/BbGTd0ELHfCMWgKcGUx7t986w4qL437
 fkoG+oIMzaF6i4GG2A74Hah5i7jL3BeqAb5tg5Oicn1Zcd6H/Pm9vKRqp4R6tOCnxSbc
 GVcBPj6lGLYbz4/D3YJFQTE3Pi0+P4gZAQYr823qdlS5oIPrRwiaJ5noy6llfY2VXVkm
 SerERVsQEaiRogTOKhKgEkB03vM2Fnw+QcESKv8SC91Dll21ivWliKhsTcpIiMWCT/4/
 +q5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2fkJZWB+XY9zFl9KVYrlMnaTbW/fqFS9OhLEBSmereLB0YTJjn1zh1P/64l+H05YsqCelQYI7MhXWO6mPZhOy8kFRbX4ZDllHxEuWCNMz8VjYgYzbss/o
X-Gm-Message-State: AOJu0Yw4G7K6oVRH5FHX1RIbe18t8QMUlD5hoHegrgWz4qemjdrJLE7f
 DO4tsNNJss2AFmDMS+6NqB8xzx/3lnqqk9FfOQaxAUZowJ5BB/YO
X-Google-Smtp-Source: AGHT+IGp8Xl1NyteK2cTJheiqkYuxoPksdVWbAT4rxFLqcdzbR1MWL/U0yFGfpkoM2CelSanXwxOeQ==
X-Received: by 2002:ac2:4bd2:0:b0:52e:9be7:91aa with SMTP id
 2adb3069b0e04-5309b259b5dmr6037212e87.10.1722245869608; 
 Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:37 +0200
MIME-Version: 1.0
Message-Id: <20240729-const_snd_soc_component_driver-v2-1-1994f44f1ec2@gmail.com>
References: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
In-Reply-To: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=VMyTy/QXOHFk3SHVvDT19NltCELdp9XjDYOsQIhbx4wsTvUrAlC+4pd5dk7/VTqxZG3pTVCol
 Ay5w0EMq1AkB3kS+nWJsctwKtLCO2KA8PB5McC/Lm/vGTVmaaQFcDeo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: alsa-devel@alsa-project.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/2] media: i2c: tda1997x: constify
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
