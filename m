Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CA8A63F1
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25167C7800A;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D63C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:00 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3c711afcd43so424330b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209699; x=1713814499;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
 b=g6sAhLRakOa+bVmjpzeNP5zRosNEwnpEee7wvGxCCfFo5aLjOQ8eQBjywk1DBIJpOk
 qFhmEAP5d3eGiyAuXEkipSXg8XDUAF38I1kJLnsWM+yARdl7CBqlMd2X1fvFOD4coxvM
 Nnmxek6ISFsu1d2wi0opkMT2L7J7Ibx6a9pFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209699; x=1713814499;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
 b=bgYtN1gUVnUJlULXU99KUxsAP0KjJNi46Uuja2M2TwkjFfzETJdrfO22i7vnbW7HFj
 x+dUEICw+wMJnQCbm10IiM97jL7sRNIvhEUJNyoin0Y5GSKwj+ulnsCkr/zBsOwXaFe0
 V/76XvjbiuWFYqcsNxFaa+Jjqdncnp1EbrMeqnfpPfbNs6FZUEoMVgpf3vvysjq2ElAr
 r43ME+x5xiYYsDzx6pdok2alvpnCiqnjIH709K7IpCJ1qnLJ1rXb+C5S7hGLaK3415hv
 nV/o7pP4NcE1WjABlOv1dCEViU/C55+h4hSHjX0j6sIGyLJfMNmX2ZNdiDVj44/vdnNU
 8SQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4IyGcoHvlvFewqWsOh6LjzB8LLIzZiKf2RGO7/tnALk8EB5dkoLjWUMCICuZwMCkXaSlZaM4OmgS+y5Jeidz2ZVq5zBNOSRuePHRovo7kENxbpA7weAxd
X-Gm-Message-State: AOJu0YyRd1k4WZTZY3tIlAPNmW3uzkrwWocWjPgEJvxS3Z16NDjMpWRF
 JRPZ892cxzpwdzdP4WyZp9qpxLKiasfeEroyCgf53dIuJsDCx8NjZvXn/hzkkw==
X-Google-Smtp-Source: AGHT+IFB7ej7jQ6Y7TTKmDCBXS4WSfTxH8KcZpQzoboVm109oqWmXInnRELaaHMlCW17SN5elKNPwg==
X-Received: by 2002:a54:480c:0:b0:3c7:c12:e2fb with SMTP id
 j12-20020a54480c000000b003c70c12e2fbmr5150205oij.56.1713209699409; 
 Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:45 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-28-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 28/35] media: usb: cx231xx: Refator return path
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

rivers/media/usb/cx231xx/cx231xx-video.c:1282:12-13: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-video.c:1328:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 8f347bbeeb32..bbe207d72427 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1279,7 +1279,10 @@ int cx231xx_g_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 int cx231xx_s_register(struct file *file, void *priv,
@@ -1325,7 +1328,10 @@ int cx231xx_s_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 #endif
 

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
