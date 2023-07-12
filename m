Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CA750AC7
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 16:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AFDDC6B443;
	Wed, 12 Jul 2023 14:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADBB9C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 14:25:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CAvLIq022875; Wed, 12 Jul 2023 16:24:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=IcqyTeLAeVhtdtveeoVoA1o7cESLgC6N68Fkz6p0bW8=;
 b=zhbjs4hJ7I/ZuuuXWi3pHlRgdZp2DGxPztjVyaP7DWMZ5vAdYmdDB3ze8mh4d/K+z9U0
 b4e+ytgL6kK26y6O4OfnP9oMpdSS7d81EYJpSrS3N/pGpyYsCmMAKooa9+pvbzU8Irqa
 D4xLEb8QIOga565qnrw4vER9GtIHz6t1yzCt7y6386bum5ON4YHPLEdb89HNOA5kfcIn
 WqgtboE3Khss6DXtvkPGQUnWNAxImggNoFjk6h7L7Gm3tOVl3sGBX5ZD7xNvyuUB5GKQ
 iVcLj28xBqsl86fP1e0SE4+YRB7HNeThgsQOG7IjILqFEpRVjICabsQCVC5IGXxJ3muk 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rsr19b145-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 16:24:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC323100065;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A071D21BF68;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from localhost (10.252.136.3) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Jul
 2023 16:24:38 +0200
From: <p.paillet@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jul 2023 16:24:32 +0200
Message-ID: <20230712142432.1885162-5-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712142432.1885162-1-p.paillet@foss.st.com>
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.136.3]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_09,2023-07-11_01,2023-05-22_02
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH 4/4] ARM: multi_v7_defconfig: Add SCMI
	regulator support
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

From: Pascal Paillet <p.paillet@foss.st.com>

Enable ARM SCMI regulator support.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f0800f806b5f..524ca56f52d9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,6 +612,7 @@ CONFIG_MFD_ACER_A500_EC=m
 CONFIG_REGULATOR_ACT8865=y
 CONFIG_REGULATOR_ACT8945A=y
 CONFIG_REGULATOR_ANATOP=y
+CONFIG_REGULATOR_ARM_SCMI=y
 CONFIG_REGULATOR_AB8500=y
 CONFIG_REGULATOR_AS3711=y
 CONFIG_REGULATOR_AS3722=y
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
