Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C478294982
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 10:53:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CFB5C424B3;
	Wed, 21 Oct 2020 08:53:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77509C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 08:53:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L8q3RN018414; Wed, 21 Oct 2020 10:53:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6+cV9aSVoNtdjnIqEJF4uE/x1F0+i1m9HIcw8USdsF4=;
 b=rMgbcOfMDK03le+RpP8LE3WKFgqN4EUwTjLva754UcEeGpSWuxqgoJbpIZrYZPdLqcKc
 WEZV9R6hYv84sw12Ah7JUD12Em64wrhMkDFf7QTtpOM9IPOdXI0LJl3hSWCsZmSSU+el
 I5ZEwZtx3TGgFeVYoXhjFsQNLPfBx7xBfwSiffP2uepA9rCUTEqVOaoGeMRmWSA4kf/m
 6b8iU6UH449XTVNdZ9PbGcMpYwGUkejdom+R/zHVOgX00wkiI+pCV2j1GdwzXNsZU5Mx
 309CIdADjxRysDNwahP06SI7kwWuFh7xLzg1adtjKHms+XCABfoWNibU860MkrIEheUp VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx0pgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 10:53:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5A2F100038;
 Wed, 21 Oct 2020 10:53:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A85FF2BE968;
 Wed, 21 Oct 2020 10:53:28 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct 2020 10:53:27
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <alexandre.torgue@st.com>,
 <fabrice.gasnier@st.com>, <olivier.moysan@st.com>
Date: Wed, 21 Oct 2020 10:53:13 +0200
Message-ID: <20201021085313.5335-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] iio: adc: stm32-adc: fix a regression
	when using dma and irq
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

Since overrun interrupt support has been added, there's a regression when
two ADCs are used at the same time, with:
- an ADC configured to use IRQs. EOCIE bit is set. The handler is normally
  called in this case.
- an ADC configured to use DMA. EOCIE bit isn't set. EOC triggers the DMA
  request. It's then automatically cleared by DMA read. But the handler
  gets called due to status bit is temporarily set (IRQ triggered by the
  other ADC).

