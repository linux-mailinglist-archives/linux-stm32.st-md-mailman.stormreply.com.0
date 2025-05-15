Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F6AB8728
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 14:59:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C32FC7A845;
	Thu, 15 May 2025 12:59:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9092EC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 12:59:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso8563595e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
 b=QcDR9IzuDDN6Rkldx0ez3VcHTvxKQ1MBppsb0NxXPbZXyFtENSTIwf83AqMC3PFmkU
 /bQ/yke9Lh0bqQ4cX6BwYtdKMYHr+aD+Smj7Ojfiu9af6BuYlEz0VYguZupa6r1bg8Y4
 V+DajvZjw6EMoQULngiOibC+hsERa7unTS9R72/SC65em2OLLmfpymGdlYEROKJ+dPSq
 BinA6KswXjbPF+RJWo/bK8xS4s2TML3SOalfso+AoADxLyCxnbEnG7FC5U5tLfFzDe1n
 T5wd2k29tYRkpTNnaupyvEjP3i10ahLV+w4oDYTiY9rceZjKS/NjEIU/aaNK6PVzbHeR
 r+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747313954; x=1747918754;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
 b=TGYITbApY44iwY47C5TfWdM4yce3Yt6KYIGTxCqS7OQe6UBrKhv/JC7oOFdc9hyvHq
 Kb0nvShJGueZ2VQWnqxCUmVR1/b3P5hTuiDPOT4Ghxvw7eDG5pe6B/qFaZ6G9NmPctC1
 heAm6cP+6CNDAxsrzLlSwIl03/KXGsZyNiisCCQBX3WL2FGVCfP5aZRMrm08sPbGtoip
 O6GjpMrQTo72fCi5Xp3bayjDJcq8cE1693NEZj2HtUjz2igaxd3d5eajCTHYVGJcHu5F
 uaqo+y5vvCaF3RwHKcjx9JT/XW/+WVMbiXeeKio2unaidOFYSx6Nyn/Uhw4PQYi6LgAW
 d4xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnLjyJNOsRiX85DjmW0dQRvmflclQEi5CZJ6Uup5ynLtvNXx5W/keZSvC2VDttyFlqFYVqJ/ZE7FSxRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz42erMcFHcXQQSEB1c7NAkZn8+dNIetW56+5GYaugNPLdwAxy7
 ci3Xd3Gigz1xr4Sb4gYgJmkjoKqCpQICs1iXIbAQBZ6vDBYpGYXwJ3dLj5CdiF8=
X-Gm-Gg: ASbGncvnE9gpdb2/OJ6QQ/9YFnZbAeafLgJF443ndMpCdMHU/afScHtX/6i+u5sQrHs
 Jh/+xRytJT2hpLkHh2cp/scCtH57bMjXqkZfqCuPSqJFpnuV+erlNBpTvRiuOLGImlY2EpYmu0B
 1xuFVAOMkvcbaCcdTg+khAW71a6e0c3Hm1Eti254Rtcntv0nYUESmHbkxJ7uYcaIEKx0/44zSNj
 w7VQWKs60H+sa+A+Zx7r/OEd0Vbq1ZvWVuY8p0tP5gzy6iT0nla+wIpv/CucFvNexi5sbrSWKDK
 xZsD4NIV8ZF532OnTcjYmumIm+V9hPIp6ECDYAio3cILmVjtBGy/dc7/FHhxKb2w7g==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125; 
 Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/5] clk: Do not enable by
 default during compile testing
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

Applied to clk-meson (clk-meson-next), thanks!

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
