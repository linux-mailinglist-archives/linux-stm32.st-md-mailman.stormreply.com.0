Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C7366D9E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 16:07:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1B87C58D5C;
	Wed, 21 Apr 2021 14:07:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC96C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 14:07:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D226144D;
 Wed, 21 Apr 2021 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619014020;
 bh=Skq855dn4Yk8ZwBtQx47eXayXzk9s74Sg6+dno+4Ebw=;
 h=From:To:Cc:Subject:Date:From;
 b=A2iwB8xHmmW52ko7lImxPer4TrHRy06TLUnEw5x6ZCLapRg+MKpq0k8GCJWPhrhqS
 Q9g5G+px+nMsU3Mpy2L3hSvfiZqVK/LQqW0CsG4O2eRavgFPxvCp1BNpWIhjgHKp+k
 qEBKaOGGWyecjdjYxkEgy/c81IJrYRxPqJGBkUz3JhrVFpVA+M7pSSTClzxmHwEBj3
 aQL/ka9VddIrzvTp10WI/PWuBStazHXfAvPxo7G5HrxA+PG2TplPQO2QJz8Q4q6uVH
 Hptw4ZIN/SWSF7PK4hTTxBuG4wDLUXT2/ljZeXu34PquS1z8ohCtcFeT3PNqHMoVM/
 N+G6bcwVfi/VQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 21 Apr 2021 16:06:48 +0200
Message-Id: <20210421140653.3964725-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32-qspi: fix debug format string
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

From: Arnd Bergmann <arnd@arndb.de>

Printing size_t needs a special %zd format modifier to avoid a
warning like:

drivers/spi/spi-stm32-qspi.c:481:41: note: format string is defined here
  481 |         dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);

Fixes: 18674dee3cd6 ("spi: stm32-qspi: Add dirmap support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/spi/spi-stm32-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index e2a99f054551..7e640ccc7e77 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -478,7 +478,7 @@ static ssize_t stm32_qspi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	 * all needed transfer information into struct spi_mem_op
 	 */
 	memcpy(&op, &desc->info.op_tmpl, sizeof(struct spi_mem_op));
-	dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
+	dev_dbg(qspi->dev, "%s len = 0x%zx offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
 
 	op.data.nbytes = len;
 	op.addr.val = desc->info.offset + offs;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
