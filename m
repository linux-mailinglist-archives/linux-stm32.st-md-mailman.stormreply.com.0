Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7708B5C5C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:04:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15058C71294;
	Mon, 29 Apr 2024 15:04:55 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B70CEC7129B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:04:53 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-23cededea57so116550fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714403092; x=1715007892;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=;
 b=gwQNEqI3u0X4mZ+9MPyNVGorRNL7Njzge2hq9UhDbD+0mCeNoXDIGJWnFtWBUYrP3K
 VH8g2F6P4b3B6vDgBAo5GpACSG5Hl3LfSjmuaXv4r3GrHsS/XUql99Zsgnn/drHy96QS
 EZDS7ZN6xsnUWaWoRaKhE7gmZgGO6GEnpcV5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403092; x=1715007892;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=;
 b=iWdCojhLaBE/0oGFwy+pygXMM0OelfQfnnoKVBI32JHqvJZ1aETD9O0XMuPnT8ion0
 EDQx2dsGoDxBkdTWsqSMnL5kIP2JM2Ir+LAXlekJnhEvo+3+1buvoQsIjZEAmd3A5gZT
 ppgx6YwvPOnXROtpgP1hXul0kv2SufI697IPfBNFqvhkE5sfuQvb2Qj7OJsU0SpHjujP
 Wa3ix1RgNz+2H8vGXjzXZkjBFjkEfJKeISuxRB3YyplEE04vtdJtcmB6CGSsBmoLPWNk
 A1EBDzXKjPZViWN/wfB2qpCafQg6shfZ0vfpRAk7X5B4DODJ7uaJr/8cL7U/XXRWr/cQ
 syFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYP4XZX/FW8n9ywMz5K+ZgNaW9Gzxi/3odmKGkuKyWR5MpTaeEKuFU+Xs6jxPw2gTXnZ3ZEp7uer22AN5GEY4qo1jkDVq2ZrWOWZVAJ3x/JpEpsNPpNIGe
X-Gm-Message-State: AOJu0YwqhfNMfMfHhBz/SMmKpCkqDEx4ApXDORZ6ioOZv6uPWCIK7Mqy
 7Q3JYHKvV2GTQheOvZgCI8dtetV/agqEV4zFhcAvTHv6HfutTPjs7dTMWOq/0A==
X-Google-Smtp-Source: AGHT+IGXcStN+XAFfYHJlQ/BhJGSDUpZDAykPn1StedMjlrpGT2G5swu1IRQFedvTjeL4JvuXpf10g==
X-Received: by 2002:a05:6871:a416:b0:233:b5ef:3bab with SMTP id
 vz22-20020a056871a41600b00233b5ef3babmr9216406oab.3.1714403092563; 
 Mon, 29 Apr 2024 08:04:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:48 +0000
MIME-Version: 1.0
Message-Id: <20240429-fix-cocci-v3-9-3c4865f5a4b0@chromium.org>
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
Subject: [Linux-stm32] [PATCH v3 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
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

Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
is not enabled.

This makes cocci happier:

drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3a22da443a22..421b2b96bc8a 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
+	struct media_link *link;
 
-#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
+		return 0;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
 }
 

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
