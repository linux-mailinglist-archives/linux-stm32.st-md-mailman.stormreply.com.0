Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD0B00A1F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 19:43:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65DC1C349C4;
	Thu, 10 Jul 2025 17:43:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 212A3C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
 b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
 6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
 URwibWZiy3br+cSDhFQbudAzUvI23pQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-hI4WVNkCMSCWIo_p9lnw3A-1; Thu, 10 Jul 2025 13:43:27 -0400
X-MC-Unique: hI4WVNkCMSCWIo_p9lnw3A-1
X-Mimecast-MFC-AGG-ID: hI4WVNkCMSCWIo_p9lnw3A_1752169407
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fe182a48acso44711546d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169407; x=1752774207;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
 b=qTuHn2Nf2/SM8PdJaerzswCQEYGskYpjc+D5ihzXuO2DVnukZPVZz5yRi24saureHy
 FHkDf7aseO63exurUdS5YJKlK06GaER8UFW5qsS6/Ys+ULPv+s5tPcGF29MK5SC0V9RJ
 aLg/uP9ohf4YD6UZZ3C96taPy1seY6JP1eM+k98CrcKqqw/q/WWU36oI/kSBYqL1zdEM
 evFdcnSgB1bC+M0eKlZX7PnGoXMgOpJVhslzODWBdzMiGO46f/RbubR2GL8aWw6rDtYu
 VnAz+CCDuCa9c1DiKS7pndfyDFzSSkjHQszXvt8CYb3IBH8L9LCwZfDEqqMu2sPZgEqZ
 hcxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXffAbfAwdK5qr3/jvjFrnn1VZ86xQBx8MdCMS8T7xchROmJMzKXzyKiKJ4WtVrQ7301L1UGRjmkiBP9A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLA1ZeOLQkfxsD0o6R1HRO7WDF43jvmKd7QBs5wNH79XjXFe4n
 J3YVkpdPWs44cmJO9yjVjpRpsbPCUEdgw2oKrq+QNqcRHYphv9kSwLip4K7itHat5VtmerhzgTW
 0uogRQbiaxCGJXApa4mbJrO5C0OSyPWflehHBEmXZi8LGhdYyTVae50HMrnA7MrA3DqLwY79ekl
 cBTdC92w==
X-Gm-Gg: ASbGncsJdwbhdzSYspXkoL1C+Pulk1O4bqLAKAzIXM5mA1FP+5rd980GaC54Fgd/Z04
 nlzDkafPDp4VW5Xh/U26MCK8usn1CoHALWpcLQDDuOrEnPWN8P06Ar7rUy0m9dVDeiHAGaQQloe
 3iayuHBSCLr5BKUd3rjNBAjZQBAIXp1J/fCkZjiX0o10D+TKYp1XVRcj2aWKNGrElwFglOTz093
 DSv5NPUE6KHLbpts/tMyiIbf6KjGQF9eCnEGDWnkgseV+786L7yadR9NGzTYmMNtPbtWGfZ1ZPa
 kiYvukKctrJC6UHuk/HPpSP5ybUdboNceEjf3rzaNuiJ0lsTNFjhMkwJkq5s
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id
 6a1803df08f44-704a3f6fd62mr2495976d6.14.1752169406568; 
 Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id
 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197; 
 Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YazD_yfG-VTJKyALP_mb3FzMDQyTHT30MyjGZVWyCds_1752169407
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert
 from round_rate() to determine_rate()
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
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
