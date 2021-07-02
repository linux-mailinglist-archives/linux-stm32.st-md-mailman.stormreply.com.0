Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B93BA616
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Jul 2021 00:52:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 261EAC597AE;
	Fri,  2 Jul 2021 22:52:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91CAFC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jul 2021 22:52:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id i20so18305953ejw.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jul 2021 15:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUXIdV7IyIYLsaimkDpH07CvQJHcqNP5b8K6Nj4IrE4=;
 b=FCo1WJAAgMsJncjryBYDadhLVfBG08rP33YJnoPHG90FhHsz357vFHnIzBo1nLcjNR
 lH0eZWtHZtimnegirn9Y0rXLi4kQ4+xX+KulK73EWQ3DBEz6rl0SvUfd/V/Rh1lQSN1F
 Zb1MhTGoDljyVuvLlqIGvIm6af09vb1ongwRsIfrxnANCuMYJl/QupK1i36K+JgERmzf
 cl/JJUQ7WblSFFRaxZr0hYpoMIYyTzDQ/ozQGqO3W375dYqJxbsbVIaURxsPvNHjBplK
 WtGTwcVRwErEGHG2B2GL08fqqlW+IOBQd4lJIa3sk107tUmbgopKw+mC/oyf0OVmlXq5
 pqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUXIdV7IyIYLsaimkDpH07CvQJHcqNP5b8K6Nj4IrE4=;
 b=asexv/trGRteDs/D60JEI6f24R2TBQOhyXJ6BajyNaARbvDFiduvm0IY5lRZQM63KA
 Xoznvz8sp+cQHYPuvm6ehR/vZQ7Wdr8RGY/6xseUywQc/wyCdcQyzAUbrOdpdL3pRBqO
 EjhsjQQ8m/nYBrQ55zBUcnCO0noCPcyUUvhsACRwkhahhrnWbqkYOliU3woI2fo4iExh
 YGt4Jpj8OaiJ1NOnUt4+AjvWdicnvQ72l0oshksdGfQWsJeJe3AO+IFfuOZoZnh3mnd8
 m4jxfmgonyCTmzIbZ1MyahNes7LpYzNVtFOrSh7zuVC2PVjr+FqN64mmQTWk+53Na+sa
 yfFQ==
X-Gm-Message-State: AOAM530/ib6TsMZFXTsUbl5gobXLjgBowmbY4lOkZdKOPCegK2ss4Tas
 RDWwHGYmGYz6LcgUj8EM7OY=
X-Google-Smtp-Source: ABdhPJzx45XAEdaPMlRXfsxl9nOpf+kJ9KYEYm3S8JI9izdhcVTWhCQMQwzh//FMvriJE+pnPJYJZw==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr2113939ejw.46.1625266321918; 
 Fri, 02 Jul 2021 15:52:01 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-095-117-063-046.95.117.pool.telefonica.de. [95.117.63.46])
 by smtp.googlemail.com with ESMTPSA id r17sm1866964edt.33.2021.07.02.15.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 15:52:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-clk@vger.kernel.org,
	sboyd@kernel.org
Date: Sat,  3 Jul 2021 00:51:43 +0200
Message-Id: <20210702225145.2643303-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 4/6] clk: stm32f4: Switch to
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
 drivers/clk/clk-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce5ff85..22267fb3e92e 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -709,10 +709,10 @@ static unsigned long stm32f4_pll_div_recalc_rate(struct clk_hw *hw,
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long stm32f4_pll_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int stm32f4_pll_div_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clk_divider_ops.round_rate(hw, rate, prate);
+	return clk_divider_ops.determine_rate(hw, req);
 }
 
 static int stm32f4_pll_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -738,7 +738,7 @@ static int stm32f4_pll_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops stm32f4_pll_div_ops = {
 	.recalc_rate = stm32f4_pll_div_recalc_rate,
-	.round_rate = stm32f4_pll_div_round_rate,
+	.determine_rate = stm32f4_pll_div_determine_rate,
 	.set_rate = stm32f4_pll_div_set_rate,
 };
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
