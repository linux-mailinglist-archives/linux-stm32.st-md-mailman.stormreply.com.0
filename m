Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE77572BC13
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 927C1C6B443;
	Mon, 12 Jun 2023 09:24:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DCC2C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so29304395e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561880; x=1689153880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6Qql4lmrRc6orjCzbHdO+X/jI0p6UbXCT7w4xaPn70=;
 b=r3C+LN0I7FtVIMevczG2G4gXnrbL8tV0VWh6EO722HqR8GSaE0sIdbfNRfxVxFLZ5B
 KBIgDCk8KbY3A1fU3rbQm5hg/qG9fiu/Qh5osa9r5C1dsQA0Xew8j5mZNyLKuBNimXuJ
 6e0x0WmGekpMepRjwxkoNwMoSWLpFysA/e7TXwQ9HxvqKKEmDAkTMxo6WGY5DU3VlT33
 NHaWsB9EL8reOpnI+0F5kohXV0fYBfz9i83cHE6asArFI1iLJgt+h16f1Yd5ENreccvG
 guXlbNPG/FuHocWDWvE5pg2eRqhyFAu+oxb9QULwsW/TV/ONDHrPilSk3mWzsETb+yPC
 RCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561880; x=1689153880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6Qql4lmrRc6orjCzbHdO+X/jI0p6UbXCT7w4xaPn70=;
 b=Rs7yApdjdcl5wygVQPYZytRfRUbcEt5nTYGnzelP7HG/6wfl7/6lqnCx2o/Febq90L
 /Jhk5YGNW/JATRsMaBOtP76quLyBtUyhHNq0cDUo1G8kiW2R5FVGrn5+ru5yZn23TiX6
 RExD4CXhaVWH7GAdI4X+lEZKI/LHgvq4l/f0gvXFybED/L7GlsMp1fry0GGkjsR/bRqG
 uCo0Dg/mE2uVeS+pFgEyj81qcQ0Xn99VEjT4wptkUg3q28nJIc1576SCJC2sgi8aG06w
 dHCbTNg8FKkf/fqKxTx1hH5LBarqYMuI2TBdvsFDcBo36De+BpCMqSzbR9hy/1PQJEjq
 HmCg==
X-Gm-Message-State: AC+VfDy2iwhpo/PuA272Oun8u4fUrfDha2ErLF2R+LxwVbmwo5XgVgrI
 iOAC+MwXjBQSHluPjsrZzmx9yg==
X-Google-Smtp-Source: ACHHUZ4pVmMwHGX7bNbtVfB97Jl65MLcpOZps2ubdvFDgRPuGgLyhLlZQF10mQYnesEmUQW2Dqf8YA==
X-Received: by 2002:a1c:7c19:0:b0:3f5:ff24:27de with SMTP id
 x25-20020a1c7c19000000b003f5ff2427demr5380405wmc.32.1686561880266; 
 Mon, 12 Jun 2023 02:24:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 12 Jun 2023 11:23:39 +0200
Message-Id: <20230612092355.87937-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/26] net: stmmac: dwmac-qcom-ethqos: add a
	newline between headers
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Typically we use a newline between global and local headers so add it
here as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ecb94e5388c7..5b56abacbf6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/property.h>
+
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
