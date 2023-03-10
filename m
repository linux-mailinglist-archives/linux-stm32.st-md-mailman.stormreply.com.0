Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E1E6B5341
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 22:46:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9098AC6A60C;
	Fri, 10 Mar 2023 21:46:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57C85C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 21:46:37 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id a25so26300970edb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678484797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SeJX9lSGwZbRGOASyeKJInBHWHmDyRL8Oo8/OupUB9Q=;
 b=I4VhGR8BarZ8ZUC/EPGtBWoticWk4MDuo0tG3Tg1iNkyklQ2Ur0SuiqcPODtE2eMBf
 PyeDV5OcJpdUHGd0wHSGqBEZB7YeXs9mEOxD3htiyMPdbfO2dAPkaOJsB+Kr6WWn9Z2s
 8Jl4R5WOgnBRXbpBKvAa0kEOAHXE9/7qfcblWSrM0YZbuJi6EqOK4NitnHKNs4cC+3/4
 7hjMaA4G9lfyHpVebanLvVFUMkYNajOyIg6C33wTk/rGYaR+zfx5s9neSPUZ4CrX7w9a
 8o+Mdt+mzzNn7Cvv4pxDZHRchsZWOOmGTSFXDGk/q8Jrf3q/9lsgLKvERaYG9NyaLVKc
 vB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678484797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SeJX9lSGwZbRGOASyeKJInBHWHmDyRL8Oo8/OupUB9Q=;
 b=rmYg9EhRlsKibJQKCuDuaSdw4jJo4OJJrVZaPPal6tgxCnZfcuQOS8rTCAInsiku6/
 +YLYOpzscRIYYJLuIaX1KfDVgEodSfaBOqVI9UbvCXhFiAautYvvzabLy3OwipkLyn3H
 NI34XZM2vE1A/Ge7Nx7dk5GQYge3TJ767/LEn5oXIrPv+kAWIIz644Iwy9Qqb/7WcvbU
 x1aiIAGQrva5crj0ErBzsrcIyrR3UPg7Tvr/rOoRy66fp//wbyvpMdHy1LY4gQQjEiuC
 X3HFgSBVU4gfF8UwWSE0reD0K8UgFnYyCMhJy9QyOJf6uRqlZdZ6aoFqFdnwFFXsUb7Q
 pdcg==
X-Gm-Message-State: AO0yUKVoqBEwOCoqA937FGqrscpuVrIhQSPQjmf1Oy7CJXH6EeCRLSka
 yTmcPwX9ZfYIrOCxCEXtE+mtYw==
X-Google-Smtp-Source: AK7set+fefzslhk3HVdoFlRZdjEzX/BPXogkmHteV4hEH093tDdyyFmRA7z+gYHRC6c1yXWYakLf5g==
X-Received: by 2002:a05:6402:1608:b0:4bf:da1a:2be3 with SMTP id
 f8-20020a056402160800b004bfda1a2be3mr22977290edv.34.1678484796905; 
 Fri, 10 Mar 2023 13:46:36 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a50ab45000000b004bf7905559asm488088edc.44.2023.03.10.13.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 13:46:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Byungho An <bh74.an@samsung.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 10 Mar 2023 22:46:28 +0100
Message-Id: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/5] net: stmmac: qcom: drop of_match_ptr for
	ID table
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

The driver is specific to ARCH_QCOM which depends on OF thus the driver
is OF-only.  Its of_device_id table is built unconditionally, thus
of_match_ptr() for ID table does not make sense.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 732774645c1a..32763566c214 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -606,7 +606,7 @@ static struct platform_driver qcom_ethqos_driver = {
 	.driver = {
 		.name           = "qcom-ethqos",
 		.pm		= &stmmac_pltfr_pm_ops,
-		.of_match_table = of_match_ptr(qcom_ethqos_match),
+		.of_match_table = qcom_ethqos_match,
 	},
 };
 module_platform_driver(qcom_ethqos_driver);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
