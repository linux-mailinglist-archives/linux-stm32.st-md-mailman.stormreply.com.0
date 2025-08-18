Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA547B2A9C4
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 16:24:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 075ECC3F93B;
	Mon, 18 Aug 2025 14:24:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40ED1C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 14:24:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-afcb74bef86so74784166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755527050; x=1756131850;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
 b=U/AOwpm4AfC8YdrOb8FOlVTbM5/8QKkBw4twTwYEhwhobcMExxy8LFeO1Z4U+FjJE8
 alEVeSrTlQh++KqNzUYNeCUXVvVrPDo7+5UFg+whJ4483BCTaRctRrd6b7fjbS7FRzET
 /XRa7MKeZsQWXHuFqbh4/ELi6sgPnwAZftCZbjMQgvj95VmVt0We9kDtNXAcqPDKvo7M
 66lxFviu0jWSxZ5KgiAhgGv2qWqMYlpfcMo8L78mMs+mWERDth2pw4MjAb//335LyDNV
 rCYsKZh1UGcLYm/2pdLL9fT2rLJpWFypQ2ji5pjwn7cpDROFERTnwzFtfBGY6RnJXt9i
 EWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755527050; x=1756131850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
 b=Pqe3yZ7fY6wzszmLsFz/WRgR+DaMDE/rmWHd7z/3xMiKwtxECyy6UBF92WFxv/84rx
 FK9naORazhkLUSe4PzuRW0K3kNrpp6UMK+2W02GxiWMJo2S249E6+UtphrLLFbCZ/7yF
 wHXuhJfsmYvR4cbESAd5EiTPZG4+UOdvgjamKqlP3v7APlIDHf6BMOkgJfrufKjPbEJu
 8QjTvZ3Q6nj76bwWnYn94svfPGGBI+TIA51Cof7nXn9dCjPvTg1QBHJN6liNM3ynkXxn
 Kdb50VGPcssmZviV989dfRRKzXwgjiUiQLbrYzwB8chK9l77GsBtwEa4fY1/giwB+NDg
 2G4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJVK1eOsJ5YCp5tX2p29K6ZrtxRwWChBoxQ4d/IY2gAMLETbHsbPaeZiSjkyDhZyXIOxz8LeSBFoFYdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxROa5/bL9x9XSGyuUaJbdHGWKz4p2Ar6Mzrvr6+R1AV90MCWlX
 rv0oMZcMJnw/nfvvgYVZ2Mh4ODou4/jr9S6jJcYOVrpqcFZ2W2SrqWjqflzjntjWsns=
X-Gm-Gg: ASbGncsDHjiW5Z2fyVCr6KYNvNCTcvcA6rHPzNTFlUEkd4CGAGPVUhqwUZ186f+xGhQ
 F0QzcGUp6Ou/c2DrGWvcHT/w66iUKCjMk2ayuZ26S0BEkVDyNJZ5DwlAjCbyR6ikETEBidhJMgT
 2japcRaf6+Z20WL2bTYQch7PYMhxuVfS2kk+Vd1jvjJoIijUYmqo9FKF4e892ModcolPAfSS3oy
 flpOiSDxUMIlyotW1i/KcOh3MgwrRAJwI2RkAJdSc7wStj/KgOTdmIebAe0A7E50JYID1FUoqNL
 P390tOMxhM83nI4CFiM7s8ASyVBtRuit/3M7BLgjYiY2EooMmGScuy+NP7NDHPHLCFHdwZJ735C
 j4Eg+f99/BrrMh0SiTw3q5bctAI+v+WxkgA==
X-Google-Smtp-Source: AGHT+IF0eQL4ER7n043LGZ/uWkPZXG/pygEg35URndrpoalaoUz4uPyviRVbuOk3OWfAjWq8XjlDiA==
X-Received: by 2002:a17:907:7fa7:b0:af9:566c:4cd2 with SMTP id
 a640c23a62f3a-afcdc2367a4mr462998666b.10.1755527049798; 
 Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53dd5sm803192366b.5.2025.08.18.07.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 Aug 2025 16:24:03 +0200
Message-ID: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=840;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=GQ5ftdYWjc1ggmTXk0Nbj6QK5jviPLomx0fpZtjccPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoozeCHbXUKSjJp2DSxgX9G/1zAJfSI1ztiFFmO
 GadvdBbwOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKM3ggAKCRDBN2bmhouD
 1yoED/4kiZrB9q1OBGXP/IDolXlLyozFqO4AV9Emhx7w6pECE6srTXNW0Io7CnrMi0NzZMG58Ok
 fm+15O1C8b/juIQEqd21izzXzrGo27C3MZyD0BRrXqiwig7D2md0Om36cPq5qhacQ/zDmTpqwre
 RB3kZssnYEetCx0yNNlo+4FilIdI73HUOLBe7NjhjdgYyinQ1CUFjyQBrIkfunSZqcBZezmsQ++
 D0K40lIyY0h5nBjRIKpz+x6o7wDitTdHR41tBju6dC/iGlvLJy+EEOpTTi8OuybUdMZTjyXH+AW
 v3l7+uSupThYNKmIPHmI+dgJTg6wYmF+RRwgTwlKOIVSkrjSK0qlmYJxDubNzMVhPGQtLju+zZf
 yrapLhuKFH6b2QE3QQigfWAWcilF9rdt7gD/mr8FljvXYBKtQVazVxlky4pZWXtJnk0acqX4+bu
 JRmGZ08gufYi08WEAQ4Fbq4ef0x1HR4/6epHh6Kyf033ep138BhgWHGz5jinmmwQmCTJPowT+Iu
 ZRAS5U1JPvwEAQHEQsFTMttnyATQyBPYpJ7NZiTc+QJMTnYhxHhQBnpIrcUZuQ8gjf9Aw+NoO5s
 cCDK8474FZvZaoSSTtwZPWx9SuZLQQmpjUT5Yjad3ZHNO4LYiv5uT/wfKA8WZczUAJ1ziod5OIU
 fbYKk48w9jEUxLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: Constify static 'pinctrl_desc'
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566b..0cd41f3f7a52 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -575,7 +575,7 @@ static const struct pinmux_ops stm32_hdp_pinmux_ops = {
 	.gpio_set_direction  = NULL,
 };
 
-static struct pinctrl_desc stm32_hdp_pdesc = {
+static const struct pinctrl_desc stm32_hdp_pdesc = {
 	.name	 = DRIVER_NAME,
 	.pins	 = stm32_hdp_pins,
 	.npins	 = ARRAY_SIZE(stm32_hdp_pins),
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
