Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44578A63E9
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA4BDC712A2;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60033C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:52 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6eb7d1a5d39so1007891a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209691; x=1713814491;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
 b=KhVCG/2hpdrsdWUdKtaainbG8Ramv67KEUVNgvUdojhsxgB+RLMVu+7zKD5+8nTgru
 RfNfKhvsf04kxaZ1BYqjOvXZMNcHQsDSIfJ9GSW131RbowfqzRVqgJVGP7WIVe67RgrY
 zwLjAcbJX9P5E6DJEowKsz9sUb7ttGtiTwy+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209691; x=1713814491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
 b=jNh8/zsIUfcUgsRHLP4HD7tsxbIR07Ij2iy/CEfZNES2JF5Vti7gJFKbGmNqSCxPns
 Z02293J8mx4Kaysfic/lSEK3vWN5dN6SWucQj3ubxwd2qBFMj6F8Dkwk5hy0Lhl1JUKM
 rmkqbAFpGKtXGh8fWgQlx7RErsFNkEFI7U36iMT4/cwZK1ueOvNH+Izs1aOOxzpHRye+
 rLFAQy0MTH5thMOOOgWhYRmJzSBmL+58uhu6lTvPKCvyww8bSFRSiRAfmstHaFReacat
 drhafUvHMgFKn46eOn/hINxmJIeF/kYIAOlcuhwE77uT2BdqQ5tspRv8kcCFPzLGHUeO
 bKmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYN4d0GtgSiuN2Lypz31ph9fE19wMCxa8nUO5LmthjJHf8l7AM3Y9gahhAy2Jvg93WXjx1er0K048yQZE3P806C4WeigQHeh71mNG+xUNWPl4NWm0AGMbk
X-Gm-Message-State: AOJu0Yys9BspyVjnPPctx5tWDB3KkrmruQ0vVap09wTESG1h1gqrHCeD
 UDrKfQ5ZW2Rm2cF9Nxvs8cbQ1aLT6Bcq62rDdllT8iv3KL+qSuuLmdeqvULzCQ==
X-Google-Smtp-Source: AGHT+IH6vSvyyYYzExFejV09di7HyPhtKMxRA7xlKo8y+g1ouireMhE+BqwQkFqVSegum+jG+Rz+Iw==
X-Received: by 2002:a9d:6ac8:0:b0:6eb:75b6:4245 with SMTP id
 m8-20020a9d6ac8000000b006eb75b64245mr6116943otq.15.1713209691286; 
 Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:37 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-20-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 20/35] media: tegra-vde: Refactor timeout
	handling
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
