Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652D1A07A2
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Apr 2020 08:48:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E87C36B0B;
	Tue,  7 Apr 2020 06:48:56 +0000 (UTC)
Received: from qq.com (smtpbg477.qq.com [59.36.132.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF1F7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 06:48:52 +0000 (UTC)
X-QQ-mid: bizesmtp18t1586242114t31i3imq
Received: from localhost.localdomain (unknown [111.28.140.218])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 07 Apr 2020 14:48:32 +0800 (CST)
X-QQ-SSF: 01400000002000N0LK40B00A0000000
X-QQ-FEAT: M1J1ppP5VJu/IKvoalnukNKS6K1bq6+1e/GWW1pEr7NE+Hkf8UHRLSy7olpnN
 AqQ+pjrfSRc0Pk31q0iTRIF3syz2hrevJJtowOeSFyLWY4/sC7sv5FV5dBtUmnNc0Uf9+5b
 d4+LgGBsNR5FPXOP8ip1BS8Qzh079HnWuGn5Fg91Ezocnnrgp9zHLYT12NlZVJPAbAiL8tX
 gOUd8SaCAO1iq2U9iuBbw4Td+HOcj/3ajxSh8nYsa/BdFDmDrF8IP3vnObJcBKsUAqSp9zU
 HjDMcvraLlkODkN13LhOESe+9Guq6WFDU5/pjIbKUZjpYCI/ShytWuIommnGcYIBKtXw==
X-QQ-GoodBg: 2
From: xiaolinkui <xiaolinkui@tj.kylinos.cn>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com
Date: Tue,  7 Apr 2020 14:48:19 +0800
Message-Id: <20200407064819.16945-1-xiaolinkui@tj.kylinos.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgweb:qybgweb14
Cc: Jose.Abreu@synopsys.com, netdev@vger.kernel.org, linux@armlinux.org.uk,
 davem@davemloft.net, p.zabel@pengutronix.de,
 xiaolinkui <xiaolinkui@tj.kylinos.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: fix the wrong comment
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

Corrected the incorrect comment "clk_scr_i" to "clk_csr_i".

Signed-off-by: xiaolinkui <xiaolinkui@tj.kylinos.cn>
---
 include/linux/stmmac.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index fbafb353e9be..234641b34fd4 100644
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
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
