Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E08A63EC
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D06A4C78000;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A461C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:56 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6eb7d1a5d39so1007940a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209695; x=1713814495;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
 b=AKdqWXB5cmY1J1nc+yDNLP1zOTnrb8GYayFOYrR55H2RPHOIiSsmwsCwlSJhtDZRFW
 kUoKIu0oA810Zkn/N8iMNjsRTCpKuUOrHboIQYw8l6HmvwGmVYQHAOjKZ8TFNupH2I13
 EgLxvhOqZl/8+Nbt9UjllJSd5kF2dlShdNKMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209695; x=1713814495;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
 b=PqQKfu5GOvSHv4LaputFksj3lMHrDfhLgIrODqT7Q6C1YEZdbYcy35wddfRwJyjaOE
 11bW6pkWE9Ehc+8O3VT3ZlB6ZJEjjer2edQ0u9ZUiD1B1083mDTuQpFo5ofQZzKbEZtv
 TWBpwh7Td5jlfM5Szw5iPFYTq6HwS/Dgk9kzkrJzT/MiCvZJCigUKk6yo51GbKFt/Met
 XVesJKsMmdsbcZ5tjjy15TMBQ7tZCg3o5MtmL+7EhRortargl2wBRIeO5hm8oxs2rcuL
 ptYSazdenz3xRFTevYb3hjBiQ06k2lgtOxDOX56ul0LjkRf9XjmnyhKMgMRgeDjoQMj5
 nNcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsg7URGoCyzaUPWK34J+7/+h89CR3nYli/fqbpTgOycUK0bBiH3DyLZ1gYw5z741me0gQciZcMFTuhcgL0LLmMPb3piCeUEUxGFGkHRiwhO8/9UyzT4GDe
X-Gm-Message-State: AOJu0YwtCs/smxAbNg0VaCxWhezNqLOIQrgORRWdwwpL5IeRPnrYzgjk
 r3H4hIzmiXKYLnqdJwyn71IKB1Vh1WY+0stS00gn2T7m+oBd265+HQjcK3ofww==
X-Google-Smtp-Source: AGHT+IFsqXR5fSRZnzm1Kf6aaPblaNqmPYRQpJrXNEFCJBpTElAi4AncAaUAPBA9CFnD3PK/w6M+nA==
X-Received: by 2002:a9d:748b:0:b0:6eb:7d1c:f793 with SMTP id
 t11-20020a9d748b000000b006eb7d1cf793mr4227322otk.31.1713209695186; 
 Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:41 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-24-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 24/35] media: tc358746: Use the correct div_
	function
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

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
