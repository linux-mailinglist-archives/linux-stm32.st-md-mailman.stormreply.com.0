Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD62341A9D
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C71C58D5B;
	Fri, 19 Mar 2021 11:02:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07415C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id e33so3424314pgm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2r+hb4QLBinjqUWBtvalv2ZNlSEWr0t8LgbnD3rkGXY=;
 b=H51BuvBk+d+VrafWjiNmYuhXP7SH4yFn00mnwg8b97GELTFmQGDRHkiyl3cFn2Du8H
 iWdGT8w0g9J31DJ5Cediv47FGjuMnN0brALAyV5qutKgiyTRrWt6cnr9K9P4qAvY42uS
 odgf7DXOOTPORiEcmIVEiNWzL3LvvJC042qtOR3WoPClXPiC05+8SR3a4hrhbJYM8U58
 /FTBmCjxLdoE6ydhBNWZrIBpCJya8vha05aBc/bGwLcFXv0PBKDhRXj28uaYVv3GGi9r
 90btPv0mGImHFMNNFp7ji6CM7sjqsxsmaok6UU7JjI9WyGPunAhcRIowDks2smDYvJHP
 vmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2r+hb4QLBinjqUWBtvalv2ZNlSEWr0t8LgbnD3rkGXY=;
 b=iu2hM9d3Kdg5okkVaLhBbe7dOtsRvddCRTcOPdUFZIWLHjwVVFk60H+DqgAFt1721m
 dzp+aA9VFV6ER9WL8OxuJ5FacI4R0tCZBHGF3CvY6ef+ji2IGkuGxwpEX4K7/UnSfBAv
 k+oiG7FMoGNfFY3bsfuQz9nqtKDlt8Jj0vCUHHvqLDmO4xBOz8WxHLihBF+yvDKKq27l
 hr4c7j6CSeJDsRHrHgGfyzSkg8WgCO/d5FrCmg8d32DAbh6zAp8YWnZDQDHujt2OwdeV
 +X+K51+VM+Tz3rbS9xDoLOWn3Uy/bQzrZaHmX6BmFbsTpxAFtyKFkx1odsiLXxHUk8pl
 bSng==
X-Gm-Message-State: AOAM531HjkNGgDWWHTOoSGNGCx3IwJk3nw4P/Ym9GCPuq25LGgnAdX0p
 dxaadgdgAN5YBitKElZ0chM=
X-Google-Smtp-Source: ABdhPJy7/4zKHODKQrPCYa79oyG0kmHaS2DclyVozWj+lMVQ0xUggA++2YKGb1mbTv1owgD153DeBQ==
X-Received: by 2002:a62:3384:0:b029:202:ee3:f83b with SMTP id
 z126-20020a6233840000b02902020ee3f83bmr8759016pfz.77.1616151718601; 
 Fri, 19 Mar 2021 04:01:58 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:58 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:30 +0900
Message-Id: <b1baf33d515a911664650f006c035784c4d79eb2.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 11/33] counter: stm32-timer-cnt: Add const
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
