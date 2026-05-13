Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RkVRBnTaCmoi8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78985569991
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 186D9C57B72;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1230C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 10:44:07 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2b941cd869cso41594715ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 03:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669046; x=1779273846;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
 b=N/7G/EJXf8uPVqbuQwtOEPwHsfopWhsnj651eR1m/s51AjtTErMW5uVdKPkQ4bIvZL
 fL0+7vgEFaClOOniSJqvOeSFXBt/RnYJG8B2ipb9jwxkDZrTtz1uzJjj4kWzZWPXyPrG
 psO5L6m9lf6ZYZ4cA07hw/o/NePqqYXCJ0VfyUmHCK8/QjiuMCIrJed+mZFJUBKOLMmW
 ABYmG2tP6462QS1uZgW8w5sAjznx8ZxkvqbVth2Q2pTolrdUHMBBubjWTFzHUAETzexv
 AppKuizauhQj2dzaBSwMoC4xkhYkSTqkjkRJr7iJMdNZo7m6WzY/iOz2H7n0dqAlSSvZ
 JOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669046; x=1779273846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
 b=PXvsgLEuM6bs8/c9M6MvLKoN2QGZgcQg2dsyOuUzDYN5srmQuhDzL1vFOHs+63LlEw
 HvozXjDE10u1S96cQwSqPVHgLlIHZevePbofcW8wpEMSpn5aSYDZqvgSlCqmN9WKHyZZ
 lfrFljbVRorCySiPCPxOHM6V1J0qYxOnVnnQLf21U+q756bQfoivhK8FSO12kOF2rEGn
 P8eERiggq3Q+KtOfmLHZbOTkXsxldror4NGVXun6ETZSgnGPcnn+M/DM0knFyjYwx9do
 3QVrLsXZuNN+fQLIo0aTws7fz5NLII8gp67n6us9YoeoxLk8Kl3+eTsDFfvWwEErf7k2
 iYJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Sz107To4QhJfqTV6/HMtPu3p0th2nr2Lch+bOwNfIwFkk2eEzMJylArKAuAhReumnmKVXL7mwh0LoKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTHMmQpqGjhYShlZGQaI8V8T9SUmKgE8CTAdM6FpgDnr79MxOv
 D/UGhVfvTtT3gkGZaWMLQBQG24bWV6Eg4e3T8g5D/5uKKL1NgzFPfq7i
X-Gm-Gg: Acq92OFOOHa674ID1jd01aPj3bS6Zo0/qDEq2lYUF9dfh17Nj2Wu/f1qgbtS43lbBmB
 KjKorFDD95tDUCHQhztlR/9NUZMdC8DPvV22GTVXDRr4ma9HScNEEoA59ckwP881xPkj3+ZT+mB
 3/fHLZJdRhNGU4oeTGC/TeLjSWdnVz9HJp3dGv0pO1K0eTLZRBbUs1LydnGpAOpcSU78BmxlyTm
 x+M9N7KGQIejvYNPRdAbt2rPx4wVbh2pCo4pVDDBjNE51bbmbE+1WH8kTSW6eiAxy4wEcslWRjq
 Mx3h31s5Xf/daJO6eFZ3y1qjZ5fq5zun9VGqCSwYBi+4fUR75G1hXo61meR/N07aTi43kKYXUE4
 55/WXl7dH2pci5/0O3Pc3z4vlPQhhHxME0qLILzDKxtuoN7QyvFqT8t/EfQEr0zk3Sm6HQEDW6r
 LNuQCI9/KBNXWE0WHkrhQ0P2g8npvADwyW7Wcz4Bu02X/l0Spo3QqRAbMyjQ==
X-Received: by 2002:a17:902:c40f:b0:2ba:bfc:76b5 with SMTP id
 d9443c01a7336-2bd2f4dba62mr24128275ad.4.1778669046222; 
 Wed, 13 May 2026 03:44:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:44:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Date: Wed, 13 May 2026 17:43:28 +0700
Message-ID: <20260513104329.81592-4-phucduc.bui@gmail.com>
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
Subject: [Linux-stm32] [PATCH 3/4] ASoC: stm: stm32_sai_sub: Use guard() for
	mutex & spin locks
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
X-Rspamd-Queue-Id: 78985569991
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3e82fa90e719..ea9e8bddd63f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -280,9 +280,8 @@ static int snd_pcm_iec958_get(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(uctl->value.iec958.status, sai->iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -292,9 +291,8 @@ static int snd_pcm_iec958_put(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(sai->iec958.status, uctl->value.iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -658,10 +656,10 @@ static irqreturn_t stm32_sai_isr(int irq, void *devid)
 		status = SNDRV_PCM_STATE_XRUN;
 	}
 
-	spin_lock(&sai->irq_lock);
-	if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
-		snd_pcm_stop_xrun(sai->substream);
-	spin_unlock(&sai->irq_lock);
+	scoped_guard(spinlock, &sai->irq_lock) {
+		if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
+			snd_pcm_stop_xrun(sai->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -894,11 +892,9 @@ static int stm32_sai_startup(struct snd_pcm_substream *substream,
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int imr, cr2, ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = substream;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = substream;
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
 		snd_pcm_hw_constraint_mask64(substream->runtime,
@@ -1083,7 +1079,7 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		return;
 
 	/* Force the sample rate according to runtime rate */
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	switch (runtime->rate) {
 	case 22050:
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_22050;
@@ -1116,7 +1112,6 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_NOTID;
 		break;
 	}
-	mutex_unlock(&sai->ctrl_lock);
 }
 
 static int stm32_sai_configure_clock(struct snd_soc_dai *cpu_dai,
@@ -1284,7 +1279,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
@@ -1298,9 +1292,8 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 	if (!sai->sai_mclk && sai->put_sai_ck_rate)
 		sai->put_sai_ck_rate(sai);
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = NULL;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = NULL;
 }
 
 static int stm32_sai_pcm_new(struct snd_soc_pcm_runtime *rtd,
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
