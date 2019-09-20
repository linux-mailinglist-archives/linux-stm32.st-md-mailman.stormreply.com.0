Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93DB8F41
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2019 13:51:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C79C35E01;
	Fri, 20 Sep 2019 11:51:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E52E5C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 11:51:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8KBkIj2017548; Fri, 20 Sep 2019 13:50:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qUuOTKALdP6xNmW1oAipJOYX3UVnQd9Jlvbx4RkfGQg=;
 b=RDi/UqUssIhajsuP9V869QvATLwVnCGN4VOHYR63QRaGVj1K4CJdnd02HsMtxlHQ4H29
 Yfn/VGooOfsQeFUzAKXIUBcUPWeZZ8Mav5hWJtwbuPpFYFeMGk4SzY+BFloOKFhhzkdE
 LGkJgaNcnUFeQ9if1VAyW19oiw/stPA1c7jN9wkUi1t7DvdS4jyMms0Z1aRzTzrqe0OE
 4Ny+s8ZYyBRYwWPVLkpDXHmHZBPI+H2E2La/b5wltRbgx8onco7FjusJvYv9AiyFJVdI
 uuqAdD94r+9Inj/aRazDX71Gy8F+9hBcku30FAFP9luwWeyZvNmkqQ8GMcVLAox7R0dE yA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v3va2jg6e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 20 Sep 2019 13:50:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2301823;
 Fri, 20 Sep 2019 11:50:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C112BEC43;
 Fri, 20 Sep 2019 13:50:31 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 20 Sep
 2019 13:50:31 +0200
Received: from localhost (10.48.1.232) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 20 Sep 2019 13:50:30 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Fri, 20 Sep 2019 13:50:06 +0200
Message-ID: <1568980206-5428-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.232]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_03:2019-09-20,2019-09-20 signatures=0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix kernel-doc warnings
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

Fix the following warnings when documentation is built:
drivers/iio/adc/stm32-adc-core.c:62: warning: cannot understand function
 prototype: 'struct stm32_adc_common_regs '
drivers/iio/adc/stm32-adc-core.c:78: warning: cannot understand function
 prototype: 'struct stm32_adc_priv_cfg '
drivers/iio/adc/stm32-adc-core.c:123: warning: Function parameter or
 member 'pdev' not described in 'stm32f4_adc_clk_sel'
drivers/iio/adc/stm32-adc.c:219: warning: cannot understand function
 prototype: 'struct stm32_adc_regs '
drivers/iio/adc/stm32-adc.c:237: warning: cannot understand function
 prototype: 'struct stm32_adc_regspec '
drivers/iio/adc/stm32-adc.c:264: warning: cannot understand function
 prototype: 'struct stm32_adc_cfg '
drivers/iio/adc/stm32-adc.c:323: warning: Function parameter or member
 'difsel' not described in 'N'
drivers/iio/adc/stm32-adc.c:323: warning: Function parameter or member
 'pcsel' not described in 'stm32_adc'
drivers/iio/adc/stm32-adc.c:371: warning: cannot understand function
 prototype: 'const struct stm32_adc_regs stm32f4_sq[STM32_ADC_MAX_SQ + 1]
drivers/iio/adc/stm32-adc.c:417: warning: cannot understand function
 prototype: 'const struct stm32_adc_regs stm32f4_smp_bits[] = '
drivers/iio/adc/stm32-adc.c:508: warning: cannot understand function
 prototype: 'const struct stm32_adc_regs stm32h7_smp_bits[] = '
drivers/iio/adc/stm32-adc.c:1112: warning: Function parameter or member
 'indio_dev' not described in 'stm32_adc_get_trig_extsel'
drivers/iio/adc/stm32-adc.c:1420: warning: Function parameter or member
 'indio_dev' not described in 'stm32_adc_debugfs_reg_access'
drivers/iio/adc/stm32-adc.c:1420: warning: Function parameter or member
 'reg' not described in 'stm32_adc_debugfs_reg_access'
drivers/iio/adc/stm32-adc.c:1420: warning: Function parameter or member
 'writeval' not described in 'stm32_adc_debugfs_reg_access'
drivers/iio/adc/stm32-adc.c:1420: warning: Function parameter or member
 'readval' not described in 'stm32_adc_debugfs_reg_access'

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
Note: this applies on top of "iio: adc: stm32-adc: fix a race when using
several adcs with dma and irq"
---
 drivers/iio/adc/stm32-adc-core.c | 11 ++++++-----
 drivers/iio/adc/stm32-adc.c      | 21 +++++++++++++--------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 93a096a..20c626c 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -38,12 +38,12 @@
 #define HAS_ANASWVDD		BIT(1)
 
 /**
- * stm32_adc_common_regs - stm32 common registers, compatible dependent data
+ * struct stm32_adc_common_regs - stm32 common registers
  * @csr:	common status register offset
  * @ccr:	common control register offset
- * @eoc1:	adc1 end of conversion flag in @csr
- * @eoc2:	adc2 end of conversion flag in @csr
- * @eoc3:	adc3 end of conversion flag in @csr
+ * @eoc1_msk:	adc1 end of conversion flag in @csr
+ * @eoc2_msk:	adc2 end of conversion flag in @csr
+ * @eoc3_msk:	adc3 end of conversion flag in @csr
  * @ier:	interrupt enable register offset for each adc
  * @eocie_msk:	end of conversion interrupt enable mask in @ier
  */