This is a regression as similar issue had been fixed earlier by
commit dcb10920179a ("iio: adc: stm32-adc:
fix a race when using several adcs with dma and irq").
Issue is that stm32_adc_eoc_enabled() returns non-zero value (always)
since OVR bit has been added and enabled for both DMA and IRQ case.

Remove OVR mask in IER register, and rely only on CSR status for overrun.
To avoid subsequent calls to interrupt routine on overrun, CSR OVR bit has
to be cleared. CSR OVR bit cannot be cleared directly by software.
To do this ADC must be stopped first, and OVR bit in ADC ISR has
to be cleared.
Also add a check in ADC IRQ handler to report spurious IRQs.

Fixes: cc06e67d8fa5 ("iio: adc: stm32-adc: Add check on overrun interrupt")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/stm32-adc-core.c | 41 +++++++++++---------------
 drivers/iio/adc/stm32-adc.c      | 50 ++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index cd870c089182..a83199b212a4 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -41,18 +41,16 @@
  * struct stm32_adc_common_regs - stm32 common registers
  * @csr:	common status register offset
  * @ccr:	common control register offset
- * @eoc1_msk:	adc1 end of conversion flag in @csr
- * @eoc2_msk:	adc2 end of conversion flag in @csr
- * @eoc3_msk:	adc3 end of conversion flag in @csr
+ * @eoc_msk:    array of eoc (end of conversion flag) masks in csr for adc1..n
+ * @ovr_msk:    array of ovr (overrun flag) masks in csr for adc1..n
  * @ier:	interrupt enable register offset for each adc
  * @eocie_msk:	end of conversion interrupt enable mask in @ier
  */
 struct stm32_adc_common_regs {
 	u32 csr;
 	u32 ccr;
-	u32 eoc1_msk;
-	u32 eoc2_msk;
-	u32 eoc3_msk;
+	u32 eoc_msk[STM32_ADC_MAX_ADCS];
+	u32 ovr_msk[STM32_ADC_MAX_ADCS];
 	u32 ier;
 	u32 eocie_msk;
 };
@@ -282,21 +280,20 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 static const struct stm32_adc_common_regs stm32f4_adc_common_regs = {
 	.csr = STM32F4_ADC_CSR,
 	.ccr = STM32F4_ADC_CCR,
-	.eoc1_msk = STM32F4_EOC1 | STM32F4_OVR1,
-	.eoc2_msk = STM32F4_EOC2 | STM32F4_OVR2,
-	.eoc3_msk = STM32F4_EOC3 | STM32F4_OVR3,
+	.eoc_msk = { STM32F4_EOC1, STM32F4_EOC2, STM32F4_EOC3},
+	.ovr_msk = { STM32F4_OVR1, STM32F4_OVR2, STM32F4_OVR3},
 	.ier = STM32F4_ADC_CR1,
-	.eocie_msk = STM32F4_EOCIE | STM32F4_OVRIE,
+	.eocie_msk = STM32F4_EOCIE,
 };
 
 /* STM32H7 common registers definitions */
 static const struct stm32_adc_common_regs stm32h7_adc_common_regs = {
 	.csr = STM32H7_ADC_CSR,
 	.ccr = STM32H7_ADC_CCR,
-	.eoc1_msk = STM32H7_EOC_MST | STM32H7_OVR_MST,
-	.eoc2_msk = STM32H7_EOC_SLV | STM32H7_OVR_SLV,
+	.eoc_msk = { STM32H7_EOC_MST, STM32H7_EOC_SLV},
+	.ovr_msk = { STM32H7_OVR_MST, STM32H7_OVR_SLV},
 	.ier = STM32H7_ADC_IER,
-	.eocie_msk = STM32H7_EOCIE | STM32H7_OVRIE,
+	.eocie_msk = STM32H7_EOCIE,
 };
 
 static const unsigned int stm32_adc_offset[STM32_ADC_MAX_ADCS] = {
@@ -318,6 +315,7 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
 {
 	struct stm32_adc_priv *priv = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int i;
 	u32 status;
 
 	chained_irq_enter(chip, desc);
@@ -335,17 +333,12 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
 	 * before invoking the interrupt handler (e.g. call ISR only for
 	 * IRQ-enabled ADCs).
 	 */
-	if (status & priv->cfg->regs->eoc1_msk &&
-	    stm32_adc_eoc_enabled(priv, 0))
-		generic_handle_irq(irq_find_mapping(priv->domain, 0));
-
-	if (status & priv->cfg->regs->eoc2_msk &&
-	    stm32_adc_eoc_enabled(priv, 1))
-		generic_handle_irq(irq_find_mapping(priv->domain, 1));
-
-	if (status & priv->cfg->regs->eoc3_msk &&
-	    stm32_adc_eoc_enabled(priv, 2))
-		generic_handle_irq(irq_find_mapping(priv->domain, 2));
+	for (i = 0; i < priv->cfg->num_irqs; i++) {
+		if ((status & priv->cfg->regs->eoc_msk[i] &&
+		     stm32_adc_eoc_enabled(priv, i)) ||
+		     (status & priv->cfg->regs->ovr_msk[i]))
+			generic_handle_irq(irq_find_mapping(priv->domain, i));
+	}
 
 	chained_irq_exit(chip, desc);
 };
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index b3f31f147347..16c02c30dec7 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -154,6 +154,7 @@ struct stm32_adc;
  * @start_conv:		routine to start conversions
  * @stop_conv:		routine to stop conversions
  * @unprepare:		optional unprepare routine (disable, power-down)
+ * @irq_clear:		routine to clear irqs
  * @smp_cycles:		programmable sampling time (ADC clock cycles)
  */
 struct stm32_adc_cfg {
@@ -166,6 +167,7 @@ struct stm32_adc_cfg {
 	void (*start_conv)(struct iio_dev *, bool dma);
 	void (*stop_conv)(struct iio_dev *);
 	void (*unprepare)(struct iio_dev *);
+	void (*irq_clear)(struct iio_dev *indio_dev, u32 msk);
 	const unsigned int *smp_cycles;
 };
 
@@ -621,6 +623,13 @@ static void stm32f4_adc_stop_conv(struct iio_dev *indio_dev)
 			   STM32F4_ADON | STM32F4_DMA | STM32F4_DDS);
 }
 
+static void stm32f4_adc_irq_clear(struct iio_dev *indio_dev, u32 msk)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+
+	stm32_adc_clr_bits(adc, adc->cfg->regs->isr_eoc.reg, msk);
+}
+
 static void stm32h7_adc_start_conv(struct iio_dev *indio_dev, bool dma)
 {
 	struct stm32_adc *adc = iio_priv(indio_dev);
@@ -659,6 +668,13 @@ static void stm32h7_adc_stop_conv(struct iio_dev *indio_dev)
 	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR, STM32H7_DMNGT_MASK);
 }
 
