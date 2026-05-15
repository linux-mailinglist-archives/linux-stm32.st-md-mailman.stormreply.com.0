Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ozS7E3naCmo48wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F115699C6
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D3FBC5F1FD;
	Mon, 18 May 2026 09:23:00 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECEFEC87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 11:25:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2bd8c4aa911so4346545ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778844329; x=1779449129;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
 b=q48vUSV9Rx/Mg24QzMbIgiZKHDcvb4rJ7XpLNjozvQ16jzj3cA4LFo5MRlO3Ch9YOP
 D2h0GFS7ZEv1LSUNrSmOOIXORZ2ycXwosddpqr9JS2vVQ1h0xzdg6n6jqis1JgkMGPPE
 YLdmydSDndjYY1FqBgi/n4+lHzz7ISg5sXa1oNmE+E12Qc9kgu6xl47txdeKE5a1mnl+
 Zj/PJU4OEMxQxGLGQUAzf0qJrIQ8N3ja2fQEY1EfdkJmZCRuxbcr/Xo1I9sez078hmJY
 H5sS6ieHtdeTNhHKWeUdWzRIHFwkDgjvOAbO/hpdMezfMtmXHZwhtECKQt0gTTdVGzEz
 wJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778844329; x=1779449129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
 b=ZIWrja9gh1HAN6H7CgamfLTongnihoI4goM1cfrNV+iC+G2akvZz4wOaNxxoUIJ+uF
 P74D8MgSwxLNriL19StMTnkiAqqBVx6Nx7k2vSn88aDMxAFbGHBKEyF/8DTMYeHExLXp
 ejDUMsxIDqr426+R4tNNMV3p8ccmG9+UQtt9D6XFOW6K6XsE2PCER3wHReqvLf98QcMh
 GxgXRwQrTa3VRAgiWSJWsf5N4PSQaaBtVbI36czpsd2O29KDHb6DKWa7MBv9D7V/LLR4
 b9HlUw2NDeTIYQ1jkJrvauYQONGfu2NxJB/O+nkIEtwgjpUnoyfNZgXTMo94G+WIL3Iv
 Dfpw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/QEYAulT/rMD7G3to+WQIAtT2pb/Hdnu7epuLlMzIKZwvhkkb2QGE+2IcflMFV1M7+Cjtb+AiXvMRXbA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRJicAyu0DDE7+51x1yZI3F9f4la5ViMdu3CSjwPV/4ZVLu/G2
 cAMk+fT1uXNk7Cbd8Um///yBRDWaXAd8QeCT2a2FMd+F4Ft5PTo1Mmxk
X-Gm-Gg: Acq92OFyLYj008omLp8kzgO4uol9d6x2Pjc/Vi1w4s6JnAIKQQlhnpjis/r5RYeS9EZ
 3N83eXH4sRJCBtNTE9ng+BZVGuJfH5PTkCFDAwBTFjqRcCZp9HAFtbstL7e+TD+mb5RCsI3Y1q3
 zXGYxgASNmZlBDLilluWM63YMjyDsMQpAVTh5h60b9rlztSh9TYpc8HHVI8JCRujmGSvbQVr++R
 dTi4lgT9Tb/wC2eS8mDFuTQVo50dtoYYlIpv3/KPYB0/CWwi9Xx13b1Sh2pkX4OG+lbwMvksE21
 D23xyg3JzD21Sc703QNkOq1Nby3SgWthQvr5HEaHtOWpFQglmQG7rnw0VRm1Fc+Vo0DYl8vUtR2
 blahzhgamWQP5Acf/kVoyKTYV61q1PoFgV77yU8XRb5TT9yDzm+g3/bHyNccc/gOxVK3jakFk1u
 1YwGZsKFJ8qYjc3BDpEttXX56ZdFuHmUa8R1TYmHdQE6QkwUzGOBhCUO7DrIDTjwEZh96p
X-Received: by 2002:a17:902:d5d0:b0:2b0:7531:b61e with SMTP id
 d9443c01a7336-2bd7e97a6c2mr26865625ad.41.1778844329329; 
 Fri, 15 May 2026 04:25:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 04:25:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 broonie@kernel.org
Date: Fri, 15 May 2026 18:24:57 +0700
Message-ID: <20260515112458.34378-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] ASoC: stm: stm32_sai_sub: Use guard()
	for mutex & spin locks
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
X-Rspamd-Queue-Id: 03F115699C6
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
