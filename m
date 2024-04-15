Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B58A63F3
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E6F7C7800E;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C44D9C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:02 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-617e6c873f3so39447257b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209702; x=1713814502;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
 b=KzJJR3qEZhh/PJpBrmy/Mu68cOtr4O2CWXh2HWWhu+ICAdMFuLki9hxEHOOJAIXsDV
 pENtiDrQ10sPN7y8dUuXXEZ5wS39k95fbyVvGVLrg8qyJGOc7zVND/ldc6E32lIcub6L
 r94WnO4mZ7J7gEIS2YAOnpVef0RP/xavZhoqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209702; x=1713814502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
 b=aIAkRUPu+ZKPfpb9stGmkwNwcVfNcEj6wKRPO95HbSbcuxYivWHAqOH52IY+wPgVeO
 VqZ2c/IT5rXwl1M9aXV5sdeyQnIa4sRrqGXB1tF+Tj/raLCnFxJReH6y3TcpoUDb9Z+S
 hw8m2/2hBDLFMLz/fi94H6T3J36voza71O1gMNPOLtMdP5scccsqN+XFc1T7+N490xIU
 Xw5NoiYR+QFxxumRnBc/k3DDaRXTdN9CuyMV/Cxdvorxsn5j1sQF5pBHHzt2M2Uequjx
 Xezx8sJ8dt0ES9BxScpTRRfLYvs9gB77pcPvdXA44v5sJI7SpmN8wDu3cCS6Ot+RrSWb
 vAKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoM+IV2AFMMM2f9utuLicPekXkboOqjyY09bftJHEYaxqTyVvF5FO+LwEPefd18FRNnTq5YrF6uexnN/uXVOsUf7z8filijuEvvzaEGls6oeibPquMTO75
X-Gm-Message-State: AOJu0YzLDBSUGkH3aRam9aVVxWEABAqXvNpnAmYZqg+vq3Enb9XnuWOY
 Q8sziJou//IBTNqx4ntbAoHMakQI/xpXMEIPcluTpWwOlJ7QKeA7+LbG0vd02A==
X-Google-Smtp-Source: AGHT+IEHr8lEllDyip6pAkUMGURPdINr08Mt5MZfIhMi3nIR8h+wyIaxQ16q8BBaKyR8INXB42ugWw==
X-Received: by 2002:a0d:e292:0:b0:615:2078:9c0b with SMTP id
 l140-20020a0de292000000b0061520789c0bmr10298321ywe.40.1713209701695; 
 Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:47 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-30-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 30/35] media: i2c: et8ek8: Refator return path
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

drivers/media/i2c/et8ek8/et8ek8_driver.c:255:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e932d25ca7b3..c7984f90ae4d 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -252,7 +252,9 @@ static int et8ek8_i2c_buffered_write_regs(struct i2c_client *client,
 
 	rval = i2c_transfer(client->adapter, msg, wcnt);
 
-	return rval < 0 ? rval : 0;
+	if (rval < 0)
+		return rval;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
