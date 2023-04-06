Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EB6DA95C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 09:22:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25832C6B456;
	Fri,  7 Apr 2023 07:22:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED19C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 17:30:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 019F564A7B;
 Thu,  6 Apr 2023 17:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763E8C433EF;
 Thu,  6 Apr 2023 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680802221;
 bh=uTezeCfzpYKuhuhU2D8QgaY4IY+HPF1/VqkokcAEH/s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=asWJygQgC55dAkjx6udpdZntn9zuHt+kcQ0wgfPkXijrhvumhv4d/EdkWjZEHE7N+
 yQ9SaMwOJrnlBbTp5gMzf0WuZR6An4wuvhlKq2VTDDN7QWKJ+PFershPATGcWAZqHO
 5W9BmCuXhTOb73ykf4CFUIIX0dMjlDlXoa9Y7finaHR447+dLH1oGzE4KthCFZNQB4
 OWacI/iuswF2dqqdr+nS1SlS0t6eDREd4RYsfrZ9UgjrnpVaGChDZqcNkroTRPYeUe
 P7+WiNdpj3HseW4keCiCN2oq67bx0VL2IAwOaid3tZFAg5Q0KAeMJRz0UhxcaRM9M1
 A6OsHLO0kcUkA==
From: Simon Horman <horms@kernel.org>
Date: Thu, 06 Apr 2023 19:30:10 +0200
MIME-Version: 1.0
Message-Id: <20230406-dwmac-anarion-sparse-v1-2-b0c866c8be9d@kernel.org>
References: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
In-Reply-To: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Fri, 07 Apr 2023 07:22:33 +0000
Cc: netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-anarion:
 Always return struct anarion_gmac * from anarion_config_dt()
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

Always return struct anarion_gmac * from anarion_config_dt().
In the case where ctl_block was an error pointer it was being
returned directly. Which sparse flags as follows:

 .../dwmac-anarion.c:73:24: warning: incorrect type in return expression (different address spaces)
 .../dwmac-anarion.c:73:24:    expected struct anarion_gmac *
 .../dwmac-anarion.c:73:24:    got void [noderef] __iomem *[assigned] ctl_block

Avoid this by converting the error pointer to an error.
And then reversing the conversion.

As a side effect, the error can be used for logging purposes,
subjectively, leading to a minor cleanup.

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 2357e77434fb..9354bf419112 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -68,9 +68,9 @@ static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
 
 	ctl_block = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(ctl_block)) {
-		dev_err(&pdev->dev, "Cannot get reset region (%ld)!\n",
-			PTR_ERR(ctl_block));
-		return ctl_block;
+		err = PTR_ERR(ctl_block);
+		dev_err(&pdev->dev, "Cannot get reset region (%d)!\n", err);
+		return ERR_PTR(err);
 	}
 
 	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);

-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
