Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B667B8B5C65
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:05:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DEBBC71294;
	Mon, 29 Apr 2024 15:05:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D034C71298
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:05:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-78efd1a0022so364794285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714403099; x=1715007899;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
 b=heYol1cXel/3/d7Cw3I5XTR/NI18hysNzoJEYT6RMQGo7ESAp9PAzlLNuuoThY5dx0
 vuKfCrOlm8bIDim9VBnY+uLJDTNHwN++kiu9OWYyr/SZ1Fyk2TAt4vHeAtaaeiyvFAdy
 oa8+oogzuhZdoQeh3DawrcAPOgfdC8Mi7MVPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403099; x=1715007899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
 b=XThCsKft5q/+xT2pmz4UafNyaRiEzj4oU5hAZZWIwGzj9kpbztk7bYrVJY2Huy1oS7
 sptRX9jFPAEBa3IgRedEGIZ5ilv5lHUwt6LevO2vjw+sqKz1KM33pr+GxEZWFQmALwRn
 ZOlWRmz+yTgnZJ8DREm3ZBGYQ40yuA2NtEsKVuu0RXdsupYTtybwuM65kR1OVdOrIjNK
 QyIcswgSh9glyh/b1LpmGcafl4m//PLzbblP6+BP9/wTr6vcdoW84biayquYtpDRDkMp
 YhXGiILMFKOgYIkbvuOrl67qRjNrKd+h6Mx7D7Vzqb0kqTwLJL4d9i3090BaIFP4VMp8
 VC/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDTuN/n6ZwcIkJpskPuLF7ZCxRLTEmZsF4lYzz9azZ8vGtSR4J9P0tQrnPvmXLYDbEjn4/j7VWS4oit8eF8qI/u9XWq1UI2kZfHmngPu3dkMdyFumjxbT6
X-Gm-Message-State: AOJu0Yx1pjrxEYwVAUL8bFtyQopseT52MCn7L8PUpsfft1dOCONxaj3U
 vX/a4hqDSwaxI6svTheuH2sFKFKhPYt1x4vWW7hidf/YTm6HgnBbY9cH2zHrUQ==
X-Google-Smtp-Source: AGHT+IFJT4Q2Syc1PBrJKVClvA35sFEGet4fgiHKy6TprlGgcTs6U4UnMxlpWR+ax38rGRoBMytLog==
X-Received: by 2002:a05:620a:410c:b0:790:ef3e:24fc with SMTP id
 j12-20020a05620a410c00b00790ef3e24fcmr5535437qko.16.1714403098672; 
 Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:54 +0000
MIME-Version: 1.0
Message-Id: <20240429-fix-cocci-v3-15-3c4865f5a4b0@chromium.org>
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
Subject: [Linux-stm32] [PATCH v3 15/26] media: netup_unidvb: Use min macro
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

Simplify the code.

Found by cocci:
drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:138:26-27: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index 46676f2c89c7..1c885d620b75 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -135,7 +135,7 @@ static void netup_i2c_fifo_tx(struct netup_i2c *i2c)
 		(readw(&i2c->regs->tx_fifo.stat_ctrl) & 0x3f);
 	u32 msg_length = i2c->msg->len - i2c->xmit_size;
 
-	msg_length = (msg_length < fifo_space ? msg_length : fifo_space);
+	msg_length = min(msg_length, fifo_space);
 	while (msg_length--) {
 		data = i2c->msg->buf[i2c->xmit_size++];
 		writeb(data, &i2c->regs->tx_fifo.data8);

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
