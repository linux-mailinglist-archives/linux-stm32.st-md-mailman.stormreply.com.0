Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJiMAEI91mlZBwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 13:34:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58C3BB525
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 13:34:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31178C87ED1;
	Wed,  8 Apr 2026 11:34:25 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A181FC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:39 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-66ba9898ae8so1185882a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Apr 2026 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775637879; x=1776242679;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mn7wQQPeIAPXSFjgjTqJdELriWK6r3kCAJfIBvkQ3a0=;
 b=ZPDLdGQxmDwhXwgtrBBusdYiwY3+GmTYguEfYG9q7IYI9wT8r0XzCUyiKNKAQ+McUp
 CY8JXW19384t+DV+TTNfcoDdZ/UNTQDgTEF+MsGH7Ct6f8orgrgfW6NMZq1hNmLnx2sF
 fy6p0ZhhyhobNvXeuEWRGrHyOLwOnyVpBTyOA5ziTGczl97FNG/PDOlSZa/5bsZW7JAF
 vnnsey4Z8t5tPtNo2Y04aP95q0cEl6hnS1YhNX3goeMKW+OF/074WpjDCNe48D3+ifue
 b2B834zfmOI4ph9M4HkfkwLlOzH1sonjS+IvxRbgfCPqid3hf7e/TI9IpU6zzQrQY+EG
 b6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637879; x=1776242679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mn7wQQPeIAPXSFjgjTqJdELriWK6r3kCAJfIBvkQ3a0=;
 b=px3vu0yOt4kYPgewgMyk50Igh8cpZeH5WATuZJRTtj8qNJD48fHBE2j/Yv3C7aRNw8
 6kQTYci1z+rEjKoK9t0ZhEj/uRNHj+AB3tRyJ9K/xcOUTbKqcdpJbwEQBOCsetZKbx7X
 ny5kGzpKgeZgPQJn3g8wpgdHwXjRrzDVdMPbTrq0HMR8RPoiwcPFrqQbM+yOAT+1kAVY
 EX9V36ZP3Hweeya7jMpRwu9hczysi/ctQAStzZXaSNNNAO65kePZhmYBlk5EGURy7I/C
 4er7t1++bdV0EMeWCcmQ0/74LrtGCMkIF4Y8eL48bogJIga6mf4G2YTlOZv1WCBijPG9
 Bkjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJD52eRGVPu+GBO2WGft827gGhjvoInCCJqjpALuQnlnsfvCkAUcLbeO+L1fLIuGufYpH6Lpa4+GWq4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5iwlnzYc0E/E9FaQgtwBwsfgsWukUk05qC1L/KlkXmIDgXfiL
 Ohn0oAfcKtp8q/kbACaj/Ke7dYRE+tBLxhTDo2gf1HOwNx9eh30HMU9g
X-Gm-Gg: AeBDieuCtV6yAg9fXGmi029dFUo885MBuTNygnfEOf/4/8rasnvIPSijS9xOMrCMLP8
 z6uC/lCToZNgZeOTPcFSrNIRwoEbK95bzEW2VUjVy9hl9AcHslZ6nq7X+IprcLHz7Hk5vHxGcEp
 uxCRuZWYfzgt78FwfNH1MJSdsgMug+T6zm0ZMW9tLU29ib/oLbJNYIkfVPpZx+On9wL9gdZgdC0
 l+CuySboXmGMmzBsPhit+fIE4bZPCzLbrF62B2vn2XQJ8lHSpzDBzsOMzybPs4fX2abj9DNfMKZ
 SAsHH22DxgyF6j+Ks5xPkJqxGzoEKvMv2XtV+BHRcthG0dq1JDyAg2gTipap8rbEWlD8PiASa4d
 RavWwo9TmTkjC6u01WK5/P25F6HJXQ+PipiKM3O6aIWWf7vIBEgjiKfjjwFnmE+DwOLGudd9gLd
 joNigvZuXsuh0qgg0usaA7ex0Xs1NuqhZmySHPS6dvPg==
X-Received: by 2002:a17:907:971a:b0:b97:fec5:eced with SMTP id
 a640c23a62f3a-b9c46a55746mr1174761366b.0.1775637878710; 
 Wed, 08 Apr 2026 01:44:38 -0700 (PDT)
Received: from tm-Precision-5570.. ([213.192.89.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66e034c9c47sm4815194a12.29.2026.04.08.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 01:44:37 -0700 (PDT)
From: Tomasz Merta <tommerta@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed,  8 Apr 2026 10:40:56 +0200
Message-Id: <20260408084056.20588-1-tommerta@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Apr 2026 11:34:23 +0000
Cc: mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, Tomasz Merta <tommerta@gmail.com>,
 Tomasz Merta <tomasz.merta@arrow.com>, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK
	polarity for DSP_A/B, LEFT_J
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,kernel.org,arrow.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[tommerta@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:alsa-devel@alsa-project.org,m:mcoquelin.stm32@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:tommerta@gmail.com,m:tomasz.merta@arrow.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommerta@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.940];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8F58C3BB525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tomasz Merta <tomasz.merta@arrow.com>

The STM32 SAI driver do not set the clock strobing bit (CKSTR) for DSP_A,
DSP_B and LEFT_J formats, causing data to be sampled on the wrong BCLK
edge when SND_SOC_DAIFMT_NB_NF is used.

Per ALSA convention, NB_NF requires sampling on the rising BCLK edge.
The STM32MP25 SAI reference manual states that CKSTR=1 is required for
signals received by the SAI to be sampled on the SCK rising edge.
Without setting CKSTR=1, the SAI samples on the falling edge, violating
the NB_NF convention. For comparison, the NXP FSL SAI driver correctly
sets FSL_SAI_CR2_BCP for DSP_A, DSP_B and LEFT_J, consistent with its
I2S handling.

This patch adds SAI_XCR1_CKSTR for DSP_A, DSP_B and LEFT_J in
stm32_sai_set_dai_fmt which was verified empirically with a cs47l35 codec.
RIGHT_J (LSB) is not investigated and addressed by this patch.

Note: the STM32 I2S driver (stm32_i2s_set_dai_fmt) may have the same issue
for DSP_A mode, as I2S_CGFR_CKPOL is not set. This has not been verified
and is left for a separate investigation.

Signed-off-by: Tomasz Merta <tommerta@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 450e1585edee..3e82fa90e719 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -802,6 +802,7 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		break;
 	/* Left justified */
 	case SND_SOC_DAIFMT_MSB:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	/* Right justified */
@@ -809,9 +810,11 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSOFF;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL;
 		break;
 	default:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
