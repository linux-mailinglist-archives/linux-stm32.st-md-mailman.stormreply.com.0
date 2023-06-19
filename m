Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE2734FA7
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77CC2C6B443;
	Mon, 19 Jun 2023 09:24:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74DD6C6A61E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3f8fb0e7709so28625345e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166658; x=1689758658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2s2NJclKWNK/7cl/j+crrrKprFB1owa3fhzvvYgN/iA=;
 b=JVygoOc+Sgv4N+YpwUy0/S3Tb3EU99+UmbwTg/SZi3AvYvh2T/jrFwNRBUFY9D4wNT
 ajdGMMWD0gbYpHD6PU1nP33R3HM9Fuzz9V3lUQrccCudcwfMKMyXTLE4iA4i/Hyxqc8H
 xUo37e8oXYLHW2ghVq0kXhM1jrh8ZzxKRq0c7xUAOGN8Foo+KzgPr1T7wktwzGLD5SLv
 4d35AemYguD/hrY/mLMc9uMxNtpNdFRQZTU7wTKdphQPeaPj2c4jccE1jen6R5IVfzP2
 V/DmfYJoHcq80KiiveGwg4M3EA3Z6JEexZHzukbJ7/lWtuO5PZGvelemFRS8280yP8NO
 DaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166658; x=1689758658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2s2NJclKWNK/7cl/j+crrrKprFB1owa3fhzvvYgN/iA=;
 b=XDu1SvhoaexiP04QNB0XeUpwYArs8p+HbzG1WoWHmfDJbdmHKP1QVuoetJA2XLIq1n
 3AM4z0kBVIc6CjZMW7C15TpZY0yvvPXFAig6vCZwKmcz6oAPWIHXy2KiUSrf5Z/i3fP4
 2bUF2NvotCxgmou/kJXWDSBn/nQ1H7E6CfYPiH/oWJPv1k2AKpJALReZqIzmm6TlR1nA
 C2/9eQWCvZe2GVto4t2KnlUwoL2oWJHxmxK9VoSoW/GXgXVqZNjH2B6ctMXILlxPprlT
 cx+ZvnNox9uDsIp8eaGGG8Carv3R1oWDwqi7Z9zXEaWIqArjA5QjAxVF01jcLf35M9AG
 i/qw==
X-Gm-Message-State: AC+VfDw5t00cB6u2Y/dmq+YpX1AqwTsrai2jwYyJuJzyXiJwb3EmMPT/
 w3LkqZ+fk1McfCAlW4uqotVAgw==
X-Google-Smtp-Source: ACHHUZ6PbF7xaV88naI4EANmCuj1nfS/vMqu1VtnGeIj+ZKInR97LZy9OzAzGw+H+MfOGIxYdxlSSw==
X-Received: by 2002:a7b:c454:0:b0:3f7:5e08:7a04 with SMTP id
 l20-20020a7bc454000000b003f75e087a04mr7646140wmi.25.1687166658109; 
 Mon, 19 Jun 2023 02:24:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 19 Jun 2023 11:23:53 +0200
Message-Id: <20230619092402.195578-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 05/14] net: stmmac:
	dwmac-qcom-ethqos: add missing include
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

device_get_phy_mode() is declared in linux/property.h but this header
is not included.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f0776ddea3ab..b66d64d138cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
