Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L+3MuiLsmkQNgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B879126FD68
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C833C900B5;
	Thu, 12 Mar 2026 09:48:24 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C272C90088
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 09:29:30 +0000 (UTC)
X-UUID: f45f256c1df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:4c02d704-ca6f-4871-95b2-ea056b94ca06, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:a07c265c81ec8ea205be13609e15f68e,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
 ,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f45f256c1df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <xiaopei01@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1485123681; Thu, 12 Mar 2026 17:29:22 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Date: Thu, 12 Mar 2026 17:28:58 +0800
Message-Id: <b9499692634a1cb6fe1244264c88aab733f4ae61.1773306858.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773306858.git.xiaopei01@kylinos.cn>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2026 09:48:20 +0000
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [Linux-stm32] [PATCH 06/17] spi: npcm-pspi: Use helper function
	devm_clk_get_enabled()
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
X-Spamd-Result: default: False [1.79 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:broonie@kernel.org,m:xiaopei01@kylinos.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[xiaopei01@kylinos.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,kylinos.cn:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B879126FD68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-npcm-pspi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index e60b3cc398ec..99fa866f4efc 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -361,27 +361,23 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		goto out_host_put;
 	}
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
+		dev_err(&pdev->dev, "failed to enable clock\n");
 		ret = PTR_ERR(priv->clk);
 		goto out_host_put;
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		goto out_host_put;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	/* reset SPI-HW block */
@@ -391,7 +387,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 			       "npcm-pspi", priv);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	init_completion(&priv->xfer_done);
@@ -415,15 +411,12 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret)
-		goto out_disable_clk;
+		goto out_host_put;
 
 	pr_info("NPCM Peripheral SPI %d probed\n", host->bus_num);
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->clk);
-
 out_host_put:
 	spi_controller_put(host);
 	return ret;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
