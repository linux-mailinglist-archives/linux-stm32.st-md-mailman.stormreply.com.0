Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A030033267B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B91C57B78;
	Tue,  9 Mar 2021 13:20:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC2ACC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:48 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4994260pjh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zj7+sm7nk2JUK10WGHF14mMymh0P+kdsvv/edNpXnVQ=;
 b=dr1NBz1sIQAoYrrUbrRdkjOj9yhfd+zFT5TTFhG3smfCVNmH9EJ+fW/RiBfPXdYJCz
 KMAE5GLHZYPIP9vCq7Uua1LiPg9IQQG+GRHW3Hx1HbzjdDfB0SxDKTWwwib7W8IyZcCm
 Ym6Dzq/2XIPH8v0wb4Wysob7fTtAZY1cFZ9vVNBv9rUjqW4mOKCYPoxImr1aRa1jiiiw
 OSrX3TDkO0w9BsbVGwVFO6pSiJ1OAhnuQZWQ+64HbUQyihAucSifjk2iQ/bWlAWzOSgQ
 l4noN+n6Yb9on9upQPWXzpVHI6tGqprEl8odS2YcDAikDBq2+VkhPHxWE6CD0Pxw3mbz
 JhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zj7+sm7nk2JUK10WGHF14mMymh0P+kdsvv/edNpXnVQ=;
 b=LoJNYoCkoKij4gfqSpeM3ilkhDrYc698cfeTwdShLkV6XO5fLEPux+0YjwiVBNXxAq
 EH5lSp2E/12tXkUsEekSO8u7iolzrAAJ9PLyIOB2oeujGQ/eW5bGbQ2I2LnQV2UCEgl+
 HaMsldDtznEYEzIdNCdzCw3LSzbPPmiaiRees5msUwX6s/nGNUnJRxOz3xEPmnQDMgLI
 6u+J6cTff+9DIn9dU5MXlSC9gEwlacEpzi5Fwnq2Jxbs40GByNLLc1OtDtgd/maFxrvA
 5/gHVAiO+fSpZfUzBySXTjihGGDvFJmTeZxJjL8RCHq3iAMArz3T6JMttAQYyFn3rYQu
 iScA==
X-Gm-Message-State: AOAM532GoobLoCXefdcIvnOoyR9LTc3GhBgZkseA+YNe9wBwc9Ujfymf
 qrM6SBrbjoTOt5yz/KfcKR4=
X-Google-Smtp-Source: ABdhPJxVIxri8CSPeQwEBxpL4lyaoQVUFDNOXibjSAlsHzjikvlIqauj3O0He51c/uXIyeIi0wkRTw==
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id
 x9-20020a1709028ec9b02900e60c5ecf18mr13935274plo.47.1615296047360; 
 Tue, 09 Mar 2021 05:20:47 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:46 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:20 +0900
Message-Id: <4d899b2fb1ed37f97f827af5880fdde916c5c4bf.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 07/33] counter: 104-quad-8: Add const
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
quad8_count_functions_list to match functions_list.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 51fba8cf9c2a..ae89ad7a91c6 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -193,7 +193,7 @@ enum quad8_count_function {
 	QUAD8_COUNT_FUNCTION_QUADRATURE_X4
 };
 
-static enum counter_count_function quad8_count_functions_list[] = {
+static const enum counter_count_function quad8_count_functions_list[] = {
 	[QUAD8_COUNT_FUNCTION_PULSE_DIRECTION] = COUNTER_COUNT_FUNCTION_PULSE_DIRECTION,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X1_A,
 	[QUAD8_COUNT_FUNCTION_QUADRATURE_X2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
