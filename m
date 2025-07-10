Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67233B0079D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:51:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2896DC349C3;
	Thu, 10 Jul 2025 15:51:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3971FC349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
 b=R4ZO+QKJRrLCOQ20jLJ55RZKOUS+0Me8l+wvda5NTB8YkPchpChsVdEwuiSDs7CCVwEuEO
 UXD2MFRiU9XfWr0Aq6cqnuYNpXegQVZLkbEhkdz7cqK2k4jrMiJZFltg+qj+U7ksM/jWje
 /cVPz0pD47LiAUdcG/yXf98vRE2JxMU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-OK0aTqgmMl2iRUj0M-KblQ-1; Thu, 10 Jul 2025 11:51:48 -0400
X-MC-Unique: OK0aTqgmMl2iRUj0M-KblQ-1
X-Mimecast-MFC-AGG-ID: OK0aTqgmMl2iRUj0M-KblQ_1752162708
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb50d92061so16871406d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162708; x=1752767508;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
 b=ubteh/WHqCnF1caDHwVPFor4rQcXkuXRiJugN6r8BnUFsjbUfHTwuT7qnc8A3C8gGj
 Gyo1dwxNr+S7BWZNRJ6uDjD+SK1sMsWGnVQr3lmQQQD1CWm1Xcq8iJpi+HmA5mxLJClF
 jcanD64PjD5qnopRQhZ8DHCstIJxjvbbeoPJcB52TBjm0BDtaOmT/NQ+6gPdZpkI3srE
 Q7Xme+cB0sdeK7lVIZxprO/QaHQsgZga2h2lwSPr/K6OmbS44huEFyQM0jBoTC/4Ah4y
 ce5w/FhG5oSi06zTipIKoYpLYMy4/9wugejWQ65lYP066eoumf6BTcEWaX4T+zoG0zci
 bKjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSwxCTo4IISaiMF2Gi6BcgTJ7ilCDnUFy9IrJYbEl4OOwtpdoO2mh0M/4sy1raoLiFfeNoznY+510/eQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJZXvcst54Or/p6uXCB8RwhlBd7hKh+xASk3Ssr8aV371JYIdm
 kgCrG/zUdyXPwUU8qWbe233K3LEBfN242C6YegUJoUgmPvCWezVr3gOIvHHh6PLSmTIGEwzZyQe
 6TcsZGSaANm8iqG8H2p+6cHrPm6Tw0ynUHp1cAMWwsRUFOo5AHXQ3v05Lct/9KVHvbD4/p+7TPz
 nIMPzLEA==
X-Gm-Gg: ASbGncvOpdxYs9HEFCO0IsW51s98P1l1Fc0eKx10Juxnj1Lb77aX4UsWFUnBcwCQEX+
 Tqw3leajrPYgP7QGvAekm2wG4gnampaaJlqgS5BLmT9Arcpc0jdxbRVj0ACqwCW8WXv7XTQl7Ko
 Zn7gAgV4d9ZIWqdBrp3BCxNEA9+kBAqEfOGILGXhyhnwdobOryWnJx59KB6XDYvrCCiw93BwHOT
 1QjY86inoDCP+1PhniBPBw2agLqwr9FnsbO0a4ShVoPWJsutIWDlbU2KWbpvC/UxUcA+IaCrM8g
 qLJLfGHs0nMhoTIj6dEWHj7FBpQrL/oPU2thBeQHS1fMD+GpdvakXksDRhQd
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id
 6a1803df08f44-70494ee3ed9mr73517766d6.3.1752162707894; 
 Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiBnQKyOU9ItMPJPrgQVPScQNEJSbolGEYy2qaZnVPuAr8zwJYLa8LtkWFTwl7pjIeSY0WKw==
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id
 6a1803df08f44-70494ee3ed9mr73517366d6.3.1752162707432; 
 Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:08 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-2-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
 b=aqGq6Wwv3mN+qouYIGF3pJ+rhEvmpUrlcSVA+xDWGeOk1pwtlMf/NqlX0M/HemN2IEuG5nCBi
 JURzf2JUU/1A51p4xURtCdQ1xTp4/K/hH/dOMIbhw6NBEwmj4I/5xek
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e18amEqGGmb3e-8TCg0wt6ouys4yW3AK1LjUgmgJCqw_1752162708
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] sound: soc: codecs: rt5682: convert from
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
 sound/soc/codecs/rt5682.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7c88370e2dee6a4c2332f1e3db885c980f5e8079..a0abd2ce0c1e1f6cf59fecdd426db16136befe66 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2675,8 +2675,8 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682->lrck[RT5682_AIF1];
 }
 
-static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
@@ -2689,13 +2689,13 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2795,15 +2795,15 @@ static unsigned long rt5682_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682_clk_check(rt5682))
+	if (!req->best_parent_rate || !rt5682_clk_check(rt5682))
 		return -EINVAL;
 
 	/*
@@ -2813,9 +2813,11 @@ static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2849,12 +2851,12 @@ static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
 		.prepare = rt5682_wclk_prepare,
 		.unprepare = rt5682_wclk_unprepare,
 		.recalc_rate = rt5682_wclk_recalc_rate,
-		.round_rate = rt5682_wclk_round_rate,
+		.determine_rate = rt5682_wclk_determine_rate,
 		.set_rate = rt5682_wclk_set_rate,
 	},
 	[RT5682_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682_bclk_recalc_rate,
-		.round_rate = rt5682_bclk_round_rate,
+		.determine_rate = rt5682_bclk_determine_rate,
 		.set_rate = rt5682_bclk_set_rate,
 	},
 };

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
