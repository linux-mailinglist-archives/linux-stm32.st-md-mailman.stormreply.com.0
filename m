Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EE3B20690
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 12:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB5B6C32E8F;
	Mon, 11 Aug 2025 10:56:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74AF0C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
 b=cs3w6PCZ19/9CqK+yc/iS2DaNJWzdf/xSvNUl74zHSeSKA4Z07tepTYQi6czbJ/8hBX611
 A78sgW3eccQ6XO7CrHzWesaQK4638Sr4/72uTtNWyGvDBEU3VQ6nQwT+YMfkWD+Iu6l9ZU
 TpxAOu3JyYDnsagHHTq9y4x1yv2sWXU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-FZRhogcfMymkXUvVh73fVw-1; Mon, 11 Aug 2025 06:56:42 -0400
X-MC-Unique: FZRhogcfMymkXUvVh73fVw-1
X-Mimecast-MFC-AGG-ID: FZRhogcfMymkXUvVh73fVw_1754909802
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e82b4ed799so705390885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909802; x=1755514602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
 b=lh+QzskJPew0jYY1n0bW2gJ65FurJ1GAGARCKR6GkFeGjbp3ZRDSyHfeHOF2/eoMEn
 hESkacd/XHScrKpwi/vjTFIrdrrEa8bDO78kUgoea58sVOCrEbl47cJ5ZzxNhm4WHfDb
 w9XTlJOigv+giLV59uhv2fqJGrYDk4dYBS7RIQlpP+Xq6Quffm2VQcJ5YVMJuTmMjT29
 mUs4balsBZJJu4bMY9fonjPVs3ephFnu+F3B24ZvQVor7up/ON8X8PHgsKOThZi1TgFs
 tcNxpo+cKExWVGB8ptfLqOq1T+3xF9Qvrgr4oqPOta4opMbs28yJbEr0TJTPoZAZ2cHn
 3y4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKdyT4c84RP/GHyQxRRnWqF3affVUu2enirgLK4K19VCFreINHseb5CbXnHm6Tbij2XbsYImXXHlsQMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhZVzV5VNtL1GqVVSIwLhrLj0DOqYihP7K1WmsHtUMRJLeXW0l
 wqZf9uMlUqmj/MJndVAJPM+0+y8HUWzeRJ1WttODyOexPhJEHZ0ZbZdyq2fiMM3sU5HnG1SXEFm
 EHuIPemv8Bq2h/GFkvCyaVkhIv3cjS6wiANlXD2ae7jjp8Xb28q88/syqk1sz+bDWl3WoYKW8R2
 F1HvabZA==
X-Gm-Gg: ASbGncvPP0/nSdnEcOH3QXFWpUeZykmVOUKA+GiXnTeoCRrIDMuBpb9rno4p2CsqKPs
 vHLwPa2T/UJ4qIu5MwV7byxNPDvv+RlOTimlWNoi5Fy40m0ZRBpYyfKYbfpQpBlI1WJAqGe3K2N
 pso1ngq6fNfbHCUeDgO6W0CzTeixReYr0/6KW4rnk6RESScxzaPwkev3yvjgUNApKDgUuQdYz7p
 SxO/tKv1KUGg5rMyrUKVkBOcvKEVff/zM5PJuCnBPjeWOi9I213444k95f/cRkp1fMTGvTql3kq
 ggkfIXWNl2eHCM4dnGCrmmlmU2lYn/jRpGwbIcX6iTkJpMDW4mDcXp+cV5GYvVGhPg+QyNF+b3o
 dsdU=
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id
 af79cd13be357-7e82c6834edmr1680336285a.25.1754909802048; 
 Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4J1YPALYk3sfXKt4CIgszP9xA12/nZjPecmiJUzpdOL3Mq3At3CKB2rvFttPLfHNTO7lJg==
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id
 af79cd13be357-7e82c6834edmr1680329285a.25.1754909801517; 
 Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:09 -0400
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-5-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1718;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
 b=NJqHQ2ssaD4y0rqVbCbujpIrqzdN3VuMWj9ghDV3lWlNDbiI/oggFqGjuVCZHps19PnD896Q0
 9FdZ8qhj9mUBZ/GerZTn1O4AjtYG03lLvn79VW/TKhLY3AumrqAiB+P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IjgoYnrVEqpAoZpMMUi3j5Q_39IIcMqBcI7nFJ9lMZw_1754909802
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/9] drm/pl111: convert from round_rate()
 to determine_rate()
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
