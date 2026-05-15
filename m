Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DzVLM3baCmoq8wQAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F12615699C4
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BEF7C5F1FF;
	Mon, 18 May 2026 09:23:00 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A3E7C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 11:25:35 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c7b9f54d3deso6488775a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778844334; x=1779449134;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
 b=cK0daK7ZhGqkqZq7BE4ppU8lxnVqawYmCaPUwVpH3ZZzpFxlqwIzb/2NBIGFWnxfi9
 4jIBzKih+kVoHpKQvn1zco5Ztf+R3fA8lTzhChHiIKfoek2rcTC81r7hD8obboJn4R+Y
 j8TfazOueRbED7HMvSyzmzvxnGXf6HVx2YBlHAH99Ui+h/a9H2TU2rPQ/xN2kHQb0NGE
 Q/ypx4mSQ+HJ/LapRf6cpM0AfeLDq9PLla7w0eB3DJMX4HB8fa7GPUD3o0dHxvodbV53
 H2zfN8Ijp0H9rLLQOtF29RavNqEFZanwCyodJx+41WvP8Sm4j4LIhmdpOuXj0JorP5rG
 YyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778844334; x=1779449134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
 b=sOBLMwy8q0eEetOVMX1KZEWf4RP7xx+YsZ2K1sOanmtFWPNQiPvZCr2W6ul60U68kN
 U0+F/Lpmnl4HhsQ8DDin//eyI/kYYjZ46FvKqt82qx+or+57pwTCY2fcKQ9T8h/Lt7aO
 x8sf6L68CbxqAkzansgWvEMbVtRxfRBChOlB3Nhk7a4CiuF/y4MBgtmLq70/7q6GvuW4
 i+oaQZwscQny8yelQpHVpHUpKZbBH9JdzTsHSyV57cPk3SI2tagrWPpLq5fn57oaSNij
 gxPoaJYMVMUcA3xcHfNA090yfpjtrLngcT4etgbKHpLkYz0Zt224ONN6YEIeBQuepeIr
 ng5g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NMizAxPat1/FWAD5ncSC05KK/ebWzDTzkqSKGHaQWLE3hps53aFWRtearpPrGFyHtTv4RSlcLduzUTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzd2aWqbxovysPq9eO65h5KFaG9VBEIxjZjNnH2AN8CfZqdTGf2
 LxfPclVe/5OUhiTPrHvRzumny9xPfHb6hTxk+xn6+RCgK6I2d1NHk7Td
X-Gm-Gg: Acq92OGW8p63YSKuSi1m3Z3/7YT4NA7VpiCkg32UjOxFOakvrTFGi+bkMvlhpteMyoZ
 5A+O3ksKpKJ6ZuADlhmbQ6Pkahm2NpoLpYNS9A0PgF4ZUbVDEVIA391FQMGfqDVxprMHCdqrqBr
 X9mEKrE9vBeo5cIagIr1CN67MY3lxKf+MH0AfRtYourSVHGTLsLqnHciEBmJi8icICKsIpwPt/O
 BdVdhSsG6l1wU70EetVs9vfr0IyeqRNy1Gc/vka3//v6Buh1yAcnSwotvpt14iC1sysEXEwvxSV
 NTW47jhbvZAuhQnXYm5nr3uhhebwB2F9L9zNyPU3i6ySP55AMcdqhWptXA4uzh+BLu6Q/Df7sWw
 +9dUCp11bj1mk1img51MbcZ6QI6oYfRHkDABgBEnPyFBzuZPHuEPLJ+bo2JVpddeoAkZq5CoDuz
 tOjJCbR4AYRaTdmAu3/EObbXVQ+FZZmQVLDsBkCwwvHXIoeEqly1cvPWNgVRlJuWlfYkG0
X-Received: by 2002:a17:903:1250:b0:2bd:7bec:f0d8 with SMTP id
 d9443c01a7336-2bd7e8386dbmr42166865ad.13.1778844334085; 
 Fri, 15 May 2026 04:25:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 04:25:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 broonie@kernel.org
Date: Fri, 15 May 2026 18:24:58 +0700
Message-ID: <20260515112458.34378-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] ASoC: stm: stm32_spdifrx: Use guard()
	for spin locks
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
X-Rspamd-Queue-Id: F12615699C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[69];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
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
