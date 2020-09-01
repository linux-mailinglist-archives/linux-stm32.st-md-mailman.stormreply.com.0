Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE925939A
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Sep 2020 17:28:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 044BEC36B26;
	Tue,  1 Sep 2020 15:28:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75BB4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Sep 2020 15:28:15 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F05A82078B;
 Tue,  1 Sep 2020 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598974094;
 bh=sDJbBtyuXPf8AdJ2TLEs7TvBFyJ4HZya4/KdpqfIghc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fAHrqrmSB4+wTOyV0CJPyMHjbIK7a2KePXXbjKYHvv5XgBqg//ACEhBjJ0ylaK0Ec
 EeG4O3t/mJEqHW08oNKRn144pLZz9feRDorO86UEs6QnJLpiKzgmRuHvVeBjFlXpS2
 hmvYeTll0PNzb0AVA0nqTfLeMEpOWb5YTF9WeGzQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Tue,  1 Sep 2020 17:27:09 +0200
Message-Id: <20200901152713.18629-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152713.18629-1-krzk@kernel.org>
References: <20200901152713.18629-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 07/11] spi: qcom-qspi: Simplify with
	dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/spi/spi-qcom-qspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index b8857a97f40a..f83755e292bb 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -495,9 +495,8 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 
 	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
 	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
-		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get cpu path: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
+				    "Failed to get cpu path\n");
 		goto exit_probe_master_put;
 	}
 	/* Set BW vote for register access */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
