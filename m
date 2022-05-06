Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37D51F58B
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 09:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 221EDC6046B;
	Mon,  9 May 2022 07:46:55 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D32A8C6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 22:57:08 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id kl21so6424496qvb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 May 2022 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Sxt7bLTssTeYGgR+I7SCEoY9oG9Ye7EjzwX7GHS4YA=;
 b=FyEpzqzMqKKRkhENJXzIx1SKNfuiDwTDe2hZnG9S3tlEf6FZtTCZRNgI4vwteFBePZ
 WK6lOvZ++KV0FS/HZmCxW6uotvBBVbSrt2rl54OwhQK6AbLwk3gcoBzDDnvpl8znNvOM
 h1fu7FodgNlfedOQZuSdmBIM5Ag1QXpzUrmpT0T/Gk8i3fKHcQBvKj5nmVYkETgpv+ah
 XdnEsCQ6p+9SGQWmH/fBS9GSsgVPdGBgXPG9V2jkiBSsMFl0T9/vkbJuf3wCc+UuhtPb
 oQbK7yBwXqT+fQywZQRi+nCglvl4ERdIRtuXmnE78W4U+kxZQoVi7EbtKnISfMXzTRj5
 Kjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Sxt7bLTssTeYGgR+I7SCEoY9oG9Ye7EjzwX7GHS4YA=;
 b=XuYZDf5Qx3/Z/Lrghm0ODmAD8TMprZOMFnDShxvzkddGnwJYdqRP97l7OqdzY9vAmK
 GhDiBkHRQIwXquzBkUOWlMc8457TbDQPDi6ACQUhKv1q/N1fzJGSkKCbt4Cmnf6M7Fc3
 h0UUnVrrH7/zZsz2nQuC/fb2XLRQZfYAmBq7KgjBOaWYiyebxokA6bR+Bs2XR3hFV9e6
 gS+JVmw+jfRjN/3zvvn3kFVx6h5DmNYO7eHF88aX96bY5vu1J5/25aFjzKAWbWyBlUGr
 7POOo9eO2rgcpJHmGql9d7GrRW5hnF0mjEZoLdL7gsnyNPeWOSaprlDyw44RTORPSugk
 HDoQ==
X-Gm-Message-State: AOAM5322KuxMtU8y8z+D81fPSczLDtJ1eBEbZyxQ6g+/VhsNB8B/4Uln
 o13JJmnsGka8pZsWlelxQyA=
X-Google-Smtp-Source: ABdhPJyJUB99trwp20kwsbY6BLjfTSeFKbSoXp/o/cHRlk5ZjsS/u1oU3NXwrW8evzZn2PRvwCJ+uQ==
X-Received: by 2002:ad4:5c4b:0:b0:45a:8cc9:bdfd with SMTP id
 a11-20020ad45c4b000000b0045a8cc9bdfdmr4440496qva.1.1651877827789; 
 Fri, 06 May 2022 15:57:07 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 q188-20020a37a7c5000000b0069fc13ce208sm3187880qke.57.2022.05.06.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:57:07 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Fri,  6 May 2022 18:56:16 -0400
Message-Id: <20220506225617.1774604-2-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 May 2022 07:46:53 +0000
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] iio: adc: stm32: Iterate through all ADCs
	in irq handler
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
F4 and H7 generation, since it was using the num_irq value. This patch add
the number of ADC in the common register, which map to the number of entries of
eoc_msk and ovr_msk in stm32_adc_common_regs.

Tested on a STM32F429NIH6

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 142656232157..11c08c56acb0 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -64,6 +64,7 @@ struct stm32_adc_priv;
  * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
  * @has_syscfg: SYSCFG capability flags
  * @num_irqs:	number of interrupt lines
+ * @num_adcs:   number of ADC instances in the common registers
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
2.36.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
