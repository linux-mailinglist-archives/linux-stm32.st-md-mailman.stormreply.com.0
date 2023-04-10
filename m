Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE396DD695
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 11:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3525C6B460;
	Tue, 11 Apr 2023 09:27:55 +0000 (UTC)
Received: from hust.edu.cn (unknown [202.114.0.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A14FCC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 10:26:57 +0000 (UTC)
Received: from foreverowl-virtual-machine.localdomain ([10.12.168.97])
 (user=m202071378@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 33AAPOkn009938-33AAPOkq009938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 10 Apr 2023 18:25:24 +0800
From: YAN SHI <m202071378@hust.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 10 Apr 2023 18:25:01 +0800
Message-Id: <20230410102501.13246-1-m202071378@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-FEAS-AUTH-USER: m202071378@hust.edu.cn
X-Mailman-Approved-At: Tue, 11 Apr 2023 09:27:54 +0000
Cc: Dongliang Mu <dzm91@hust.edu.cn>, YAN SHI <m202071378@hust.edu.cn>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] Regulator: stm32-pwr: fix of_iomap leak
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

Smatch reports:
drivers/regulator/stm32-pwr.c:166 stm32_pwr_regulator_probe() warn:
'base' from of_iomap() not released on lines: 151,166.

In stm32_pwr_regulator_probe(), base is not released
when devm_kzalloc() fails to allocate memory or
devm_regulator_register() fails to register a new regulator device, 
which may cause a leak.

To fix this issue, replace of_iomap() with 
devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
is a specialized function for platform devices. 
It allows 'base' to be automatically released whether the probe
function succeeds or fails.

Besides, use IS_ERR(base) instead of !base 
as the return value of devm_platform_ioremap_resource() 
can either be a pointer to the remapped memory or 
an ERR_PTR() encoded error code if the operation fails.

Fixes: dc62f951a6a8 ("regulator: stm32-pwr: Fix return value check in stm32_pwr_regulator_probe()")
Signed-off-by: YAN SHI <m202071378@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
The issue is found by static analysis, and the patch remains untest.
---
 drivers/regulator/stm32-pwr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index 2a42acb7c24e..1df64e3513c6 100644
--- a/drivers/regulator/stm32-pwr.c
+++ b/drivers/regulator/stm32-pwr.c
@@ -136,10 +136,10 @@ static int stm32_pwr_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	int i, ret = 0;
 
-	base = of_iomap(np, 0);
-	if (!base) {
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Unable to map IO memory\n");
-		return -ENOMEM;
+		return PTR_ERR(base);
 	}
 
 	config.dev = &pdev->dev;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
