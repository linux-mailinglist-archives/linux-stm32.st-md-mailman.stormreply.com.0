Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A802293F151
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 11:37:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D96CC6DD96;
	Mon, 29 Jul 2024 09:37:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3A67C6DD9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 09:37:51 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7a9a7af0d0so433361466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722245871; x=1722850671;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3eJDPYXgy8QQkiw/Zb7wYEQMVUFtjlM4KzTipc5erj0=;
 b=Qd0Pr4jkGTsjFkilToScrMcFl5f6t+dvFgAsKWZQKqOf2NVlEqC9wabAFkb2/0LjUr
 mZachR49Y+4de/ZCsbb8YNFE/LHX/Z0SuKRWCeW9BvnfT+dWuG9mhER+hcKNuRqq/nPB
 cfKjjUI5uGOX+29fymGINfVlLHcyuOd6cBCb8sF22jIUCDAlVa7TzerP339nl4n0BrD1
 J5LBlxHQ0PAie96VLH5pJBe6nVb1hM4M7r+zj6eKi8ZonkOzYr2kkZRVM5Czz/pcBc0a
 3QYjmpZD+21UNmHSkq2lox9BSLX0trCRWPCpRVcPxGFk458SHOpDyChgfg6vdpVbIN90
 jhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245871; x=1722850671;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3eJDPYXgy8QQkiw/Zb7wYEQMVUFtjlM4KzTipc5erj0=;
 b=XWV9pWElcjGH+lrdnCcPNuoai7X0nyaxhWEL4n+Wxuds5FBfxG84HERYF1pQ5zel8B
 bvc2ViRFZgOOpXnTXRnBt2/rC+oAWh3caN5vsHRaFYFi6D1iGhczVsNHilZ0d2a7A79e
 DSU+EivYufqGj6jVUwn+v5CXykr3Al3sB7RwfYcHSUQXobB+eFCHt7k0FmmKneyIZpGa
 OV6FLSEAdzAdI1B+e0ZuW5otj/m+3vnoh+9JPdfC9vxSW235xMh5eM7r3l8AlK74TNRe
 a06inZsjLkwnqNtZ1IyHagThb4GgEDYwk9nkkjx9pgGcJli5EFEDUdbYpRA+mQnY4e5b
 f0Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaPDOAWMEbDN5cnI1mgzphhDS2vtxXgypeIcFGonM4K7dLpsJAcBw/4wzkPlK7EXiHZe25Rt2MQD7CA5ZchXXNZTSRJ0/PhZBHY/bxt84t/wvdNv0/XBJT
X-Gm-Message-State: AOJu0YwtznGK3Zbvc3rhmjY+FqBSuZO9Xy8ofh8zsdcULNmvD+0yOVKW
 kDSheyyIKLgMrIRiSA2a8JTvItFjm2qK+vHMCArAHtab8awyHx2F
X-Google-Smtp-Source: AGHT+IEBHnn7keFlJ0y5guCeEd5XYooTXx71rjnTo2kZAITFA6R1xQQb3gBfc6pw8Nx1ROztsH5/xw==
X-Received: by 2002:a17:906:d54a:b0:a7a:a763:8428 with SMTP id
 a640c23a62f3a-a7d3ffef7e0mr398513466b.25.1722245871127; 
 Mon, 29 Jul 2024 02:37:51 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:37:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:38 +0200
MIME-Version: 1.0
Message-Id: <20240729-const_snd_soc_component_driver-v2-2-1994f44f1ec2@gmail.com>
References: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
In-Reply-To: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=7340;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zZ1diTwdBFLWVY+JZ+0pKMWYvvFbvI82HD0Up/hucrg=;
 b=cRSDxdHyOHXmzLyYvLiNlix02j3ou428swU4/3/NqFC3bMG3c7oecUnUl5+vKxiblOPgDxGaB
 ny4oe+aTVW0Dn0OxNtzjiG8MAMO6P3tIKEmPT2ClAJheGb4Y3GQmsgL
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: alsa-devel@alsa-project.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] ASoC: constify
	snd_soc_component_driver struct
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

