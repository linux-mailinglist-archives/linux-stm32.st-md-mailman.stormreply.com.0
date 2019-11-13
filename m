Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15542FB4C5
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 17:15:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3A51C36B0B;
	Wed, 13 Nov 2019 16:15:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B3CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 16:15:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xADFv0TN018303; Wed, 13 Nov 2019 17:15:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5TjD38QBbB9//539GuMz/PLBV0iVGNkVN9JR03CqXQ0=;
 b=he75MF+09RUdlBB7NerTymiJ6V62+N8f6Ta9s8jqkBtOca1bzd6Z29AGIBZ/I3WXrRyC
 vK5kAjjgntsAoaN1/wNoCRI7hv7JA1IAxWprlTr1v25dQuO7cNbYpOXgc8al4Clz6vhq
 1GTd6zpO/2jEAWlQ27iSkhXMWGenHrUE0B+6enQYwNdjgow4sixX3GJEQjaex/h+RYwc
 J7qp+lVRhkCW1LhDzbM4+XmgmIaUX2k1dUpbn951taXHUI8Bs1wg6rEZj0B+KHc4Q7SM
 Dgp9Bgl09YiXyiqc63lzOf6rFV3bQ+pF5QPFrP39Z00tXZGR8dSIqUjOb8NThYWY4qf4 Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psjs5n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 17:15:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F1EC10002A;
 Wed, 13 Nov 2019 17:15:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83C532CFC6B;
 Wed, 13 Nov 2019 17:15:30 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 13 Nov 2019 17:15:29 +0100
From: Pascal Paillet <p.paillet@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 13 Nov 2019 17:15:29 +0100
Message-ID: <20191113161529.27739-1-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_04:2019-11-13,2019-11-13 signatures=0
Cc: p.paillet@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] regulator: stpmic1: Set a default ramp delay
	value
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

Set a default ramp delay value to the regulators with the worst
case value.

Signed-off-by: pascal paillet <p.paillet@st.com>
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
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
