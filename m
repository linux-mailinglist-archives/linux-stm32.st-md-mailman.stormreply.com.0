Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB662AE4975
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 18:00:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D8A6C32E92;
	Mon, 23 Jun 2025 16:00:46 +0000 (UTC)
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FBA7C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:31:52 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bQnWh4Mb7z4xPSq;
 Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Received: from njy2app02.zte.com.cn ([10.40.13.116])
 by mse-fl1.zte.com.cn with SMTP id 55NCVeuH048305;
 Mon, 23 Jun 2025 20:31:40 +0800 (+08)
 (envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app03[null]) by mapi (Zmail) with MAPI id mid201;
 Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Date: Mon, 23 Jun 2025 20:31:44 +0800 (CST)
X-Zmail-TransId: 2afb68594930fffffffff5f-67598
X-Mailer: Zmail v1.0
Message-ID: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <pierre-yves.mordret@foss.st.com>
X-MAIL: mse-fl1.zte.com.cn 55NCVeuH048305
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68594930.002/4bQnWh4Mb7z4xPSq
X-Mailman-Approved-At: Mon, 23 Jun 2025 16:00:45 +0000
Cc: andi.shyti@kernel.org, linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
 xu.lifeng1@zte.com.cn, linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 ouyang.maochun@zte.com.cn, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mou.yi@zte.com.cn
Subject: [Linux-stm32] =?utf-8?q?PATCH=5D_i2c=3A_stm32f7=3A_Use_str=5Fon?=
	=?utf-8?q?=5Foff=28=29_helper?=
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e4aaeb2262d0..ef15475a7ee1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -34,6 +34,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 #include "i2c-stm32.h"

@@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
 		setup->rise_time, setup->fall_time);
 	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
-		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
+		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);

 	i2c_dev->bus_rate = setup->speed_freq;

-- 
2.25.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
