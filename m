Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L0YdMHPaCmof8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4E56998F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7F20C57A51;
	Mon, 18 May 2026 09:22:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE64DC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 10:43:57 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ba928852a5so43830565ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669036; x=1779273836;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
 b=QXULxvcucfFu8YT+Ac6yQKb2JLcANErDTnFulWNs9K0/sWzXfHk5vN3rqNUpGWzHFW
 hKyoryHmvvYz++s2Q/2w5c608xqar+7m1Z8JDBwwz0yOgaUnuvJPJyZ3s/A8hhhjm3WL
 fk38aFFeHGoOP9iaF/s/xoGnU8LOo/yjIIaAzFlNfNpjp8T+r7ObeCqhdjQyU+VzSbUW
 7jwIpCR5XfvyIt18NIATTIXtfLQychvAONl0RAaag2TCUU/oEc6kk+5cEaxd0paobWW9
 /fNAjflIqcGILbKxMQmzYJM2OsIrNh4kBH0ELMHn1e5Sy1Dx10TMTB0hU7U4Uwf5CoUy
 derg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669036; x=1779273836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
 b=MhVNjVTwMep4YQUPjJNvFk6vyWvhMptM8o1BcsCwy496aYwy/Lw0dkSBYgxDuBNTxr
 z7fLQFdsabzThCMSbFdZGf3HXswvqiPnHBJ4svrSWNqmjWapxhbJh0DlSoLARHi2S9sN
 qbYMnYSEKIGXfKPBNUbEhLYxys98jIrnuXKQAzs/rZ6nc4VKnQ8GSLX18CYTpq4dXZU3
 z3kkoD9HHYIXwOqBlXAlEPLn74CyzMIC+6lUTZZdpct6mRdo1fhQUmoe+Sh45SMPCRjS
 67p/utPLh+XKdPH4LvMbFYzi6yfMyXLYHwcmQVAWeqeOv/xoC/NrLSIT4Cs+ISRecEwt
 NxYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9w5DM82idNqHMGQbzzBVUJKr6DuMUMnQT4MQcm1tUninNoe3GyO+Avbv+gxG09XZF+ILRLR/5WpAp8qg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcT3eHbwyovhOz0W7iPfPvzuvpcQSLCvUXZPLeZXquWtzwcGIG
 1brSBRTwSMH8Db0gEtcOAzGLNY7OQLV1M+bxstyKmVK9UQ31rg0O6x+G
X-Gm-Gg: Acq92OEPxoUsllh65Gt3VvQmsxiokrUd4FxckgGfXbVayMMFkNwNrXT/tszDdwJbEHx
 oYwQNZY09yJTeMkMoHp16fxX6/r7YRItLOsMyhCMLRmgH/WMbmDhUK37dQ10uW4pYXQZRpNaayT
 gRSkDYx4RtImXTUFLn72keHrwxy2930RZEZSiHi0br6F08xc/I+1+n3B3Ls5kHNhSKYb4oeAiAP
 JUcgXM7vUPvqoilO76T93NZiKCjl/wxrwI+fYlbDG5p1M0Br0paHhoUDT18tAj2zlNcv5GVUTBy
 fYcnl79C9gruL1QJy0ohO9oEh3kwd2H6u73lqKDli5eahp7w4A7W97zewp25z2p41dNppg2DhOo
 WhdxdZsaZsK9VYdOo3YvOS19spwnnqQm/eShB+cW/ZOVoqc2CU9tDN37f5IDunyonTXk0ZiOiIR
 hks8s9rMaqGRO3PQTEPmbgUU4XUppkOer0OQNTGNfNcKrIl5SIyNsnFdwZVYWgECQpZqaf
X-Received: by 2002:a17:902:ba98:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2bd26f75ee2mr21419305ad.0.1778669036225; 
 Wed, 13 May 2026 03:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:43:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Date: Wed, 13 May 2026 17:43:26 +0700
Message-ID: <20260513104329.81592-2-phucduc.bui@gmail.com>
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
Subject: [Linux-stm32] [PATCH 1/4] ASoC: stm: stm32_adfsdm: Use guard() for
	mutex locks
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
X-Rspamd-Queue-Id: 3ED4E56998F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[118];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	NEURAL_SPAM(0.00)[0.984];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_adfsdm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 0f6d32814c22..a585cb9fc011 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -62,12 +62,11 @@ static void stm32_adfsdm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
 	}
-	mutex_unlock(&priv->lock);
 }
 
 static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
@@ -76,7 +75,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
@@ -88,7 +87,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret < 0) {
 		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
 			__func__, substream->runtime->rate);
-		goto out;
+		return ret;
 	}
 
 	if (!priv->iio_active) {
@@ -100,9 +99,6 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 				__func__, ret);
 	}
 
-out:
-	mutex_unlock(&priv->lock);
-
 	return ret;
 }
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
