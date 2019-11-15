Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A6FDD70
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 13:25:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B327EC36B0B;
	Fri, 15 Nov 2019 12:25:11 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D36FEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=fz8jcrh/IFmNSf19R75zpgiaL6oK1a5JOhUgpBqW6fc=; b=HjTNCn/EvDkn
 RhKF2VsqyIx3Q2q0f/KdcCi9w5udwexkzZ/i1+AwwbhOJu3oquvRWaL7eKb0kwVLXmj0V9a3d0HC/
 OW8v5b5HVBZjZqLQvVOjwmb0/JsvjRPNA3HvNx7yQb/NsvCX7DgWUOpz16q1WwH1D1AV8WXHUotP1
 FyB1M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaey-0000Kt-GT; Fri, 15 Nov 2019 12:25:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 02ABF27415A7; Fri, 15 Nov 2019 12:25:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pascal Paillet <p.paillet@st.com>
In-Reply-To: <20191113161529.27739-1-p.paillet@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122508.02ABF27415A7@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:07 +0000 (GMT)
Cc: p.paillet@st.com, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] Applied "regulator: stpmic1: Set a default ramp delay
	value" to the regulator tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The patch

   regulator: stpmic1: Set a default ramp delay value

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9ebde17c5d0387a5e1f71e687ac35d36e01208cc Mon Sep 17 00:00:00 2001
From: Pascal Paillet <p.paillet@st.com>
Date: Wed, 13 Nov 2019 17:15:29 +0100
Subject: [PATCH] regulator: stpmic1: Set a default ramp delay value

Set a default ramp delay value to the regulators with the worst
case value.

Signed-off-by: pascal paillet <p.paillet@st.com>
Link: https://lore.kernel.org/r/20191113161529.27739-1-p.paillet@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/stpmic1_regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index f09061473613..f3d7d007ecbb 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -54,6 +54,8 @@ enum {
 
 /* Enable time worst case is 5000mV/(2250uV/uS) */
 #define PMIC_ENABLE_TIME_US 2200
+/* Ramp delay worst case is (2250uV/uS) */
+#define PMIC_RAMP_DELAY 2200
 
 static const struct regulator_linear_range buck1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(725000, 0, 4, 0),
@@ -208,6 +210,7 @@ static const struct regulator_ops stpmic1_switch_regul_ops = {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
+	.ramp_delay = PMIC_RAMP_DELAY, \
 	.supply_name = #base, \
 }
 
@@ -227,6 +230,7 @@ static const struct regulator_ops stpmic1_switch_regul_ops = {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
+	.ramp_delay = PMIC_RAMP_DELAY, \
 	.bypass_reg = LDO3_ACTIVE_CR, \
 	.bypass_mask = LDO_BYPASS_MASK, \
 	.bypass_val_on = LDO_BYPASS_MASK, \
@@ -248,6 +252,7 @@ static const struct regulator_ops stpmic1_switch_regul_ops = {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
+	.ramp_delay = PMIC_RAMP_DELAY, \
 	.supply_name = #base, \
 }
 
@@ -267,6 +272,7 @@ static const struct regulator_ops stpmic1_switch_regul_ops = {
 	.enable_val = 1, \
 	.disable_val = 0, \
 	.enable_time = PMIC_ENABLE_TIME_US, \
+	.ramp_delay = PMIC_RAMP_DELAY, \
 	.of_map_mode = stpmic1_map_mode, \
 	.pull_down_reg = ids##_PULL_DOWN_REG, \
 	.pull_down_mask = ids##_PULL_DOWN_MASK, \
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
