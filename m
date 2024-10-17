Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA19A1996
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 06:07:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0BBCC78032;
	Thu, 17 Oct 2024 04:07:11 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8016C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1729138020; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Iwz05P1p61sVpu5xupITnxxL612xYYGx4kkmJtzWbM8=;
 b=MaFRQ/4qlciqS3ELGqQnLYDhVCTLSkghW1OX3BD2I5G/UKaI/09kg7BBYvh09CB27d0oRVzmnbYAT2F3Jk1F3T+Mqu1p18PonyaAGE5+wDgkIEFV4poS6COqivNVw//z2wMCdj6NQmfPll1nOnTEx+JZtnsote2C38oZe32pnlw=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WHJR90w_1729138018 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 17 Oct 2024 12:06:59 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Thu, 17 Oct 2024 12:06:57 +0800
Message-Id: <20241017040657.33992-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next] phy: stm32: Remove unneeded semicolon
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

This patch removes an unneeded semicolon after a switch statement.

./drivers/phy/st/phy-stm32-combophy.c:226:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11403
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/phy/st/phy-stm32-combophy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index e1e7083ccb5f..765bb34fe358 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -223,7 +223,7 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 	default:
 		dev_err(combophy->dev, "Invalid rate 0x%x\n", clk_rate);
 		return -EINVAL;
-	};
+	}
 
 	cr1_mask |= SYSCFG_COMBOPHY_CR1_REFCLKDIV2;
 	cr1_val |= REFCLDIV_0;
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
