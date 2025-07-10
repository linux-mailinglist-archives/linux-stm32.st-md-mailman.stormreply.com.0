Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BABECB00A23
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 19:43:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78AC0C349C4;
	Thu, 10 Jul 2025 17:43:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2B6CC349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
 b=RdfcP/nQ+wwiCUL7TitQjJ5AsimGmI+vbUwbN/txPW8ZsvNmp00oc4wMeJAxggEHn2HxSx
 XUvTqx9TuuXoj6yoA4DkmYgnGeraqyXT99xafPTFEGqJb9asi80SpO6/9B2RZ6EniMej2O
 PXM2bhDWmyvy6+JoG+rtpAd5njgnsxk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-8T4Sud4WPieFv4Up3LyPgg-1; Thu, 10 Jul 2025 13:43:30 -0400
X-MC-Unique: 8T4Sud4WPieFv4Up3LyPgg-1
X-Mimecast-MFC-AGG-ID: 8T4Sud4WPieFv4Up3LyPgg_1752169410
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so238875185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169410; x=1752774210;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
 b=JcZEaiZBs+J+7NJiHIUd6Ppw/wMq7o/q4yu/uxT0oECP6UxXuVuXNuSoZbQHTJKu38
 BzJRZsnPU8iRbvIYKFtRUzHUxkq9iSaZhMXWx/s2NU5Ionot+36e2a+JVgnAR6t9A34z
 k01jM0DoNkEAdGXvtz+IjU10wfvfCtn4pFUCgHA1Li0/szK6kt5SLDD1A5R3DBTetuVx
 fQrDXad58W61VqoeBGC9rDMGh+2C4V75B1IGP+2KZLI1OwJov5D/FTWa9zl5iXJpSrVy
 1MoHBej9VeUKR584TvCFDieeReZFAHbK4KrB4j6H8rs1pjz0HmJc2Vp2wbkSjZhbu6T0
 sdWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPUR59MQ1MI7wREtLG1bA7CO6Zddm18gZbzAa20MjgCVA2ucsgLdZw2ut2ZiCq64cxkYzNGL44t8Sp4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXleX6VO0xhZIrnUUF5kcUiax7xLvn111m0QfC2Hc3J+etHrO1
 OGdoWeOZVjam2GNEgiw0POWx8/wIuxUS0cWvYZgddm23TciZqgK+9VSoFlgtjVM7S3yKJB+XSAp
 ZAZL0ihBYkGTkbztm8snfqp/ydDFSB6MrcpUo0XGFwpU7Q1CKg27oZf7yC+F3l+E2pG5TQ3PMgz
 S98NQY5A==
X-Gm-Gg: ASbGncve90qcyDj1UxrC35FAaEnz4+hIjLcaQjMpkJwozu9QnH4aD5MuE7s8UH1/NIU
 sIPwl9gJmk0P+02RCkAnfQPxMyWnF68Y6pJmXAWbK9P5Ux1mDZie96kav+tkL3Uz/FqiQO4O12K
 YAPVbRVc7UGChkEZ+nIqadhHyvOg47dMKxQ7u3LSfP3xbklqrOUYSHXsrMSYtNsQU2U+es3dzRO
 iCNzx/ezS5suTDLTE2sshmJeo94P6qAuM2qIypLmDiPLuLl8ot+RW4sYNrbeEvRvSS/eIIUUU8j
 vBrxDEUyHS+uOI3M3XG9zwdUeM/tnKkWXIdLRrFpycJ+keHvDIUhcBI9xj09
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id
 af79cd13be357-7dc97da02f2mr646710285a.9.1752169409713; 
 Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id
 af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169; 
 Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g7lc1NlnsE0i5L_F3usBpmB76K5q2NfMuKPjeJ9Y_z0_1752169410
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from
 round_rate() to determine_rate()
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
