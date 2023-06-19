Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6680734FA8
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B090C6B443;
	Mon, 19 Jun 2023 09:24:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABADBC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3110a5f2832so3135265f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166659; x=1689758659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
 b=kyHT8TL+2GSjjQREnvB3sDGmITerXPnmzkNogrnyC+QjJOC6XyLg2cdclezHjWaXPH
 zfGTSZePqXBZcCL5FKoRCWQsiHOxWONCURN9XFcfwFtqHLxK0VGUv47VJ/iKqP8ivnUT
 +0qyHmkDi8Ja6fQ+JssQeGdFGfISfMn2BCpDgdTrg6ogiAmIqnVsSn4odIrAeGc7XsIE
 UXGFFyF43iaDeIM/9rgTPFr5eN9CQwYmiTll65ySroOyumfs++eBFi/EYb5rTIQ+Napk
 IvKkDERUvy0JAY9sWgZUu3b1zF/YjGTGMOb6738nk6iU0q6Tj49q7Wz5E89jPFwxkD/Y
 5RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166659; x=1689758659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
 b=R4HEGIun+6U1tlr89EpTgMoHDH/hqS6IQnN3R1jjoZ0AllS5wws+OL05ptT5gdBHCk
 dnZAAlRIoGenTHxlLdV7tX1TYnJkI4tqU7n9wSR8RHWLwfkfaQz/vhIg66hbp92kTmhM
 8d+FaG6ffdECQ4LO8NdPR1/HytrZipq9u6AzrkT3FVUMNrFKivLOLdM/1Lz8ADHX97I7
 wRA617QXEHIIMfBnw8jwkNu2L7XjYSIua0pikfNcCGbkBL80qusYIgNtmsDVDdJyzz6M
 JiKoRF9g5MpsBCERutDKPf7IkzsikuTD2cgqZ6RzXfcx8K9OUAgFMd4WRFIyjvqWsSfo
 1ogA==
X-Gm-Message-State: AC+VfDxNvX0p0u94ka5n8jsWPBsiy7fCEH830NLscFe73WQlxPDIS0KA
 fTZ88aF2KCAyfX/Uno5N8WdStg==
X-Google-Smtp-Source: ACHHUZ4CVUlTIzAxN+LAPNfnxBCniWd6XVG9x7Oys2PrG/4EHzRom2BdwYzcTsWwhaF6q/GoKdWTkA==
X-Received: by 2002:adf:ce84:0:b0:30e:5bf2:ef1b with SMTP id
 r4-20020adfce84000000b0030e5bf2ef1bmr12363169wrn.25.1687166659271; 
 Mon, 19 Jun 2023 02:24:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:18 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 11:23:54 +0200
Message-Id: <20230619092402.195578-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 06/14] net: stmmac:
	dwmac-qcom-ethqos: add a newline between headers
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
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b66d64d138cb..e3a9b785334d 100644
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
