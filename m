Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD7341A95
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FF2C58D5B;
	Fri, 19 Mar 2021 11:01:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A8DBC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:40 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id v3so3431531pgq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XSocH1pEsSl5GXfkgGEmzp3nM7R7NfVZbOAEiTfnQJI=;
 b=kjOcLKbCFtzL3WRZ+TMUVvMnzsHKXNVNuCHl+oo/fV0dipngNeeNES1u/UHkJEUIml
 JyNwebt5WfgbhZmvTperffY9h84hMNYEP06UtCLJ9T1v0RpU1hRDzD+XI1A/BYGnt9Lc
 MfCI6WX5r71fnHUV4PPxjLoproqN6KLXMJn6aZ9Q1kAY7Ss74bngKQboFwr0VTX/GCYa
 ej+x9hIjxQpoIgyS+vVJ0zi9bVzHFRIVfnblEGgNGTHXc1k0T3UuFMdWkidJr06aYdjP
 blwfMp7eW9R6K6ZNgCiM2bjzxp+/YJg4JOvwt35Wd2S0MMCUewYFiHtnzhfBvPuM+iHQ
 ghqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XSocH1pEsSl5GXfkgGEmzp3nM7R7NfVZbOAEiTfnQJI=;
 b=lM7JZhEEEbG0lp8gW0ccOcezeqyvdvafGIxKVvI8I3hiVHducCjTMEbjvD8B7c5U6n
 67ng1eMmDQhltjHbTZpwQ9MfuPK9hbVhtzlIkCMHP0vWIm3zBitD0FOk47uePCGTnQbo
 2n9ZGYjZoNqCp0kim3FTCxn3prElCnMjQho8ZFojFYR+54VCj/3Ibj48VX++NKwIqqpN
 +unIELFEnmx+Lu2w2rbRW5Ev/JwVklabmoFiSKGb3r4FP2BOCZXNxlE4U8rGDE/BJ2ma
 GblEPTZz/WWa57/aKmj6ayVEOKnKjHjUlWePe2x6WTF8D2fL5lRM9Y4ILu9ihTJmV75M
 mERQ==
X-Gm-Message-State: AOAM531tp63jAfTekYF/GACn/1Qcq5knxFrJQYPS3Wc+/JYp1jPmiV0r
 VpQ+hFgSDfkM3qw3dF+K7sU=
X-Google-Smtp-Source: ABdhPJzRoI1fHcE1ZAKUXQ3BHSbmbZz4CqkRJPGAcm7nkR1fgIQrZY50i8oPgAoFDMztWakz8atzYA==
X-Received: by 2002:a63:1d26:: with SMTP id d38mr11288574pgd.385.1616151698789; 
 Fri, 19 Mar 2021 04:01:38 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:38 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:26 +0900
Message-Id: <c3d989972172945bbc616c973c1a759df5fa3d19.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 07/33] counter: 104-quad-8: Add const
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
