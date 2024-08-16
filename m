Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C05899546FE
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BA9DC712A1;
	Fri, 16 Aug 2024 10:54:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97A85C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-367963ea053so1277871f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805685; x=1724410485;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tYPp0NsTOxhLjR9Ww3ZqtUjI7/iF6gTBv/X0BXKx08s=;
 b=F+hOEzHWwvQ3TgSLpQA5nMWxJnFzsR1daRxdSkaRthGfJrqsnoJf5JgVjUH6gKd0KV
 rNukrlm57xZ+fRXgH2TndjDfXVy8EByLzsiuk/1SYtTfTcm/mFu/nSzuZQicYTKf57Jm
 wx5nZMEn1kJsMmavXDEAyQV1jrKUSNROL2n1jJk9R01+xrZuF7lwi169GfRBNVXo5SaI
 RiGrdLsJdXH5l/0aGLgWNeeGxiDvoGJJB3OjaS5NDu6FgOW3IE7vvpBNdXAjH57wXAWx
 11oCtkBanQTpnyPquClpki7z5yCfEV5UwlREDaWeawHne16SSkXeaPl3LP39R62wbg7H
 OKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805685; x=1724410485;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYPp0NsTOxhLjR9Ww3ZqtUjI7/iF6gTBv/X0BXKx08s=;
 b=edPoOjK9wS6GbUZRJ/+Z5xYEF4IYlf5lucokF8QvDw6pl9MS76geyrsPXGIL7wXIl2
 TdvYH00ZvMoX63lF+OsivJJcz5uQ7n453S9cvKz2NUqM2JUQmT7za3j/gd/nWQb+ZRgF
 xM0V8IqgFnwtVLnb5KmTqefILeypks7mSWSs3ZJnUYPFbaZtwHxb7E2VIKNjHLFbeBS7
 +1nxYu0QrdSP6pBqwGiK6e5GwwC/Z7stuFMxEmRj5TD+8jElnRHF9pi+Sd28ySzE3tCV
 MwKRAL4G0cNu/YBLPYYeheOcpz2iTaBg3BWOhqW8STPQZ+XH7VBXOjcT/C4upAzmqg/8
 9Uew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbD7+mK19h/L90xt9R2pq/xisLcE1nqkMeWrU6hqnm8LiILuXLwk+nHFna+h0ORBOEwJIoPgUEC18MLodDYNtb1Suc9fkpQInghXIlylRQt3eFJ9vQn7Ax
X-Gm-Message-State: AOJu0YyESMTezaee5fjxrfHscKV4DI22q8XJWxDK8UU9wSoYXp0+cAyI
 5CyJ6SfZHscOdfzer6sq2AUvci9yNaHcAKz1D8t1xsXlSk1tqv8y5gQynzDOlVg=
