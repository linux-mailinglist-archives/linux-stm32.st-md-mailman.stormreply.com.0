Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E91DBB20677
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 12:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B382C32E8F;
	Mon, 11 Aug 2025 10:56:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30C52C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=Vlbpd4d1GWLigeSUtZRUv6DKjNBdXibb4g9JbYbVitRrPiFoji9hYKRStDLadmK5tBebGE
 O8pfANZy2JB4mvj9zgRNWtcrWGCIF4PAp5CDs9jbUW2m0xzVyPlEO/n0D/CWyW+5FVEsWZ
 +c3yXwS/mQYrfBi/vxjzhSLMtzshwp4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-yArmuiscMQ-qjDoF5DjiMg-1; Mon, 11 Aug 2025 06:56:33 -0400
X-MC-Unique: yArmuiscMQ-qjDoF5DjiMg-1
X-Mimecast-MFC-AGG-ID: yArmuiscMQ-qjDoF5DjiMg_1754909792
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e8100bef92so967909185a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909792; x=1755514592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=AFiwvBlRfgkB7eSJf4rz2DBe74qKB+hJJINrn3TFCGT2/QfJEnHrPFiLj7ts5kzCm7
 obwXv7HEPEmcmzPQVLqpvjtexpbAOQtKPR1yfvid7eOtD0jOHu7fULrLjKSZvrYnXlc4
 8ekZOy42rjh1nXGygW5jAfj9kbTdfSiVWrYQZ0t+7NdhVZw1jyIN0r7GGo2fEej5PTzz
 63KWgU1WDBysEJgvJoV4nll8Hlvd3jCGzvUH/+9KUOprGFF4AhaVRFl3wwlRzMvWPagR
 p6TTSmQqwVqjFcYXssWURpD7DuuAVFTtPLnKVPO9n3W1z9XG6s7TWQLnvEJrJjEKsS/e
 J6kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9XHo0SCfERcAfavD25fjUGEp/DEvMsFQF5WQGkrBZh0rIJxzecHsNyglMXyi70jZDw9FwHOz2QhoKYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDmSSsSfUab6ychgLZRpOajkX8LzcJx02KibGOqQauNUgVYDCK
 2JGyWpZ9IODCeHRwKgsaLrjzFJ369xPNN1SdMkpx9OWsiwvU/YJwBerP27e50QXSa3x0iy9NS+c
 ZrBQ6HxoFFXGB3wuM+HAMcMsvJfGSTdLn7wjxyJge31vWgbl2/cGhi1rbEoKtsrNMs5D4ezYAe4
 EmnCsZhg==
X-Gm-Gg: ASbGncuXV2Q7BzU8jJlHudPm3w3GxO7c7EVEr6Pj9hSEBvBHNjafNNMzsyWDyK8Q3R9
 w9GaUZMyjiGxlal34FInmbXeQfS90VJcjLYsI9rcTKSAIOfcgv9DP/tKC7d3Mi/F9T1TMUGAioI
 YFt2+0TnOakvAWsb0kTzIi7u2j6tSBzRtte1mt7O+3Tb9lsoFFhrd0w4+5K0em2Acetaj414GWe
 cS/+N0xR16GvxRXXjD8bv0bO8uunhg9QgINomuv5GCva82GuBoGjlPyvg/VLicpKnYxUW+nInK2
 u4mVJjo1rFRHkSfrG2t4KZMcE6XwcCIeRcvbCKh31GWcEQ9rfWTXh2yCTH+INFMI4dbtlbXrTNQ
 aBk8=
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843253685a.16.1754909792415; 
 Mon, 11 Aug 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgW8gZJYQbVSn9A8dMelBcES9raZpoqJep5i7D+EdYN7YXUJOpmuR1qZ1AM51jM57roxoq8Q==
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843249285a.16.1754909791988; 
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:06 -0400
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-2-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1730;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9BXAN9WaQXGACsWVgeakYqAdywyzgmh/IMziqVvQDEg=;
 b=ylupjg1fmCNBXXxO3X3BdCWItZxz3hbcUzYzU1GUNiNNWUiYrAb17RJCYD00k/EMPQMfWhWKC
 RXc0CDE9VnwCgzocNA8sHN+o4QXxCM6UpLGynPKDC6JbO0dbhiFFntj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bG1Pmm2gROjnVitALJFJOlV4pKMi6fES0kpQBDEq_4w_1754909792
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/9] drm/mcde/mcde_clk_div: convert from
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
