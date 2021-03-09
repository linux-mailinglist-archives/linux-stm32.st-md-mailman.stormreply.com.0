Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C0332681
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E0BC57B78;
	Tue,  9 Mar 2021 13:21:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB4EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y13so6008459pfr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P1nrq/4ri+fE+Ilcjx/mmcch8pXzmb2SwjOeRT4IcXw=;
 b=iJuGBvTig6gCxoRWZAjYZwOCL5LUQ+ojN2NsJSGSpHX02kW872JtXtqDU0lJSNUPbZ
 ptci+vytxDskqoPNo503TEwxh6zqvcjfQVZQE1K0zmre42auTZocUWwaFangkldy0/Wq
 tu09zItvH6d2oFp6RXYVaObaKyITOnRG1aWPxK57gg2oHlqKNydkW+BCXkA4z2kTnGRJ
 RrXJ+UtzNk6rlzul4h94FAwt50kNvvSqPXVCMdMlzSiz3tOCzb7vuhjUs471pCcUDFW1
 Mn4NJMLXKlp3bky/QRCA6DbuZWfB3ZYrWqcVGblv+/kwnvX485xZbYzxvQy4e0vsWF2j
 Y9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P1nrq/4ri+fE+Ilcjx/mmcch8pXzmb2SwjOeRT4IcXw=;
 b=K2KWRuR8ETdGg2FO0/dcU2Yh1Lzgvg2JLrpvh60uUUciVPmeFvi2kLYXed/PENZoOm
 Z1Hoycpdx7sAyh2vJB6V2uF/ei0ulh3eLfxxHwQoy9VCmn6N7NNvnXDoAC7pke1uVBFq
 1H+5dWNSvnjPSHg0vEFfiwAUcC4qKpoOhva6n54KWLS5KuLU4RaAufX458Log+520X6o
 ltlXUiWzky8C8zDR16riOM6wp2nGYhfT0atA5+blXGZA5XZ0u3hqd9tiCMD+jp7RV7vx
 ZtQl5oSLn/us3uktnyr5nQSJiHsO6P7LqG0zEsccb9sqwICF9ShH7erf102LXiEUkpeG
 C8tg==
X-Gm-Message-State: AOAM533/j19O3lFr09+F22MtwWTAXPztNnu3lzl7usp4+HqfUsBR6R0c
 Pd/xchgalwZrCOGK68pYRDA=
X-Google-Smtp-Source: ABdhPJxBiCwRlmZ1ZVaN9w8ZTI3BTyAsztf03NSnBCbgzsKnmm+LmB45p6bpfilnxSSPdBV6BRoI+g==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr3171412pgh.192.1615296058721; 
 Tue, 09 Mar 2021 05:20:58 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:58 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:22 +0900
Message-Id: <06801459f7fa7fa47ec973c1278df70181a48cd1.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 09/33] counter: microchip-tcb-capture: Add
	const qualifier for functions_list array
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
mchp_tc_count_functions to match functions_list.

Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/microchip-tcb-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 710acc0a3704..cabcfebfc799 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -37,7 +37,7 @@ enum mchp_tc_count_function {
 	MCHP_TC_FUNCTION_QUADRATURE,
 };
 
-static enum counter_count_function mchp_tc_count_functions[] = {
+static const enum counter_count_function mchp_tc_count_functions[] = {
 	[MCHP_TC_FUNCTION_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[MCHP_TC_FUNCTION_QUADRATURE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
 };
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
