Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CD3213A3
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Feb 2021 11:02:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79869C57B6A;
	Mon, 22 Feb 2021 10:02:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 122E3C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Feb 2021 09:23:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11M9KlGt016260; Mon, 22 Feb 2021 10:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=CEx+dJ33M2OiDJi9X3qiBhe30dtWSWB5g83Cp50fZwo=;
 b=SPezn6Ht4XYEb6ypx4NcpjfSKDUoxH9t7hs3mdMsQ7MmKdt4RSveqAbhYkBBCyoOHRbY
 vfrMA0SbCiZTs+WUJhv3vmXA4RzvXAMYSGrNDXYwXpRxutrPXka73iN8Ebg/9Jo5CiRJ
 8tE5oHCUh3TBGjldR8e0zMkJXCbZO4Tc14l5xL6F46/ezS2bydlp4/8SOSnSGx7/oZD9
 PKt15Ns7tEg5lhEvcIoHt1uuKujNlWsp/f1PDbRFwUciVEXCXlXFZzhrc2BoDiD/erEL
 ZjOxXQO5X7jdc8L1lY4Df0hTF0yPb2KhWjivfinODJo7zEMH8Y63rFErZoxOCs+9D+Ac wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ttn6tneb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 10:22:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32CE010002A;
 Mon, 22 Feb 2021 10:22:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2342B21F0A7;
 Mon, 22 Feb 2021 10:22:58 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Feb
 2021 10:22:57 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 22 Feb 2021 10:22:57 +0100
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Sam Ravnborg <sam@ravnborg.org>, "Joe Perches" <joe@perches.com>
Thread-Topic: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Thread-Index: AQHXCPxOHztlhOrGKUWaJgLQSaRSdw==
Date: Mon, 22 Feb 2021 09:22:57 +0000
Message-ID: <20210222092205.32086-2-raphael.gallais-pou@foss.st.com>
References: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_02:2021-02-18,
 2021-02-22 signatures=0
X-Mailman-Approved-At: Mon, 22 Feb 2021 10:02:54 +0000
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [Linux-stm32] [PATCH 1/2] drm/stm: dsi: Avoid printing errors for
	-EPROBE_DEFER
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

From: Yannick Fertre <yannick.fertre@st.com>

Don't print error when probe deferred error is returned.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2e1f2664495d..8399d337589d 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -363,8 +363,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->vdd_supply = devm_regulator_get(dev, "phy-dsi");
 	if (IS_ERR(dsi->vdd_supply)) {
 		ret = PTR_ERR(dsi->vdd_supply);
-		if (ret != -EPROBE_DEFER)
-			DRM_ERROR("Failed to request regulator: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to request regulator\n");
 		return ret;
 	}
 
@@ -377,9 +376,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
 		ret = PTR_ERR(dsi->pllref_clk);
-		if (ret != -EPROBE_DEFER)
-			DRM_ERROR("Unable to get pll reference clock: %d\n",
-				  ret);
+		dev_err_probe(dev, ret, "Unable to get pll reference clock\n");
 		goto err_clk_get;
 	}
 
@@ -419,7 +416,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
 	if (IS_ERR(dsi->dsi)) {
 		ret = PTR_ERR(dsi->dsi);
-		DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
 		goto err_dsi_probe;
 	}
 
-- 
2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
