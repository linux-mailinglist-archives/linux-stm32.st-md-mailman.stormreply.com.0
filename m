Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2835D063F6
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 22:18:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C644C8F286;
	Thu,  8 Jan 2026 21:18:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE679C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
 b=BsaKeO/fPuxKFrU0HG/h38eFXzTzyue14DhNE9+ivU4OeNx9D+6HHGjqIVLfh6mwIyJdqf
 Yf9d9R6q2+XEKBj5XYYqyCv2+Dh5csbH6rObjQbyteqjo+7UlQVLC9VSASZR+FY4hfqVtw
 M+aYkcshd6MEa5YcCVvLiKX6tGdZ26w=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-DyKkbR6sPvCvo4JSPMdrKA-1; Thu, 08 Jan 2026 16:18:55 -0500
X-MC-Unique: DyKkbR6sPvCvo4JSPMdrKA-1
X-Mimecast-MFC-AGG-ID: DyKkbR6sPvCvo4JSPMdrKA_1767907135
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5ed0b7ed42eso1164024137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jan 2026 13:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907135; x=1768511935;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
 b=ZL9eSgux/TuDVE/4edAOa10ydG6bd7QM1A8eeABGbzhNyVafuqo+lXs39BGWg6E19+
 ZakQ2pQCTjpi/ltzxWVj+u92iRbKy1l1IjiMm2xXoh9utsS4EGEXmInNWCoV3icOAi/S
 WgXXzYjwQLtE+BNBuUjzFmYg/IGASFrhPIshN4yWjadqa7Srz4/BC/28qP1geVAKE3Td
 0g4d11/gWdP4x+VbZ6WZMXgHx4bAPzH/etp0ZX3yGmzzrrkodOYYoyo/oKIusd+0ZKue
 JWz2lxpPgwQ+k6JNdbAzEfkIu687P9fy3VhHsofQR8wLoPjXKVYb8rtrbL937LgT/4tW
 ALPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgbixEwxwHaKuIRNq6kZTaWmtoIq23MAZ5f+cQEnrA3PMds8+Y4YLskI6LDo3XjU4V8OgUe3cxzC/xYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxh4WxPbza2SB0t2XA+/pODPm3o91Ke3Ak3VGYwrQV0+pQKEIqt
 +qFZx8epbKWvGtTAo37sFtEZvJ2Ps/XOITdNpU7WqGtoorRjfWgXP6z4QW0i9AZSXM8339tm5Zx
 1siLba3fNG0t9UYOt+D840bY6MNzlOR3dplF2tkWFpZ7wiyRSVCLLBSrITVwMn01lqb2FRs7Uw+
 cJF8W4VA==
X-Gm-Gg: AY/fxX60GEHApvnRHAjnwFgM+FWgtW9DOph3kNcDGH2rGVxbGHOQw0BBJlOtgRq6bAD
 e42FC2LNH85jm4HeROl2DqEmGZgiE/1rri8saDGWaXeUflhfkJ3Q2S5qmcTUrT0W3BF/iksNK6h
 9TMIaVx6tEsNFnCx/ZA8XHpmcBCfWSr2OOpr1ftQS9aYroaVJ+tXgkR4IuOJnfvUxXmzPH5gp6L
 l0hDnfwgJvmMRJOQ1rjV7EwiaffONUwwbF+XcRPHyK7mvuSJeC6cXVNI0aX+bj3m4I54kyUFP3I
 5dYvH5YQ+NJ5BYijvWb2DwyETEY54SGDwWn2M5pEHVC3NqrDJSSVleK+BjIgwKD5+UMKxEnIjIF
 HmvRS1mrpjgDDEy4=
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id
 ada2fe7eead31-5ecb560294amr3157833137.19.1767907135129; 
 Thu, 08 Jan 2026 13:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+wVo31RtnFWHlhbf1gwVuy01FPzefAIXV8pM4OiwoVNvycs5UB0kClvVq2bdd3YZxuh0SVQ==
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id
 ada2fe7eead31-5ecb560294amr3157824137.19.1767907134612; 
 Thu, 08 Jan 2026 13:18:54 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:18:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:38 -0500
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-20-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1zGr1VEhUSEgUAAiV8B/qL6RDaMkiVVGUfjryyBP0yI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ+rVz4cq5P358Ldj9m7J33rWhF42pTTu5vx/bOq
 vD+uDptd0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATCT/H8Fc20NW1ctEMhvb1
 eUtmWJ9753w9LOauSY9OqHpK5FGLq08Y/jvaJGQWz50Y9HLBob45cZedTKY73G51alpxMHDtvcU
 MsWwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HYsw5Ah-hxHC-9BZK4y72d_P4L_ZwcKs60nBeSy0jrU_1767907135
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 20/27] clk: stm32: stm32-core: convert from
 divider_round_rate_parent() to divider_determine_rate()
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

The divider_round_rate_parent() function is now deprecated, so let's
migrate to divider_determine_rate() instead so that this deprecated API
can be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cd1cb38836c0 ("clk: stm32: stm32-core: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/stm32/clk-stm32-core.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index b95b9c591fda7d900d523f50c8bd449398aba49f..e921c25a929c303a2e189bf876667178a123eae1 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -375,13 +375,8 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 						 divider->flags, val);
 	}
 
-	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					      req->rate,
-					      &req->best_parent_rate,
-					      divider->table,
-					      divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
@@ -438,7 +433,6 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	const struct stm32_div_cfg *divider;
-	long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
 		return 0;
@@ -457,14 +451,8 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 						 val);
 	}
 
-	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 req->rate, &req->best_parent_rate,
-					 divider->table, divider->width, divider->flags);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static u8 clk_stm32_composite_get_parent(struct clk_hw *hw)

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
