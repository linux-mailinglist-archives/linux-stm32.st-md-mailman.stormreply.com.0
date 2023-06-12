Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A972372BC12
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E8AC6B455;
	Mon, 12 Jun 2023 09:24:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B5E3C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3f7f4819256so29873345e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561879; x=1689153879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9517L+m6kHVlackMfaxSN+CNphejP2hqUH4D90m9Olw=;
 b=niV8zcJpx+FM/U+qoIxdAubWZD03pWCf8LOroYc/q2tXxGMobXAhRDTkiRBScpbEha
 nmxGS6K4K+sMXcJWCBnsRrq2MLQI+me1BzhofFvIbxfFBqtqVfBnlU9NnJ+S/3YdL81N
 /pMUKBNVFHGFG4pB4KMmO0Tm3YSZ/mtio9kHJMTOzA12sEv0MYYTtbBZ0g1XISkS4YXu
 HIpSDd0gsNCx9eAULp0cL5z0caPJYHrM67slR1Ji1AyGcoXvSRtRttHMVkb6nWUiHY1I
 3Vr6JmgkhnmHSgmjDaKJSXOBVvR+k1fRIz9MfUkxMIHyJffKzIcI+Zs0Ptrp3HHe31Zi
 31rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561879; x=1689153879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9517L+m6kHVlackMfaxSN+CNphejP2hqUH4D90m9Olw=;
 b=ZN1HnbINFPlv5pPIF6QnZsR9hZ9A228T7QFYCOveWjVSMiRnjR4dkF9jONevvGDjXg
 3lf/ztvMm+F6gJRwLX3rrupmXkn7WyjYiudUkCtpJEU6JtCZgBGLuiZGDlW3Ycc1naF7
 DsThmArbv28VRoQOsMmlwW7BkkrZRVJeZQWfe8fAzPahZv+cLGyKqKsxdfvXaS7ltxgS
 DtyQKp1+fQJVaJds5YLCH91s9Fg98xlvZT/O8OpLNUhk6TiU9ZDVPRMNwM2S1v3C9C2w
 qK+Lbxo/FInJquQZeNn5OaV56bCfyUpECZln2H3aInZ9JCVxeZM7r3X9D0mvPxclCgJy
 cj8g==
X-Gm-Message-State: AC+VfDzdyLE3myFUaEgfW8UHpWzLnx2i4qRT9d+WWvNVMqHyrh2KgQFZ
 2KsY/O41X9VUzpSsTsE6eJOZbw==
X-Google-Smtp-Source: ACHHUZ7OmuBoNhbMPtzJgMKKXL9pAuDmUXCPSMeBXS0fx0sGH2DzxWk99X8iZUVMp3kJqiLAHi07Gg==
X-Received: by 2002:a7b:c84c:0:b0:3f7:33cf:707b with SMTP id
 c12-20020a7bc84c000000b003f733cf707bmr6349917wml.1.1686561879026; 
 Mon, 12 Jun 2023 02:24:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:38 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:38 +0200
Message-Id: <20230612092355.87937-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/26] net: stmmac: dwmac-qcom-ethqos: add
	missing include
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
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e19d142630d3..ecb94e5388c7 100644
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