+static void stm32h7_adc_irq_clear(struct iio_dev *indio_dev, u32 msk)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	/* On STM32H7 IRQs are cleared by writing 1 into ISR register */
+	stm32_adc_set_bits(adc, adc->cfg->regs->isr_eoc.reg, msk);
+}
+
 static int stm32h7_adc_exit_pwr_down(struct iio_dev *indio_dev)
 {
 	struct stm32_adc *adc = iio_priv(indio_dev);
@@ -1235,17 +1251,40 @@ static int stm32_adc_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+static void stm32_adc_irq_clear(struct iio_dev *indio_dev, u32 msk)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+
+	adc->cfg->irq_clear(indio_dev, msk);
+}
+
 static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
 {
 	struct iio_dev *indio_dev = data;
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_regspec *regs = adc->cfg->regs;
 	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
+	u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
 
-	if (status & regs->isr_ovr.mask)
+	/* Check ovr status right now, as ovr mask should be already disabled */
+	if (status & regs->isr_ovr.mask) {
+		/*
+		 * Clear ovr bit to avoid subsequent calls to IRQ handler.
+		 * This requires to stop ADC first. OVR bit state in ISR,
+		 * is propaged to CSR register by hardware.
+		 */
+		adc->cfg->stop_conv(indio_dev);
+		stm32_adc_irq_clear(indio_dev, regs->isr_ovr.mask);
 		dev_err(&indio_dev->dev, "Overrun, stopping: restart needed\n");
+		return IRQ_HANDLED;
+	}
 
-	return IRQ_HANDLED;
+	if (!(status & mask))
+		dev_err_ratelimited(&indio_dev->dev,
+				    "Unexpected IRQ: IER=0x%08x, ISR=0x%08x\n",
+				    mask, status);
+
+	return IRQ_NONE;
 }
 
 static irqreturn_t stm32_adc_isr(int irq, void *data)
@@ -1254,6 +1293,10 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_regspec *regs = adc->cfg->regs;
 	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
+	u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
+
+	if (!(status & mask))
+		return IRQ_WAKE_THREAD;
 
 	if (status & regs->isr_ovr.mask) {
 		/*
@@ -2046,6 +2089,7 @@ static const struct stm32_adc_cfg stm32f4_adc_cfg = {
 	.start_conv = stm32f4_adc_start_conv,
 	.stop_conv = stm32f4_adc_stop_conv,
 	.smp_cycles = stm32f4_adc_smp_cycles,
+	.irq_clear = stm32f4_adc_irq_clear,
 };
 
 static const struct stm32_adc_cfg stm32h7_adc_cfg = {
@@ -2057,6 +2101,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 	.prepare = stm32h7_adc_prepare,
 	.unprepare = stm32h7_adc_unprepare,
 	.smp_cycles = stm32h7_adc_smp_cycles,
+	.irq_clear = stm32h7_adc_irq_clear,
 };
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
@@ -2069,6 +2114,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
 	.prepare = stm32h7_adc_prepare,
 	.unprepare = stm32h7_adc_unprepare,
 	.smp_cycles = stm32h7_adc_smp_cycles,
+	.irq_clear = stm32h7_adc_irq_clear,
 };
 
 static const struct of_device_id stm32_adc_of_match[] = {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
