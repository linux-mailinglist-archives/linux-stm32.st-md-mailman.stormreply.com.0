Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 130075F9B0A
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Oct 2022 10:30:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1165C6410E;
	Mon, 10 Oct 2022 08:30:32 +0000 (UTC)
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 22555C04003 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Oct 2022 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4eL9r
 8jw9Yc+LnW3t0PByM/D4ZUtGdkfbKKYzje1sCA=; b=clnd2V0pDxGd98xbfqBm5
 d9IpbX8HB9PqZS6420ndPFdvvR3edqgTSSTbQHgnMhkUffnTsBp0j70Fo1zHvUQH
 zYqUOrZD8BLGq1vt2CU3H4eQDcrcMLat36fUa96IVVfQbtKtmoUH2tIh/4eNgAuD
 0ZP5q8M/ZuZaeRBJqFTdDk=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by smtp4 (Coremail) with SMTP id HNxpCgD3ba4whkJj26drjQ--.45619S2;
 Sun, 09 Oct 2022 16:28:33 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Sun,  9 Oct 2022 16:28:19 +0800
Message-Id: <20221009082819.2662964-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: HNxpCgD3ba4whkJj26drjQ--.45619S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5Gw4xArWUArb_yoW3AFb_t3
 W0qrWDWr129asakr18Cr1avryYyFs8G3yDArn0grs5J3srZw4DX34DZrnaya47Ar4YgFZ3
 Wwn5tr9xGa9rJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbuOJ7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbiVxGV+1etohKRzAAAs-
X-Mailman-Approved-At: Mon, 10 Oct 2022 08:30:31 +0000
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] nvmem: stm32: fix spelling typo in comment
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

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/nvmem/stm32-romem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index 354be526897f..0c206ad05be7 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -19,7 +19,7 @@
 #define STM32_SMC_WRITE_SHADOW		0x03
 #define STM32_SMC_READ_OTP		0x04
 
-/* shadow registers offest */
+/* shadow registers offset */
 #define STM32MP15_BSEC_DATA0		0x200
 
 /* 32 (x 32-bits) lower shadow registers */
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
