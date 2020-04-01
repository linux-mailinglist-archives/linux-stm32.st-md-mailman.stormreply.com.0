Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D605219B6A0
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 21:57:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92077C36B0E;
	Wed,  1 Apr 2020 19:57:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF826C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 19:57:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sxnR3JPMz1qrM1;
 Wed,  1 Apr 2020 21:57:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sxnR216bz1r0cc;
 Wed,  1 Apr 2020 21:57:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KNV0hCM_tGEZ; Wed,  1 Apr 2020 21:57:45 +0200 (CEST)
X-Auth-Info: jQiO9NpYBSZHs6DTFZLZ5C7RkVKt6h5mPpQXku8TjTs=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 21:57:45 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-mmc@vger.kernel.org
Date: Wed,  1 Apr 2020 21:57:21 +0200
Message-Id: <20200401195722.208157-2-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401195722.208157-1-marex@denx.de>
References: <20200401195722.208157-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] mmc: Return 1 from
	mmc_set_signal_voltage() if switch skipped
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

Adjust mmc_set_signal_voltage() to return 1 if the voltage switch was
skipped because the regulator voltage was already correct. This allows
drivers to detect such condition and possibly skip various voltage
switching extras.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Barre <ludovic.barre@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-mmc@vger.kernel.org
---
 drivers/mmc/core/regulator.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/core/regulator.c b/drivers/mmc/core/regulator.c
index b6febbcf8978..2805ea8a070e 100644
--- a/drivers/mmc/core/regulator.c
+++ b/drivers/mmc/core/regulator.c
@@ -136,6 +136,8 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
 						  int min_uV, int target_uV,
 						  int max_uV)
 {
+	int curr_voltage;
+
 	/*
 	 * Check if supported first to avoid errors since we may try several
 	 * signal levels during power up and don't want to show errors.
@@ -143,6 +145,14 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
 	if (!regulator_is_supported_voltage(regulator, min_uV, max_uV))
 		return -EINVAL;
 
+	/*
+	 * The voltage is already set, no need to switch.
+	 * Return 1 to indicate that no switch happened.
+	 */
+	curr_voltage = regulator_get_voltage(regulator);
+	if (curr_voltage == target_uV)
+		return 1;
+
 	return regulator_set_voltage_triplet(regulator, min_uV, target_uV,
 					     max_uV);
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
