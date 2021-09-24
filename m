Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00643416DF8
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Sep 2021 10:35:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B09B5C5A4FC;
	Fri, 24 Sep 2021 08:35:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 813BBC5A4F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 08:35:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O87s0i001053; 
 Fri, 24 Sep 2021 10:35:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=TqwtW2d5KmGwP0OJh3npzOxYswyABAgq8aaE1Jj18eI=;
 b=NDPc6fjROV7XW1F6OIWCtd28mxYIFRrkMcmOpd2aOvOllo3GT7BJUgVAJwSafhTWYW6C
 gI3Z8JBtBLqMn8Mkw6Q/214hzR8g8v391s1pDZS7SdWPl9za3Qb3+oms3qS20za03Tev
 PhQkZBL/8xARNkdHIOvev86CbIweuyxu3dc8DLsQTKITIWIcfJT6bx/QdYRuu19OHwbD
 4k7/ko00sVkhgwwTG2n+4PL0bEqoaBnwAkrVJ+2DqIAa8g5tRV/5JVbx/LeVfNVLVXpO
 MJSD5z3ic+wP194wvK8mJn1P/7wkY5zSXFJWe5B7JQK/Ahro+E7xHtKBRQGXorLmbCZA 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b93fsaddk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 10:35:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E668110002A;
 Fri, 24 Sep 2021 10:35:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBC2A226FB0;
 Fri, 24 Sep 2021 10:35:30 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep 2021 10:35:30
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 Sep 2021 10:34:08 +0200
Message-ID: <20210924083410.12332-6-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924083410.12332-1-olivier.moysan@foss.st.com>
References: <20210924083410.12332-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_02,2021-09-23_01,2020-04-07_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 5/7] iio: adc: stm32-adc: add support of
	internal channels
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

Add support of ADC2 internal channels VDDCORE, VREFINT and VBAT.
The reserved label name "vddcore", "vrefint" and "vbat" must
be used in Device Tree channel node, to enable the corresponding
internal channel.

Note: This patch does not provide support of internal channels
for F4 and H7.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc-core.h |   8 ++
 drivers/iio/adc/stm32-adc.c      | 142 ++++++++++++++++++++++++++++++-
 2 files changed, 147 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
index 2322809bfd2f..7c924f463f67 100644
--- a/drivers/iio/adc/stm32-adc-core.h
+++ b/drivers/iio/adc/stm32-adc-core.h
@@ -102,6 +102,9 @@
 #define STM32H7_ADC_CALFACT		0xC4
 #define STM32H7_ADC_CALFACT2		0xC8
 
+/* STM32MP1 - ADC2 instance option register */
+#define STM32MP1_ADC2_OR		0xD0
+
 /* STM32H7 - common registers for all ADC instances */
 #define STM32H7_ADC_CSR			(STM32_ADCX_COMN_OFFSET + 0x00)
 #define STM32H7_ADC_CCR			(STM32_ADCX_COMN_OFFSET + 0x08)
