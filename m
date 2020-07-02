Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95E212B2E
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jul 2020 19:25:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F1FEC36B27;
	Thu,  2 Jul 2020 17:25:47 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E71CC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 17:25:45 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id ga4so30634271ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2020 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NnTRoWjTfYr2A0Uu+ecfb7UTjmUGA+TKhWtn9pkCD0I=;
 b=MrrLRE8T6J2vS9TQARvXwu8USGzuPxgmYm6BHRL88aSYWsp3/l4n6dmpJvUr0iagtS
 eFsSyzjvWmZt7fgTlOsHnBEWVciouvhP8n4iPEo9N6bPJ5ajUdKIz7gTXUfHeqTrG1iT
 QmiJ1bSxWZHNQxL5T2kf4oWF+kWadTdaAkTQmBCKUpdSCS7IBVMNoBe5XTOgjQisemaS
 IE+o+wVwfVuf5/+BljBz1U7dGInj9bsIDlhHgSB3QJroDQNGjUOByJ/OBvw2a0ubKTZn
 8c7+LXrloX9CIcVuRx2Ozx/yqVS8WWtva1A1SpxCl3B586MkWlsXTPOqi4UsMZ+yjLEC
 CL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NnTRoWjTfYr2A0Uu+ecfb7UTjmUGA+TKhWtn9pkCD0I=;
 b=F2N5Sx6wfxvG2uHgPokpQCmYxfO9ZHOiA+bw3Sp77YJmi6XbDpwO9n09bv7DLheECz
 tVaFUS7Wrj8ksC7spsZosoYbTt0oeZTxvb8OMgcwvYV1mk6sRHSerIPTVWzzEYLYg2m2
 9ZhI18iZI9lwv9O/cpyFzNXnl9Bkes9y3TltYB+uqMI8J+CJc8Xzs3myyfXvqzn/O52R
 FHU9neTgtKWPWS9HjejPJfGUvot24qA4CNo4ntcaOoGIYq4tW724JwLD6fxtemICNRRb
 jol5884ThOMkZTZio9UzsOcOP01lkeOi6u99l+s2HevWhUnkF44olSLdAqCcNeosEIDR
 rT1A==
X-Gm-Message-State: AOAM53018cFyzC/kxtQRTzfFW+jKgemktKTe7DEGh8bxzcv4cOOMZmd1
 cDYDoM4NCO6Ogv2gtjsZG1U=
X-Google-Smtp-Source: ABdhPJwiP2P0UIlaSVwrUUaua3N8zGJ8j3nQZeobo/IS6TbPfAs6R7ZnqLBuwhXOUApwiNHibGuQ+w==
X-Received: by 2002:a17:907:20c4:: with SMTP id
 qq4mr27836954ejb.85.1593710745093; 
 Thu, 02 Jul 2020 10:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2a04:2413:8140:6d80:2142:c138:da0:5086])
 by smtp.gmail.com with ESMTPSA id p4sm7427033eji.123.2020.07.02.10.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:25:44 -0700 (PDT)
From: Adrian Pop <pop.adrian61@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Date: Thu,  2 Jul 2020 20:27:13 +0300
Message-Id: <20200702172714.158786-1-pop.adrian61@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Adrian Pop <pop.adrian61@gmail.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/2] ARM: dt-bindings: stm32: Add missing
	DSI clock.
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

Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
---
 include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
index a90f3613c584..ba5cb7456ee4 100644
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ b/include/dt-bindings/mfd/stm32f7-rcc.h
@@ -107,6 +107,7 @@
 #define STM32F7_RCC_APB2_SAI1		22
 #define STM32F7_RCC_APB2_SAI2		23
 #define STM32F7_RCC_APB2_LTDC		26
+#define STM32F7_RCC_APB2_DSI		27
 
 #define STM32F7_APB2_RESET(bit)	(STM32F7_RCC_APB2_##bit + (0x24 * 8))
 #define STM32F7_APB2_CLOCK(bit)	(STM32F7_RCC_APB2_##bit + 0xA0)
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
