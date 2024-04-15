Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F26618A63EA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6488C712A4;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688BAC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:53 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3bbbc6b4ed1so2194163b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209692; x=1713814492;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
 b=PpjNAVDD1+nfiKT0DoxC0BlGWb2u8OPPBH2vtnQ51ysu52hJjPaM4Bc9nDjyGK+SMb
 MwiRXnuRPr09cL9vuX3HWqzdkgCAGVurcdH4t7AQrMkCkwa3tYJ8Ru2xd4zoE6XSp4Zh
 1XqqoxIbYzhUkqLX3vkk9I/osTBf8Sw2+Z728=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209692; x=1713814492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
 b=ULCZvZrRAM2+Fo5EqxU8bMVTHWMKiNNBC7pqS6hFq/QR2iHcnnFJerf0ZslgLFEU5u
 DXJht+ogU7IewCpBqxImkv+MZDlacyQfA7IDlADEFwrTgES+Z6BuGLI7euRPutIcVsJn
 jA4nQveWRU/Xg30Ew7DOFgZw5kZ8WEH653JiwKISqjyWdTODwvit/p4Uw7AONBkJO9n8
 UuFuQ6lsUPCR2XU7JL3/o1sjGCkLGDT0+dJz2E54FYKgJduJCPprqd9cDDeD2voTmkVQ
 UId9oNJg791+X1xCtfk3CizYP4qwH0Lvp3CqJLe1q2Fyp3vq7Rb9FuPHd9AWa0DMydsJ
 TXxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7axZrj8d00Er1d7hEmRbn4b6jGU0UZBQWIixz6Yv1JmfyED3MlQc+gvy8n6X6Pgc9r80JKUeqjqUFTayo8JRT+h6D4Fi1PdC5+81Hv5jPHOsUzITA0ByP
X-Gm-Message-State: AOJu0YzU28c0HOoawwTkxEfcmycfr5Q9ft5SPp2Ncfqfpev+NNgpjrX/
 IYczYgd3ZKgaSkWtjewuK9b62GcbUDRIX51bmb5fJNO7A79uZTohsXYIlqTe8g==
X-Google-Smtp-Source: AGHT+IGZ58NMkpObXyXFmK/dlwdDRAXnKMQeVrLnGqtYNcTRA6TD/q28Ror56VZ2t4DiW7soUyKUtg==
X-Received: by 2002:a05:6808:128c:b0:3c5:fe95:2371 with SMTP id
 a12-20020a056808128c00b003c5fe952371mr14036703oiw.29.1713209692296; 
 Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:38 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 21/35] media: venus: Use div64_u64
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

us_per_frame does not fit in 32 bits. Use the appropriate div function.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..1dffeb7de76e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