@@ -168,11 +171,16 @@ enum stm32h7_adc_dmngt {
 #define STM32H7_EOC_MST			BIT(2)
 
 /* STM32H7_ADC_CCR - bit fields */
+#define STM32H7_VBATEN			BIT(24)
+#define STM32H7_VREFEN			BIT(22)
 #define STM32H7_PRESC_SHIFT		18
 #define STM32H7_PRESC_MASK		GENMASK(21, 18)
 #define STM32H7_CKMODE_SHIFT		16
 #define STM32H7_CKMODE_MASK		GENMASK(17, 16)
 
+/* STM32MP1_ADC2_OR - bit fields */
+#define STM32MP1_VDDCOREEN		BIT(0)
+
 /**
  * struct stm32_adc_common - stm32 ADC driver common data (for all instances)
  * @base:		control registers base cpu addr
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 85d09cbd41ae..5a7ac45a0725 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -77,6 +77,30 @@ enum stm32_adc_extsel {
 	STM32_EXT20,
 };
 
+enum stm32_adc_int_ch {
+	STM32_ADC_INT_CH_NONE = -1,
+	STM32_ADC_INT_CH_VDDCORE,
+	STM32_ADC_INT_CH_VREFINT,
+	STM32_ADC_INT_CH_VBAT,
+	STM32_ADC_INT_CH_NB,
+};
+
+/**
+ * struct stm32_adc_ic - ADC internal channels
+ * @name:	name of the internal channel
+ * @idx:	internal channel enum index
+ */
+struct stm32_adc_ic {
+	const char *name;
+	u32 idx;
+};
+
+static const struct stm32_adc_ic stm32_adc_ic[STM32_ADC_INT_CH_NB] = {
+	{ "vddcore", STM32_ADC_INT_CH_VDDCORE },
+	{ "vrefint", STM32_ADC_INT_CH_VREFINT },
+	{ "vbat", STM32_ADC_INT_CH_VBAT },
+};
+
 /**
  * struct stm32_adc_trig_info - ADC trigger info
  * @name:		name of the trigger, corresponding to its source
@@ -126,6 +150,9 @@ struct stm32_adc_regs {
  * @res:		resolution selection register & bitfield
  * @smpr:		smpr1 & smpr2 registers offset array
  * @smp_bits:		smpr1 & smpr2 index and bitfields
+ * @or_vdd:		option register & vddcore bitfield
+ * @ccr_vbat:		common register & vbat bitfield
+ * @ccr_vref:		common register & vrefint bitfield
  */
 struct stm32_adc_regspec {
 	const u32 dr;
@@ -139,6 +166,9 @@ struct stm32_adc_regspec {
 	const struct stm32_adc_regs res;
 	const u32 smpr[2];
 	const struct stm32_adc_regs *smp_bits;
+	const struct stm32_adc_regs or_vdd;
+	const struct stm32_adc_regs ccr_vbat;
+	const struct stm32_adc_regs ccr_vref;
 };
 
 struct stm32_adc;
@@ -195,6 +225,7 @@ struct stm32_adc_cfg {
  * @cal:		optional calibration data on some devices
  * @chan_name:		channel name array
  * @num_diff:		number of differential channels
+ * @int_ch:		internal channel indexes array
  */
 struct stm32_adc {
 	struct stm32_adc_common	*common;
@@ -219,6 +250,7 @@ struct stm32_adc {
 	struct stm32_adc_calib	cal;
 	char			chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
 	u32			num_diff;
+	int			int_ch[STM32_ADC_INT_CH_NB];
 };
 
 struct stm32_adc_diff_channel {
@@ -451,6 +483,24 @@ static const struct stm32_adc_regspec stm32h7_adc_regspec = {
 	.smp_bits = stm32h7_smp_bits,
 };
 
+static const struct stm32_adc_regspec stm32mp1_adc_regspec = {
+	.dr = STM32H7_ADC_DR,
+	.ier_eoc = { STM32H7_ADC_IER, STM32H7_EOCIE },
+	.ier_ovr = { STM32H7_ADC_IER, STM32H7_OVRIE },
+	.isr_eoc = { STM32H7_ADC_ISR, STM32H7_EOC },
+	.isr_ovr = { STM32H7_ADC_ISR, STM32H7_OVR },
+	.sqr = stm32h7_sq,
+	.exten = { STM32H7_ADC_CFGR, STM32H7_EXTEN_MASK, STM32H7_EXTEN_SHIFT },
+	.extsel = { STM32H7_ADC_CFGR, STM32H7_EXTSEL_MASK,
+		    STM32H7_EXTSEL_SHIFT },
+	.res = { STM32H7_ADC_CFGR, STM32H7_RES_MASK, STM32H7_RES_SHIFT },
+	.smpr = { STM32H7_ADC_SMPR1, STM32H7_ADC_SMPR2 },
+	.smp_bits = stm32h7_smp_bits,
+	.or_vdd = { STM32MP1_ADC2_OR, STM32MP1_VDDCOREEN },
+	.ccr_vbat = { STM32H7_ADC_CCR, STM32H7_VBATEN },
+	.ccr_vref = { STM32H7_ADC_CCR, STM32H7_VREFEN },
+};
+
 /*
  * STM32 ADC registers access routines
  * @adc: stm32 adc instance
@@ -489,6 +539,16 @@ static void stm32_adc_set_bits(struct stm32_adc *adc, u32 reg, u32 bits)
 	spin_unlock_irqrestore(&adc->lock, flags);
 }
 
+static void stm32_adc_set_bits_common(struct stm32_adc *adc, u32 reg, u32 bits)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&adc->lock, flags);
+	writel_relaxed(readl_relaxed(adc->common->base + reg) | bits,
+		       adc->common->base + reg);
+	spin_unlock_irqrestore(&adc->lock, flags);
+}
+
 static void stm32_adc_clr_bits(struct stm32_adc *adc, u32 reg, u32 bits)
 {
 	unsigned long flags;
@@ -498,6 +558,16 @@ static void stm32_adc_clr_bits(struct stm32_adc *adc, u32 reg, u32 bits)
 	spin_unlock_irqrestore(&adc->lock, flags);
 }
 
+static void stm32_adc_clr_bits_common(struct stm32_adc *adc, u32 reg, u32 bits)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&adc->lock, flags);
+	writel_relaxed(readl_relaxed(adc->common->base + reg) & ~bits,
+		       adc->common->base + reg);
+	spin_unlock_irqrestore(&adc->lock, flags);
+}
+
 /**
  * stm32_adc_conv_irq_enable() - Enable end of conversion interrupt
  * @adc: stm32 adc instance
@@ -579,6 +649,60 @@ static int stm32_adc_hw_start(struct device *dev)
 	return ret;
 }
 
+static void stm32_adc_int_ch_enable(struct iio_dev *indio_dev)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	u32 i;
+
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+		if (adc->int_ch[i] == STM32_ADC_INT_CH_NONE)
+			continue;
+
+		switch (i) {
+		case STM32_ADC_INT_CH_VDDCORE:
+			dev_dbg(&indio_dev->dev, "Enable VDDCore\n");
+			stm32_adc_set_bits(adc, adc->cfg->regs->or_vdd.reg,
+					   adc->cfg->regs->or_vdd.mask);
+			break;
+		case STM32_ADC_INT_CH_VREFINT:
+			dev_dbg(&indio_dev->dev, "Enable VREFInt\n");
+			stm32_adc_set_bits_common(adc, adc->cfg->regs->ccr_vref.reg,
+						  adc->cfg->regs->ccr_vref.mask);
+			break;
+		case STM32_ADC_INT_CH_VBAT:
+			dev_dbg(&indio_dev->dev, "Enable VBAT\n");
+			stm32_adc_set_bits_common(adc, adc->cfg->regs->ccr_vbat.reg,
+						  adc->cfg->regs->ccr_vbat.mask);
+			break;
+		}
+	}
+}
+
+static void stm32_adc_int_ch_disable(struct stm32_adc *adc)
+{
+	u32 i;
+
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+		if (adc->int_ch[i] == STM32_ADC_INT_CH_NONE)
+			continue;
+
+		switch (i) {
+		case STM32_ADC_INT_CH_VDDCORE:
+			stm32_adc_clr_bits(adc, adc->cfg->regs->or_vdd.reg,
+					   adc->cfg->regs->or_vdd.mask);
+			break;
+		case STM32_ADC_INT_CH_VREFINT:
+			stm32_adc_clr_bits_common(adc, adc->cfg->regs->ccr_vref.reg,
+						  adc->cfg->regs->ccr_vref.mask);
+			break;
+		case STM32_ADC_INT_CH_VBAT:
+			stm32_adc_clr_bits_common(adc, adc->cfg->regs->ccr_vbat.reg,
+						  adc->cfg->regs->ccr_vbat.mask);
+			break;
+		}
+	}
+}
+
 /**
  * stm32f4_adc_start_conv() - Start conversions for regular channels.
  * @indio_dev: IIO device instance
@@ -947,11 +1071,13 @@ static int stm32h7_adc_prepare(struct iio_dev *indio_dev)
 		goto pwr_dwn;
 	calib = ret;
 
+	stm32_adc_int_ch_enable(indio_dev);
+
 	stm32_adc_writel(adc, STM32H7_ADC_DIFSEL, adc->difsel);
 
 	ret = stm32h7_adc_enable(indio_dev);
 	if (ret)
-		goto pwr_dwn;
+		goto ch_disable;
 
 	/* Either restore or read calibration result for future reference */
 	if (calib)
@@ -967,6 +1093,8 @@ static int stm32h7_adc_prepare(struct iio_dev *indio_dev)
 
 disable:
 	stm32h7_adc_disable(indio_dev);
+ch_disable:
+	stm32_adc_int_ch_disable(adc);
 pwr_dwn:
 	stm32h7_adc_enter_pwr_down(adc);
 
@@ -978,6 +1106,7 @@ static void stm32h7_adc_unprepare(struct iio_dev *indio_dev)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 
 	stm32h7_adc_disable(indio_dev);
+	stm32_adc_int_ch_disable(adc);
 	stm32h7_adc_enter_pwr_down(adc);
 }
 
@@ -1800,7 +1929,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	struct device_node *child;
 	const char *name;
-	int val, scan_index = 0, ret;
+	int val, scan_index = 0, ret, i;
 	bool differential;
 	u32 vin[2];
 
@@ -1820,6 +1949,10 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 				return -EINVAL;
 			}
 			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
+			for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
+				if (!strncmp(stm32_adc_ic[i].name, name, STM32_ADC_CH_SZ))
+					adc->int_ch[i] = val;
+			}
 		} else if (ret != -EINVAL) {
 			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
 			goto err;
@@ -1869,6 +2002,9 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	u32 smp = 0;
 	bool legacy = false;
 
+	for (i = 0; i < STM32_ADC_INT_CH_NB; i++)
+		adc->int_ch[i] = STM32_ADC_INT_CH_NONE;
+
 	num_channels = of_get_available_child_count(node);
 	/* If no channels have been found, fallback to channels legacy properties. */
 	if (!num_channels) {
@@ -2219,7 +2355,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 };
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
-	.regs = &stm32h7_adc_regspec,
+	.regs = &stm32mp1_adc_regspec,
 	.adc_info = &stm32h7_adc_info,
 	.trigs = stm32h7_adc_trigs,
 	.has_vregready = true,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
