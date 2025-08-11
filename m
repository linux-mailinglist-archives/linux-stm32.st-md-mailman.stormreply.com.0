Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06266B2067B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 12:56:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B095C32E92;
	Mon, 11 Aug 2025 10:56:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB7CC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
 b=UbuQMlYmTwYPV2/asD2FSXjSz1l0hyZlxDj2qQ+MZN9i9uXIzuH4cwD8p1WTaZXQrD1cbW
 p6l5aa/d4m/oPGXE7eiMB3K/o6jlzQrVNLBTOFQ/PHg8zHzRDloN0Qc8GvVAFEfPNY16Jq
 kKu4/c4JlIqdnfTzIuLnYz2yLMghqkY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-eEFO7RD3PgKh43J5aXbiKw-1; Mon, 11 Aug 2025 06:56:36 -0400
X-MC-Unique: eEFO7RD3PgKh43J5aXbiKw-1
X-Mimecast-MFC-AGG-ID: eEFO7RD3PgKh43J5aXbiKw_1754909796
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e69b0ec62cso874180785a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 03:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909796; x=1755514596;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
 b=CONv3fDm70Ov0poVxnZfioiF2gIH3MYqgUoZMKrxVeTFI4lo0f/GX9izF1e+du/npV
 ibgYOnjlFITUZh8ZjPqtcysnHVl6KwyTJ6jNhcdYbxj3mkpgXsXTOhtCsBptnMocnoim
 XOWTvZoDSXqXgj87RqvIY8wJqJoSjFXoEBxzacf4/gyIjun5Ko0BlVLCQN7pJxP+VZSs
 EjmK8mnchwZhlHyoebJnE5haTpnirzva606DBMJ+fe5cEBasn8inPZpaC9XYfGvYt2zs
 U0HyuPSAnjgXAWV44UNLxK6ESgWNFNTNtNp3GbAbXkgBUPu8LaFpGJx+eyTUZ6l5j5zf
 bY9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV4wIOBs4tDNHyKZ1ncQbN17HHSYEtSv+j8qrscGTc0nL9fJ4kas2kU5FWOm6UoH+BVsrPeG/FQ3+vkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNsdoH66ptFRomavpoO44B9Ispu/3Nqmo3lFC9o3RowGAE/zh0
 Ld8tg/VIHreVfYmhRZ85NHfrY7Mg/FwptvvUR18039yeCERrXXWp74pWhgyNQpuXWAFEAhwz+Wy
 efRl+cqsQmJJCAVRR97nZrACTDF/cS8O0XMqNUm91Fpl4FRVggnBQal1cYYWT7JHH8ZP9Q9ov31
 1Yf83A9Q==
X-Gm-Gg: ASbGncttWdnfrz0a29dNNMsJKHGYmc527kqfiotC1aIi1HGSV3seKesOkQqH+wedCU2
 1X6n5mL8/Q2MrPWNZAASSocbzRCszJDYVumLU8r1DAmYt9wZtskjSjUPWhdQ+LmTei7JjlHEQ6a
 Ml2QBmfHmPpBvsHcP4faMAScZH7/H58mCANPIo87W47n8vMdRfR9NZtpAHxsoQO2rKDKW1bOK1z
 yjDggZDeZ/usraPEMl+/ZZsQwg/4O1yd8MklQMjDkdfiI33nKqBR61WSe1IbVPVYQVLC1So87x3
 jXgrbPknZFgwMEt2tQ2oxD8z1S2f2mmSKJCO8/V1pEislUdUcgMJ9yu4JE0A4IW3OOMXVtmO2FL
 JakQ=
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id
 af79cd13be357-7e82c64cc0dmr1348328485a.3.1754909795591; 
 Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9n70Dnsh0oekI6lYBsj+g6fiHD2aJUNrf5ZRMtmoVkJvAZxcIb6V9PGnNEHDigLw+MQojEQ==
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id
 af79cd13be357-7e82c64cc0dmr1348326285a.3.1754909795068; 
 Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:07 -0400
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-3-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1737;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QhsR7m95oQQJWiR4k5sEM+znPy8RVqMfVFdEDgPgP5I=;
 b=Yf+/AEJVSVpYyfmQu4W8WyuhOAot3PpTJ66fonHG6NgwPWqhvr62JRFBH9lf6jrYZTbKGBwD4
 RLchj5Jj8AWD0/ZZRq0fRTK+W2ARhNi43oK0yq2QvGqqPc6Fg70Vyhk
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k_uqc2DPYQKEz9oPdtx9wOplakL3De8Hs0IidZH6VJQ_1754909796
X-Mimecast-Originator: redhat.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll:
 convert from round_rate() to determine_rate()
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
