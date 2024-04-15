Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3D8A63DF
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D8A6C7128E;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4972C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:39 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-78edc3e7cd9so133684685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209678; x=1713814478;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iffer3/QisAZiMzK6e6qkKJFt6oDSvxeznUoOZCft7U=;
 b=kMzL8uL+7AKitDamQhJRu41dk8tDUaFahf3OTibvzgKvfJ9C44nwMOPUvli9KDqHrk
 lc+S0o6t/I5pKH3shDk6YK9xGAhYpesSwOODWIjLA//nQVCRieL+XFeNCpVC0PdPTWC/
 5PxwIXph/4G/BHCjN3Rj55UKrEpVHzuGPC5uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209678; x=1713814478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iffer3/QisAZiMzK6e6qkKJFt6oDSvxeznUoOZCft7U=;
 b=n+tEi4FfmOc36Epd6Xa+o0RqGbmjEYnEkTffo08Qu8OdA37mLYlI1XDXzNyUKqsUId
 jdBzRh7SqCGVDOMjM9sBgy+fLXnanYIa/5HuiMTHh7zSTmK1gI6xbA6sbdD96zfO28tW
 7Bt2xpcG6TdM+mbC94f/SYU29t0LJcd78EEedciy9n5BgFjpq8gfQa0JQ3xF+Cnm3dpQ
 yOZ2eLijIxAHcpT8B6F+y69Ogr0RXFDq4q2B5iNenj/X9eS08apNrQ+fyhSyV5ArtRit
 EGOotYdtzcc7DZgyEi/2ZhuowAqBP8kb6yp3hK39v1n3QkjpVmoSn143QSNi8+mSrWQU
 l1bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpslCojxmB80kNPF1sJ+aMICDJlusS7PBKQ1HdSZZSRLoPRgOcBz/atYutMh9eUCR4svS++reYvFYifr7e+Iy+MuzITssRZz8fkW9cjdQbXXQmD8Kfh1PA
X-Gm-Message-State: AOJu0YymXO1/3aN2wVrDp5U48anOW0WHoDmYjWNZ4twTpjVOEeeM/MnD
 VUBPl90kyq9e6xBj0FBVyS5VPHHWJnTdRPmkzn1HXhdPjvgOL2Uq5S1uyHyiQg==
X-Google-Smtp-Source: AGHT+IFEHU7eIzT8/HtrN2B+e04dqI5HiplT7bCOIBdeXvPZpYPaOGCG3Tv+rHX6H2GzPAb2+GvQRw==
X-Received: by 2002:a05:620a:3b8b:b0:78d:58d2:b600 with SMTP id
 ye11-20020a05620a3b8b00b0078d58d2b600mr11752858qkn.42.1713209678448; 
 Mon, 15 Apr 2024 12:34:38 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:27 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-10-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 10/35] staging: media: tegra-video: Use swap
	macro
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

Makes the code simpler and cocci happier:

drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 630e2ff987a3..7b8f8f810b35 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -317,13 +317,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
-		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
-			unsigned long temp;
-
-			temp = chan->addr_offset_u;
-			chan->addr_offset_u = chan->addr_offset_v;
-			chan->addr_offset_v = temp;
-		}
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
+			swap(chan->addr_offset_u, chan->addr_offset_v);
 
 		chan->start_offset_u = chan->addr_offset_u;
 		chan->start_offset_v = chan->addr_offset_v;

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
