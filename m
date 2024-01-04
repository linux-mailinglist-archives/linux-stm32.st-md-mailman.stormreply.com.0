Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77258242DE
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 14:46:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A3C8C6B476;
	Thu,  4 Jan 2024 13:46:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70A56C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 13:46:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 404CBeVI029873; Thu, 4 Jan 2024 14:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=uxlxZGGWiCK9ukUifKVDu5ceC0YPpoymX4MhiItDcpE=; b=ix
 iNQLc2z46Mb22jinHAtIUyBjsTQQKE5He0vqBQmJpd3KHpyOWA7Rul5jbWZaBHLL
 13+QaAR+9O1SXKp9WtsL6vyYwm/y+e45IcqWjl0yvFaMTZJ697UNl/eFbxY5uekO
 TvpKCawdeYSw1a3y20Q51pyb2jLCLTWALoRvk2XzhpZZNxJzJEEl2FoELTPip+K0
 XzGlk89Ihsp0ux5EuybJevpGZnk5Hnlj8Be+eW+WiIWDEFdgO77QRMemzwSCdXaS
 b8Y5JvwL6kjRLc4gFeFb5iF2NArMwc5XO5HZ6VUV0+S1i4EY6XPBQJ/u2YNXOmN2
 yPi67UUZIcuBVFy5pFzg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vabe21ept-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:44:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3EB0D100039;
 Thu,  4 Jan 2024 14:44:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 346912138E4;
 Thu,  4 Jan 2024 14:44:46 +0100 (CET)
Received: from localhost (10.252.5.254) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 14:44:45 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 4 Jan 2024 14:44:31 +0100
Message-ID: <20240104134434.744497-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
References: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 1/4] drm/stm: dsi: use new
	SYSTEM_SLEEP_PM_OPS() macro
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

Use RUNTIME_PM_OPS() instead of the old SET_SYSTEM_SLEEP_PM_OPS().
This means we don't need  __maybe_unused on the functions.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index d5f8c923d7bc..b1aee43d51e9 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -544,7 +544,7 @@ static void dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 	regulator_disable(dsi->vdd_supply);
 }
 
-static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
+static int dw_mipi_dsi_stm_suspend(struct device *dev)
 {
 	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
 
@@ -556,7 +556,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
+static int dw_mipi_dsi_stm_resume(struct device *dev)
 {
 	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
 	int ret;
@@ -580,8 +580,8 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
-				dw_mipi_dsi_stm_resume)
+	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
+			    dw_mipi_dsi_stm_resume)
 };
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
