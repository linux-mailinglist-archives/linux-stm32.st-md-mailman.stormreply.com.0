Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A764BB1084B
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jul 2025 12:58:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50566C32EB0;
	Thu, 24 Jul 2025 10:58:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB46DC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 10:58:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45600581226so8630705e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753354707; x=1753959507;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RGecDSfQkRQwOHSUrTvJEbSVKAprJg4maVsG15+73gY=;
 b=mDA/YFBj8cYOXCzThmBQNsV+2FKwivn2YdJLcPjVxD2P4RZhtcndElpsKdBEB7Aiyv
 UbpTa+E8NRz8OPMwELjBs27dSmOZzxB0zgdYpauL7wnS2sV7Wj2HDmdjPtNXt2Swu6eP
 hlZdEQsn0W8HowlcwHu6Ejj9LvbA1ss8JUsfiCmJnoTkd0tEGDSnCuZ3fgRjjAYr/ggx
 g8pDy7mTLmVw+mE++vCnkWar2WWojZ0UDP3ppAxmSvqLc8MaKsL2IC/sNAcch0EaOphP
 sgv5Zq1Fm2aqGn4b3/DwOkmJ2n2OTSwa5uJWOaYmtnt71w2gBg+vyP+NoZpPapKTuvEI
 u1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753354707; x=1753959507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGecDSfQkRQwOHSUrTvJEbSVKAprJg4maVsG15+73gY=;
 b=iewA/Y0CuuFlpvjJ1zKczuGTx++/PnFuVkLF8ghQvxjPvqWmQcWDkoNGMPmpQfl37W
 Xw9ZWbQcwoa1L8gTg3bxoeHWShVMuo45Up8FUoptN2pQSc+FQMMZBWo6iFosC894gLdg
 +9Zfjyy52eyvQb6d7DnmrB7Otz1XvAWUlNIkkuhLzoQ2yL2TMZUF3QJ0Ed95JQ3jeEuk
 1CabiIJAZqhSAY+0/0xcNNx7x3I+kRG+SRQoJY9lXINkioNXArhqWo0ZfFnmgGbvU51r
 8LzDlhB/yUjYAcB3hnGUEfxzJnuTFsMsvWKec4xRzupF/Jlhwknv9eAFbCpX2PbIWNSz
 9zdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbYbJEnCXNu1WzmqUlIKfCwchL/ixnbloiUHbNUwIvW6DkqWWifEfiJrFiAaVXiqsQM8+EE1UCp+97TQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKVrsX0SNZHSMSfaRWZSPEu08xqjij6ieYWGmDByF0k6EBcpTt
 fBiNcnZ9Xe8ELyaR4dcBlZkDJOswxVINjZWupE09GtI4i077NtUWm5Ss
X-Gm-Gg: ASbGncuLQnro6OcnjeFog9L6E5J+jgWNpmj9z6AORIVTPyEKqYa49MUZScZbdlj1GEU
 CplVlssrKxoAirN2e7rVPd1VsufATO53eO+bD5XIre1IG8kZKl8UOOwNhZWN1pknsfgovN17tRY
 CUofbbHk+jvvHot0yISpQOuxpeblgrsHUOHUrW2AYRx+CEPL52n8lEkuJ0UZgk5yCBqf8Fd5AlV
 yw15FZgC7YZty8n5ARjshuF8M2/82nH+49kbenhkeZ13qV9PxkO7LpNdlyfys1TNiA6gvJskfaH
 1aTeoaH6i9YruGyCB9s7vZoPJk6xoWDB72oLsdFnjXcx+CvFil0oCjgYPU2bN92Zm4o/j2C+xw5
 bGo/ldl0D+rUjgbLP5Ct8
X-Google-Smtp-Source: AGHT+IEec1gAogEhVNDlKxHHWHB5R0+lqM/g4ZlsnII2um+rpJwBJ/Nvy+vyPcI2BysN3G6ob2NnHw==
X-Received: by 2002:a05:600c:3e83:b0:456:2000:2f3f with SMTP id
 5b1f17b1804b1-45868d53693mr42892935e9.23.1753354706968; 
 Thu, 24 Jul 2025 03:58:26 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458705ce781sm15812735e9.31.2025.07.24.03.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 03:58:26 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Jul 2025 11:57:54 +0100
Message-ID: <20250724105754.140400-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH][next] crypto: stm32: Fix spelling mistake
	"STMicrolectronics" -> "STMicroelectronics"
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

There is a spelling mistake in the module description text. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index a89b4c5d62a0..5e82e8a1f71a 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -2781,5 +2781,5 @@ static struct platform_driver stm32_cryp_driver = {
 module_platform_driver(stm32_cryp_driver);
 
 MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
-MODULE_DESCRIPTION("STMicrolectronics STM32 CRYP hardware driver");
+MODULE_DESCRIPTION("STMicroelectronics STM32 CRYP hardware driver");
 MODULE_LICENSE("GPL");
-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
