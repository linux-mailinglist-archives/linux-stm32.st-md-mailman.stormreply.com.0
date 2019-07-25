Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D074CB3
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 13:17:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7AD4C24028;
	Thu, 25 Jul 2019 11:17:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C22BACFAC6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 11:17:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PBGKKY029109; Thu, 25 Jul 2019 13:16:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0lUCfEK3ONxg/NNCAgs3L5jocem76yi9BMRZQfOjHd8=;
 b=g6aBzlx7Y1CVz3yBYoHW1xxxNxME/UDCiStUnlGjRhsSgI7bvyFBjW8FB3wcLdmrn3vz
 U2J7wnY4KUQlV5VBdpvS10TpiOxVof2XFfk4EbPYBjPOF4SKu39HtaGv+LQGxGKpS+Yt
 BBqT8W3tARzEbisvSkYqvoyirPYOSAye/Us9g/sXuYoIgCUCORQtx86d4lXpg9rhk4Lw
 1JBEft1YrX7uMXGGYl9Jq/5TqDd8rCCqKOkHIzENSaMlaeFGnIXZevOPhAzRoPPEa9g4
 wKcJLNdnjawSPsZ/ZfiovRzdS/5LDNEXd24lDmRtAp3yOKJYu2iXS1J+g/G9yrZioZ82 Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx6083kb5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 25 Jul 2019 13:16:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE3FC31;
 Thu, 25 Jul 2019 11:16:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB4142AC2;
 Thu, 25 Jul 2019 11:16:57 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Jul
 2019 13:16:57 +0200
Received: from localhost (10.201.20.5) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 25 Jul 2019 13:16:56 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 25 Jul 2019 13:16:56 +0200
Message-ID: <1564053416-32192-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_04:, , signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pinctrl: stmfx: update pinconf settings
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

From: Alexandre Torgue <alexandre.torgue@st.com>

According to the following tab (coming from STMFX datasheet), updates
have to done in stmfx_pinconf_set function:

-"type" has to be set when "bias" is configured as "pull-up or pull-down"
-PIN_CONFIG_DRIVE_PUSH_PULL should only be used when gpio is configured as
 output. There is so no need to check direction.

DIR | TYPE | PUPD | MFX GPIO configuration
----|------|------|---------------------------------------------------
1   | 1    | 1    | OUTPUT open drain with internal pull-up resistor
----|------|------|---------------------------------------------------
1   | 1    | 0    | OUTPUT open drain with internal pull-down resistor
----|------|------|---------------------------------------------------
1   | 0    | 0/1  | OUTPUT push pull no pull
----|------|------|---------------------------------------------------
0   | 1    | 1    | INPUT with internal pull-up resistor
----|------|------|---------------------------------------------------
0   | 1    | 0    | INPUT with internal pull-down resistor
----|------|------|---------------------------------------------------
0   | 0    | 1    | INPUT floating
----|------|------|---------------------------------------------------
0   | 0    | 0    | analog (GPIO not used, default setting)

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d3332da..31b6e51 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -296,29 +296,29 @@ static int stmfx_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			ret = stmfx_pinconf_set_type(pctl, pin, 0);
+			if (ret)
+				return ret;
+			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
+			ret = stmfx_pinconf_set_type(pctl, pin, 1);
+			if (ret)
+				return ret;
 			ret = stmfx_pinconf_set_pupd(pctl, pin, 0);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			ret = stmfx_pinconf_set_pupd(pctl, pin, 1);
+			ret = stmfx_pinconf_set_type(pctl, pin, 1);
 			if (ret)
 				return ret;
-			break;
-		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-			if (!dir)
-				ret = stmfx_pinconf_set_type(pctl, pin, 1);
-			else
-				ret = stmfx_pinconf_set_type(pctl, pin, 0);
+			ret = stmfx_pinconf_set_pupd(pctl, pin, 1);
 			if (ret)
 				return ret;
 			break;
-		case PIN_CONFIG_DRIVE_PUSH_PULL:
-			if (!dir)
-				ret = stmfx_pinconf_set_type(pctl, pin, 0);
-			else
-				ret = stmfx_pinconf_set_type(pctl, pin, 1);
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			ret = stmfx_pinconf_set_type(pctl, pin, 1);
 			if (ret)
 				return ret;
 			break;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
