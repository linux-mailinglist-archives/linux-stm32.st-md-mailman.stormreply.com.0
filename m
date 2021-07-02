Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8E3BA617
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Jul 2021 00:52:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 385DDC597B1;
	Fri,  2 Jul 2021 22:52:06 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD122C597AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jul 2021 22:52:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h2so15259159edt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jul 2021 15:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=741oOKm9Y/CN6pZlsJDyA+wQ24ovzGnQR0XtQiJk4V0=;
 b=cvI1oGQdong/J6jo2Uvf7v7DwJpDQsEHB76D+A5tSKdsRTiJif1apV6Sc6OKruoHcU
 O1/6bF7h9IxRqm62vZco6/cmJpD/7zNoo+570lV7tmFWpN3KK59H61v7GPJ1NwYmNRxc
 B4DyHUGOv33SNJn9E9Uaw9b1cpVyfMNcIfm7b5VpM0i0hH3DWHNzgWtPJyXHd93SUuKY
 zACpIEWgQHAPFuJEHII5AefZ3zJcEFSKYpRj095dYUNZ25Zx0pSIJf7k7/WW+t5JB0Nv
 NvUCL5BLafsHKspqJ+DSaHkHCDQA5p9qfT7K7IPiGwsdudWC3ueuvUWGQMiFtV8raqAy
 LUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=741oOKm9Y/CN6pZlsJDyA+wQ24ovzGnQR0XtQiJk4V0=;
 b=bWyU1C5DAc3UKjjscZuf+AZ32GrvmjKargMfAXlGwGEyqiJzKK+Uft2sjdQa2bgCv7
 1tM94MUerNq22jYdZmdD9jZKzw2/ZBJ07OrD0DEyJcddmAchMmvlZX3YYu/ynvY55dOV
 niBb1ofeQbtbQ7b+WmpuPY/OAONCKjAe5/YFiO6HRpd7affGfhYTNy//qwSndbPVHjVP
 b29l6yNkNzWUWlzTejWIBaxdlRIVgvZka+ntJyQQWKnFycDYaoU5HaR61nvicR+6PE+8
 rwd0qrmor8KoaLDcuXvMeKq+vBLhdXIX3fJpEh3VeEPxDwHwFTnTD8ITDWxhxcJtrw85
 AtGg==
X-Gm-Message-State: AOAM533TSvf04/NWlqhABtYMmTxal6lDL6EXI4zL79h7/yJv7iQzRk5g
 v66I9JUGAIQXfhUsffHKZXU=
X-Google-Smtp-Source: ABdhPJyw33dANIX/Wgn1Qh4aloRjh0gEEBdoN1t3F9c93El0LTh594GXs/thf0NjLPIuBtUz7hwutA==
X-Received: by 2002:a05:6402:214:: with SMTP id
 t20mr2212183edv.20.1625266323359; 
 Fri, 02 Jul 2021 15:52:03 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-095-117-063-046.95.117.pool.telefonica.de. [95.117.63.46])
 by smtp.googlemail.com with ESMTPSA id r17sm1866964edt.33.2021.07.02.15.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 15:52:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-clk@vger.kernel.org,
	sboyd@kernel.org
Date: Sat,  3 Jul 2021 00:51:45 +0200
Message-Id: <20210702225145.2643303-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 6/6] clk: stm32mp1: Switch to
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
 drivers/clk/clk-stm32mp1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 256575bd29b9..4bd1fe7d8af4 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1076,14 +1076,10 @@ static int clk_divider_rtc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static int clk_divider_rtc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
-	unsigned long best_parent_rate = req->best_parent_rate;
+	if (req->best_parent_hw == clk_hw_get_parent_by_index(hw, HSE_RTC))
+		return clk_divider_ops.determine_rate(hw, req);
 
-	if (req->best_parent_hw == clk_hw_get_parent_by_index(hw, HSE_RTC)) {
-		req->rate = clk_divider_ops.round_rate(hw, req->rate, &best_parent_rate);
-		req->best_parent_rate = best_parent_rate;
-	} else {
-		req->rate = best_parent_rate;
-	}
+	req->rate = req->best_parent_rate;
 
 	return 0;
 }
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
