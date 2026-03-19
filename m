Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHjfLa9Zu2lfjAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 03:04:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C232C4B15
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 03:04:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CC5C8F29B;
	Thu, 19 Mar 2026 02:04:31 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC245C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 02:04:29 +0000 (UTC)
X-UUID: f582e0ea233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:e918a92d-3266-4741-8843-5ab7bb1fa260, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:9730383e14a457566eca870e6a4b8b8f,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
 ,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f582e0ea233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <xiaopei01@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 91165205; Thu, 19 Mar 2026 10:04:27 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
 Frank.Li@nxp.com, amelie.delaunay@foss.st.com
Date: Thu, 19 Mar 2026 10:04:13 +0800
Message-Id: <611b4c4b67aaa8d86a7aeba9707ada47e6fd5dc3.1773885292.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [Linux-stm32] [PATCH v5 17/17] spi: zynqmp-gqspi: Simplify clock
	handling with devm_clk_get_enabled()
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[xiaopei01@kylinos.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:amelie.delaunay@foss.st.com,m:xiaopei01@kylinos.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,kylinos.cn:email,kylinos.cn:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A3C232C4B15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
the need for explicit clock enable and disable calls, as the managed
API automatically disables the clocks on device removal or probe
failure.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error paths and the remove callback.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-zynqmp-gqspi.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 502fd5eccc83..a7e135607e2a 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1244,26 +1244,16 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(xqspi->regs))
 		return PTR_ERR(xqspi->regs);
 
-	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xqspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xqspi->pclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->pclk),
 				     "pclk clock not found.\n");
 
-	xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
+	xqspi->refclk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
 	if (IS_ERR(xqspi->refclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->refclk),
 				     "ref_clk clock not found.\n");
 
-	ret = clk_prepare_enable(xqspi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Unable to enable APB clock.\n");
-
-	ret = clk_prepare_enable(xqspi->refclk);
-	if (ret) {
-		dev_err(dev, "Unable to enable device clock.\n");
-		goto clk_dis_pclk;
-	}
-
 	init_completion(&xqspi->data_completion);
 
 	mutex_init(&xqspi->op_lock);
@@ -1339,9 +1329,6 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	clk_disable_unprepare(xqspi->refclk);
-clk_dis_pclk:
-	clk_disable_unprepare(xqspi->pclk);
 
 	return ret;
 }
@@ -1368,8 +1355,6 @@ static void zynqmp_qspi_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	clk_disable_unprepare(xqspi->refclk);
-	clk_disable_unprepare(xqspi->pclk);
 }
 
 MODULE_DEVICE_TABLE(of, zynqmp_qspi_of_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
