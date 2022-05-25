Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EC533E33
	for <lists+linux-stm32@lfdr.de>; Wed, 25 May 2022 15:49:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA065C03FCA;
	Wed, 25 May 2022 13:49:36 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B04AC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 May 2022 13:49:34 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17])
 by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1628e33e6953-0bef0;
 Wed, 25 May 2022 21:49:27 +0800 (CST)
X-RM-TRANSID: 2ee1628e33e6953-0bef0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.144.216])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9628e33e361e-d2f77;
 Wed, 25 May 2022 21:49:26 +0800 (CST)
X-RM-TRANSID: 2ee9628e33e361e-d2f77
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 25 May 2022 21:50:23 +0800
Message-Id: <20220525135023.6792-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: sai: Remove useless define
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

STM_SAI_IS_SUB_B(x) and STM_SAI_BLOCK_NAME(x) are
not being used, so remove them.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index d300605a2..4b33257c5 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -45,8 +45,6 @@
 #define STM_SAI_B_ID		0x1
 
 #define STM_SAI_IS_SUB_A(x)	((x)->id == STM_SAI_A_ID)
-#define STM_SAI_IS_SUB_B(x)	((x)->id == STM_SAI_B_ID)
-#define STM_SAI_BLOCK_NAME(x)	(((x)->id == STM_SAI_A_ID) ? "A" : "B")
 
 #define SAI_SYNC_NONE		0x0
 #define SAI_SYNC_INTERNAL	0x1
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
