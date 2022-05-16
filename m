Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B6C528F85
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 22:40:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0BB5C57183;
	Mon, 16 May 2022 20:40:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 215EAC03FE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 20:40:03 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id c1so13157631qkf.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3le14rhaSocQeKQwxrRTldErgYW+NHKabztIF2/qZ4=;
 b=YwBuId0XmN7JIWITFrXT+8veOWLqw7slTOSwB3fed+CJpB+0z/tm4v5Rf2B+9pj+pQ
 T7mdFXHx9Hg1Ca4MmX/x9HtjhrlDEWLEXPA5auHE2CRdEKkG8fJbYktrABWoYO8nQzNL
 XINzLvXYqqjOseUog68ZikVGx7Rx4ghnE65h2Z7PZ5/ZKKlnWgEqCifCFLgqRpZYM34d
 mYeJAv5soR7JZGQSnd8TGdhPO6Xetsu1JJjy9oSrI1u2bxlbgcUTDgoVmDXExlzVa5gW
 RGqfTRbCbX8CGu4a3gbLIC3EaK8p3r+/PJ5w/5Chu/nZA0Huo/nPxgCBXWt3MjOI/XIh
 CAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3le14rhaSocQeKQwxrRTldErgYW+NHKabztIF2/qZ4=;
 b=On55ALeXPs/1a6YSf+8vbIckptkXzwGb95LFCStzWYhmPFzcg5AdKzWSfKxY5xo8er
 HocEkttOLD65l5gidlLpVEZQG/jwHE49+XKKT9BpVLLVWrErbcUo0svS8tZaYCOmyQ31
 9lij1/cg9mcZ+YRMn356dBs/sCupFr2Lu6BGdmDuP0hogYkJADzkfzUXoDalMoKk1sEJ
 M+u4m5/wDPGqRFX/mnMN/fY+2i+nMsWCdSstGBp2uhecRDVUiM6pbcEm+vMJ+K6o3Z79
 Eyy2p40/KSO5MFQkouhU0JEmjeY+cpcPCnQ82ANHOjKRGIkzpBuZ9ahdT/nGbD4nnt6C
 OMAQ==
X-Gm-Message-State: AOAM532doCHKbwv1d1hkKwB/70yHLvL53EgDgNU9uJTrlEWbV9CB+Tfm
 STThahvXNzgnuofd1XdyDZU=
X-Google-Smtp-Source: ABdhPJxJnWTboPrcAFadimt77on92UDhywlvLKxVgUleScXkQ+vnAbz0mZZhuvSEuAjMyTfTw8dscA==
X-Received: by 2002:a37:a953:0:b0:69f:9314:ba62 with SMTP id
 s80-20020a37a953000000b0069f9314ba62mr13554460qke.398.1652733602008; 
 Mon, 16 May 2022 13:40:02 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 k67-20020a378846000000b006a00fabde68sm6364016qkd.10.2022.05.16.13.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:40:01 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Mon, 16 May 2022 16:39:38 -0400
Message-Id: <20220516203939.3498673-2-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
References: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] iio: adc: stm32: Fix ADCs iteration in
	irq handler
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

The irq handler was only checking the mask for the first ADCs in the case of the
F4 and H7 generation, since it was iterating up to the num_irq value. This patch add
the maximum number of ADC in the common register, which map to the number of entries of
eoc_msk and ovr_msk in stm32_adc_common_regs. This allow the handler to check all ADCs in
that module.

Tested on a STM32F429NIH6.

Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using dma and irq")
Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 142656232157..bb04deeb7992 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -64,6 +64,7 @@ struct stm32_adc_priv;
  * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
  * @has_syscfg: SYSCFG capability flags
  * @num_irqs:	number of interrupt lines
+ * @num_adcs:   maximum number of ADC instances in the common registers
  */
 struct stm32_adc_priv_cfg {
 	const struct stm32_adc_common_regs *regs;
@@ -71,6 +72,7 @@ struct stm32_adc_priv_cfg {
 	u32 max_clk_rate_hz;
 	unsigned int has_syscfg;
 	unsigned int num_irqs;
+	unsigned int num_adcs;
 };
 
 /**
@@ -352,7 +354,7 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
 	 * before invoking the interrupt handler (e.g. call ISR only for
 	 * IRQ-enabled ADCs).
 	 */
-	for (i = 0; i < priv->cfg->num_irqs; i++) {
+	for (i = 0; i < priv->cfg->num_adcs; i++) {
 		if ((status & priv->cfg->regs->eoc_msk[i] &&
 		     stm32_adc_eoc_enabled(priv, i)) ||
 		     (status & priv->cfg->regs->ovr_msk[i]))
@@ -792,6 +794,7 @@ static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
 	.clk_sel = stm32f4_adc_clk_sel,
 	.max_clk_rate_hz = 36000000,
 	.num_irqs = 1,
+	.num_adcs = 3,
 };
 
 static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
@@ -800,6 +803,7 @@ static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
 	.max_clk_rate_hz = 36000000,
 	.has_syscfg = HAS_VBOOSTER,
 	.num_irqs = 1,
+	.num_adcs = 2,
 };
 
 static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
@@ -808,6 +812,7 @@ static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
 	.max_clk_rate_hz = 40000000,
 	.has_syscfg = HAS_VBOOSTER | HAS_ANASWVDD,
 	.num_irqs = 2,
+	.num_adcs = 2,
 };
 
 static const struct of_device_id stm32_adc_of_match[] = {
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
