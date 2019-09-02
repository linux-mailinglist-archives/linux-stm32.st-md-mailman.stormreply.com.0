Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2084A5AF6
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 18:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C836C35E01;
	Mon,  2 Sep 2019 16:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD5FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 16:01:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x82FpZdP025195; Mon, 2 Sep 2019 18:01:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xrlRhN7JPPOqfg3FVj66plKLvtdIpfigptlMyrQBYfA=;
 b=UZCQ9RS969vKhs9HkXrczNrsHeUPuzt8P6G3OGj2v19ICNC/IT29ZF79z+yQfqOoHTRx
 ykaVkbLZm3MjE6PmEn+hkMoX4Z4Co7FOfT5++MshhOOXeFg8UCvQYb4m15JyduDlP+kg
 wIZBx2Nb2RfxmfhuMdcoY2CTzGJHVc8iG6f54n/HV8Nm9RJKu0XK8KDntrvbuOR1LEzR
 lMWoMSlSFDqy2kNALr4pTbOcn+fT/uAiD6Yv5KA/8vCclblEybsLw8YQjtchW/tfB2RE
 Taz4qLQvTWDqA4rT92tM4CTwodfi1kVfC88S+4hAsvwZ1MLwzXTFMcNT44Zvr3vhcKiF BA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uqfshnc8g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 02 Sep 2019 18:01:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2831122;
 Mon,  2 Sep 2019 16:01:04 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 875F12C1415;
 Mon,  2 Sep 2019 18:01:03 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019
 18:01:03 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 18:01:02
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <alexandre.torgue@st.com>, <olof@lixom.net>, <horms+renesas@verge.net.au>, 
 <arnd@arndb.de>, <krzk@kernel.org>, <yannick.fertre@st.com>,
 <tony@atomide.com>, <m.szyprowski@samsung.com>,
 <fabrice.gasnier@st.com>, <enric.balletbo@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 2 Sep 2019 18:00:40 +0200
Message-ID: <1567440041-19220-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567440041-19220-1-git-send-email-olivier.moysan@st.com>
References: <1567440041-19220-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-02_06:2019-08-29,2019-09-02 signatures=0
Subject: [Linux-stm32] [PATCH 3/4] ARM: multi_v7_defconfig: enable cs42l51
	codec support
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

Enable Cirrus CS42L51 audio codec for stm32mp157a-dk1 board.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 02265e195e50..03a4d93df8c4 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -714,6 +714,7 @@ CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
+CONFIG_SND_SOC_CS42L51_I2C=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_SPDIF=m
 CONFIG_SND_SOC_STI_SAS=m
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
