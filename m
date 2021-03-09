Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC044332682
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97655C57B78;
	Tue,  9 Mar 2021 13:21:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E6F2C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:05 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c16so6569255ply.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UIAVd9muG3GyzUO3PQ0xXOFMJbQ/8NwAgbwz6em0ZRg=;
 b=jW4gcFVXjW/JzLz3cPSkBjbDaBo7tO/oiG724aeK0AHoO05rKqd4AKWvx1if7eAHD+
 fiQSL6f8rZ8ViPuFQkYvAHO4kVlvV0jah/mzK5yD35slTRN4LKOJg0efzq02kONJvhXm
 QuV4bY5t7iLV8WfhAD4MSAeL/U99u3RMbSz9gUrJKK6M4sezn4AbIAPXat7GfNIyQxmb
 58pgasZgH2HmtV6jrHyhMsgl670VOZ2sI+tDluqgnCDCzFm5g+B49Kg7mDdolWgveF85
 2DW5U7GJyhwBacxmVtI8e8VQCaE6nyNuK/z8pg0hxwI1D5ddWFRs50DXcYQ7W9EBegz4
 nm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UIAVd9muG3GyzUO3PQ0xXOFMJbQ/8NwAgbwz6em0ZRg=;
 b=r+pOeAQ+40m5VGJjONdaookXmHc8jjsINeLwdB9LqiNmWc871F+88/O7/RO8yp9gDr
 D+CMx1RftqJE7Q/BU2pgpExVBDr9C6VxBKQStuKbGLbpjMbXHDYkweha7ZQtARrwmvYC
 VksdOekwPiaxV6OODFLLoLUHxbEEyVWPYWkoMwD655zJvS/o6YSjB0vQ5pnKaPQS4jEX
 Sq+0YYctqd/hQTdl7bhxfWZhoPGErFzCK4AjU/56sWPQDOwn9zPTL7MLNBImkc6zV818
 tU1/m0EZrXyNngxOyNj0j7s3ikg3OC71KzyJ1F+SeAf6o+q50no09H3OyavZI+GV4VS0
 /NgA==
X-Gm-Message-State: AOAM533BpnOOCDfajipqsNrqaBpBRUfwFLaCucPcVggPL/qmugxXSRGY
 0PaLkjCM/LQrhn2sbb5ypLA=
X-Google-Smtp-Source: ABdhPJxVXkw9bGWsBjUq7o7hg1B/IvBD9mBlo1XlR95LPUGnVPTey/VSv8pOU7IfUWfxSbINqhwdFw==
X-Received: by 2002:a17:90a:a584:: with SMTP id
 b4mr4701165pjq.186.1615296063689; 
 Tue, 09 Mar 2021 05:21:03 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:03 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:23 +0900
Message-Id: <6325a9857d8566c31c6bd7fb3812249c99350fbd.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 10/33] counter: stm32-lptimer-cnt: Add
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
stm32_lptim_cnt_functions to match functions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 937439635d53..0f7d3f1ec1b6 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -134,7 +134,7 @@ enum stm32_lptim_cnt_function {
 	STM32_LPTIM_ENCODER_BOTH_EDGE,
 };
 
-static enum counter_count_function stm32_lptim_cnt_functions[] = {
+static const enum counter_count_function stm32_lptim_cnt_functions[] = {
 	[STM32_LPTIM_COUNTER_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_LPTIM_ENCODER_BOTH_EDGE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
 };
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
