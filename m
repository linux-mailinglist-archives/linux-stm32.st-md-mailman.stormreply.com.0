Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4723BA618
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Jul 2021 00:52:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 768DCC597B4;
	Fri,  2 Jul 2021 22:52:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9392EC597AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jul 2021 22:52:03 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y40so82820ede.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jul 2021 15:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDqwwsMfqU+YTlX7nUA9tYQ0qz5qpRvsVLjs65oq6sA=;
 b=sbTABOINWnDkV7vqSAeBZOUUoZpNOwfwP79uIslNUGhI91o+/Q4W6MsptPiwDzodlK
 sINPa2ZHyLT1HwzTODHAum01LuqZbaInErlXG7CevVLWVmZu4MUwaLJAPPj4sbeYw3bD
 86Plh23LYm51clZTBeLad+71Brt6Da7XcmLBgSV+XH8jxy/BH/ZwMQdyQlEeAUIo81Jo
 Q9OgDvoy7hw8ro12l9CZeS+ikGB9JNyGMQgoiBLOOd3kHA/S+tsYDPQV9jC7Mxe1Bysr
 8beHTmLQWhxetmSaU6lzv5WvDxVIzCZsZgZvqrp1lHE0L9IxmJB4hjwnayAtEG/tAIkJ
 FL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDqwwsMfqU+YTlX7nUA9tYQ0qz5qpRvsVLjs65oq6sA=;
 b=cWGoPId3eihLKuFnLZbcUJwLp197GkyHuxQd1a5BlTInhyA2dWaq6wyxpjc5oN1G+3
 F4JMtTqo99hc6TcsuNwjYmlaUeU7cPTW/ot1vU84bHRfabQwXkqPghx42JotiJA2WLo+
 P5iaEEDeg6+XAtxNg0YJoYEqEZTztXm0cDeRATbXoYOdAIhTwFL0KcgZEskj1xvz8EM1
 15dieFUcdl6bPjGrgcT7VFHmUybbRQ6ao2foFczeFXRM/zUTcP6pyDqg56s2lX8a8wCe
 a7tUgbehEZXSt1+S1tumJKPooCZxjH/qnjJp4Ev3Pt8RloLqg3XwsqKiBQnb/S58toCm
 o3yg==
X-Gm-Message-State: AOAM533pkVd7tNHTjSZ1dOMqOdAjBR2Q9/+0ogc1Hfqy9kcPEw64tlZ3
 naKqkFJ+mrwaHlLLfSB8iVo=
X-Google-Smtp-Source: ABdhPJzbCHHCDX0VLPouL6nXL312RmrkyTgGK9KxV9CLAe8LLwMi9WKTcs1bnCOfwl8adqw1x5NUJQ==
X-Received: by 2002:aa7:d34f:: with SMTP id m15mr2067164edr.155.1625266322654; 
 Fri, 02 Jul 2021 15:52:02 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-095-117-063-046.95.117.pool.telefonica.de. [95.117.63.46])
 by smtp.googlemail.com with ESMTPSA id r17sm1866964edt.33.2021.07.02.15.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 15:52:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-clk@vger.kernel.org,
	sboyd@kernel.org
Date: Sat,  3 Jul 2021 00:51:44 +0200
Message-Id: <20210702225145.2643303-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 5/6] clk: stm32h7: Switch to
	clk_divider.determine_rate
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

.determine_rate is meant to replace .round_rate in CCF in the future.
Switch over to .determine_rate now that clk_divider_ops has gained
support for that.

Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-stm32h7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32h7.c b/drivers/clk/clk-stm32h7.c
index 0ea7261d15e0..1a701eada0c1 100644
--- a/drivers/clk/clk-stm32h7.c
+++ b/drivers/clk/clk-stm32h7.c
@@ -845,10 +845,10 @@ static unsigned long odf_divider_recalc_rate(struct clk_hw *hw,
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long odf_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int odf_divider_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
-	return clk_divider_ops.round_rate(hw, rate, prate);
+	return clk_divider_ops.determine_rate(hw, req);
 }
 
 static int odf_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -875,7 +875,7 @@ static int odf_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops odf_divider_ops = {
 	.recalc_rate	= odf_divider_recalc_rate,
-	.round_rate	= odf_divider_round_rate,
+	.determine_rate	= odf_divider_determine_rate,
 	.set_rate	= odf_divider_set_rate,
 };
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
