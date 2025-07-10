Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C23B00A2A
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 19:43:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD5EC349C3;
	Thu, 10 Jul 2025 17:43:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23715C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
 b=gIxkbYzhzJu9VXAhX0wu0qWinqNz/xR4w9iiOZTxiv+FyLatwWf3B6i73Rwg9HJFIsU6Fq
 XgljN4s7m+HJu5Kow/8aEnc2/vbjHtl+19UvZLc8tQCiPaobidwJYcfwVNuNY9M1W1CTq7
 NWrJnlIh52wp7Z0cEjnEhOI8kby0kq0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-I6XJ0qEGPPmW8KLYPOfm3Q-1; Thu, 10 Jul 2025 13:43:37 -0400
X-MC-Unique: I6XJ0qEGPPmW8KLYPOfm3Q-1
X-Mimecast-MFC-AGG-ID: I6XJ0qEGPPmW8KLYPOfm3Q_1752169417
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fd5e0bc378so24193906d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 10:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169416; x=1752774216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
 b=xGOQ3l7Nb3z9I9p+vq3V2VdAHSbDj2axP0mdFWCH1d6BIb4Ctf1Gx52EYqpnT11kTW
 nUGgPxIJ2BTDRr5sKsoqDEItwRVWHm4ij1rKtfMBqfjTmJ8Pk5G3csnnU9+3AAsYuyBw
 17bxD6fuysnL2y7wjQ/bo7w9hpKk7sGVorLJsygv/uKFncohEf4enQsNsjSXPqrIstUB
 UDwSknCYbF4rXkltWSUlozFnBBgvC4KYvP0z/1RLVGSqPmjhhuI6H5bVjae2BzphxpE1
 33m0vIUGDf1TaplsSwzbpHAMw4MJOXjM5tYq1YKS+RTG5OPJIi4fDETrq5Ciqq7BsVvi
 hWvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/QNiQqEG4l/ari/IgM0aFraxH4vAF/04FOQx+pExoFkyp1V50jCEnoCSwG7afVQx/H/8hgh5uCEndlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2BSpRfXRrtnE95IR1/aFE6PatR8Wtyy48AvB2b4o5yJFnGJyP
 9rclgpscADlSSZOc7G/SriuB6DdU9FY82Ar+eeFmMScPMRX/Y8T1DUMmSRkybouU4VBlFKkF62L
 UU/72yjsVABzD3kWEC7O4AH2s0EGMP0w+yGfCZsiv0hQ2jUahjnG/7gfQvuh/eQVzTsuUKmUcL8
 zbaqarMQ==
X-Gm-Gg: ASbGncs0YWuAmwMmqjrC1pMdbgHrBje/2Z4M9FnbonrMhMB1sprLs8ZPFpGub+Hh948
 cnDdc0vUeM2vFE0RDcwzKde5qAi3dFUERxnJD/IhcwW8dfy6QlXQKW5wwIqnBkVOMzQIaASV96f
 UFWtkshSu70+J6S2hwqtI7PZvUaIMapOaQ5RgM8UceKofRSri9voAF17eZ+SzK8VD0gmrMi0B5d
 YfFDJTg1Uz2Gy1SdyeZ4aZcN3pmpVCBNadAoYKq5V8pEaWW02P89XhKUIQqdA0b5X+8F8noY1fd
 6Odt1ksC/fnlHuw7usihlvxSbmCmEyNFfwKUsJrp1dd66MrdaqG8JUZ8kz4C
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id
 6a1803df08f44-704a3885c2emr3440186d6.24.1752169416337; 
 Thu, 10 Jul 2025 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS2Rzm0JfKmIyrTldYCoa+GfaWxjePB16xygyyHje51M4cEE7holVyPZ8C5FzqtnGtvcUbQ==
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id
 6a1803df08f44-704a3885c2emr3439666d6.24.1752169415753; 
 Thu, 10 Jul 2025 10:43:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:07 -0400
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2405;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zHcO3z3+e99osmKzMokPyvWC6/DSceppfY/05RlRXYo=;
 b=QXQyVz/ESQN/1lpuOY+kiAZj2ii+/13EpYKJAuvi9VgjSVMZZp3cWkyo089YF/6/d4LrccG+3
 IcOoOTC43L3AvbwBhN/wVyDOB1m1IcbEamuqRU2PQsvtkEzD5/kz2nO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCPG1fG8NZD_k8gfvZQj6hojico1vaZo6ClM4f8j4Uo_1752169417
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from
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
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
