Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF46DF99D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:18:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D76C4C69063;
	Wed, 12 Apr 2023 15:18:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A190C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:18:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CCK5gs012362; Wed, 12 Apr 2023 17:18:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=RNINIw4nntSoyMexop9tmtpb4ycNWDpQqAjG61if2P4=;
 b=CIFzkUDSDs3dPgki0dsMzDA5oldL+kUaosOveK85Gbs1xxyGbnLrLNWFZTnLZjuCLnDO
 mLr1FhUbgiE0FZqmH5Gq+jsnkuatHuXTNJq2l924ksS3sSHVNmbPj3/URucpC5RAob7r
 Ny9PBikZUaO+VcOZAj4wfRkhCcbuUDpUqONUUGm5xOYRcc9u+iLWQ6cddbpMDWatyza7
 Xm80Kw2QbQUYIowUF9BHJbweG5CGB8eqO9p+Ejj35Mjt9ZAM3wlYpVPD+hO2wNGSHYf+
 gFAbEe/gEoScnMhDmSQWagsiYhcvLDGypGMWHKWeD3p2Vvw7mmOOO6GzlQuvBAkZiz3i Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pw7wp04ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 17:18:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63E94100034;
 Wed, 12 Apr 2023 17:18:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BE8A218612;
 Wed, 12 Apr 2023 17:18:42 +0200 (CEST)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Apr
 2023 17:18:41 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, 
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Wed, 12 Apr 2023 17:18:30 +0200
Message-ID: <20230412151831.3069211-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412151831.3069211-1-fabrice.gasnier@foss.st.com>
References: <20230412151831.3069211-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_06,2023-04-12_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] usb: dwc2: platform: add support for utmi
	optional clock
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

Add support for the utmi clock. It's needed on STM32MP15, when using
the integrated full-speed PHY. This clock is an output of USBPHYC, but
HS USBPHYC is not attached as PHY in this case: Full-Speed PHY is directly
managed in dwc2 glue, through GGPIO register. Typical DT when using FS PHY
&usbotg_hs {
	compatible = "st,stm32mp15-fsotg", "snps,dwc2";
	pinctrl-names = "default";
	pinctrl-0 = <&usbotg_hs_pins_a &usbotg_fs_dp_dm_pins_a>;
	vbus-supply = <&vbus_otg>;
	status = "okay";
};

In this configuration, USBPHYC clock output must be defined, so it can
be properly enabled as a clock provider:
	clocks = <&rcc USBO_K>, <&usbphyc>;
	clock-names = "otg", "utmi_clk";

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 20 +++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 40cf2880d7e5..0bb4c0c845bf 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1003,6 +1003,7 @@ struct dwc2_hregs_backup {
  * @ctrl_out_desc:	EP0 OUT data phase desc chain pointer
  * @irq:		Interrupt request line number
  * @clk:		Pointer to otg clock
+ * @utmi_clk:		Pointer to utmi_clk clock
  * @reset:		Pointer to dwc2 reset controller
  * @reset_ecc:          Pointer to dwc2 optional reset controller in Stratix10.
  * @regset:		A pointer to a struct debugfs_regset32, which contains
@@ -1065,6 +1066,7 @@ struct dwc2_hsotg {
 	void *priv;
 	int     irq;
 	struct clk *clk;
+	struct clk *utmi_clk;
 	struct reset_control *reset;
 	struct reset_control *reset_ecc;
 
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c431ce6c119f..c4d3d63ebdc3 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -101,10 +101,16 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	if (ret)
 		return ret;
 
+	if (hsotg->utmi_clk) {
+		ret = clk_prepare_enable(hsotg->utmi_clk);
+		if (ret)
+			goto err_dis_reg;
+	}
+
 	if (hsotg->clk) {
 		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
-			goto err_dis_reg;
+			goto err_dis_utmi_clk;
 	}
 
 	if (hsotg->uphy) {
@@ -129,6 +135,10 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	if (hsotg->clk)
 		clk_disable_unprepare(hsotg->clk);
 
+err_dis_utmi_clk:
+	if (hsotg->utmi_clk)
+		clk_disable_unprepare(hsotg->utmi_clk);
+
 err_dis_reg:
 	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 
@@ -171,6 +181,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	if (hsotg->clk)
 		clk_disable_unprepare(hsotg->clk);
 
+	if (hsotg->utmi_clk)
+		clk_disable_unprepare(hsotg->utmi_clk);
+
 	return regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 }
 
@@ -247,6 +260,11 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 	if (IS_ERR(hsotg->clk))
 		return dev_err_probe(hsotg->dev, PTR_ERR(hsotg->clk), "cannot get otg clock\n");
 
+	hsotg->utmi_clk = devm_clk_get_optional(hsotg->dev, "utmi_clk");
+	if (IS_ERR(hsotg->utmi_clk))
+		return dev_err_probe(hsotg->dev, PTR_ERR(hsotg->utmi_clk),
+				     "cannot get utmi clock\n");
+
 	/* Regulators */
 	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
 		hsotg->supplies[i].supply = dwc2_hsotg_supply_names[i];
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
