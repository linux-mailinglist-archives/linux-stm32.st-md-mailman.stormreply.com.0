Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D55420AD
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jun 2022 03:53:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E24EDC0D2C0;
	Wed,  8 Jun 2022 01:53:36 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1995C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jun 2022 01:53:35 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHqw05xKSzgcdJ;
 Wed,  8 Jun 2022 09:51:44 +0800 (CST)
Received: from CHINA (10.175.102.38) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 8 Jun
 2022 09:53:32 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 8 Jun 2022 02:11:54 +0000
Message-ID: <20220608021154.990347-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH -next] clk: stm32: rcc_reset: Fix missing
	spin_lock_init()
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

The driver allocates the spinlock but not initialize it.
Use spin_lock_init() on it to initialize it correctly.

Fixes: 637cee5ffc71 ("clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/stm32/reset-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index 040870130e4b..e89381528af9 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -111,6 +111,7 @@ int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
 	if (!reset_data)
 		return -ENOMEM;
 
+	spin_lock_init(&reset_data->lock);
 	reset_data->membase = base;
 	reset_data->rcdev.owner = THIS_MODULE;
 	reset_data->rcdev.ops = &stm32_reset_ops;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
