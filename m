Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305AB0079E
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:51:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34973C349C3;
	Thu, 10 Jul 2025 15:51:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2BDCC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
 b=UH0FGp+LbCeEiwQDqhbHJkLEjxrR5FPsa1R/o3PtiPDf18pYT/HYQ/R7XyggMnzfrNajyX
 cPSnf60aLSQePenKrY3Ex6crtVPGoTrc2Z0AZZJD0OTJ0TAZVsk2njiCbkynqwtnmi8Wir
 b7qD5aZsotZDtBSE/FxnY56vj9R6Rgs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-jDOm0fKYP1-50hMXNqlMKg-1; Thu, 10 Jul 2025 11:51:51 -0400
X-MC-Unique: jDOm0fKYP1-50hMXNqlMKg-1
X-Mimecast-MFC-AGG-ID: jDOm0fKYP1-50hMXNqlMKg_1752162710
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ff81086f57so13365216d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162710; x=1752767510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
 b=K/amZVe90nubnzAyWk92fnqJpn2CsgVIWkTVBrDPPt7EKAdtAs3jzi5W2VSPXxVc6z
 9Mt6/oXbQnGgmUNBvXmVtWjr0Hj1aU8gqOaFAzV9IPhg+5X3v1PEuDqJuUDejDEAWr7y
 pCQM4DK7lR0AgpsodwCqkiH6WD+JsxZzgmPkfhymK6HBE5HXP0VK39Iznoi4Jc8dpb2f
 JVH5NW+BIYQF+7D7lyCUeo0FrirYsqw1egumCrElb7weEuF+NWLcEvfctrG5dK6jhJ+N
 CQz6XOY0wudNe9aZf52pOlKPg8ta8OmMelIAzerEw5YKKwGQXkIMWJWd1eCOLB3CKkdK
 8HKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQr+IRWctt6sdnpY0OMh+7hnk2JOmVVgnMt0Ygd/IpqFAFByYt99CPsXc9XekIsSAqnUyREkAuyLBacA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLlcFH90V9T84i6+Qtg+oQIwV8B+/TqbkveuDol//DcO8Vc/VS
 44CPhMnW9/vLsw6o2wIq9LAv6yqccb6sqVnMpLUMj4cx7FY1/XtjUfgWscFAFjOVKSWJ1ZE2Kgt
 UNOD1Vw05xJ3B6QuEAXdCM4GwZMf1HQs7/Ceqn4DDYEJ6BQWLW3PZEZ8w3zM14vF95R2RketGYE
 WCWvBANw==
X-Gm-Gg: ASbGncsV51Whdk2D7n0JixLVBk23BuOGMcWsffSv9o8KZ4aVgH7zhweBDEnddO6//cm
 BA0FSFeql449nHl9qaTRYNP88WHs13RU3Zh+sMoBTnsQNDeWRV9V4cVWBnoLX9yrItcEvc2GAMQ
 vyDnrv8Z/Ilg3KR+nvWcxCtojzWW+s+6lPEivvV4D8X5WJYmdcvsBHo9hTivl2AQgLWIv5aHsbK
 pSYEidjlDBERGeWfth4nJUkbkbdm8StQ6CsIrzblmhhvePABZY2U4wiszXm4gCy5nEiLFm+0mEv
 dxO9v+WCmxpx9YJZT44eBbIId3+3OM2dr14FSuH3w4lz40PnXXGG2PblY/iC
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id
 6a1803df08f44-7049801cd10mr39722556d6.12.1752162710213; 
 Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Z7rRnZbhf+h4qqa+7uxIY+dr40XTC3XMOAdTeO370BxlyEUPUGIFiPj6+jcE4rOLalJzHw==
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id
 6a1803df08f44-7049801cd10mr39722176d6.12.1752162709775; 
 Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:09 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-3-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3348;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
 b=vD7l+nzKA8agktbW8Jzsxd4HfmX/ug18UCk1oQGlijIkHUQB6mZ1qnPnNhOQanXgK2uw/TZG1
 MAryM+LpwAXCVClNThsU6ftx2kQA9I5QEh/lGCP0TGcm3ECu8RsmgOH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PXagiqpO4uVbjm-1kEXMtUm4-ujZjfAqGYPKCMi5gVY_1752162710
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] sound: soc: codecs: rt5682s: convert from
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
 sound/soc/codecs/rt5682s.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 73c4b3c31f8c45703d965e6fd1b70aa1817e2926..80b921695e7d1c0506766bd47421c07e5fa7a6d3 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2610,8 +2610,8 @@ static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682s->lrck[RT5682S_AIF1];
 }
 
-static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_wclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
@@ -2624,13 +2624,13 @@ static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682s_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2719,14 +2719,14 @@ static unsigned long rt5682s_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_bclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682s_clk_check(rt5682s))
+	if (!req->best_parent_rate || !rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
 	/*
@@ -2736,9 +2736,11 @@ static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682s_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682s_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682s_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2769,12 +2771,12 @@ static const struct clk_ops rt5682s_dai_clk_ops[RT5682S_DAI_NUM_CLKS] = {
 		.prepare = rt5682s_wclk_prepare,
 		.unprepare = rt5682s_wclk_unprepare,
 		.recalc_rate = rt5682s_wclk_recalc_rate,
-		.round_rate = rt5682s_wclk_round_rate,
+		.determine_rate = rt5682s_wclk_determine_rate,
 		.set_rate = rt5682s_wclk_set_rate,
 	},
 	[RT5682S_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682s_bclk_recalc_rate,
-		.round_rate = rt5682s_bclk_round_rate,
+		.determine_rate = rt5682s_bclk_determine_rate,
 		.set_rate = rt5682s_bclk_set_rate,
 	},
 };

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
