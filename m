Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BA8A63F6
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72281C78014;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B40C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:06 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-61816fc256dso31279287b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209705; x=1713814505;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
 b=XPWnxjcAeWpqPXen/LA8Lvq5euZTX93Qrm0MnqKTKrsxcKjcDi/LA3kwyvmZXHosVK
 qYj4R+MrfQsVDVNL/pW4QDq4oFpBpxZMaSc5qYthf49gRAL1sG5m8kp9mQmowqIKsd6r
 nAX6LIFgaGXkgTP897key5xnSlAkmt3eIkmSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209705; x=1713814505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
 b=AJ4IakEcN5sOUlI1StDDu9cShSKaZsQ7jIaIjIW9KeuYsdv4vi8R/jm8mXYGOze/oz
 Jmi+uQ4BzSOP8D9DdxoVmYy4/jHRufHiBBlbF6ZQwnXrPQk8/9Of88TwsAikBPS+WcjP
 TFTJ1jr8xFo9sM0Q8U0DF6YUdxEXRpmdhMABc52dZXteHZIOufOzsU/ThOs4iWhfz8wv
 LvzzPCykWDC2xDUj95oEDKzZyw5+m+4HU8lC1/79WKqIjEfMXpoOCYefIojImVrQuP1Z
 TmLJ7+HOHw5xZjeD84e3JQtvPGOg1UrYKA/5IP+zoRGHXDg+FH9OBau3D/tE/eixgU0n
 oMkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW98Z9eHDJkNHU/0y6/xtqe6o68ZVlJlSnKtSTMg80PGhL31cbSd0JJEbCKCbRwvingWHowShGYS9g4JD+kTQANIr5uLcfHQX92GNeBpDALooFsbBJatWDB
X-Gm-Message-State: AOJu0Yx7jJEmTJ0ypI+AWoQoietn/GqHvZoFoG6GlKGmrQPue5gulQEW
 SKpArzcVdhli2Ov+4nGTJ31YBF50lA/JnUYq8ERCSvCBl689SW1WkzqSOkDTBA==
X-Google-Smtp-Source: AGHT+IFGGKloXi4LQc1kB9HoB/VhdVmfNZmSGv5YL+7VwXl3CHp5amZHgBcaP1BDvt5Qqswtqu1lLA==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id
 p1-20020a0dcd01000000b00618875e2bc1mr8807707ywd.21.1713209704967; 
 Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:50 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-33-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 33/35] media: ttpci: Refator return path
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

drivers/media/pci/ttpci/budget-core.c:280:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ttpci/budget-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index 25f44c3eebf3..2d85ae1ef50b 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -277,7 +277,10 @@ static int ttpci_budget_debiwrite_nolock(struct budget *budget, u32 config,
 	saa7146_write(saa, MC2, (2 << 16) | 2);
 
 	result = saa7146_wait_for_debi_done(saa, nobusyloop);
-	return result < 0 ? result : 0;
+
+	if (result < 0)
+		return result;
+	return 0;
 }
 
 int ttpci_budget_debiwrite(struct budget *budget, u32 config, int addr,

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