X-Google-Smtp-Source: AGHT+IHHvawl5XEfEGL+I6Vq39YTQapEbBWFGCGvUkRJ46B0XFDy0y8IVU67kRwXPNSR2rjsEPylrA==
X-Received: by 2002:a5d:5592:0:b0:368:4910:8f43 with SMTP id
 ffacd0b85a97d-3719431561emr1605829f8f.3.1723805684861; 
 Fri, 16 Aug 2024 03:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:24 +0200
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOAvv2YC/42NQQ6CMBBFr0Jm7Zi2SgVX3sOwqHQKk0BLWiAaw
 t2tnMDle/l5f4NEkSnBvdgg0sqJg8+gTgW0vfEdIdvMoIS6ikoqbAcyfpmwx+DQB0s4LTOONIb
 4QWu1JfmqVS1vkBNTJMfvI/9sMvec5rw73lb5s3+GV4kCS6FLU7mLllY9BvYmhnOIHTT7vn8Bt
 jdD6skAAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2UwlDFsvx0FENZTR3WL94gVz3cLqUmxrINSyGxA/NxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/kBBEqhpXjMi8XcGTKE6afT4vE1o4FulDg7
 ujMEz51mUOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v5AAKCRDBN2bmhouD
 13OgD/9Lao5pfe/Gv4e/sGD9rnGL0Qq9TO3361aYYrL3qW/oHUal1cCVeioK8fpPY1cjlnPkrJP
 wPr86G2hVX9eXMeCqkVR/btO/AMLqD1UyoZm96Chr/n4wDstwJSYlpOiMBugsFQS9wjpQmyRtRG
 JhJCc5TZMVUbkDQIHdnf63dXnACBKmZbQ0vf05z37T4TUbS2fhVizHcfdVCPvmpi81KqfpZ+Brk
 0pjnfQP3/AwPwCJvAnCK+Ww8w7RhqwblPscpq4FkzILrIAsmQpkWQe9XaVbXfoIICXo2HqU6FvB
 8vgDjAhIfJGX2aSLx2V//vwwUr46mxv52jfT9/wp3WA8ROHttQXJpuMkJZ0cmvvwytm6omt/wAQ
 iqqMA4+fBetSJlZCmQo03dNlCFpOZzHNQ0io/S8I0ATFF7UsZfmquheffuxHVmrq2fzUHYU/U94
 i55XKETUwW84kNWHIlVWiRzSUuO1Ixve62gmEGn8R2TESeXG+/gsIzijXhl3+fyEMLm+Qlo9zlA
 xMxPsl/vBLEZD3TBbi87+gtmwS+zujDEuOKeQk3iKabX3qi0NZIVHNQaup7oRNiyp07B7VbkHxm
 8lJsfKFWWVvzZwV0f91GuFjn+dsdhK7eHcYDFUlVQDFL5dNhgRo51OKT4/HvzmBPYgvPb6ny3m4
 LUM1YTR6ADFfZAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/13] memory: simplify with
 scoped/cleanup.h for device nodes
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

Changes in v2:
- Add tags
- Wrap lines before of_parse_phandle() (Jonathan)
- Few new patches (see individual changelogs)
- Link to v1: https://lore.kernel.org/r/20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org

Make code a bit simpler and smaller by using cleanup.h when handling
device nodes.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      memory: atmel-ebi: use scoped device node handling to simplify error paths
      memory: atmel-ebi: simplify with scoped for each OF child loop
      memory: samsung: exynos5422-dmc: simplify dmc->dev usage
      memory: samsung: exynos5422-dmc: use scoped device node handling to simplify error paths
      memory: stm32-fmc2-ebi: simplify with scoped for each OF child loop
      memory: stm32-fmc2-ebi: simplify with dev_err_probe()
      memory: tegra-mc: simplify with scoped for each OF child loop
      memory: tegra124-emc: simplify with scoped for each OF child loop
      memory: tegra20-emc: simplify with scoped for each OF child loop
      memory: tegra30-emc: simplify with scoped for each OF child loop
      memory: ti-aemif: simplify with dev_err_probe()
      memory: ti-aemif: simplify with devm_clk_get_enabled()
      memory: ti-aemif: simplify with scoped for each OF child loop

 drivers/memory/atmel-ebi.c              | 35 +++++--------
 drivers/memory/samsung/exynos5422-dmc.c | 90 +++++++++++++++------------------
 drivers/memory/stm32-fmc2-ebi.c         | 23 +++------
 drivers/memory/tegra/mc.c               | 11 ++--
 drivers/memory/tegra/tegra124-emc.c     |  7 +--
 drivers/memory/tegra/tegra20-emc.c      |  7 +--
 drivers/memory/tegra/tegra30-emc.c      |  7 +--
 drivers/memory/ti-aemif.c               | 48 +++++-------------
 8 files changed, 80 insertions(+), 148 deletions(-)
---
base-commit: cf4d89333014d387065aa296160aaec5cec04cc5
change-id: 20240812-cleanup-h-of-node-put-memory-dd6de1b92917

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
