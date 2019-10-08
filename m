Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14782CF8B2
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2019 13:42:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5432C36B0C;
	Tue,  8 Oct 2019 11:42:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8F90C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 11:42:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x98BesFt005862; Tue, 8 Oct 2019 13:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JZ29o3+ZA5x48x8+yCCPyxRuo1rTg5MroHIYryI/F3c=;
 b=LempFh1Xlla+0GUWqcqrMNqJTOx1DFSj02f0oYlIGwTNiroRG51+Pt80DQ+R8llxMluq
 GRry1sBSVssoH4J4s6U0FzLfcEMwAqAMh08xU+2PdkDlEUt5iPYsgW/fvAgrVlkjpRuo
 8shy6xDyiign0oIshGl7hQguuuhNHm7O+UIdtEqH4w5VAAZ5FazUCjlPkcMubO01NF3N
 qm60avg/xJmeThj3w2VPhYbWql+x2G2r5MD4ACkkgp0vhkJmrSOshbXd1DHeszEKrccG
 uHdB4htnX4OoWP+f5fsHKPRf2Nv2XIZX1K4jWi8QTRMbYK0OUBf5qyKyMsg0o43/evk7 og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxvqwq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 13:41:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 831D710002A;
 Tue,  8 Oct 2019 13:41:47 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 766142B8A64;
 Tue,  8 Oct 2019 13:41:47 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 8 Oct 2019
 13:41:47 +0200
Received: from localhost (10.48.0.192) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 8 Oct 2019 13:41:46 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Date: Tue, 8 Oct 2019 13:41:27 +0200
Message-ID: <1570534887-26181-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_04:2019-10-08,2019-10-08 signatures=0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: add comment to better describe
	breakinput feature
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

Add a comment to better describe the purpose of breakinput feature that
can be found on some STM32 timer instances. Briefly comment on the
characteristics of this input for PWM, and pinmuxing as suggested in [1].

[1] https://lkml.org/lkml/2019/10/1/207

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/pwm/pwm-stm32.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 359b085..6406ebb 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -522,8 +522,14 @@ static int stm32_pwm_apply_breakinputs(struct stm32_pwm *priv,
 					     sizeof(struct stm32_breakinput));
 
 	/*
+	 * Some timer instances can have BRK input pins (e.g. basically a fault
+	 * pin from the output power stage). The break feature allows a safe
+	 * shut-down of the PWM outputs to a predefined state. Further details
+	 * are available in application note AN4277, "Using STM32 device PWM
+	 * shut-down features..."
 	 * Because "st,breakinput" parameter is optional do not make probe
-	 * failed if it doesn't exist.
+	 * failed if it doesn't exist. The pinctrl handle must hold the BRK
+	 * pin(s) when using "st,breakinput" property.
 	 */
 	if (nb <= 0)
 		return 0;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
