Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B286731861
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E75B6C6B443;
	Thu, 15 Jun 2023 12:14:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F692C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-30fb7be435dso4016197f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831286; x=1689423286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
 b=H2PTh4hD9hzbycE5igomrrO0DCv84czKWu9BdxtjyDf6LSzC48IU4LSjyvYlAgB8nt
 jNpjXeMumj8pFyWnMh0IldN/tcmk/RBW7X/oAbEjT5pHbowgacjdTyikRxoqYb/fN4C0
 arIdhnzIjcn+mByXIb+/knuZZ5BRjT6+YbTRmovjHKlg1gmvOmEkzkBTGV7CsOjZbMoi
 IkbAMBaShTFb6BN0Mgu9ccN6nDsZFfr4ZUeDKfws4BZZJbGyf/GrbDS41qv7hZIp9caW
 GGj+yG4g8SfHbqd9po7aVCM6vChyNGXDXkNcvDjxKScxrOgS7Vpim+2KqOL1bfg5tDPJ
 1Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831286; x=1689423286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
 b=lUmNQOg9E3WI2LCSEG8t7xfthtp7e7vTdUy/6VY4rmTYLUqTHwBh61bRtlsRJfDfET
 PtpLnGiOB56OVZz6/tI077XYj7Scd+2z2gLWCPraEvbgz+f7cWkg7W6HvGdjRc+/VXSM
 fDMl5mkHi/atpIeRI4zYIK0AW9uo6HZnPWOHoFp8qE+6u4Y1PxDhu+71Z3UKI9tiurfo
 5ewY7P/75tMjT9GNpzxi4XzNWKCJe5Xplq+u8E/dEeoRNS92zP2PbgYtCbzE35NqpNCh
 qkwoLuKFY6uLXEYePLrxU303NdG8bV3IsePhnwLu9tQkdLkWSu0mOvLfHaCOIst7xQ+c
 L+/A==
X-Gm-Message-State: AC+VfDzccfAendSsvzPnET5eVwLQiFNysuvqQ6a5HgOc7egtZ/cA38fW
 qMC4008Mz8iLCw/edQe3JJFOoA==
X-Google-Smtp-Source: ACHHUZ4r1A3qaTK5WSf+N6NhTfrUIoixv+YgCS9FosZwGOvt8xYnavFbEe9tPLw5/qL92M2SWSYV4Q==
X-Received: by 2002:adf:ec0f:0:b0:30f:cc8f:e48c with SMTP id
 x15-20020adfec0f000000b0030fcc8fe48cmr4937374wrn.25.1686831286752; 
 Thu, 15 Jun 2023 05:14:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:46 -0700 (PDT)
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
Date: Thu, 15 Jun 2023 14:14:06 +0200
Message-Id: <20230615121419.175862-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH v2 10/23] net: stmmac: dwmac-qcom-ethqos: add
	a newline between headers
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
