Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2FA79F88
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 11:08:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50EB7C78F85;
	Thu,  3 Apr 2025 09:08:03 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4352C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 07:41:55 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZStwd126qz5B1J4;
 Thu,  3 Apr 2025 15:41:53 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl2.zte.com.cn with SMTP id 5337fetw066040;
 Thu, 3 Apr 2025 15:41:40 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Thu, 3 Apr 2025 15:41:42 +0800 (CST)
Date: Thu, 3 Apr 2025 15:41:42 +0800 (CST)
X-Zmail-TransId: 2af967ee3bb677c-3db59
X-Mailer: Zmail v1.0
Message-ID: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <olivier.moysan@foss.st.com>
X-MAIL: mse-fl2.zte.com.cn 5337fetw066040
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3BC1.001/4ZStwd126qz5B1J4
X-Mailman-Approved-At: Thu, 03 Apr 2025 09:08:02 +0000
Cc: linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn, tiwai@suse.com,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, yang.yang29@zte.com.cn,
 broonie@kernel.org, xu.xin16@zte.com.cn, mcoquelin.stm32@gmail.com,
 ye.xingchen@zte.com.cn, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH=5D_sound=3A_soc=3A_stm=3A_stm32?=
	=?utf-8?b?X3NhaTogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 sound/soc/stm/stm32_sai.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 504a14584765..fa821e3fb427 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -169,20 +169,14 @@ static int stm32_sai_get_parent_clk(struct stm32_sai_data *sai)
 	struct device *dev = &sai->pdev->dev;

 	sai->clk_x8k = devm_clk_get(dev, "x8k");
-	if (IS_ERR(sai->clk_x8k)) {
-		if (PTR_ERR(sai->clk_x8k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x8k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x8k));
-		return PTR_ERR(sai->clk_x8k);
-	}
+	if (IS_ERR(sai->clk_x8k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x8k),
+				     "missing x8k parent clock\n");

 	sai->clk_x11k = devm_clk_get(dev, "x11k");
-	if (IS_ERR(sai->clk_x11k)) {
-		if (PTR_ERR(sai->clk_x11k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x11k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x11k));
-		return PTR_ERR(sai->clk_x11k);
-	}
+	if (IS_ERR(sai->clk_x11k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x11k),
+				     "missing x11k parent clock\n");

 	return 0;
 }
-- 
2.25.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
