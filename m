Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5301B7DAF
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 20:16:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78334C36B0B;
	Fri, 24 Apr 2020 18:16:46 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB46CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:16:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j1so12069809wrt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ieWnO8DComqla3yHOcWNlGDT1t9CTFtocezocte3FwY=;
 b=JfBwZ6Y8cWCcahCa59GldWU93zzWnt8l14DjiUJIwHvNELNGgIXOEWkcg8GJtAg0KE
 3ggAZEdzrMcnAbE03Kj/AZdCVqfnUbo4lCQESa9FJGpIOW94m2oLd2yIyrm6k1hZIzcG
 k7lDOi/JcF8r4Eu4imA6Z6nciBGRXP8bqF0bcm2UNkMMMZqOTQY3XMu0Lc9t1+p1HTO4
 4WPNvvdUo4hE4CCqAJowHZtTuTtwV8KzL/03aYqGHozoUaqoO+NBRtcRvIYdb6ebgqig
 pJGUhv/oammk8nJpFd8f5zBcKqyXjKp/pK3dyrlFDxIt/b8JbvHi2Am66usvwyTBuOBe
 fD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ieWnO8DComqla3yHOcWNlGDT1t9CTFtocezocte3FwY=;
 b=SQsQ/DAt9E1sxj5+yHmNrA6rHuv5P648jrgXL72c8QAqLCFgjjT/skrLIwzh4TjqFm
 3t6dV/Y27EzyInlYDR9B//EFFD8S+I0tsDq13NwdRzS+cBK1OQgI3+4cW5dW5TZy6ujn
 St6ndEO+DXwiLtbvG36Z4ym90ZaiowXAJp+W+3UXO+jOOcx8ovr/qdfcwthw98/4eZwE
 xJDYO7rqKf9AJwq5g1rRGjcLH/S/70HeYFb33hWHIyYPf+cJX8djAVO/AnebaS5fGjgS
 VWMf8/lt5epIjfUYXqANDf+K8BS2K5sl0Ql4cjxnbxLn+F1+kYlVF5zAZ3g9phtiu7U+
 fUPA==
X-Gm-Message-State: AGi0PuaDL6aXoHKXGWALwvZzXtZ7YQn30Uook9GuynnhbyYNfSbLDHwR
 0FQpPl6GUGroEtNh//E0KV0=
X-Google-Smtp-Source: APiQypIKSmT1g/OvWZvryuhk2ZfBiuMTXa6LcUv3vESta4ZnJL2cNrAoW7cKm4HTnxlFjfLG4W8Qsw==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr12531518wrw.307.1587752203918; 
 Fri, 24 Apr 2020 11:16:43 -0700 (PDT)
Received: from localhost.localdomain
 ([2a04:2413:8140:d480:18da:1e39:90cf:b88b])
 by smtp.gmail.com with ESMTPSA id c190sm3913426wme.4.2020.04.24.11.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 11:16:43 -0700 (PDT)
From: Adrian Pop <pop.adrian61@gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 Apr 2020 21:16:42 +0300
Message-Id: <20200424181642.32084-1-pop.adrian61@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Adrian Pop <pop.adrian61@gmail.com>,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] arm: dt-bindings: mfd: stm32f-rcc: Add
	missing DSI clock
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

Add missing clock.

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
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
