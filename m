Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188A4E4B7A
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Mar 2022 04:31:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C993FC5F1F1;
	Wed, 23 Mar 2022 03:31:33 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1932DC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 03:31:32 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id q189so488854oia.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 20:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Her+CON9l4wgkaJDnpr2YlL55pStpePMG7/cYiCS/kU=;
 b=Z3zyJsmTrtJQJdSg7rK6ezx3eG2w+7kETHaEEWALmZjvYBgHUdZU4Kdz9rOzdtI03Q
 IuLnfugF4B5M9Ff0rnt/sARNrGlvIQPLZsTf82sEcN61ZTShoi30Nyb13gZjXJlj8Ns6
 o0RG9j0zIe9r/6Vn4JMpbqXus6CIgYZ/LUmtkIp+riJ/c7zWSzRueP7ykisb58Owoxsp
 n2sW+AvG/ShAKbYATvINYzr5ATLcZocaRunx5wVREBigwxibRo8psAE2G4P/VXuDSBh1
 HHCXFPSBDeYVrM2/Li0m7jig3PS20q/B79nGRZKNP5/FXhIRGHs2+DXzQYFnLTbfDoLr
 VGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Her+CON9l4wgkaJDnpr2YlL55pStpePMG7/cYiCS/kU=;
 b=8M8jl4XKpgwYJNr8mVT9vf661s4ZiVrTKO/Yn+PQdy+pOywiBF6Yy1y/D8GsgY+iMp
 /vxc7tYRqag96l+V2bAbkm4NbP+cn0wnkpucJwQN/FJ6CUdgb/Npfs+XEytsUCVeRJUb
 pjJDeMxZ0O06e+RnCcnz+ioWm1/IPcIhbb2jkEx72ei7+slZy6EhqVqPljxrI1qOiB9e
 OzPyNW6mEn0w60TfyKbLlVU8LihIvj9GrOnwPqB6qrJUHRnORbD+TnlKxVwwOX8DvLJC
 yQN+opcytu3H3cDY9dvzh+TIte34PeFXXTi8CoDgtRu864qI/Bki4MctG2yHQPcVx+7k
 aQRw==
X-Gm-Message-State: AOAM533Rr5Zz7GvGlYam7gTrY0Ln+IXMBElRJ+7OZbTieFlAqR7zl+MG
 Zs539ot73mD32kHPdm5xoPtHsA==
X-Google-Smtp-Source: ABdhPJwvnI084HJJ4vim9a3sctreUx8ZoiaiGUsBr1kx94Qt+Yxnl03yWN9JXRilkKjBAROxtCkbbQ==
X-Received: by 2002:a54:4104:0:b0:2ec:b263:9979 with SMTP id
 l4-20020a544104000000b002ecb2639979mr3581918oic.66.1648006290958; 
 Tue, 22 Mar 2022 20:31:30 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 23-20020a056870131700b000ddc17aba19sm6514297oab.58.2022.03.22.20.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 20:31:30 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 22 Mar 2022 20:32:55 -0700
Message-Id: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable RGMII
	functional clock on resume
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

When the Qualcomm ethqos driver is properly described in its associated
GDSC power-domain, the hardware will be powered down and loose its state
between qcom_ethqos_probe() and stmmac_init_dma_engine().

The result of this is that the functional clock from the RGMII IO macro
is no longer provides and the DMA software reset in dwmac4_dma_reset()
will time out, due to lacking clock signal.

Re-enable the functional clock, as part of the Qualcomm specific clock
enablement sequence to avoid this problem.

The final clock configuration will be adjusted by ethqos_fix_mac_speed()
once the link is being brought up.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0cc28c79cc61..835caa15d55f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -487,6 +487,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			dev_err(&ethqos->pdev->dev, "rgmii_clk enable failed\n");
 			return ret;
 		}
+
+		/* Enable functional clock to prevent DMA reset to timeout due
+		 * to lacking PHY clock after the hardware block has been power
+		 * cycled. The actual configuration will be adjusted once
+		 * ethqos_fix_mac_speed() is invoked.
+		 */
+		ethqos_set_func_clk_en(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->rgmii_clk);
 	}
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
