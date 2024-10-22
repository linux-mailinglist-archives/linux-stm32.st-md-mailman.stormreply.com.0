Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC619AB2F9
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:59:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 838C7C6DD6B;
	Tue, 22 Oct 2024 15:59:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C275C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBYUeg018538;
 Tue, 22 Oct 2024 17:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rP7/lb+gK3a2TD+v47UvKOow6DTb7ED05Ls7Zht6nXc=; b=j+sPPq6jcNwMuLEY
 ewH9OVsCnCS0HqxeMglAIi8vviobk2vb7DP5kZKZmxUHTxW3EGbeeoyV+gIT1Hnd
 /xZdlOTxLop+Mj7sfOGRSY/+goi7x0h3pyzCtzKfKeycW41MrLuOi3upF5dPV4fr
 ED4ft5Vp7X0a6f2JMMvwWMjQ9fKv+ZOph2opbfXH8QMKlNoPSTIacvxiJw7yMdji
 T7xsR1asGeAfFMNYPVoySq4ZyysoLjS2zAEjzU9rH1LsMOtEWzdKIvABf619lXjJ
 6yPBZwYPOFNDT5uEbWqhjmblSKu65W22M8GWdalFeS9PCL4VuUWy6Z9ZDmK42/Ph
 dZZQWA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:58:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 59E6D40057;
 Tue, 22 Oct 2024 17:57:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7162126E854;
 Tue, 22 Oct 2024 17:57:30 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:30 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Oct 2024 17:56:49 +0200
Message-ID: <20241022155658.1647350-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/14] pinctrl: stm32: Rework
	stm32_pconf_parse_conf()
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

Reduce the number of parameters of the function by moving inside
the decoding of the field 'config'.

While there:
- change the type of 'param' to 'unsigned int' to handle the extra
  values not in 'enum pin_config_param';
- change the type of 'arg' to 'u32' to avoid additional conversions
  and align to 'u32' the corresponding param of __stm32_gpio_set().

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cb7929feb6a0a..b387f6caaf3f0 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -197,7 +197,7 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
-	unsigned offset, int value)
+	unsigned int offset, u32 value)
 {
 	stm32_gpio_backup_value(bank, offset, value);
 
@@ -1072,10 +1072,11 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 }
 
 static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
-		unsigned int pin, enum pin_config_param param,
-		enum pin_config_param arg)
+		unsigned int pin, unsigned long config)
 {
 	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	int offset, ret = 0;
@@ -1144,9 +1145,7 @@ static int stm32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 
 	for (i = 0; i < num_configs; i++) {
 		mutex_lock(&pctldev->mutex);
-		ret = stm32_pconf_parse_conf(pctldev, g->pin,
-			pinconf_to_config_param(configs[i]),
-			pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, g->pin, configs[i]);
 		mutex_unlock(&pctldev->mutex);
 		if (ret < 0)
 			return ret;
@@ -1163,9 +1162,7 @@ static int stm32_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = stm32_pconf_parse_conf(pctldev, pin,
-				pinconf_to_config_param(configs[i]),
-				pinconf_to_config_argument(configs[i]));
+		ret = stm32_pconf_parse_conf(pctldev, pin, configs[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
