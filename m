Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5698A63F4
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CE7C78010;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C81BBC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:03 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6eb658ca1ceso2343629a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209702; x=1713814502;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
 b=cqgCDhAMzuAZJF9ukNbhSjEpyXprSw0iVAawhQng8T9B2tjHOlyWwsSCCiGY4rVd4h
 +/J6iApfJjR4f8SpLF+mGdBI1y8oexQ+f63p4xU09ac3rweDaEp3x0OSfv65wuHDLK1w
 1qEbIA1MPIOSzhlaGiiTxZSFZ0CeBZGKklanQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209702; x=1713814502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
 b=GlGK25txT9S7rajA4053NzLpucAqzvMP3tGDcrjtSEck+OjbmZdsYs3W8oMhJjLoK2
 sLgk8HQrrEFVjOzBXmhPD4XDLGHpuCoYSpQ3AdYM3bAZ02j7lNVOoyGvm+64+rAXZfIb
 aek1C471nkwovro7FhDYC8dqORJYksrfltaCAL7sDlaTnYO6J8yqFRPfAFW9RC6pMlpn
 aQnY+R5AL5eQiHakJB5CxP01YMsOoT5YL3BZ5/Vusjcm/jDrT2rLsAkFtFaLhjhb3BIv
 vmVgbJgfMgjN1+FmR6LjJfumuiHWkkvAThSrWYG+lC7B0paihMWl/ZJx3zv6GGrWnTFe
 cDIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi10eodUbWsGjoK/fuMYhCzsIFGdl5DgO14h9cFDOvv0r5Zap5MS18LNXfid30vYUyza7pS+lCP1yWOnVdPiWJ42IHoh30n7/CIx+nQbqAEce7UO+dhYqU
X-Gm-Message-State: AOJu0YwnVRDKcV49zwk+4Oolzb2tXyu+LQrzNb1WyZ1BoWVMAXZJ6CiP
 c7Ean92acmD72t+c4VI1b2KkYB5yQNiMQgLHIm+NLxF/bSD0RH5RBOm6ZhMF4Q==
X-Google-Smtp-Source: AGHT+IFpNLbWkYy4T2kNtWWO3Krrkln4WZhxhxOvSx17rkc4ihK9bZ3DdjfUrMbHC9Tqsq3KJ+SA1g==
X-Received: by 2002:a9d:6a15:0:b0:6eb:7c52:ed04 with SMTP id
 g21-20020a9d6a15000000b006eb7c52ed04mr5573331otn.5.1713209702690; 
 Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:48 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-31-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 31/35] media: cx231xx: Refator return path
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

drivers/media/usb/cx231xx/cx231xx-i2c.c:353:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:262:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:326:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:176:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index c6659253c6fb..28de72856c90 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -173,7 +173,9 @@ static int cx231xx_i2c_send_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -259,7 +261,9 @@ static int cx231xx_i2c_recv_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -323,7 +327,9 @@ static int cx231xx_i2c_recv_bytes_with_saddr(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -350,7 +356,9 @@ static int cx231xx_i2c_check_for_device(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
