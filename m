Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FED419916
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 09:42:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEA0C6411E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 07:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92571C6411F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 07:42:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4A7cWJe028672; Fri, 10 May 2019 09:42:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Q4CttDSeHlGs3NyMtzY/R45bn2jdu2ftuKzuZpOJ83E=;
 b=lhNNj13PJ8w6uEjIvetr4ONcJ5zGcFiLzeeEtym0o5IxMHTBS2FCLdhS2GbTtLYck3CL
 hXMv1hp2RwH0N8GXywkZPgbhNgLrQddNjHYhKL9jea1id2YGjfbNfIqH6jpSxicGn6bS
 XZzk/JxOpheseE5PiRMuges+urbv3NZji9r3RaDmkJauOhEaAAHWVDkz1iMBRmqARBtL
 jmm7lzlCvbAoxEmZTw/8btxLzwOmgtE4tIp8xX3xK9nnti2sisZBtMXV21pN/4lxU4ry
 W5KjYrVDYpeHwOPUskASybPKzyDenH1tliEuBQyvV98pW2czd3e/x2LZ4gH4tPXmWOu6 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4gpn7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 09:42:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69EEC3A;
 Fri, 10 May 2019 07:42:37 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F6315AB;
 Fri, 10 May 2019 07:42:37 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May 2019 09:42:36
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Date: Fri, 10 May 2019 09:42:30 +0200
Message-ID: <1557474150-19618-3-git-send-email-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: Enable suspend/resume for
	stm32mp157c SoC
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

Apply suspend/resume management for stm32mp157c MPU.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
index 320544f..2ccb99d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
@@ -2342,11 +2342,16 @@ static const struct of_device_id stm32mp157_pctrl_match[] = {
 	{ }
 };
 
+static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
+	 SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, stm32_pinctrl_resume)
+};
+
 static struct platform_driver stm32mp157_pinctrl_driver = {
 	.probe = stm32_pctl_probe,
 	.driver = {
 		.name = "stm32mp157-pinctrl",
 		.of_match_table = stm32mp157_pctrl_match,
+		.pm = &stm32_pinctrl_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
