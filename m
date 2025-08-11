Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBAB20697
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 12:56:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B70C32EA8;
	Mon, 11 Aug 2025 10:56:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AD62C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
 b=eUMN4dSQ3le9FS/Y+6Y244khcoOhLYX3ErDME7G3+JqrItrM3btxiZa4VxtdirKP6n+uVz
 bKdOfahB50Z39mmUTDcCmij99rrkoz/YQHYs97rsBTh7lYgC0fX7KFzWbQTg/8Dqn5Y990
 K+ndaUng1xI4r+jRbtzKOn34Udo47z8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-KVk_F-UBOPWccqZY-spMeA-1; Mon, 11 Aug 2025 06:56:56 -0400
X-MC-Unique: KVk_F-UBOPWccqZY-spMeA-1
X-Mimecast-MFC-AGG-ID: KVk_F-UBOPWccqZY-spMeA_1754909815
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e8106a41e7so1030889485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909815; x=1755514615;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
 b=mjalVT8sljU7AsTYVHW+0AkYRVvfyPQ3f30PfjV13xRrNi8O2qNM3O8Rm063pinhdC
 YsIZi+C5+0qlwEKWAEpLAyOYjBiHFIF6J3KA5eaj2jrWAIPEksQL7R96KWlLkMNZhRas
 qdrw5mPtf3TBrpf/EPi+VOMz11QNIipeffhcpq7L9JVftEOQzO1qZ96x6WsQQNOClrAF
 FCy1rTLR3E03JMUJxZJDSMEicLoxJ46kDlMzDzVbljUhYDVJBJg14sWydH6lYBdPluJW
 5OXqZ+2fw4ZjQnb1m/VSgekmGcLzIk+SXunshVKO6hoVo3t6b/LDv6cT+vXJhJVlf9CP
 rklQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUDcsiCD8MRFqZhswPg6lD4erjo5TTdGJelU0GwwHFlDN0NT7nRsqG/1dscu+IsSvV6CN9eHUear1yaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5wm3BKL4dUpbbtt4aV+s6J+jPyynxWQ+JGtdI2SqmDA8N+38b
 0Ffwvc5lM0dPils17JsY1Sb9q9dJPsL817pCtStaR/Wih+Qnz10/sChWlev4Hs32dzBQbrrWTH4
 G4jIp+yjdH0GIewxpRMdwBjc+drzpYeI2jy7KAhYBLxQWG8Rpqlchywdutna4mcO/b2K81F6S7O
 MCbNzQxg==
X-Gm-Gg: ASbGncuw6C0UKsiyWzN+OLBClZpJ4ukxW1CpGDmOkoxg+ION195YpBQg2EPNqDa0l14
 yVl6BZ+7ZCgBx20fsqhndj0mnO6juKgWdcVfHtEZloY2AdMZ+5ZyTkNmBrUODweCWM2Y97D+UOJ
 0UuWpJAziL6bj5obUFxEkj+G3/Uiv8sUm3KwQ8SOXJMvIHI4W5Lb5yXne2l4dbJSF3T0T0DyJ/g
 4HH4KJp3BUiU1BWLVvuHRL9uyZl/qmg1j+G163V+2yYPjBxs9RdhV97xD80H0NePm6iTz4lUZLf
 ZGVbfmxEJ5SJwB6D7nswF0SZgLsR/NkiWk7JY1QsQr9MeWJIyXee2XL6Oh13UA71dHFzQrPwRd4
 oKPU=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id
 af79cd13be357-7e854f76862mr91485985a.50.1754909815347; 
 Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id
 af79cd13be357-7e854f76862mr91484185a.50.1754909814934; 
 Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GXTsA-vtISjrkUf62zMz7x33Vep8m9G22ZUpaQYghJQ_1754909815
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
