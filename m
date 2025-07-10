Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE9B00A1C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 19:43:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A65C349C4;
	Thu, 10 Jul 2025 17:43:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34A73C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
 b=P8bvczu7pfaLqeHwdII1Seo4HNcCHsD6JR18CdMR2zlf/uCtDBjnpgRHvKsHCq3yzDfQOr
 Gwydx6C4YI/uZP8HM36D46YukvH/jy1m1tbkiEDA8ntyylgY7eF9p91o4VOSABlOfDW0nR
 1qFuvpuA4+VCRHBP33L3C6mmRtBP7T0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-Itv94LQUM3S_0HXggbtYdg-1; Thu, 10 Jul 2025 13:43:24 -0400
X-MC-Unique: Itv94LQUM3S_0HXggbtYdg-1
X-Mimecast-MFC-AGG-ID: Itv94LQUM3S_0HXggbtYdg_1752169404
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-702b5e87d98so25243536d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169404; x=1752774204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
 b=O/TOQEX/0r7df4I+Rc9poTE2mYtGXadq5FwFtiml4f9H3FYk5Z54O/chCaXJuEgbaj
 4zz0aFQf39mzOx/i5Jl5D0vIE58YIM8d7HcZXENw2t43fv7q9r4PZNcrehuLfvNRwg0K
 GSOd8kAUJ1LFybjUddS903rSXbGazpFh8wl9EhWZD13H2KqFUePseqz+OMrzgi8zn4jQ
 16FUJ/sex287Ssgv1GAg8AwqsmOVKmiZ83DmIChykD4ggvwG1UkSt3NcuAvKMpRrqP5a
 mDY/rgq7fEjaMyNzKGBCV0lNbBOsbiEUBxyLZ/NhCdqWB+2vDBy5cOU43PCrDHmqWXaJ
 i0gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSmKGEzI3PqeetuPiaZ4wi/hSOrC4Yonfq2e1paIrrMhvEnrKRKU7Xba5ge57j1UGnDQraQYcnAxceug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyFR3EV48SFH3R4aSNJA6BGR2Ti0NPexVAYMmSnHU5zFZ+VirV/
 2avzO63qXEt/l2M+kPofC+PnW9bC+86T1ERUNiMRauIWZ+jKkBIJRNFClMsp051WUnlQnqmAHm9
 cAp8uHblWrVMPhoTwhYG0c/CR6GWOzZscWVGP47pHyoyR9t8dct3qgLQ9ioR/49OzL7075f5b1X
 htKJ6+iQ==
X-Gm-Gg: ASbGnctoCVnPyZL3wgCzLV86/7qeGz2klfv+sngKNeID43flxko/2lvZH4TIA4ESQvD
 V2xcR2CA5Mr6pK5IhdQ335Yq6qCxF6tjeS66DWNyGIbL22baOxf4ntR0mMdV/jrduwluX/gh2b/
 wNuGrvnoTKewGQeSHeWNijVHXY0ku/zEN/GQQWGUW7eoxOf5qutillItMTzfwmMdQvIisAbhxrz
 M69LEg/aBuxgSlg8D76p3aHObM/27e1MGPBINGdb2ihRM8S4DQMP+CgOQnRUavf8Tj77ReFBb5m
 MS9GQjwtf2ZrPbhs5/eHAEeZLy+piFS5wDRmITHQjuc5mdOUnH2Gc0cxsiDz
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id
 6a1803df08f44-704a3b03a02mr2644766d6.43.1752169403796; 
 Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibFyJAqH2Tkc8cSfyuj43nonhKwPGrbHTb1n3BZYj/b4JFbj4juY9nmJvfEsNrJfVGljjaQ==
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id
 6a1803df08f44-704a3b03a02mr2644146d6.43.1752169403246; 
 Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:03 -0400
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1675;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
 b=dJ/qA0hGF/+fQfe0crsCUgeeRXp3uEEF5tBBbhlI5F6XFBRbvTidAvVYatP+DdWjLDW+J4Np0
 hf2I1m8Rc9fCuxnysHNHHy4FFC3Lx0PLz51pJGMCy+rQ/pwYO2VWCbI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kENmjfZ-26_YvUgIjLLghYTHbMlqZzCRL0xnAIUgi_4_1752169404
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] drm/mcde/mcde_clk_div: convert from
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
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
