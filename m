Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D653768DB2
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3131EC6C822;
	Mon, 31 Jul 2023 07:17:27 +0000 (UTC)
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com
 [203.205.221.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B76BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1689436574;
 bh=Q4AIE3ORkFkez9a9uTEasaw5aPDPog8DGCyhlYhijtQ=;
 h=From:To:Cc:Subject:Date;
 b=l4roMFnIZh9BbEdmleocIhUX0QBk+WyKibPJLQGnEHAVB+22banQNPCr83g7y8ymf
 4z7KOxCdsVdYHkbA7stcKgCWjZRvTy95NPuzJy4GSVPlL7lBphVKXGIVuWiDsvRglK
 z0lqv/iURpDnJD5q4QqYTUOn21yyoQxZ8M7NEGLk=
Received: from KernelDevBox.byted.org ([180.184.49.4])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id DF305C36; Sat, 15 Jul 2023 23:55:51 +0800
X-QQ-mid: xmsmtpt1689436551toyuslagu
Message-ID: <tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com>
X-QQ-XMAILINFO: Mh1dUllL/+A2vhqHkhb7/gbp7caHWu3yMPEaqAyj5XA8papyHBSXtvAfD/ZjW3
 C4kT0qRyiZZKbdkqCYuxPuM9KQO8fzJ/ju1Ab8Pds4sdFaTl3RnLpBWT7mFN3HJaq9Bo/MPvh31B
 VfUEXkWQR6WzB2VrYboWIhWpWuwmnZSIIpn0ZFVQqcxixa3Iam3ai8+k1ZrCM/tZwAQF328cdCNi
 zM6z6E0JnfFqyAPER780NcHNyGGxIbhabC4r674y17MelD9RJRL74b2TFr60cvR1ZthrcGfn1GFP
 UGkGu++cyhOF37to76jS4umSneMTn4JmLH33y7G1yO6x1HpynmCNj+G8Oc3dRXQux2/kcP8MXKRx
 15jmN5YKDvnjstk4WGF6GJCcGT0oZ9VnyQOdt6ikh+RzjPMM/L8C8JcEM+FbeMIUba2giTmurVj+
 REJnfM3DiZH5YrTNUvIR0zeZVjwJGNjkGRlMZkY6aQnzXsb8wthhjdBlHYMxHNDS5FPElAESdN5+
 /tp0YWENXjW/F1vn7FhBxor7suyS6+UdXy8+gYu8wA8NpEXjoIfRBhQDpX1ZoQc3b537VxBR5IUu
 uF+Ke1KSmyuMSYY/KnCzLPCBmOAXvJb8IOUH5CScml1b7Xh9BujIqIGK792Q6lgH7A9UddFC9AzB
 TAEXPefm+fLuN6Y3mC/ek0jjWgpgVN30AZgR3BW9WB5Gq/PfOggAgzcVLRpqthSzqUaY0GAkXMho
 zxMQTeuGFc9aX3I3cFmTWODlrX69jiO5+eap74ZB2NeMnH93qKhK79o267XTzhnK8z7S/+xzz1VT
 oUxa1pYgGLmT5l/4FHiBTIrrFlRFNOQrf4fo78r+Cha5Zy3km/qSULIqXl8LsLGu8MTr8j+hzChM
 tKUuUcUe/xhWmPv3Hy7YVfnwa/vWSowwY+gR1CeYGoAL/CwIqEugA3m5945C883OYJ/fON0b3L3t
 0zTxRDb/JE+35a3SbEPet/LUVTXHPsr5U187AvQTrktEn0jD01flhEtxGgcXnPdJzfCgV+/gqlLz
 pL2Cqzuw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jic23@kernel.org
Date: Sat, 15 Jul 2023 23:55:50 +0800
X-OQ-MSGID: <20230715155550.2306245-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [Linux-stm32] [PATCH] io: adc: stm32-adc: fix potential NULL
	pointer dereference in stm32_adc_probe()
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

of_match_device() may fail and returns a NULL pointer.

Fix this by checking the return value of of_match_device().

Fixes: 64ad7f6438f3 ("iio: adc: stm32: introduce compatible data cfg")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/iio/adc/stm32-adc-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 48f02dcc81c1..70011fdbf5f6 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -706,6 +706,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	struct stm32_adc_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id;
+
 	struct resource *res;
 	u32 max_rate;
 	int ret;
@@ -718,8 +720,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, &priv->common);
 
-	priv->cfg = (const struct stm32_adc_priv_cfg *)
-		of_match_device(dev->driver->of_match_table, dev)->data;
+	of_id = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_id)
+		return -ENODEV;
+
+	priv->cfg = (const struct stm32_adc_priv_cfg *)of_id->data;
 	priv->nb_adc_max = priv->cfg->num_adcs;
 	spin_lock_init(&priv->common.lock);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
