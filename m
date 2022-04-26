Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE7511326
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Apr 2022 10:03:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58563C6046D;
	Wed, 27 Apr 2022 08:03:52 +0000 (UTC)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 5514FC5F1D6 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=d5llz
 nYDqD4Oykhgm+9HpjyKx1Xg8vbwgBkT6OoYxr4=; b=M+Pbnbq2pPZK1DNgdNwoc
 NzLXK3RtNBDQJ1vLyLvUrXDQo2Dp950OkQazE9oNuf2ZK1hM5tUxew5tgRrIPQXS
 esefB5bONX/Zz0/mYd0X88nNvjc2QLgSHkCf+Dnc+/9D9pinUvjKB9VcXU3er1CN
 jBsjldkI9Xhan8q9q6VFQw=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by smtp3 (Coremail) with SMTP id G9xpCgBXi52crWdirrz8DA--.31121S2;
 Tue, 26 Apr 2022 16:30:22 +0800 (CST)
From: Clement Wei <clementwei90@163.com>
To: mcoquelin.stm32@gmail.com
Date: Tue, 26 Apr 2022 16:30:19 +0800
Message-Id: <20220426083019.871525-1-clementwei90@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: G9xpCgBXi52crWdirrz8DA--.31121S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF18JFyDtr4fJw18ZFW8Zwb_yoW8GFWrpr
 sFgr909w4jkrW7K3Z7tryrtry3Ga90k3WFqws0vw4qqF4qyr40qr1jvr13JFWDWw4SyrWa
 qr1qgr4ayr9rGrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgucNUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5fohzv5qwzvxizq6il2tof0z/1tbiXB7ua1Xl2cxQyAAAs6
X-Mailman-Approved-At: Wed, 27 Apr 2022 08:03:51 +0000
Cc: xiaolinkui@kylinos.cn, linux-stm32@st-md-mailman.stormreply.com,
 Rongguang Wei <weirongguang@kylinos.cn>
Subject: [Linux-stm32] [PATCH] stmmac: fix typo
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

From: Rongguang Wei <weirongguang@kylinos.cn>

Fix spelling mistake: "clk_scr_i" -> "clk_csr_i"

Signed-off-by: Rongguang Wei <weirongguang@kylinos.cn>
---
 include/linux/stmmac.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 24eea1b05ca2..436b5efc08b7 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -28,12 +28,12 @@
  * This could also be configured at run time using CPU freq framework. */
 
 /* MDC Clock Selection define*/
-#define	STMMAC_CSR_60_100M	0x0	/* MDC = clk_scr_i/42 */
-#define	STMMAC_CSR_100_150M	0x1	/* MDC = clk_scr_i/62 */
-#define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_scr_i/16 */
-#define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
-#define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
-#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/122 */
+#define	STMMAC_CSR_60_100M	0x0	/* MDC = clk_csr_i/42 */
+#define	STMMAC_CSR_100_150M	0x1	/* MDC = clk_csr_i/62 */
+#define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_csr_i/16 */
+#define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_csr_i/26 */
+#define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_csr_i/102 */
+#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_csr_i/122 */
 
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
