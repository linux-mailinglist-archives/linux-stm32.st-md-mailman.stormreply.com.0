Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CrdjNnPaCmog8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8F569990
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8333C57B41;
	Mon, 18 May 2026 09:22:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 964DDC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 10:44:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ba928852a5so43830795ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 03:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669041; x=1779273841;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
 b=JgZV/dGIG32mzLRnnioDERa9dHTXiqcggod4K853t2lzsr+lvnvIp8u8qgFz2+LCV8
 dwJPCgTx9cmZoXWaVeB/p+UPXrHG28CJU6MUbdWuOzfxdiUToS+t4sHjdhLyUB4m5Av7
 UBLfg4rJ/5zb9OW4k+gDuSo8SxFjbNkStiUhIM9JXIthcU1vwuGIs6OWD5/iNs3y97Bg
 xTK8Npa7LCu3CSRGeYItORTWe54nYqZ07awB5kkQNtCcdOQF0e3/npPTf0I/ohB7nANe
 DV8phhQn03LTxAaxK/O53tqKNu/DU8hmr+iSuO99XlyCNin0netyg2MboT1ObO/q09+c
 Jk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669041; x=1779273841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
 b=UASyWcM3IJAu/q3n5+zn9wdvI22ZnGlzjS4GAR+TaASxnrecCWaIEumM9qnZiKS6Yz
 ml1LpsqKt2Bf3G0X/Xr5hrqzIclPK2xERuwa4jO4Ja6YNlEY3whsPHUg/i/xdsmsOmYg
 PHAvrgzRMmB4gU/yYCbVWQDERsCnDRmAq6IRh4qS/HfEpXuTT2Qn+FdkEqyomRdSxQYp
 4Jp8YHRy0lbCcqN6JjAPbNX0NhkqBJqaOR+o7bdZGiTjYnSSEw0SaXq5+kIZ5Yf4mjS9
 zoq7AEK7do/EQ1aLuUJruUZJJiEkrGK5X+ExmYgX2ldFtqga7EfrSPt/6xX6baO8jwQB
 y4rA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Md7QVFkk1bhdK9uI1uKZ1ecE2tXZEO3Rwf47wDS15fsoyNqIJ2A2YdDd9/WZ6VZkgDzVbmabfycuykA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWFtCnjdoRSuMZQlYo5nGpSz7DA7wT1SAXIUweFBrWYcY2aN+N
 mpCi2F8w+Cbi7/oZAONXJeMebaAV3dfejfADFzZM4WEnRnmc/YphHvOS
X-Gm-Gg: Acq92OHaOsMVJsYVVL2mc5bxOZf43IIuxFtzgLGn4SYuOcg7bS06Dtg5sxT+SkUnwqu
 znIWLbovvLgs+sI/l4HZGT0CBmjeX7sKI6Jv4KnTdewH0BuS/CyYR1mH+oWVXi3c/srrY6qF7Pw
 8KeQ0lUqxnoYKN29HVcU3iKRb7GIloURsGalqJWuTtQ4jepZM2Zq2wHq7V7B+QRsgAllgnx6fJn
 l+LuX4fXdLAD8iJR0l4jR3GVt11MrGgFL4AWpzFfeyVz5hqiaNNnr5vbkWnMqRTb4uq94kiOHQ/
 /je2ujPLdOjTgReSrLwrpvwINT00LiMgBpDQs0tBNms+46xSVJt4PXlUr7dXgzX4dkReIjvFE24
 Xeige459GbjzE7VHByc59nKCpU0nWrQjT4hwhbSvrmGdSyRLs/QDP4a8romDv2w0uVWjuCv8e9P
 68JW6ibbuA1CP1VffceJWBWZ4B3ln9aUCgmhshLVkgpgY9TnTtNmHOXxroyg==
X-Received: by 2002:a17:903:183:b0:2bd:3bfa:51fe with SMTP id
 d9443c01a7336-2bd3bfa6e4fmr11597115ad.41.1778669041190; 
 Wed, 13 May 2026 03:44:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:44:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Date: Wed, 13 May 2026 17:43:27 +0700
Message-ID: <20260513104329.81592-3-phucduc.bui@gmail.com>
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
Subject: [Linux-stm32] [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for
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
X-Rspamd-Queue-Id: 66F8F569990
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
	NEURAL_SPAM(0.00)[0.982];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 67 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6ca21780f21d..4fddb7ecd7fd 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -615,10 +615,10 @@ static irqreturn_t stm32_i2s_isr(int irq, void *devid)
 	if (flags & I2S_SR_TIFRE)
 		dev_dbg(&pdev->dev, "Frame error\n");
 
-	spin_lock(&i2s->irq_lock);
-	if (err && i2s->substream)
-		snd_pcm_stop_xrun(i2s->substream);
-	spin_unlock(&i2s->irq_lock);
+	scoped_guard(spinlock, &i2s->irq_lock) {
+		if (err && i2s->substream)
+			snd_pcm_stop_xrun(i2s->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -905,12 +905,10 @@ static int stm32_i2s_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = substream;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = substream;
 
 	if ((i2s->fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_DSP_A)
 		snd_pcm_hw_constraint_single(substream->runtime,
@@ -982,19 +980,19 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_write_bits(i2s->regmap, STM32_I2S_IFCR_REG,
 				  I2S_IFCR_MASK, I2S_IFCR_MASK);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount++;
-		if (playback_flg) {
-			ier = I2S_IER_UDRIE;
-		} else {
-			ier = I2S_IER_OVRIE;
-
-			if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
-				/* dummy write to gate bus clocks */
-				regmap_write(i2s->regmap,
-					     STM32_I2S_TXDR_REG, 0);
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount++;
+			if (playback_flg) {
+				ier = I2S_IER_UDRIE;
+			} else {
+				ier = I2S_IER_OVRIE;
+
+				if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
+					/* dummy write to gate bus clocks */
+					regmap_write(i2s->regmap,
+						     STM32_I2S_TXDR_REG, 0);
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		if (STM32_I2S_IS_SLAVE(i2s))
 			ier |= I2S_IER_TIFREIE;
@@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 					   I2S_IER_OVRIE,
 					   (unsigned int)~I2S_IER_OVRIE);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount--;
-		if (i2s->refcount) {
-			spin_unlock(&i2s->lock_fd);
-			break;
-		}
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount--;
+			if (i2s->refcount)
+				break;
 
-		ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
-					 I2S_CR1_SPE, 0);
-		if (ret < 0) {
-			dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
-			spin_unlock(&i2s->lock_fd);
-			return ret;
+			ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
+						 I2S_CR1_SPE, 0);
+			if (ret < 0) {
+				dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
+				return ret;
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		cfg1_mask = I2S_CFG1_RXDMAEN | I2S_CFG1_TXDMAEN;
 		regmap_update_bits(i2s->regmap, STM32_I2S_CFG1_REG,
@@ -1047,7 +1042,6 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	clk_disable_unprepare(i2s->i2sclk);
 
@@ -1059,9 +1053,8 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 	if (!i2s->i2smclk && i2s->put_i2s_clk_rate)
 		i2s->put_i2s_clk_rate(i2s);
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = NULL;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = NULL;
 }
 
 static int stm32_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
