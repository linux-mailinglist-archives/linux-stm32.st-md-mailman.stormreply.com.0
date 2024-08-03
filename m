Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA896946803
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 08:14:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD4BC7129D;
	Sat,  3 Aug 2024 06:14:54 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28EE8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2024 06:14:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WbXTx3mkxzxWBj;
 Sat,  3 Aug 2024 14:14:29 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
 by mail.maildlp.com (Postfix) with ESMTPS id C9ABD18007C;
 Sat,  3 Aug 2024 14:14:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:14:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <andersson@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <cuigaosheng1@huawei.com>
Date: Sat, 3 Aug 2024 14:14:43 +0800
Message-ID: <20240803061443.287117-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next] hwspinlock: stm32: Add missing
	clk_disable_unprepare in stm32_hwspinlock_probe
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

Add the missing clk_disable_unprepare() before return in
stm32_hwspinlock_probe().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..a4e3b9a9e29d 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -103,6 +103,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
 	if (ret) {
 		dev_err(dev, "Failed to register action\n");
+		clk_disable_unprepare(hw->clk);
 		return ret;
 	}
 
@@ -112,8 +113,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
 					0, STM32_MUTEX_NUM_LOCKS);
 
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to register hwspinlock\n");
+		clk_disable_unprepare(hw->clk);
+	}
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
