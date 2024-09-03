Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEC96A6D6
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 20:47:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96833C78011;
	Tue,  3 Sep 2024 18:47:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F9CC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 18:47:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483IlD8l014660;
 Tue, 3 Sep 2024 13:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1725389233;
 bh=FTqTyrECFvbLD17NBUWn4/583otSS6XLuEd+TP20G+I=;
 h=From:To:CC:Subject:Date;
 b=Y4JsSm1q5fFCVCyu7U7R/zp9O4h3Ge7Fo9rsYjLUds7t3Lip38a0++nzk0EsGTzj4
 Mvi107htYdS9aBxknJ/fuzpXEAh5W8pfgPSjpCOBqi386Kp04mRnyFuCeoZ35Tw124
 E/zsKSKZWmnL8OSn3R9bOvssyvBipDhTrfcyPtYo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483IlDLW008470;
 Tue, 3 Sep 2024 13:47:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 13:47:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 13:47:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483IlCbZ127692;
 Tue, 3 Sep 2024 13:47:12 -0500
From: Nishanth Menon <nm@ti.com>
To: Lee Jones <lee@kernel.org>
Date: Tue, 3 Sep 2024 13:47:10 -0500
Message-ID: <20240903184710.1552067-1-nm@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Texas Instruments, Inc.
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nishanth Menon <nm@ti.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2] mfd: syscon: Use regmap max_register_is_0
	as needed
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

syscon has always set the optional max_register configuration of
regmap to ensure the correct checks are in place. However, a recent
commit 0ec74ad3c157 ("regmap: rework ->max_register handling")
introduced explicit configuration in regmap framework for register
maps that is exactly 1 register, when max_register is pointing to a
valid register 0. This commit solved a previous limitation of regmap
framework.

Update syscon driver to consistent in regmap configuration for
all sizes of syscons by using this new capability by setting
max_register_is_0, when the max_register is valid and 0.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Based on my search
https://gist.github.com/nmenon/d537096d041fa553565fba7577d2cd24, the
pattern of syscon registers that may potentially be impacted by this
patch (that are exactly 1 register wide) is probably limited, though
this patch in itself was inspired by a buggy driver code fixed in
https://lore.kernel.org/linux-pm/20240828131915.3198081-1-nm@ti.com/
I have tried to Cc lists that may be interested in looking closer to
avoid un-intended side-effects.

Changes since V1:
* Incorporate review comments by rewording commit message and $subject
  and dropped Fixes.
* No functional change to the patch.
* Expand the CC list to notify potential users.

V1: https://lore.kernel.org/all/20240828121008.3066002-1-nm@ti.com/

Cc: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

 drivers/mfd/syscon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 2ce15f60eb10..3e1d699ba934 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -108,6 +108,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
+	if (!syscon_config.max_register)
+		syscon_config.max_register_is_0 = true;
 
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
 	kfree(syscon_config.name);
@@ -357,6 +359,9 @@ static int syscon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	syscon_config.max_register = resource_size(res) - 4;
+	if (!syscon_config.max_register)
+		syscon_config.max_register_is_0 = true;
+
 	if (pdata)
 		syscon_config.name = pdata->label;
 	syscon->regmap = devm_regmap_init_mmio(dev, base, &syscon_config);

-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
