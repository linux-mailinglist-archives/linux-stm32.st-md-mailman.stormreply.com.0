Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F86B8E1E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 10:06:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AE57C65E60;
	Tue, 14 Mar 2023 09:06:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F9C6C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:06:13 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p6so15903964plf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678784772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
 b=ta4LarLUW8GVYewL3V7G52f2PnqeptY/XG+Xj++LeAYExfggHPOU6rG3/4/3rQXG+n
 AzvmQ2wQl0ABLmLB+j8uqP96pHc5Kxv0AojIqlYpcGB1hUHvyyK276Yy6PoiJmTkGYcu
 zGJWJSkXkAHoByUCG6b1z7gylywfPo1un+ivuW9QzU19dOPVUL+TdFCv2jh27+uFdlUv
 7c7ZUWQY8PPanuRhSoHepXGS5nc7Tm/aIJfcWW/45typlJNAf25mejQ/TUovv4vr0E7i
 ZjaKWWdJFJ1ZCo3L2LxQbfB4xP8RlcaiME0yAjDtKQXdfMsvfTAldgKplyZxAWY1yeil
 yyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678784772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
 b=OYbJrWKORRUTOOb5MPAVGXCGdzjzCrx7CA6D3DcmOF21Ys1p02zQ8bC13wpLeiVKJS
 zrVbbob6LCBHBLUEODOTr/kuay7yRt3fI9kZ9v0TVL2QQTOmTx3cmptoJxB32cYle1mo
 JzG+V+2UZQPUwJPoKS9Nqb+OipzIJRnVp84azyuNxR28OdZdNHdwc0lNGSUQAr6NwjJf
 M6Su7EdpsKAkphL+gNLXJo6jd1Svb53zJ7qrlEM4Rc97+abO5UAvliEw2gFNVs4FQv4I
 vh/GerF+y3rnWG3HU7SpsLHB35HsL5VwHJHSkCN7R688Fa1qf+gDxhXgWycqAkKHmv3a
 Hf1w==
X-Gm-Message-State: AO0yUKVXAQN0tUZHyZTvhqnQJ43ZMgnh4XSI0JIlF297gZb1Ul3FrNcD
 xXsde4La0pSYlAn9quRWVpVNkA==
X-Google-Smtp-Source: AK7set/XpT6XzJflkOougYbJXIWlZCBg7D1MY8N+0OWLt8IZY2LG8a7E83HVnkqfAtO3xcf+IpKViQ==
X-Received: by 2002:a17:902:d4cc:b0:19a:b033:2bb0 with SMTP id
 o12-20020a170902d4cc00b0019ab0332bb0mr43699652plg.46.1678784771688; 
 Tue, 14 Mar 2023 02:06:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.34.126])
 by smtp.gmail.com with ESMTPSA id
 kv3-20020a17090328c300b0019c919bccf8sm1254131plb.86.2023.03.14.02.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 02:06:10 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: u.kleine-koenig@pengutronix.de
Date: Tue, 14 Mar 2023 14:35:57 +0530
Message-Id: <20230314090557.41960-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, linus.walleij@linaro.org,
 matthias.bgg@gmail.com, conor.dooley@microchip.com, thierry.reding@gmail.com,
 miquel.raynal@bootlin.com, groeck@chromium.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 f.fainelli@gmail.com, michal.simek@xilinx.com, jonathanh@nvidia.com,
 cw00.choi@samsung.com, bcm-kernel-feedback-list@broadcom.com,
 vincent.sunplus@gmail.com, Linux Kernel Functional Testing <lkft@linaro.org>,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com, sean.wang@mediatek.com,
 vz@mleia.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 eddie.huang@mediatek.com, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 a.zummo@towertech.it, daire.mcnamara@microchip.com,
 patches@opensource.cirrus.com, nicolas.ferre@microchip.com,
 linux-renesas-soc@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 kernel@pengutronix.de, claudiu.beznea@microchip.com, kumba@gentoo.org
Subject: [Linux-stm32] [PATCH 00/41] rtc: Convert to platform remove
	callback returning void
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

> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.

This patch set applied on top of Linux next.

Build tested with gcc-12, clang-16 and clang nightly.
Boot and LTP smoketests performed on
 - qemu-x86_64
 - qemu-arm64
 - fvp-aemva
 - qemu-armv7
 - qemu-i386

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Link,
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-arm-kernel_20230304133028_2135435-1-u_kleine-koenig_pengutronix_de/?failures_only=false#!#test-results

--
Linaro LKFT
https://lkft.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
