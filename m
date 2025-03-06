Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F192A540D1
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 03:47:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C55E9C78F6E;
	Thu,  6 Mar 2025 02:47:33 +0000 (UTC)
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B8F3C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 02:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1741229248; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=cydds6dcxAFRZNEZZYF8UB6twxkEdfSrIDqXvVzSON8=;
 b=c+M8MZHagkMJmSY8ANFKTpaa5lI+SdkeUVTzZEkNr0Dgd5lILu4vkuICDw1Pa0OpM+N/QFOYjAklNSSuyFpCI9GbO3eMcCKloj4CH8RVq061sd3oaEe29rrByTsusv3t9u8Kf66a7x99Lz9k+oTxpi4rM1llLc6sVvcJAy7RdM8=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WQn5zoS_1741229237 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 06 Mar 2025 10:47:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: broonie@kernel.org
Date: Thu,  6 Mar 2025 10:47:16 +0800
Message-Id: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next] spi: stm32: Remove unnecessary print
	function dev_err()
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

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/spi/spi-stm32-ospi.c:798:2-9: line 798 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19220
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/spi/spi-stm32-ospi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..114ebb1516d4 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -794,10 +794,8 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	}
 
 	ospi->irq = platform_get_irq(pdev, 0);
-	if (ospi->irq < 0) {
-		dev_err(dev, "Can't get irq %d\n", ospi->irq);
+	if (ospi->irq < 0)
 		return ospi->irq;
-	}
 
 	ret = devm_request_irq(dev, ospi->irq, stm32_ospi_irq, 0,
 			       dev_name(dev), ospi);
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
