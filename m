Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C687B007A1
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:52:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50B19C349C2;
	Thu, 10 Jul 2025 15:52:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A6D8C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
 b=KyHjHqHjjxi9eXT4dyrK4LLYS9CAF4H9wLEpLOWwRiR4uorNYJqVmyuiK+5LHLLXUnnCBp
 Kv3GqD0iqAS69ELL1NeLTuV8CgNAy7Zxc19pWz81j8vZ31J9nTAGBkXZjhiBzObRlJGziR
 0wHJKufKpPK/P0LCqW17D9TykLuD+9w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-6lIg1ACOO0KeaiV31DTkGA-1; Thu, 10 Jul 2025 11:51:56 -0400
X-MC-Unique: 6lIg1ACOO0KeaiV31DTkGA-1
X-Mimecast-MFC-AGG-ID: 6lIg1ACOO0KeaiV31DTkGA_1752162716
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-704817522b9so16605126d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162716; x=1752767516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
 b=GzV0hSFv/7ZV5uEMVQo7HG3dtzgNlVUxYNcH6hCGRHexHLfUJ37VVsGOJGumgD1b1m
 3ZJ5zBcP6w/ijy0bTk5Vuxum26Gsu+B38gcKHJu03XtOV5RZrm12QDBiY87W3/7LWVAr
 u6sbWQ8nWwyFpcLEG6qN3emVXlVh+28jbOoia6G1i0ETmeappbzlWpOO2pYMBRa95nij
 1YEsEEIkxUZO5ppPWJZGV+mz9Qw7rNJjodGb17QiYF+BX0uwMLey81exO/s116p5RQAc
 ZF9/om28oJwSK/uVJLGomYLzKTPaOg+YvNDWQ4M6/e5vigpg6OCnbKZhTpA02SMVaD9d
 6mxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVowseZiAZdgjPhgUgk/Y5NahcHFT3XgSkMN19D0o+Pwhfwr8HiL3ofMccNC0U1qWn6UdGRwAk5fQ6wHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysfJQyHz6fYfB8kbNIpLTY3g6Rj38rukmjb4+0PlgNBowkuzaR
 nCfG6gKjKUjljd6B1jpIPIRL/rblMfd0T2SdnnFYKdsFenxwxOx7Vu4yKeFjy/wF/2BpzKilJND
 ssul6n34SIXcw/bSLH9gU/NV3K+VUClUIBih0g15anprpm7631rermiABGVw79vgWSkCdA4ZT90
 MxyU8QDg==
X-Gm-Gg: ASbGncvLxOFjLCEi4tXTR9uiqy+FFIurCakNnFLTHVCoqUe6U3l0sl6ZjkfY1IHbvH+
 9oQcVhBc2+rI8PWLxc4v8inVrTDKiPmA3tUDijjdz/VOxyWHxSYefpQv8p/nhivkrlztsfIFiN7
 dP7uIJfeamgitud9WYd63wGm4TKB6H7aNDzDgnuD1DinRvZ1e07a/QQ1Yz6qfCPVUac4wQkooat
 yRSh1ORX0eMpUL6Wfd1R9L+FLFy99smW8Hkryo1ZjRaSoAFRld3A/x87UgyYZCLeFfcYUhQnWJY
 kFf03JuoGUqCM0ERstCdR/UWnRksL/7JTwDWzn+foE4rp92tw8YXvjMhXTTT
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id
 6a1803df08f44-7049588f0d2mr46864666d6.16.1752162715907; 
 Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhATSlh+JJuRzkMWsk8YJM8HUQ4igJGizu8oIXouI4tsZbHB3hz8OxedljaxwZ18b6yh4tAA==
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id
 6a1803df08f44-7049588f0d2mr46864246d6.16.1752162715355; 
 Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:11 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-5-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1800;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
 b=w46CeQJbLms7jsanP0xDGuQgHsJotX9gQmmNfNXgBWY+HckWjmp9QYjCSEVuxHqbdfSej7iYE
 m2Ah4xmtB30AIx+iZaZOBsQNN8TYWOwYh9Bcz8BF3HVHSMRZ3eurvHX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SqlR7guTmTfZYzWScxpN1ZCGfbyDD0i2BtU8t8N5fMg_1752162716
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] sound: soc: stm: stm32_i2s: convert from
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
 sound/soc/stm/stm32_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6037b7a9c97bf25621fccb1feb59c4caee3250ca..0e489097d9c1086efcd9e3d1013acffeb0a46d4a 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -461,20 +461,25 @@ static int stm32_i2s_set_parent_rate(struct stm32_i2s_data *i2s,
 	return -EINVAL;
 }
 
-static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
 	struct stm32_i2s_data *i2s = mclk->i2s_data;
 	int ret;
 
-	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
-	if (ret)
-		return ret;
+	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
+	if (ret) {
+		req->rate = ret;
 
-	mclk->freq = *prate / i2s->divider;
+		return 0;
+	}
 
-	return mclk->freq;
+	mclk->freq = req->best_parent_rate / i2s->divider;
+
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
@@ -530,7 +535,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_i2smclk_enable,
 	.disable = stm32_i2smclk_disable,
 	.recalc_rate = stm32_i2smclk_recalc_rate,
-	.round_rate = stm32_i2smclk_round_rate,
+	.determine_rate = stm32_i2smclk_determine_rate,
 	.set_rate = stm32_i2smclk_set_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
