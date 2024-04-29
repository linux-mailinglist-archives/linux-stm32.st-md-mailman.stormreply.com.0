Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B068B5C70
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F15DAC71285;
	Mon, 29 Apr 2024 15:05:12 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFF7C71286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:05:10 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78f03917484so307927285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714403109; x=1715007909;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WhbcF3TWQTA5MkpkxmSIX7qa4yJQy6aIRpdafwtebNs=;
 b=F5O0wEoezhhzQK0/xLleFHLkOEVTtUybRuaB0P0qYsIOL/aFMXaG5YxpW9aauKiSwc
 KI9ZDPBCuxevjDWpz0Om7ii6goFl/FqfKY0QTJf0+q3ht+iKdT01tr8xaObCni7zqENn
 J61I0wQKzkC1Zj3m5/71DDknnOpwBJ5S7WZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403109; x=1715007909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhbcF3TWQTA5MkpkxmSIX7qa4yJQy6aIRpdafwtebNs=;
 b=vqAdyzZ8JXkMFHnPm/oYu/qSkBM1ubBEdmToOVuUNLHasR2XLX9nENxf+I7p5QYa5p
 GcJyQByLivlfRxfmUkfAd1UD4n1IVt9DqHczdKPWqrv9Yrh1LEz4LKCaVX3mb6sPmqsk
 ZyJ6Zmt+SKXHWHUjG3L2kttPRcA61LDvvhCysDLASFKjWUcdR1EJ7DhvmtlnkSAj/iqx
 U9ZtB6EH7RtH8fMXl//Q9XnLOrNhCneHjuB0bq9vNyIc4Q4Ug0T6ly6q6B1+SB1eVU6F
 eLYdzgSicX0saSQw13KEBQbvuAGMt4vWgDOTh905r9GVTRQclFAbW+mfZ2oYmTh6/+Kl
 1UIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9b5WkpvjezutragY9wJsPFrtQjMiIdZlRMM0YvKjEn1PoSpG95zJQ8b8bQhZASzLta+cSDKNNKa1N7Q2K/Ldz5cnBSDZcjVvPHIQfKjvfcWRgqfeohldU
X-Gm-Message-State: AOJu0YwcADj9sTZYd9TxOOnsQS2ZgupwKK0j0BzmmIdHvL33AfP/hWxa
 1YX9hJ65pvpXkW4JOgFTEiMKnAVVuyFxnsp7rLUhq9JslAHfbQSAuxwl6dEBWA==
X-Google-Smtp-Source: AGHT+IGs4sEEfsd0KHK969uVD2lhoqcTxzDs2zjOqF/5cv6aPK5AvcxX8HFB2EOaJeVcr8eLM013oQ==
X-Received: by 2002:a05:620a:8204:b0:78d:6479:7c39 with SMTP id
 ow4-20020a05620a820400b0078d64797c39mr7471552qkn.19.1714403109214; 
 Mon, 29 Apr 2024 08:05:09 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:05:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:03 +0000
MIME-Version: 1.0
Message-Id: <20240429-fix-cocci-v3-24-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 24/26] media: venus: venc: Make the range
 of us_per_frame explicit
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

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..f87e33a34610 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
