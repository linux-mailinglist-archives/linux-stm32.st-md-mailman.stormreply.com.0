Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB42EACF4
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 15:07:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B703DC56638;
	Tue,  5 Jan 2021 14:07:33 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A6DC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 14:07:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D9DpW4SRZz1qs38;
 Tue,  5 Jan 2021 15:07:31 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D9DpW3rRxz1sFWp;
 Tue,  5 Jan 2021 15:07:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Wx0msX0_tPlo; Tue,  5 Jan 2021 15:07:30 +0100 (CET)
X-Auth-Info: 73tb2RG168XdqUxSe0oNWr82/PTU0f5ofULC8IKJLiI=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  5 Jan 2021 15:07:30 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-mmc@vger.kernel.org
Date: Tue,  5 Jan 2021 15:07:18 +0100
Message-Id: <20210105140718.122752-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing bus
	voltage level translator
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

Add support for testing whether bus voltage level translator is present
and operational. This is useful on systems where the bus voltage level
translator is optional, as the translator can be auto-detected by the
driver and the feedback clock functionality can be disabled if it is
not present.

This requires additional pinmux state, "init", where the CMD, CK, CKIN
lines are not configured, so they can be claimed as GPIOs early on in
probe(). The translator test sets CMD high to avoid interfering with a
card, and then verifies whether signal set on CK is detected on CKIN.
If the signal is detected, translator is present, otherwise the CKIN
feedback clock are disabled.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Ludovic Barre <ludovic.barre@st.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
---
NOTE: I would prefer this solution over having a custom DT per SoM,
      since it reduces the amount of DT combinations.
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 32 ++++++++-
 drivers/mmc/host/mmci.c                      | 70 ++++++++++++++++++--
 2 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index dc70ddd09e9d..a69cae19d92d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -401,15 +401,45 @@ &rtc {
 	status = "okay";
 };
 
+&pinctrl {
+	sdmmc1_b4_init_pins_a: sdmmc1-init-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_dir_init_pins_a: sdmmc1-init-dir-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
+				 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
+				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+};
+
 &sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-names = "default", "opendrain", "sleep", "init";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
 	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
+	pinctrl-3 = <&sdmmc1_b4_init_pins_a &sdmmc1_dir_init_pins_a>;
 	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	disable-wp;
 	st,sig-dir;
 	st,neg-edge;
+	st,use-ckin;
+	st,cmd-gpios = <&gpiod 2 0>;
+	st,ck-gpios = <&gpioc 12 0>;
+	st,ckin-gpios = <&gpioe 4 0>;
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	status = "okay";
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index b5a41a7ce165..1bc674577ff9 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -36,6 +36,7 @@
 #include <linux/types.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/div64.h>
 #include <asm/io.h>
@@ -1888,6 +1889,65 @@ static struct mmc_host_ops mmci_ops = {
 	.start_signal_voltage_switch = mmci_sig_volt_switch,
 };
 
+static void mmci_probe_level_translator(struct mmc_host *mmc)
+{
+	struct device *dev = mmc_dev(mmc);
+	struct mmci_host *host = mmc_priv(mmc);
+	struct gpio_desc *cmd_gpio;
+	struct gpio_desc *ck_gpio;
+	struct gpio_desc *ckin_gpio;
+	int clk_hi, clk_lo;
+
+	/*
+	 * Assume the level translator is present if st,use-ckin is set.
+	 * This is to cater for DTs which do not implement this test.
+	 */
+	host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
+
+	cmd_gpio = gpiod_get(dev, "st,cmd", GPIOD_OUT_HIGH);
+	if (IS_ERR(cmd_gpio))
+		goto exit_cmd;
+
+	ck_gpio = gpiod_get(dev, "st,ck", GPIOD_OUT_HIGH);
+	if (IS_ERR(ck_gpio))
+		goto exit_ck;
+
+	ckin_gpio = gpiod_get(dev, "st,ckin", GPIOD_IN);
+	if (IS_ERR(ckin_gpio))
+		goto exit_ckin;
+
+	/* All GPIOs are valid, test whether level translator works */
+
+	/* Sample CKIN */
+	clk_hi = !!gpiod_get_value(ckin_gpio);
+
+	/* Set CK low */
+	gpiod_set_value(ck_gpio, 0);
+
+	/* Sample CKIN */
+	clk_lo = !!gpiod_get_value(ckin_gpio);
+
+	/* Tristate all */
+	gpiod_direction_input(cmd_gpio);
+	gpiod_direction_input(ck_gpio);
+
+	/* Level translator is present if CK signal is propagated to CKIN */
+	if (!clk_hi || clk_lo) {
+		host->clk_reg_add &= ~MCI_STM32_CLK_SELCKIN;
+		dev_warn(dev,
+			 "Level translator inoperable, CK signal not detected on CKIN, disabling.\n");
+	}
+
+	gpiod_put(ckin_gpio);
+
+exit_ckin:
+	gpiod_put(ck_gpio);
+exit_ck:
+	gpiod_put(cmd_gpio);
+exit_cmd:
+	pinctrl_select_default_state(dev);
+}
+
 static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
 {
 	struct mmci_host *host = mmc_priv(mmc);
@@ -1913,7 +1973,7 @@ static int mmci_of_parse(struct device_node *np, struct mmc_host *mmc)
 	if (of_get_property(np, "st,neg-edge", NULL))
 		host->clk_reg_add |= MCI_STM32_CLK_NEGEDGE;
 	if (of_get_property(np, "st,use-ckin", NULL))
-		host->clk_reg_add |= MCI_STM32_CLK_SELCKIN;
+		mmci_probe_level_translator(mmc);
 
 	if (of_get_property(np, "mmc-cap-mmc-highspeed", NULL))
 		mmc->caps |= MMC_CAP_MMC_HIGHSPEED;
@@ -1949,15 +2009,15 @@ static int mmci_probe(struct amba_device *dev,
 	if (!mmc)
 		return -ENOMEM;
 
-	ret = mmci_of_parse(np, mmc);
-	if (ret)
-		goto host_free;
-
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 	host->mmc_ops = &mmci_ops;
 	mmc->ops = &mmci_ops;
 
+	ret = mmci_of_parse(np, mmc);
+	if (ret)
+		goto host_free;
+
 	/*
 	 * Some variant (STM32) doesn't have opendrain bit, nevertheless
 	 * pins can be set accordingly using pinctrl
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