Declare `snd_soc_component_driver` as const to move it to a read-only
section for the drivers that do not modify the struct after its
declaration.

The affected drivers only pass this struct to
`devm_snd_soc_register_component()`, whose argument is const and
therefore does not modify the content of the struct.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index ea01d6490cec..3392693faeb9 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -311,7 +311,7 @@ static int au1xpsc_pcm_new(struct snd_soc_component *component,
 }
 
 /* au1xpsc audio platform */
-static struct snd_soc_component_driver au1xpsc_soc_component = {
+static const struct snd_soc_component_driver au1xpsc_soc_component = {
 	.name		= DRV_NAME,
 	.open		= au1xpsc_pcm_open,
 	.close		= au1xpsc_pcm_close,
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index d2fdebd8881b..c9c2b1e71d55 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -289,7 +289,7 @@ static int alchemy_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver alchemy_pcm_soc_component = {
+static const struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.name		= DRV_NAME,
 	.open		= alchemy_pcm_open,
 	.close		= alchemy_pcm_close,
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 2d1e241d8367..4cb2fe10bcdc 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -707,7 +707,7 @@ static int cygnus_dma_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver cygnus_soc_platform = {
+static const struct snd_soc_component_driver cygnus_soc_platform = {
 	.open		= cygnus_pcm_open,
 	.close		= cygnus_pcm_close,
 	.prepare	= cygnus_pcm_prepare,
diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 4f9dabd9d78a..04304a7ad915 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1649,7 +1649,7 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	return cpcap_audio_reset(component, false);
 }
 
-static struct snd_soc_component_driver soc_codec_dev_cpcap = {
+static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.probe			= cpcap_soc_probe,
 	.controls		= cpcap_snd_controls,
 	.num_controls		= ARRAY_SIZE(cpcap_snd_controls),
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 451a8fd8fac5..13443f569ddb 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -566,7 +566,7 @@ static int pcm186x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1863_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1863_snd_controls),
@@ -579,7 +579,7 @@ static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.endianness		= 1,
 };
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1865_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1865_snd_controls),
diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index 3401a25341e6..9bca53de2475 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -24,7 +24,7 @@ static struct snd_soc_dai_driver pcm5102a_dai = {
 	},
 };
 
-static struct snd_soc_component_driver soc_component_dev_pcm5102a = {
+static const struct snd_soc_component_driver soc_component_dev_pcm5102a = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..7043aa9a206e 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 			SNDRV_PCM_FMTBIT_S32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-static struct snd_soc_component_driver soc_codec_spdif_dir = {
+static const struct snd_soc_component_driver soc_codec_spdif_dir = {
 	.dapm_widgets		= dir_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dir_widgets),
 	.dapm_routes		= dir_routes,
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..d997862767ec 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dit_routes[] = {
 	{ "spdif-out", NULL, "Playback" },
 };
 
-static struct snd_soc_component_driver soc_codec_spdif_dit = {
+static const struct snd_soc_component_driver soc_codec_spdif_dit = {
 	.dapm_widgets		= dit_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dit_widgets),
 	.dapm_routes		= dit_routes,
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index bb0500e9d3ea..9be054837f68 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -364,7 +364,7 @@ static int tas6424_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_tas6424 = {
+static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.set_bias_level		= tas6424_set_bias_level,
 	.controls		= tas6424_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas6424_snd_controls),
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index fb5dd9a68bea..b35c28b70265 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -309,7 +309,7 @@ static void stm32_adfsdm_cleanup(void *data)
 	iio_channel_release_all_cb(data);
 }
 
-static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
+static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.open		= stm32_adfsdm_pcm_open,
 	.close		= stm32_adfsdm_pcm_close,
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index d90b3e4b0104..a4cf14462374 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -384,7 +384,7 @@ static int evea_codec_resume(struct snd_soc_component *component)
 	return ret;
 }
 
-static struct snd_soc_component_driver soc_codec_evea = {
+static const struct snd_soc_component_driver soc_codec_evea = {
 	.probe			= evea_codec_probe,
 	.suspend		= evea_codec_suspend,
 	.resume			= evea_codec_resume,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
