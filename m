Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0808A63E5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF64C7129A;
	Tue, 16 Apr 2024 06:35:03 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88FC5C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:48 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-78ec78c4fceso238121585a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209687; x=1713814487;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
 b=FWRBtjiNeUqtNxjATmdrt29fnV49YpqdmXdFHS2DSUBfPfsnsi6Sy4BDmTyoNaaC4H
 Nti+8gOAo6W6sWNao0NzI1cVMVDYrapuSaPVNJGo69SxBogUtWnR7WnDD4WVBAeiQyXi
 wrEAFa765alueDQ/j1Rni0S0qyHg3u3JeWT2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209687; x=1713814487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VH1TTY2R78PVfXYnT8sQaYwvCkEpO00JMLA8gBHoObU=;
 b=rDeoKqLpGrDwz2iTVS28fhPsY9DwJs9C0+RiDMwkGJL8UIQ+ksCY5iJ8VGPUMHsKpB
 Hlvw2FC+v0pJxzAkhM+BcSWkek0YQcylR2z1goqKRXvPDklLf1+YJ04Kn+oJ+xd7eTT9
 QhsefvicO1oNgBUpV1pTfrUoA8IyxKRdMfD1dvpFvLA3QCURmRALQmaoYxzuLmAt5c2m
 Cl/UU6LWazkETtxmeyKjoa1tr8ZIMJqyZwNKo9sn569yrd4RZtTCeYOWJ1K0gO2MTayf
 Y17xJAXThkezhzK9CxbVf3NTm3gkIlrGUstukjXHG/EkLXj52d7T0gAXCnsgIx2hJc+c
 vF3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5H3ZNOmG51TCQR/ku45gGBGNL0YEDcISni2SKJ2itjCeROzSNTmApUNUa7nexbpNp05NgwejcS6CdquiI0Sg9xtoIE42dmYeEOVuqzTtp3pAvbMl+k5bM
X-Gm-Message-State: AOJu0YwQkbYbgK4pVxt69U6RM79umT10qqUg6ex2z8B98C+PrHbOG0Up
 IK9Pm7uYP6I0UGnqtfuyHOkJ1S/vrtGR+qt3969JOZFr0xWaTcTFp3MXcccY7Q==
X-Google-Smtp-Source: AGHT+IFZZwBtLZMDNfJayMBU/PaT+EdKNrIoBaFoYxfd58lYWJrbZu6cOvIxZ8QNIWMRuOhipLdFVA==
X-Received: by 2002:a05:620a:2953:b0:78d:61fe:77c6 with SMTP id
 n19-20020a05620a295300b0078d61fe77c6mr1118634qkp.2.1713209687511; 
 Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:34 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-17-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 17/35] media: flexcop-usb: Use min macro
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
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 790787f0eba8..3ba6a5ed7167 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