@@ -60,7 +60,7 @@ struct stm32_adc_common_regs {
 struct stm32_adc_priv;
 
 /**
- * stm32_adc_priv_cfg - stm32 core compatible configuration data
+ * struct stm32_adc_priv_cfg - stm32 core compatible configuration data
  * @regs:	common registers for all instances
  * @clk_sel:	clock selection routine
  * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
@@ -117,6 +117,7 @@ static int stm32f4_pclk_div[] = {2, 4, 6, 8};
 
 /**
  * stm32f4_adc_clk_sel() - Select stm32f4 ADC common clock prescaler
+ * @pdev: platform device
  * @priv: stm32 ADC core private data
  * Select clock prescaler used for analog conversions, before using ADC.
  */
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 663f8a5..76a247b 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -102,7 +102,7 @@ struct stm32_adc_calib {
 };
 
 /**
- * stm32_adc_regs - stm32 ADC misc registers & bitfield desc
+ * struct stm32_adc_regs - stm32 ADC misc registers & bitfield desc
  * @reg:		register offset
  * @mask:		bitfield mask
  * @shift:		left shift
@@ -114,7 +114,7 @@ struct stm32_adc_regs {
 };
 
 /**
- * stm32_adc_regspec - stm32 registers definition, compatible dependent data
+ * struct stm32_adc_regspec - stm32 registers definition
  * @dr:			data register offset
  * @ier_eoc:		interrupt enable register & eocie bitfield
  * @isr_eoc:		interrupt status register & eoc bitfield
@@ -140,7 +140,7 @@ struct stm32_adc_regspec {
 struct stm32_adc;
 
 /**
- * stm32_adc_cfg - stm32 compatible configuration data
+ * struct stm32_adc_cfg - stm32 compatible configuration data
  * @regs:		registers descriptions
  * @adc_info:		per instance input channels definitions
  * @trigs:		external trigger sources
@@ -183,8 +183,8 @@ struct stm32_adc_cfg {
  * @rx_buf:		dma rx buffer cpu address
  * @rx_dma_buf:		dma rx buffer bus address
  * @rx_buf_sz:		dma rx buffer size
- * @difsel		bitmask to set single-ended/differential channel
- * @pcsel		bitmask to preselect channels on some devices
+ * @difsel:		bitmask to set single-ended/differential channel
+ * @pcsel:		bitmask to preselect channels on some devices
  * @smpr_val:		sampling time settings (e.g. smpr1 / smpr2)
  * @cal:		optional calibration data on some devices
  * @chan_name:		channel name array
@@ -254,7 +254,7 @@ static const struct stm32_adc_info stm32h7_adc_info = {
 	.num_res = ARRAY_SIZE(stm32h7_adc_resolutions),
 };
 
-/**
+/*
  * stm32f4_sq - describe regular sequence registers
  * - L: sequence len (register & bit field)
  * - SQ1..SQ16: sequence entries (register & bit field)
@@ -301,7 +301,7 @@ static struct stm32_adc_trig_info stm32f4_adc_trigs[] = {
 	{}, /* sentinel */
 };
 
-/**
+/*
  * stm32f4_smp_bits[] - describe sampling time register index & bit fields
  * Sorted so it can be indexed by channel number.
  */
@@ -392,7 +392,7 @@ static struct stm32_adc_trig_info stm32h7_adc_trigs[] = {
 	{},
 };
 
-/**
+/*
  * stm32h7_smp_bits - describe sampling time register index & bit fields
  * Sorted so it can be indexed by channel number.
  */
@@ -994,6 +994,7 @@ static int stm32_adc_conf_scan_seq(struct iio_dev *indio_dev,
 
 /**
  * stm32_adc_get_trig_extsel() - Get external trigger selection
+ * @indio_dev: IIO device structure
  * @trig: trigger
  *
  * Returns trigger extsel value, if trig matches, -EINVAL otherwise.
@@ -1297,6 +1298,10 @@ static int stm32_adc_of_xlate(struct iio_dev *indio_dev,
 
 /**
  * stm32_adc_debugfs_reg_access - read or write register value
+ * @indio_dev: IIO device structure
+ * @reg: register offset
+ * @writeval: value to write
+ * @readval: value to read
  *
  * To read a value from an ADC register:
  *   echo [ADC reg offset] > direct_reg_access
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
