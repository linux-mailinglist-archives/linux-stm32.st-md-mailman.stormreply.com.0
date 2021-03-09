Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E9332683
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4BCAC57B78;
	Tue,  9 Mar 2021 13:21:12 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D417C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:10 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id t29so9339684pfg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNvPFH0nbH03EWMVb853Te4h5hOebkH389D/4/Ar3Gc=;
 b=oHsuOiqMdMxnXlvuMVnuJtbCtO6m8GaPBzu1TtoNuV/yMutJbslbGT93vPW6pcL0qA
 E0QsNVaJRX6FG2ROv+fQUG6WEiyDTo8YHATz03XYW16NghpHEhJd/AAH06zrrfwJjBWQ
 fLBvXF+gmx6rqoJj25pjIxs0PmYuigH9GCxrirLNUvKeW9lfqW9sxg6i/GSlX3OlqS3b
 CRfxOYwVwIWcd8gAPZPyMDSnhG4/v30MZQMxqNHUVvjR++z6lOysCgS5gJ9kQkFqtOLi
 3LwS4D6yUCljHjF4s86ICVhzqenEdJge6p3VwyMcj5k4Qc/gXohYgSEVxqCF4TwLzgaD
 eAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GNvPFH0nbH03EWMVb853Te4h5hOebkH389D/4/Ar3Gc=;
 b=mUbscjjbn3HYl62RurdEUkQwZFC9gDZRU6HEl4XFrerzCW0Neb6Kw3/B3U3xDp3K7j
 MwlfeseTDmdNHUtlW+4pnpQ3y2RDc1yLBYJ1y2duzCRphu4dEEgycOgBMRyhIO6VdajD
 rbEURCr1brkQOl5DlNGTMBEy1spKezTbv9kETJJN4rLX2p9fNA2BW/9UaWtJZdHYutjB
 4FMOhUYFLYaHXqYV4Qc+AZTiB+aupugTZVEEPkZCNSuHwh3jcBZlDPIbY9r7jF8l9l4d
 kKqGxEm5MCpOzr4ItrTsLq64S/BSnmnbihVLxGCYs1kjXRceFVXPIWxJzLmoSGtZTuhZ
 eiIg==
X-Gm-Message-State: AOAM5335kehtciXREgEzkFMjJj6FtvzWQVQxAY4mgFzFyznfIbvWjc0b
 75V8bTUhJc5PLAF81oaPPkU=
X-Google-Smtp-Source: ABdhPJwIKDxPC96PkVg3vgpek6rrcJkG+VKEdqIg1FFHHf4+K1TPcqyv7FyM+65t0sLIKaMaxK5uTw==
X-Received: by 2002:aa7:91d2:0:b029:1ed:b10b:5a7 with SMTP id
 z18-20020aa791d20000b02901edb10b05a7mr3666547pfa.2.1615296068948; 
 Tue, 09 Mar 2021 05:21:08 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:08 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:24 +0900
Message-Id: <84fc37f8c32e8b9b52ca55e0ffeda67cd93e16f5.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 11/33] counter: stm32-timer-cnt: Add const
	qualifier for functions_list array
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

The struct counter_count functions_list member expects a const enum
counter_count_function array. This patch adds the const qualifier to the
stm32_count_functions to match functions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 75bc401fdd18..0c18573a7837 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -50,7 +50,7 @@ enum stm32_count_function {
 	STM32_COUNT_ENCODER_MODE_3,
 };
 
-static enum counter_count_function stm32_count_functions[] = {
+static const enum counter_count_function stm32_count_functions[] = {
 	[STM32_COUNT_SLAVE_MODE_DISABLED] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_COUNT_ENCODER_MODE_1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
 	[STM32_COUNT_ENCODER_MODE_2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_B,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
