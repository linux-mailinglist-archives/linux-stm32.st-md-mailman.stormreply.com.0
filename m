Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF588A63F8
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 905C3C78018;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F90BC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:35:08 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-78a2a97c296so232952585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209707; x=1713814507;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
 b=aeOX+/Bzk0VxTPQBTzcvAjro8y25ntKPfrL6lYtdMgUu73xOEuiuN38/dvnpiEjcWC
 3WNAQbB3h/9dg3zUKOI688I/unbQf9nkA/yRQsJAv8kI6dQnBtqdNjkGyGYYJpZNxNoV
 N3IKjh365dEtVJjcbRoXCH9SQwH0LcnJH2Rb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209707; x=1713814507;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
 b=kapEJsv0qeolpAgNKvgPxAeGOpEqARPgR8FcUR+9JlaMP1OGLHvuyqcftnC5LZZxYI
 qZWjNHO6lEJ9Iz03shHo/SeIgGewsBFhOyd4wDBRxk8HkrREzZyAYa4txGtthStkodjU
 BFj5Wc9t/6ppb7yBvjPmadF6GeD5HmTHJjrIM3G9FkMcR3Y1thzK88VgfOyFE7wI8EEQ
 YJWt4LEnwZRnzJpj09tvvYJrBu8vmHdd1nyapFnKj9/xyE9h70PFLg8Cz/LQsOd+4neq
 zo+HJcbP/5lLxayOuA4uC/+lSFn8q7LQbzlr9UJkhKXMTtG60c1LRuFPw8yZi7j/K47G
 Uwcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYNBGeEJMP4yfKwECPxMZ1cvPOwRGsMG2KR705IsGhp/2iJodYn8hdmNWNmTbbx/xbWqU8zNtqlM3FQsO6thwMA5cRRs9M5eg6WPT2CSmhVUPWRunImDUG
X-Gm-Message-State: AOJu0Yy3/ytycK4NaRnXcF66XoucTJkSxTFlOJttOtMtW/jRTPfRaLkJ
 hz0y0uWuGY8Fx2/rHRutyYdnMkqtfDVpN8skkLIor5aBQn7FRFfogGIpAvXjzg==
X-Google-Smtp-Source: AGHT+IHZ1e+rN5kElZ/+CBGmltPllmsoOBrN7bu5f4/61aiFTpQ8yq022XA0QecM/v+OB1heBU4SXQ==
X-Received: by 2002:a05:620a:400a:b0:78e:ca18:4093 with SMTP id
 h10-20020a05620a400a00b0078eca184093mr13235627qko.60.1713209707046; 
 Mon, 15 Apr 2024 12:35:07 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:35:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:52 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-35-477afb23728b@chromium.org>
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
Subject: [Linux-stm32] [PATCH 35/35] media: venus: Refator return path
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

drivers/media/platform/qcom/venus/venc.c:611:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:651:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:629:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index de06e1712d09..285bc1b4d888 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -608,7 +608,9 @@ static int venc_pm_get(struct venus_inst *inst)
 	ret = pm_runtime_resume_and_get(dev);
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
@@ -626,7 +628,9 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_get_put(struct venus_inst *inst)
@@ -648,7 +652,9 @@ static int venc_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void venc_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
