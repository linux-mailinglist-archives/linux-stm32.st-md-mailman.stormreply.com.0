Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B258A63E6
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 885CEC7129C;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 375EFC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:49 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61ac45807cbso13624197b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209688; x=1713814488;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
 b=EE3zTSCJTvSDMgt0xdQ7eWq8EoESDk9uzGLtxtMXNwPuHd6avtcCQln97YztXj1C60
 /KrYeGXjExlbqwqErcJf6ukbjrf0amlU7j69lyToqPFYNmhUU87oX+4T4Q+AYtM0gEKe
 QEP8zlFr3nJU8HcpwIxCj/q2CW/ha9v1t87E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209688; x=1713814488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
 b=WS8AYXv00qqnwFDKBhYDpShNPUTiCPkbrXgpzy2gYF0+FStxDvfIxD4DpYWNFb/TXQ
 msDU0f7ChDZ9l8Wfw6uA19Z4tqEN1jeYMSKjGXUu1QDc86khpJ+dgNNz7ziEHQQ96dAo
 /9jBNYd/xeeEuoVj98O8mDv5mysM9jQ9poA5EZFEhcg+vT/hOaJ+ZqNEO5Awlwg2WE8K
 mCeuthj8/PW6W2GvOnvepT+9nZLRbFQZx1MbZY5SATM7p2d+HzskLKCzsbrXzGN95bYI
 uoendpvGA1zlXsmXfB1k8qlmUEk8hmbLwNiUYxhzL7pr8s/5t+1zLEi80qyJYqRAF8DO
 A0vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrsaN5nMngr52TMmEX8J4quhd/MQPK6mijH+nwfBlnJQ2/gTFTtXZDpjGpSZ83UQdsKtfhIOKCd6hZ8JFI/nCqxBso9tLC25WatysYBW3hbC75gW2I5Chi
X-Gm-Message-State: AOJu0Yy64qcOHxB322SHdG4mxY98B7UZYoFISpdw/6MphobjcNxAlY02
 I/DLzg34z6JilH46BGEuTv279+nk9lPx4a9aSRV9IaRJ8QVFVFKFIcIGxTOyIw==
X-Google-Smtp-Source: AGHT+IHXF7TrtarHgpunekvNDs6nvd1JJs+Lc0bh8dwb/yJrFpFk4KNuzD4FvIVwGteAAQA7ZBlIRw==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id
 p1-20020a0dcd01000000b00618875e2bc1mr8806798ywd.21.1713209686523; 
 Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:33 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-16-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 16/35] media: au0828: Use min macro
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

Simplifies the code.

Found by cocci:
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
