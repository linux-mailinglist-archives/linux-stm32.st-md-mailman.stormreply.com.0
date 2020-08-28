Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8D255DCA
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 17:26:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90F5BC32E90;
	Fri, 28 Aug 2020 15:26:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88C0AC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 15:26:46 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37345208C9;
 Fri, 28 Aug 2020 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598628404;
 bh=log7AWSuF7JDEl3CBLoeT1NR4965UMi8bHOOurlBFhI=;
 h=From:To:Cc:Subject:Date:From;
 b=dMDYP5r9cdaKFRyr7mNN7hs6VyR+O+iZydqxbOsqcYAf+bXjVXMRlFi0oE3FzTOD0
 h6ZmkSqU4+De+egmyCUSFm7VIGozhViBbWg4FS+574X/ck2R4m02Me/8fZ67Htfhui
 +AhhWO2mDGCKAxVHoMlu8NFh8/OZknduFMlFuSu8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Nicholas Graumann <nick.graumann@gmail.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Aug 2020 17:26:35 +0200
Message-Id: <20200828152637.16903-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 1/3] dmaengine: pl330: Simplify with
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
 drivers/dma/pl330.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 106f47298f9e..bb27338ec1ae 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -3034,9 +3034,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 
 	pl330->rstc = devm_reset_control_get_optional(&adev->dev, "dma");
 	if (IS_ERR(pl330->rstc)) {
-		if (PTR_ERR(pl330->rstc) != -EPROBE_DEFER)
-			dev_err(&adev->dev, "Failed to get reset!\n");
-		return PTR_ERR(pl330->rstc);
+		return dev_err_probe(&adev->dev, PTR_ERR(pl330->rstc), "Failed to get reset!\n");
 	} else {
 		ret = reset_control_deassert(pl330->rstc);
 		if (ret) {
@@ -3047,9 +3045,8 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 
 	pl330->rstc_ocp = devm_reset_control_get_optional(&adev->dev, "dma-ocp");
 	if (IS_ERR(pl330->rstc_ocp)) {
-		if (PTR_ERR(pl330->rstc_ocp) != -EPROBE_DEFER)
-			dev_err(&adev->dev, "Failed to get OCP reset!\n");
-		return PTR_ERR(pl330->rstc_ocp);
+		return dev_err_probe(&adev->dev, PTR_ERR(pl330->rstc_ocp),
+				     "Failed to get OCP reset!\n");
 	} else {
 		ret = reset_control_deassert(pl330->rstc_ocp);
 		if (ret) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
