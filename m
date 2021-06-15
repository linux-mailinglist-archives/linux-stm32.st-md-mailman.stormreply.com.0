Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 206263A8487
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 17:49:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC795C597B0;
	Tue, 15 Jun 2021 15:49:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3E67C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 15:49:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7481B61864;
 Tue, 15 Jun 2021 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772167;
 bh=B60Ie+OjEirDWdruJwC0k9ONKwgVsf/7BWwlQr6AOtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bE6DHb4SQ++f39Pb2XHaX3IOqTDKdDC2ynOInAc5oNjQ27UfsVd8gakSZePPyChEG
 SOGODuV7I2yrV78tEdp36GtkaCyji0WIlWvo+0VETPlpbOWQHW4PX3JlMXoBfTVdGA
 WaJ6JmaIcE93PCkF18VZtS+LRpRUEURLV70CboMnrU8K83SPzCHDREVT6ZVsH6yKFT
 annPbEMMDIujewUQuVQKW3GDcR5lZVP9IwTosBxMBWpS/kwhZjKK47p65kphyVyYyv
 g/peHfT75R8I8nCiDBYp3pTeJW54N0Z81rFeiiVhcbfgiysx4/drI+Lvray/W1ffD0
 r8tFW1CX0KsFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 15 Jun 2021 11:48:52 -0400
Message-Id: <20210615154908.62388-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154908.62388-1-sashal@kernel.org>
References: <20210615154908.62388-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 15/30] spi: stm32-qspi: Always
	wait BUSY bit to be cleared in stm32_qspi_wait_cmd()
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

[ Upstream commit d38fa9a155b2829b7e2cfcf8a4171b6dd3672808 ]

In U-boot side, an issue has been encountered when QSPI source clock is
running at low frequency (24 MHz for example), waiting for TCF bit to be
set didn't ensure that all data has been send out the FIFO, we should also
wait that BUSY bit is cleared.

To prevent similar issue in kernel driver, we implement similar behavior
by always waiting BUSY bit to be cleared.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Link: https://lore.kernel.org/r/20210603073421.8441-1-patrice.chotard@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 2786470a5201..4f24f6392212 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -293,7 +293,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 	int err = 0;
 
 	if (!op->data.nbytes)
-		return stm32_qspi_wait_nobusy(qspi);
+		goto wait_nobusy;
 
 	if (readl_relaxed(qspi->io_base + QSPI_SR) & SR_TCF)
 		goto out;
@@ -314,6 +314,9 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 out:
 	/* clear flags */
 	writel_relaxed(FCR_CTCF | FCR_CTEF, qspi->io_base + QSPI_FCR);
+wait_nobusy:
+	if (!err)
+		err = stm32_qspi_wait_nobusy(qspi);
 
 	return err;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
