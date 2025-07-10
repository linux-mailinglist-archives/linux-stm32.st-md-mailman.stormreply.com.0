Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B921B0079C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:51:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05EF5C349C4;
	Thu, 10 Jul 2025 15:51:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 346ACC349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
 b=dYwEQCMpfXwNW9vLWd1yWihGkTaSJyNZj32XUsYvyw62RnJCbGM39jWZ6ilmAPmgnR6Jyb
 3ZS5X07WZ//Ma4HWjZa05QukTmg03NWZk7DfpjSvkWVYkigL1QEesWvmZEB3rl1xPO8EjC
 tkECYYcMzM6BBAcSPD8IfDZBke2G+m4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-N-HiJF4eOi6rPvzj-PXZew-1; Thu, 10 Jul 2025 11:51:46 -0400
X-MC-Unique: N-HiJF4eOi6rPvzj-PXZew-1
X-Mimecast-MFC-AGG-ID: N-HiJF4eOi6rPvzj-PXZew_1752162706
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0981315c8so88513485a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162705; x=1752767505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
 b=U2vrz/78tqG+BUGX8lzoUuVBADElFHHd/FqGN0avFEALP8F5oMTVijHu7hdsjPcyGn
 Kyywsxqn+qBnS/aT+tP0dfwQUT6BkhZP2MEeVoYldewUuC4Jj5TBdtPf6ruwUYi5SmMG
 tLiaa0ilSnNE7yWfPDvbJnGKLTeGxXmy7xe42qh4sjtyp6KWGHmVzNH/19HLQWgP8y0W
 noZ2Srs/Xvc9pgXHhdJoiZBWd+g5i4z5k04t0Fua07UZIbmyIHk7gW6mlTaSTP3mXYQ5
 0MjQLrzclGhM5eQUzGsWz/iPeiJcJRaYuaFbnX0YD1jtifpZ2BFCqB1P99Svp1pBccqH
 3c9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuGcCkLQKqaoD1OBCn7+lfxCGQUWdmxNAHObSDGgZxPoKByo9b6wvZYkj+wWtMPZUn7pt26gxjbqJ9Ow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwznkAY2KcLh2S6T3hJwj13DXDV4BXcNttIg9bxC25GiGr5EVMq
 2eA+z40LKq0rlRT+Z+jrXJ66IhfLRm/5xMXuvOnAuGJ5RwMXXHmAN5eGv6cOatqR4ox7ed99Tzx
 8Ny5trCqHMGCFMD87sgFRsgQ3OfOsAezgJPmfxdgWj6g8dGb6pPY4uoMR0dWvhpkXXkh/tFnSzz
 yQLw4xaQ==
X-Gm-Gg: ASbGncvNIKnQHjBL11O4jkgOsJeB+b1JaP+ajKjmo7F8MiIJoLxIAMXqdJdt1sPW7kp
 d6W9HFqjv7PbeLy8pZ5AvV8XxJpbiTxiPk9b7SCiTH+NxGSfOE8YTEEeWlJvshlxaONivf7Y2Aw
 ynfULdInDfy6XqamWTDUAjzDZFXoZsHA4XOE3Vn41/+KpDkhrHRTtJKBNbgpxaAiA4qB7hyhmhA
 2D5F8DmOM2rlzHUCVOSYOq1WP7TH5Yjtn+1DfXdJg9vz1gX6AMySjG7VlG9aTf+ADf69fbv6Iwd
 vRwYOqOs1k+uurE88EQHEjsTTA5LqS/EpSXJ6vFJACdl2iDXsz1FCiqqR3b4
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id
 6a1803df08f44-704982360b5mr39084266d6.43.1752162705545; 
 Thu, 10 Jul 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkuqPel6v0c9oLWEAy3uC+hrgIsFPdla2ArZn2bXT5IJXXP8ZdH6ZBnGUgw1dx0j1MhfYDcw==
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id
 6a1803df08f44-704982360b5mr39083756d6.43.1752162704970; 
 Thu, 10 Jul 2025 08:51:44 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:07 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-1-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3957;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
 b=Whbfgc0vqEfbD1+TqJhMdUQrpnzHP0K9B9S+FRtvZgCJnqYxlve3+jWZvpTSIWePANUgtkvX7
 faBzXT5+lP7DDmWOWcvnzTKOy6haiXPgyE+uiaAkDiRx/3YzQGQaLXs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pnN2YdxY3thcUnpofUWl3jBO_UJi6Fifg3RJOT2Hes0_1752162706
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] sound: soc: codecs: da7219: convert from
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
 sound/soc/codecs/da7219.c | 64 +++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 221577574525a5fd60180a4441331d7db88f50e2..1742f91c788c62a34f35aae44fcfd1d7fbea007c 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1982,8 +1982,8 @@ static unsigned long da7219_wclk_recalc_rate(struct clk_hw *hw,
 	}
 }
 
-static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
@@ -1992,28 +1992,30 @@ static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!da7219->master)
 		return -EINVAL;
 
-	if (rate < 11025)
-		return 8000;
-	else if (rate < 12000)
-		return 11025;
-	else if (rate < 16000)
-		return 12000;
-	else if (rate < 22050)
-		return 16000;
-	else if (rate < 24000)
-		return 22050;
-	else if (rate < 32000)
-		return 24000;
-	else if (rate < 44100)
-		return 32000;
-	else if (rate < 48000)
-		return 44100;
-	else if (rate < 88200)
-		return 48000;
-	else if (rate < 96000)
-		return 88200;
+	if (req->rate < 11025)
+		req->rate = 8000;
+	else if (req->rate < 12000)
+		req->rate = 11025;
+	else if (req->rate < 16000)
+		req->rate = 12000;
+	else if (req->rate < 22050)
+		req->rate = 16000;
+	else if (req->rate < 24000)
+		req->rate = 22050;
+	else if (req->rate < 32000)
+		req->rate = 24000;
+	else if (req->rate < 44100)
+		req->rate = 32000;
+	else if (req->rate < 48000)
+		req->rate = 44100;
+	else if (req->rate < 88200)
+		req->rate = 48000;
+	else if (req->rate < 96000)
+		req->rate = 88200;
 	else
-		return 96000;
+		req->rate = 96000;
+
+	return 0;
 }
 
 static int da7219_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2070,15 +2072,15 @@ static unsigned long da7219_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
 			     dai_clks_hw[DA7219_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !da7219->master)
+	if (!req->best_parent_rate || !da7219->master)
 		return -EINVAL;
 
 	/*
@@ -2088,9 +2090,11 @@ static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * parent WCLK rate set and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = da7219_bclk_get_factor(rate, *parent_rate);
+	factor = da7219_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int da7219_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2116,12 +2120,12 @@ static const struct clk_ops da7219_dai_clk_ops[DA7219_DAI_NUM_CLKS] = {
 		.unprepare = da7219_wclk_unprepare,
 		.is_prepared = da7219_wclk_is_prepared,
 		.recalc_rate = da7219_wclk_recalc_rate,
-		.round_rate = da7219_wclk_round_rate,
+		.determine_rate = da7219_wclk_determine_rate,
 		.set_rate = da7219_wclk_set_rate,
 	},
 	[DA7219_DAI_BCLK_IDX] = {
 		.recalc_rate = da7219_bclk_recalc_rate,
-		.round_rate = da7219_bclk_round_rate,
+		.determine_rate = da7219_bclk_determine_rate,
 		.set_rate = da7219_bclk_set_rate,
 	},
 };

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
