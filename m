Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIVTNXXaCmoA8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60E569992
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32236C58D77;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9355C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 10:44:12 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2adff872068so35515235ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669051; x=1779273851;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
 b=jD/zJNriRm5KOKahhsqPs/M2noremGo0IGHy8EsGcFDff15rMX0EvThpVYlkQ3UVtn
 9p+tFLDwf64af7kU9/PPvoHpn+Fc0noTKDkJNtMBP9lMMebSDdT0fAnQPzvCNb6Cg6uN
 EwbPznPEdfvbh2lrIBEid+NwGTCvP+81aPcKdYfioAn90V5Egxh2v6g6xCzwwfRZqfKU
 s1FpOLvn5hISdgNQCZ4VjltgcseZXyuRHN3+vGnzy3jprXTlLar27DLMSvhaJjo3784h
 jtto7VX6E1PuSxg+2TbgJXhBWWZXZ5qOmNaeUHo86i0yBzjV5Jz/eJqCyrTxMZZb57lV
 qb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669051; x=1779273851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
 b=q4TLRnB0Q9wSkqtPhUMbzQhr1jRbCWKxhfAt3NXGyR09l8P4xJfurmEaXTCYPma11E
 7Xv1m/3PgawMiLtXCItAlNuTGFio4+WEfFlL2O09rOqpsc37/s+YO2dP0mhxCTvjtT4u
 FnoXCt4eoIkRnsC7A1PAyDrAwhK46x5TGMzQpr1qj+U2oUuhawIunoZlaGbmZL9WY70v
 uMYkXdnmzr5E2kkdVIEx+X8ElWbTMOHAs0WjQDRoz6zkchtuF2BU9hSevXkW+YdDxkss
 tjUSnYYVNTaxD5022nF1FC4Ry2K9VOg1smKM10enuj/hpvEw8YpVaWMdmpjWsJF/rS3P
 NUow==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pM6GgdnIjxNanYCDP+NMlNTkEnFgsBQ5waK8ANi7eDpujFvMAUpZC8G60ez4ylMmbkkUS3rWol16mpA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/k1SzgXmfLKou8FGaNwXJoOnz1AoWKEGAV0SGAz+Ql3FPwmO9
 jGR5HW53+7EvKwJSRH/G4cupJei4KmwrFNm9TAaAIWDhPNczvLbPzNK3
X-Gm-Gg: Acq92OHW79NdqKDBAWYHiJWWvzG/RCC5nPTY3KNivAG63mLKtiu/9p1T5mGhQt05zqq
 9AxuWprghXkjo+ulBtgX+0r2yPrZEx9jm73nTzreFlDFTkgQ9d5ALytYVRl+i9u0mdmZ0fT3yiA
 StVHSq2seprAAbaT3mAtBCbWxCB/Y5V5BIe/TZwEADNHlaQcOpe8+CluDrOWH3/yY0AQzIzljfm
 UC3lgvf/YrtK/ZGO00bN/bUJwcu9yOkwE6/6Kw20vect8Y1VsrCcCr0Yg6ahxiDm6C8d9lXeyUf
 wnN3wTYjbHQT3SpTR6wZ/lJmrloGUiLEoYpCWGeeV15373CuVAj8fbV3mnkJKkDwexEjavBAh6Y
 lrvuLwEjDoZ4MW+hLyt8StviG0HCk+MF0yXjK5r0kwXKJtwPDAa4WacunDwQUiWlfKoz3vf5BE9
 ku/PHJ8B5P+qh0B/2IhjMmGBAUpyfCKY+UxqYo0jw+lCmdDFH61WCD8rLiXg==
X-Received: by 2002:a17:903:3843:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bd275c6580mr30109575ad.23.1778669051359; 
 Wed, 13 May 2026 03:44:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:44:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Date: Wed, 13 May 2026 17:43:29 +0700
Message-ID: <20260513104329.81592-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] ASoC: stm: stm32_spdifrx: Use guard() for
	spin locks
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
X-Rspamd-Queue-Id: 8B60E569992
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[118];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.983];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 57b711c44278..2f83ca989e68 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -322,7 +322,6 @@ static void stm32_spdifrx_dma_ctrl_stop(struct stm32_spdifrx_data *spdifrx)
 static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, imr, ret;
-	unsigned long flags;
 
 	/* Enable IRQs */
 	imr = SPDIFRX_IMR_IFEIE | SPDIFRX_IMR_SYNCDIE | SPDIFRX_IMR_PERRIE;
@@ -330,7 +329,7 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
 	spdifrx->refcount++;
 
@@ -365,22 +364,17 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 				"Failed to start synchronization\n");
 	}
 
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
-
 	return ret;
 }
 
 static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
-	if (--spdifrx->refcount) {
-		spin_unlock_irqrestore(&spdifrx->lock, flags);
+	if (--spdifrx->refcount)
 		return;
-	}
 
 	cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_DISABLE);
 	cr_mask = SPDIFRX_CR_SPDIFEN_MASK | SPDIFRX_CR_RXDMAEN;
@@ -396,8 +390,6 @@ static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 	/* dummy read to clear CSRNE and RXNE in status register */
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_DR, &reg);
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_CSR, &reg);
-
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
 }
 
 static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
@@ -744,19 +736,19 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 			return IRQ_HANDLED;
 		}
 
-		spin_lock(&spdifrx->irq_lock);
-		if (spdifrx->substream)
-			snd_pcm_stop(spdifrx->substream,
-				     SNDRV_PCM_STATE_DISCONNECTED);
-		spin_unlock(&spdifrx->irq_lock);
+		scoped_guard(spinlock, &spdifrx->irq_lock) {
+			if (spdifrx->substream)
+				snd_pcm_stop(spdifrx->substream,
+					     SNDRV_PCM_STATE_DISCONNECTED);
+		}
 
 		return IRQ_HANDLED;
 	}
 
-	spin_lock(&spdifrx->irq_lock);
-	if (err_xrun && spdifrx->substream)
-		snd_pcm_stop_xrun(spdifrx->substream);
-	spin_unlock(&spdifrx->irq_lock);
+	scoped_guard(spinlock, &spdifrx->irq_lock) {
+		if (err_xrun && spdifrx->substream)
+			snd_pcm_stop_xrun(spdifrx->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -765,12 +757,10 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = substream;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = substream;
 
 	ret = clk_prepare_enable(spdifrx->kclk);
 	if (ret)
@@ -846,11 +836,9 @@ static void stm32_spdifrx_shutdown(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = NULL;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = NULL;
 
 	clk_disable_unprepare(spdifrx->kclk);
 }
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
