Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7D800639
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 09:51:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A57EFC6C85B;
	Fri,  1 Dec 2023 08:51:12 +0000 (UTC)
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD072C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 08:16:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ShQrW2cCFz4f3l2K
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 16:16:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 6390C1A0B97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 16:16:45 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
 by APP1 (Coremail) with SMTP id cCh0CgCn9gxplmllkWe4CQ--.30052S4;
 Fri, 01 Dec 2023 16:16:45 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  1 Dec 2023 16:20:48 +0800
Message-Id: <20231201082048.1975940-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgCn9gxplmllkWe4CQ--.30052S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW8trW8Aw4ktrW8uF1kGrg_yoWfJrg_CF
 1xZ3yIgFyIgFy7Aw1qv3WUX34F9rZ8urWvgws2vw45GFy7Zw4Yqr10qwsayry7CrWDKF95
 AF97tw1SvrnFyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUboAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
 0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
 daVFxhVjvjDU0xZFpf9x07UGYL9UUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/
X-Mailman-Approved-At: Fri, 01 Dec 2023 08:51:11 +0000
Cc: yangyingliang@huawei.com, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH] hwrng: stm32 - add missing
	clk_disable_unprepare() in stm32_rng_init()
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

From: Yang Yingliang <yangyingliang@huawei.com>

Add clk_disable_unprepare() in the error path in stm32_rng_init().

Fixes: 6b85a7e141cb ("hwrng: stm32 - implement STM32MP13x support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/char/hw_random/stm32-rng.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 41e1dbea5d2e..efd6edcd7066 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -325,6 +325,7 @@ static int stm32_rng_init(struct hwrng *rng)
 							(!(reg & RNG_CR_CONDRST)),
 							10, 50000);
 		if (err) {
+			clk_disable_unprepare(priv->clk);
 			dev_err((struct device *)priv->rng.priv,
 				"%s: timeout %x!\n", __func__, reg);
 			return -EINVAL;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
