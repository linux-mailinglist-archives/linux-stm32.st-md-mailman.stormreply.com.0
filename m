Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E773394EE3F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95565C6DD72;
	Mon, 12 Aug 2024 13:34:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0639AC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so32731055e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469659; x=1724074459;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQ9EsAfNWCNGsBTp/zuUJbg/d9ugsX/M8WUijMQTUKU=;
 b=X6n6XWU5KJk4DFNYWKcBRbcxId6X1vlV0FXtDwwa3nrKiJlSvaa+2sKbG6ccUzRkqo
 RGzErRvbUSHUtjajBa5nC4GW7OPGHfa8xTHpwUPEQL4ev4frc5wpDK4ZEUQqYEINFfql
 9qStDIlDYxiaF5+kQOwdkiE8KblLwMDD5W6nkRRY9E7lLBGNF6q01D0xvvljEIioH0WQ
 tjDFwI+48QRWaHIABFnKzoHJdqOcYXxDdhC3ff/XlZvuAQmfimJETq3fb5j/X8rPtIfs
 ZeMVRYY8ys7wCA3if9q49Q9t6Udgiu6c2QX1IioQtgc4RhGueWtWBbdy5qfrpMNtVGqz
 REzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469659; x=1724074459;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQ9EsAfNWCNGsBTp/zuUJbg/d9ugsX/M8WUijMQTUKU=;
 b=cUew+KtbcKI7DKIAlvPgPxaucNH+MZ8s9gonGgWk9t+O4HgCfD081ES0mD40F8Xrj/
 RRdJR6+pCEYij4+1UPVCfhFPQCIqBIaJSAtybJX/0MxHbK70sPQhsVvQO5qpZ2Uik8NH
 oD/QeelBkB/raATMdqis1hkOlS9IJGvcMnQXPflHrJwHXFDcvowYcDGGeqOOOgS7sZlh
 JmwwDXvBT5MVDZw6P2Gj9loP9q1NxE7DC6uQsbzT3a5vy9OtyoYUfWxmMr5JU9WbfSk2
 pnsM9scuBvON+/6Ic58fNsgUEpN3mBd1TQwvUS1wWUOnqEbfVUakhOboBcDvHHr8wyOZ
 unjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Kx1MCnnPtrFUFKy3QQV/8mjaHmGZTQuoRFn3q4CMY9JA6bP3EpG2K3IrS2WI0z5M/zceZ6AnfgmFGbofMhOb5Oul2DYQDrGcTGeZNNBpu7WWwGj2/HN1
X-Gm-Message-State: AOJu0YwF872DENNTO6i/wzScxOS8Hxd+K7bO6qTfF5IMe0xW+y6NIbuh
 xoFx73OGwC4IqTg4E4bcuOohxxS+bUkYpB2Fo0V6BoJrzVJxhknt7fygFnKNEWA=
X-Google-Smtp-Source: AGHT+IE1KeUxZr45wg8GO4bkox3rQPd8HA1lfti7444qmFnozdlwHtMIevcYiwqGJFzIO6QVhDVBxg==
X-Received: by 2002:a05:600c:4584:b0:426:6379:3b4f with SMTP id
 5b1f17b1804b1-429d4893818mr3637485e9.31.1723469659100; 
 Mon, 12 Aug 2024 06:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:54 +0200
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEIPumYC/x3MQQqDMBAF0KvIrDtggtjqVaQLdb51oCYh0VIR7
 25w+TbvoISoSNQWB0X8NKl3GeZR0Dj37gNWySZb2qp8GcvjF73bAs/sJ3ZewGFbecHi484itcA
 MjW3Mk3IRIib93333Ps8Lb52N/24AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H8kaYJ2UVmG5D5geD0TuiFhX+chgtcGynCXf+srDSxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9Og7Sl9/SIc/9Vq1Ixg2W4m32wK6q+8y6zQ
 qEYeFt7MrWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPTgAKCRDBN2bmhouD
 102+D/9BLrZ01YnrGcAHBZt6bd8l0wpghqUDKqb9lER9jW5q0eqdTUBYaEZqhXWLrhZz04wW8V5
 2PvdATezI856kVuXZ1VeKecXXA08oXa/3aDd74af9fkb29HcPi9nI8siB8e3pvF3JmpJ6CEsvdW
 HYxvlI6TDyB+SbKbBwCHcNa4y5nRFoOGL95+dqqyLOA7c+G4GfT3UOjHLgHLWVJn/AV58Al3ich
 Mskup0lPkDu8E+E9knsiT79x9k3yInyo3RdLYJUvcogoSo0kUTvc/EgkcE3ZlfZ2MngHqI/xS4m
 N+4HpTRy6fTKNzfFC4ZfjfMxDG1/0cEUoHQbkg9FTRhQ9gfnoASVNByBYrK/x9IL7t0ephvaZzX
 xNec+GhbAUCJrt5QJ+nhnbUm2vvy7Cpp25r1rQdHd79LOz26GrAt+BuAyn7tWl/nYeXhE4B0/g1
 cu0KLmKDs5LnZZEeNOn9kCMMAiFXcg/Qto8KT/LgVMJfFHsYp5qwHOdsVs3YPEPsLLKg2JUj4iB
 KLxYPUjJ2YYp7kNh47gDwIi0ffiHZlW+tv74fd6NdwJgC9J2W20sQZlwbqAM+Sno19sJ/N8jHsJ
 NS67XppXifcWhqGsVg7elPMvkGNQ85Pc4GM1kI0Kv47VZ+0RfbiFlrd4R0lRHelSBcTp1CHLZ6k
 3tWtClDb4DnY3oA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] memory: simplify with scoped/cleanup.h
 for device nodes
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

Make code a bit simpler and smaller by using cleanup.h when handling
device nodes.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      memory: atmel-ebi: use scoped device node handling to simplify error paths
      memory: atmel-ebi: simplify with scoped for each OF child loop
      memory: samsung: exynos5422-dmc: use scoped device node handling to simplify error paths
      memory: stm32-fmc2-ebi: simplify with scoped for each OF child loop
      memory: tegra-mc: simplify with scoped for each OF child loop
      memory: tegra124-emc: simplify with scoped for each OF child loop
      memory: tegra20-emc: simplify with scoped for each OF child loop
      memory: tegra30-emc: simplify with scoped for each OF child loop
      memory: ti-aemif: simplify with scoped for each OF child loop

 drivers/memory/atmel-ebi.c              | 35 +++++++++++----------------------
 drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++------------------
 drivers/memory/stm32-fmc2-ebi.c         |  8 +-------
 drivers/memory/tegra/mc.c               | 11 +++--------
 drivers/memory/tegra/tegra124-emc.c     |  7 ++-----
 drivers/memory/tegra/tegra20-emc.c      |  7 ++-----
 drivers/memory/tegra/tegra30-emc.c      |  7 ++-----
 drivers/memory/ti-aemif.c               | 13 ++++--------
 8 files changed, 37 insertions(+), 82 deletions(-)
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
