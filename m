Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5B3681D1
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 15:50:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38D80C5719E;
	Thu, 22 Apr 2021 13:50:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8218CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 108BD61405;
 Thu, 22 Apr 2021 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619099407;
 bh=2oJtReQyaeTSDvRLl66IrFTBKN7fQSwFZowLXmrUk3A=;
 h=From:To:Cc:Subject:Date:From;
 b=s/qaYH7gxGP5emtXWIcBUyRq5DVNZh7XFCprfMm9WtRj/ECsrUCPYxl6x7rM7hqaB
 Bw1QtfNgid+lL2DECA6OFP0ThIwEg4Cdc9MYbZPFkHLgpk7yoGaitqpKOi6dCsXbqU
 GhhZWJcdRi90RAZIFlooIllt2Rx76fu+Dqaa26UO1L9q5SpraU1lN4KpNjjMEzaIwj
 D0tJX6+b1tCJA+5BdSkh+F+fBcxUgo9OBgujZKzjvMZZqTjgbWtdKf7Lg+/1DhlFMI
 XCxSBhSELKCXlwuQe+VkAg9oNaMZJUM+0GoXVsbs42ydIJ8uuWke4EnfW/ZgctK/Oj
 V7/AcMhVT1W/w==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 22 Apr 2021 15:38:57 +0200
Message-Id: <20210422134955.1988316-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] [v2] spi: stm32-qspi: fix debug format string
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

Printing size_t needs a special %zx format modifier to avoid a
warning like:

drivers/spi/spi-stm32-qspi.c:481:41: note: format string is defined here
  481 |         dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);

Patrice already tried to fix this, but picked %lx instead of %zx,
which fixed some architectures but broke others in the same way.
Using %zx works everywhere.

Fixes: 18674dee3cd6 ("spi: stm32-qspi: Add dirmap support")
Fixes: 1b8a7d4282c0 ("spi: stm32-qspi: Fix compilation warning in ARM64")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/spi/spi-stm32-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 02691c1603d9..7e640ccc7e77 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -478,7 +478,7 @@ static ssize_t stm32_qspi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	 * all needed transfer information into struct spi_mem_op
 	 */
 	memcpy(&op, &desc->info.op_tmpl, sizeof(struct spi_mem_op));
-	dev_dbg(qspi->dev, "%s len = 0x%lx offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
+	dev_dbg(qspi->dev, "%s len = 0x%zx offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
 
 	op.data.nbytes = len;
 	op.addr.val = desc->info.offset + offs;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
