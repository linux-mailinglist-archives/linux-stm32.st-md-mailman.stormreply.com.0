Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92B537D4A
	for <lists+linux-stm32@lfdr.de>; Mon, 30 May 2022 15:42:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1CF6C5C829;
	Mon, 30 May 2022 13:42:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAF90C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 May 2022 13:42:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54897B80DB7;
 Mon, 30 May 2022 13:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A9BC3411E;
 Mon, 30 May 2022 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918120;
 bh=63KEk9VLTggDHYa7uCWhw1ThCahBRf68liu0x9+Y4Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TTcW2MYvIkbIbrzn/OE2PDUCuW3r3PB2V0fSjrYachInBVGD695908LeEbx1X/c1v
 RIjTN/XRGQLJDs8zr+jm0OGr7C3rL4UO5lEMNKd8Oudd7OIzlckkPXKIB6xogxAwxU
 QlqIVImJ3wxbHn5MGu9bmuiyivq6K9YvdscAxV1a63JyLychr8SvBZz3piV4DTVOcH
 Cvrn4vYOR+xoyy4D9cNQHmyvGUONbuYJ6LC1iP/tIIWxLOWH51O7bbE43ob98t124K
 aRuwNrBQXF4ir9BBVbmPTnn82tsejVOTmZ28yjkkC60E3rI9Kq+e1DhVdDsjrTM6CS
 lHZscwjPDH9JA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 30 May 2022 09:37:44 -0400
Message-Id: <20220530133825.1933431-68-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 eberhard.stoll@kontron.de, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.15 068/109] spi: stm32-qspi: Fix
	wait_cmd timeout in APM mode
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

[ Upstream commit d83d89ea68b4726700fa87b22db075e4217e691c ]

In APM mode, TCF and TEF flags are not set. To avoid timeout in
stm32_qspi_wait_cmd(), don't check if TCF/TEF are set.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reported-by: eberhard.stoll@kontron.de
Link: https://lore.kernel.org/r/20220511074644.558874-2-patrice.chotard@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index ffdc55f87e82..dd38cb8ffbc2 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -308,7 +308,8 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 	if (!op->data.nbytes)
 		goto wait_nobusy;
 
-	if (readl_relaxed(qspi->io_base + QSPI_SR) & SR_TCF)
+	if ((readl_relaxed(qspi->io_base + QSPI_SR) & SR_TCF) ||
+	    qspi->fmode == CCR_FMODE_APM)
 		goto out;
 
 	reinit_completion(&qspi->data_completion);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
