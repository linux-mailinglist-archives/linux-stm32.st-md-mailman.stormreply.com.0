Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A545A9E07C
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF4E7C78F86;
	Sun, 27 Apr 2025 07:44:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8094DC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso36044015e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739854; x=1746344654;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
 b=WTfbdQW8f1QQJMYELqcwqgZh7JIYF1p/G2NYXoD1xidfPTCYqgbxL+NImFWmkFzIEv
 w0h/3rPV5r/e85arUhBBeOL6sBot0GgbSb+MLVYutvwWvIwl2dhK4TNvkXl2vCgtlb0e
 o3P1F997CkQakGqu3He0ijuTSFYlYAmKObGfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739854; x=1746344654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
 b=fhQw+z6zlydw21DgZQ24a957dEV6r4RI3DsIUjI4HPgi/kR8PaRdbjna/DeAml5Bxn
 Xeb5BJdHwUPNckpH8GdT5FCGomcgbbdpGVvZ+S1DbM6HpkImcSRPyjR47NkXi2WMmtAY
 G0eFGLKaFIQdnOF5umIGzp8NbCcIzF2RZc/SCW7Vnc3BV8FdXH0yikfTwNMFO6r4zi0o
 j+R90AeNCxZPJsD7g4sjZi1uavk4wtRWMrHXYsp0ApIVn132IA6qA7YYTkj32gz3im32
 dmaOGvqSSZC7Q6Gw/K6XqvHcvo80wbyoXpjY4PdgpDrOqPwt6y809rdp61UyGCo+6Nzs
 mEjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOiy3CMk4KZLWqGBrVJClzQLj+ualyM95Iy+WW0HzziZqPRQovd+N5cvrJ/AHqsYBliFIYc6lgqFFu1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyfv5DAbptJ8msELS+TwfIn5tzawaqoAHKb2DrB5nAJ8MRHgo6w
 9uONZg+kLU0ffeTK2UNspg4MITuGG6zKRsbl41rt7UFjLaiWxn3/ZNRsYU4lBmU=
X-Gm-Gg: ASbGnct98IX3mT/Pymr20hxj7wmXAXvJ/5rtAUZUSurSwfRVGRHoiGNJas82MCM9tLN
 +Lq7mpnERkXJLnrMfxMEADoAenxDzQrqOnUEAKk16QFdotlWUSLB4Wuo0vu/0NxsjkmLIkvkhYN
 CxiRErYNEVcRBNfJd+cr6KQU9nkvtw4TUqHD8BzM9d9BYYUgDv/vsQUIqhleRdKQddl8hBDkI1o
 f3+JfCpa4G46vVddp09w4fQ511xr8jiNw+EOtQXsNwa8KKOOJi+Yf0XGmHbKUTwGualjnY755wB
 QTnoVtVWJySWmSqsar0Xqio64WCMVj+X7pu/+pHHhevCn1E2aQsm3zzKBJ1RYb9ktvZ823Zwrbj
 /bbP19g==
X-Google-Smtp-Source: AGHT+IFmKdlug3XBTeQtHBTWufSsMQj6wGtrXk30tYDh/x80OEhGe1hDn/XAFAGgsIRKs0/u6QDg0Q==
X-Received: by 2002:a05:600c:a02:b0:43c:e7ae:4bc9 with SMTP id
 5b1f17b1804b1-440ab76b5e2mr33817675e9.1.1745739853968; 
 Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:23 +0200
Message-ID: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/8] clk: stm32h7: rename USART{7,
	8}_CK to UART{7, 8}_CK
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

As stated in the reference manual RM0433, the STM32H743 MCU has
USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
macros for the serial ports consistent with the documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32h7-clks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/stm32h7-clks.h b/include/dt-bindings/clock/stm32h7-clks.h
index 6637272b3242..330b39c2c303 100644
--- a/include/dt-bindings/clock/stm32h7-clks.h
+++ b/include/dt-bindings/clock/stm32h7-clks.h
@@ -126,8 +126,8 @@
 #define ADC3_CK 128
 #define DSI_CK 129
 #define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
+#define UART8_CK 131
+#define UART7_CK 132
 #define HDMICEC_CK 133
 #define I2C3_CK 134
 #define I2C2_CK 135
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
