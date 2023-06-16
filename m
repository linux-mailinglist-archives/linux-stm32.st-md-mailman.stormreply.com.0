Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C641D732E5B
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 12:31:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84BC4C6A610;
	Fri, 16 Jun 2023 10:31:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B16B3C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:31:35 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-982a99fda0dso72660266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686911495; x=1689503495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l7UUUCEiDOQDFLQBmgYOU/VRB87rfpeTkrh78SXewlQ=;
 b=cYdvibiK6wuol8x9Bae5L8jbyUJor2BFpQ+IvmqbrkyV4XE169xtPQhWFeCJVy2mZC
 S1y8KJWNQoZ6Tt6f61tdQZ17mQ7/Khy4qJ4/OOfzg99RWHHtZG3revanHGAsMpz4agYc
 qmEGJ8aps2q7Vq/Hyyr8/f36b/dmAxKdaqAClpriOsphBx8XklyaUzYZWOfDx1tG+lGE
 Uog6nTn+xvetwk9YuYQwHqu8XtxyrP0JyAdaPWm+3GxY1hIbxEL8GU56nKx/B4FxfXVm
 FRRIYZKC5eguyHZXHgMEpGAqpfN8O4w7/L2gSsigMBEWNLeTPNevOvV3B+Y4AVR9XOFd
 rwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686911495; x=1689503495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7UUUCEiDOQDFLQBmgYOU/VRB87rfpeTkrh78SXewlQ=;
 b=BY9J9DVqjfrdNLkg3nIwY+Cshi08HOqsuNhRm2s+E5sEO9w1dY4W0RWpeqGo8dGMyb
 MRsgMwe8rI1zZlIHAqumrr4qzjJIdxvXO34rBj1rzffC4URYuBm/PhHeqWnn/rdffVon
 /FIwCDKUtArg0wU+bxyB3b2Xf9svWf5T2QkXSPRyCGaTk5K6efRwjPqGGL1Bbo3vw5xN
 kggsMDtfTH9uQiOn59Iq93FjlYZmsul2iSwCC/LYrubLmYDTfTkZUzzmsAgWM0skVBNG
 +zMK1Zk+G13/WYVMrOV1vPUeREONgYwNli3tRvxvbO9FGB6+T8LKPV2IMhu4SJyh9CeZ
 yFzg==
X-Gm-Message-State: AC+VfDyOMmBHEoGmcflY+zkkmXNM4uEk9TbjVlAfGtNcjZ1MpIWKkn+E
 dp0exas0yNR+5qn2Y94Q8wW9hw==
X-Google-Smtp-Source: ACHHUZ79+WHZQfcfy/frvys94Lo80cA+tl2FV9KD8MCaSKzol/5ipwbVMZ3T04P7GsrXRUhcD5vRDw==
X-Received: by 2002:a17:906:da8a:b0:96f:e45f:92e9 with SMTP id
 xh10-20020a170906da8a00b0096fe45f92e9mr1493906ejb.16.1686911495167; 
 Fri, 16 Jun 2023 03:31:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26]) by smtp.gmail.com with ESMTPSA id
 s20-20020a170906961400b009829d2e892csm2251098ejx.15.2023.06.16.03.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:31:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 16 Jun 2023 12:31:26 +0200
Message-Id: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [RFT PATCH 1/2] stmmac: dwmac-loongson: drop useless
	check for compatible fallback
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

Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
so checking for some other compatible does not make sense.  It cannot be
bound to unsupported platform.

Drop useless, incorrect (space in between) and undocumented compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a25c187d3185..900972521b59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -59,11 +59,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		return -ENODEV;
 	}
 
-	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
-		return -ENODEV;
-	}
-
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
 		return -ENOMEM;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
