Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B9B007A3
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F6A3C349C2;
	Thu, 10 Jul 2025 15:52:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA0FFC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
 b=ItkMz4UV1KnYOz+yXngBIuH4Uznhyojo6DnNGF+x4GKTuRhytxgIAOsRaFSMhbuFPD+fqN
 2MixTpfLTcejy9Sdku4Fij39bBb7dpOSgtTGKOGs97nniBiE+J+r0Bx5In7iZb4r1FNbyF
 L7mRf1LXML+W/vyGCG06h6M47bWRn90=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-1uDpehc6NQG9go4C44pj9A-1; Thu, 10 Jul 2025 11:52:02 -0400
X-MC-Unique: 1uDpehc6NQG9go4C44pj9A-1
X-Mimecast-MFC-AGG-ID: 1uDpehc6NQG9go4C44pj9A_1752162722
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb520a74c8so21043886d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162721; x=1752767521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
 b=ZwHtCEB1TzsYKvNTzMTpfITBZiv7WtrkhiZwBuJrYyRmqmbdYZfqxxlJwuzKD9KIfX
 EM2jQ/f4cW/EcMWIbL5A+KcfUOKtbuupBocpBs4L4x8xzbF9oROLgi5iAQvWpRncLAe9
 Cze/MpABDxQpndsEzOjKT22e5ZF6zJb/IzEH0FTFGSJLaEZYLGDro1A/h24c4l5u6Zjd
 KQzXMI3ZredZ2pkXg9VLpKiujcFkxhNcnaITtvuK5PFp3S9opXfHqJJuM9k5kgNOZaMk
 xHyvMdB7yGmbLEcVW1DrTA3+mSERyi33u30j7iesIPg6UBCWLeSfpJCPLnDv8uX0rHIE
 cekw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuabQGKDjEzdZBC+YcKoRZRWN+b1R3WAXMTRtSTgOxmkof8CCihrfNinGDs9/++64xsBvyxiRidxwMPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDaAheAfCwUcC3bL3Q8wxuQ4aa2gwdKn0Hf4Lmlb2fYJccvKax
 b4RplrRRflGhGugnWHV4XrkaNApxTfLfJHRhX4gML0Bz6Rq774/zV+OSOtS8eXQfLfJEDmc1f9K
 bwsFc6WgjpCjORsDVG8R9ZTGaqkHlwHjQ/arn0DLnVJVrPt864x8glQ1h2FPr9FTNrTfJ0mJhO/
 FbmPhTRCLhnfdW3w==
X-Gm-Gg: ASbGncsV6L4zFax24c7qkMeZ4kt7iDWv9PSlMQ/824KxjWBxjaEt8RQsR48ymjl2y0N
 2TAFYlekjwY75QntvuihTTau1qVMQL5HFseIXRLIWynOxJa2A6uw1h+PRmmaf5OicAiTE2L9SMg
 VPg6GJ0OUi3LuIRWZy0dMQJns1k8u7vNGbWKc64Jck39GdKL8kRKgK4uyKxN2hLYhzd4vWAQn4K
 cFa1a/xGz5ashDUx5jTDLV9w6FCAJGzzZt2VWhFMHUrr6qrhmSiaG4/7QOgtHRyVjhCy9kUfXfT
 MWhkMC+xhUdmsrGiE9qwh3NcCn1ixLK3cVvXFC7yF2dqq0B2G0fvpUG2QOJv
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id
 6a1803df08f44-70494f70162mr73491516d6.19.1752162719698; 
 Thu, 10 Jul 2025 08:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG03Gb2AMowqF+jhr90PyL5QhMQySpCZDY992sVjt31FhV8SI5QbSkQU4E7TgwJWA3WWhabRg==
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id
 6a1803df08f44-70494f70162mr73489626d6.19.1752162717842; 
 Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:12 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-6-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1764;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vZWFDt1fg2g84/6CbpXmdsOPkf8vAndRakJ7mBAnblA=;
 b=qoEKZTVvf/Mg1qqHNBU8HndCgCmiS0GmOJSvOpA45N85Yb6978lTjjiSZ4dbTnh0LPFhTtH2p
 Pn2SWV3e4UADKJGs88lQVhTDLPfehYeojWCySSStGKSngtnmPzV3I8g
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8s4wp49riiIXE55qI0pktJQlrDJYrx8FLPNlFxmGn4_1752162722
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] sound: soc: stm: stm32_sai_sub: convert
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/stm/stm32_sai_sub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index bf5299ba11c3c95ad89dfb00612ade7ed42b9d0d..463a2b7d023b9cae802f88041c23a9bcc3219a6a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -489,20 +489,22 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	return -EINVAL;
 }
 
-static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int stm32_sai_mclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm32_sai_mclk_data *mclk = to_mclk_data(hw);
 	struct stm32_sai_sub_data *sai = mclk->sai_data;
 	int div;
 
-	div = stm32_sai_get_clk_div(sai, *prate, rate);
+	div = stm32_sai_get_clk_div(sai, req->best_parent_rate, req->rate);
 	if (div <= 0)
 		return -EINVAL;
 
-	mclk->freq = *prate / div;
+	mclk->freq = req->best_parent_rate / div;
 
-	return mclk->freq;
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_sai_mclk_recalc_rate(struct clk_hw *hw,
@@ -558,7 +560,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_sai_mclk_enable,
 	.disable = stm32_sai_mclk_disable,
 	.recalc_rate = stm32_sai_mclk_recalc_rate,
-	.round_rate = stm32_sai_mclk_round_rate,
+	.determine_rate = stm32_sai_mclk_determine_rate,
 	.set_rate = stm32_sai_mclk_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
