Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93120D063ED
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 22:18:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E1D7C8F286;
	Thu,  8 Jan 2026 21:18:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E11C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
 b=GdghG0vA29eBSTmbLZqAG+tuhKc+aHR2Wko3I440SuzeFSzOajaGrdsKlg5SrV6/k0+ahf
 RIYtVQL+dqnDcfqM5GrP6yKs9CINzlV8e7QkT4fPstvoQln6ZzQ2YC4HGdSP5XiA4uz9Z6
 m6NjxlEHdVWiE2QGXgy+D6sN179nQbY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-xGo-u7tAMg6Q5hs51AZAvQ-1; Thu, 08 Jan 2026 16:18:49 -0500
X-MC-Unique: xGo-u7tAMg6Q5hs51AZAvQ-1
X-Mimecast-MFC-AGG-ID: xGo-u7tAMg6Q5hs51AZAvQ_1767907129
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-93f57cdeb11so3869371241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jan 2026 13:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907129; x=1768511929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
 b=UzXSt/08Wy3Npq1SpiZy/ss/rfo8xTbLRbSfgqLaBroQYKGHrKwEURli7d+xD6Lspg
 ooVhBef4K0jHkJo06ayMUvyVXl7c3x4EfVvj/iI7MQFxyTlMyadUOKMy44SiYZZsAYWq
 jHVHcH+ykjSWvrWddte9VBe7o2wmklHRrXBI0yzogAu5NoRU5f8nv1qb+990QDGPiQYB
 2qsKl5QfTvr4qu3UO0ldzZ87KIX0rM7Ql3yUD681tGQQtjnLCfcYx525g8VJVgL55yC3
 H8PKCKiZaMCCZbjhmJDDC/kNOLRirk/m90pYAyalQQAFGwsSEyY27DkxGLtoHXPPZqo5
 dbjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqDq47JIT5rI/8bmnZdX8BP1lVgKnOcUO/PabfLH6SPNz6W0fw9H8B1OdOt9tsLY2D4Lt7bVl+LcwOlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBxjCxjRn5vItWPHVOsWMFXShwNkJ3af12O49a49VJhOqCFShc
 3WOsZwoks8bdEEUOp9wnTEgcRJWTfpMMhx3kerzKFYY/I67UoovIWY2ekFv9S3k/qclTfJhXYDK
 nqYHkTeuHvQsQZQie2nm0UJdkDjLTMAgBbeAr3ymDBffyPNHj6hXNG+X5id5zW5j9mbb0Pqhhug
 Qq9xKVug==
X-Gm-Gg: AY/fxX4lvdD2Zj7yjmfGcTuNno3iPFqzmxLp9QfZ4lC43VPgh9kMAwiUFVpRpYG9ial
 ESMKmBpGPIjZKGVHide1cnz5B83q3YT8ZmzY81w85syaeSbExFeSIEHb1TePHaZQ07d1s1zoBvl
 Q1UArmLoITw4YIORgylIEDXTKlA+e6QYb7TDg5/t6jWQPIPGmDqe0Kx7EoMOrBw2+i6HoHxskyG
 v55afyGVApMfwJcKS4UUIi9zPzwqPBLtevQ2cMzGZBmVfHiqiH/Vl0XvjedewrRYfga0Hmd4vU5
 s9VX2d1LB3OlVaSB7Qr5VglI7K5m7iXnsafdC0v4jjfdHc5XLMkFVF5Aht21FydKhaPOz4FCsC5
 Dcf67cBrz147TuZ4=
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id
 ada2fe7eead31-5ed0f265843mr1992110137.18.1767907128955; 
 Thu, 08 Jan 2026 13:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLX2O0KlmxzrMSo3tby5b/YZN082iMeszi4qbktrWtgNvTKagIIyv7NxGpAo9E2TfU0DUiFg==
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id
 ada2fe7eead31-5ed0f265843mr1992095137.18.1767907128511; 
 Thu, 08 Jan 2026 13:18:48 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:18:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:37 -0500
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-19-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=HZjZ3HcnfJ6Gv1Fz5dnPy/7RL1U8mVqJINJWM79xQHk=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGlgHrmgM6LOwEM19Z0uuBjchVDfhpfoJgJDmN/xDONnYVJb0
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmlgHrkACgkQt9LdJ11+wIfnBwD/WXtd
 f9bkMoE+hr+2zc6UAhat71CaYeY1QhFMrePNhoUBAOsjGZioUPoLJfrsd/8VSuM/9DruUEUcARU
 bPxSu5FkJ
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MYnLi1Eg4ify3O-RriiUwqVF2fqfuClHbYWGT_pgh5s_1767907129
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 19/27] clk: stm32: stm32-core: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
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

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

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
 drivers/clk/stm32/clk-stm32-core.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 72825b9c36a4d3b8ba3f7615b9026c09ffaf88d1..b95b9c591fda7d900d523f50c8bd449398aba49f 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -369,13 +369,10 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 		val =  readl(div->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  divider->table,
-						  divider->width,
-						  divider->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req,
+						 divider->table,
+						 divider->width,
+						 divider->flags, val);
 	}
 
 	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
@@ -455,14 +452,9 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 		val =  readl(composite->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
-					     divider->table, divider->width, divider->flags,
-					     val);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
-		return 0;
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width, divider->flags,
+						 val);
 	}
 
 	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
