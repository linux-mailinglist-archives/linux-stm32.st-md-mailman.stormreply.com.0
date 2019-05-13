Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1A1B128
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:30:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55E8CC06B7F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:30:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5D95C06B7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:30:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4D7QM1I009050; Mon, 13 May 2019 09:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bURCBAue+7AyVWgZbYBJxzJiyLeB1d3yp/jM0DfADTU=;
 b=w5r30mezaFZfl7jNNnVNJBezsOhfZikY7nVPMZ+/ame+5Zq/sSr42IqClHXTF/tKMbFV
 nfxMdgOdbchEB8YQb43ZjMJG4oIMjRa37j4A14DHo0YfSNfRdroepmCd6TMMEqLIHs4a
 95nQX7fU16DnnEgaS+7ntboGSc+API5ZZTWcpvhDLYFyoaWyK8LoeHSf3acYFdLdBe6j
 85lgjymtnF4UNA13xo8WhhvCFjDlrFqAISR76q1OOISpK9iMhfggirL7LA+AXYf32kpB
 BI7GmjLUKV02lmCbNiD4LZOTR4cuahQBBfJYY3tKDuKBLDYm7ROFT2441a3Se5jM9YoE mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9fhe80-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 09:30:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C69943A;
 Mon, 13 May 2019 07:30:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 987B5141A;
 Mon, 13 May 2019 07:30:08 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 09:30:08 +0200
Received: from localhost (10.201.20.5) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 13 May 2019 09:30:07 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 13 May 2019 09:30:06 +0200
Message-ID: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_05:, , signatures=0
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, kbuild-all@01.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix comparison of unsigned
	expression warnings
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

This patch fixes the following warnings:

drivers/pinctrl/pinctrl-stmfx.c:225:5-8: WARNING: Unsigned expression
compared with zero: dir < 0
drivers/pinctrl/pinctrl-stmfx.c:231:5-9: WARNING: Unsigned expression
compared with zero: pupd < 0
drivers/pinctrl/pinctrl-stmfx.c:228:5-9: WARNING: Unsigned expression
compared with zero: type < 0

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index bcd8126..3bd5d6f 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -213,7 +213,7 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
 	struct stmfx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
 	struct pinctrl_gpio_range *range;
-	u32 dir, type, pupd;
+	int dir, type, pupd;
 	u32 arg = 0;
 	int ret;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
