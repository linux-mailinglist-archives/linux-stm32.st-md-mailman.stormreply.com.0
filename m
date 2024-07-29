Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CE93F152
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 11:37:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AE68C7128D;
	Mon, 29 Jul 2024 09:37:55 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1CBDC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 09:37:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so5716966a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722245868; x=1722850668;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
 b=j8eguVJROQ3t9tdHqBm8ugGVZrDw10evMatqFL9k4ezmh5CGmkIERU54UcD9qdfgUs
 cSYoG4F2BRykI0+R+W0zwTngd2e/n9emfZv1UxLv5bKNVlHoxk7GJHKGpNFjghvdXEow
 eZ+utz+L5ULcjsmIJ48LHDl7go7BTmrs4pwrSljATI3IhjPfJTnhdaO0FkconAAUbDj6
 DzDwTqeQtDaFfnF4C/H2ailCkUfYrXgkBB1enwN2zpvMimWENMMAOv0vL8p8ZobRZn6R
 L2KfMyoBM0doj8+KrewMPk8Z9VI+rJzodKAzF+O1rZ7nlK1vci2o9/TUNMSHAih6hxMj
 b4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245868; x=1722850668;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
 b=Wj5/lDpMS4BciI4rxI5JiH9rVqVObe5wIKLLCFC8y6E7SK8lNuV21Rbgq+e6cl3Kxu
 ClW0Ew8EK3o2d4CyU/P/IclqeVUlN5wFBmM6jFeqqdOFMfLuqLKSZhfJVQCVSPleTXON
 Wycvr3XHpW7Y8AIe2RQIaEVvxV2q4LTwL7co5l8fsIqB1a0oufY6Gxz4pAFEHdQKwLtX
 nCi4RS181msL3DscfWy3cdHQab4kuvPeRaEX/1QUWvqQlO8G6b6uIikb/Qq6fCIkd42u
 ZI7P29eyq9sn+wnE5a613VeM/SwEunA8Mf35ZbK/0u+QdXuF36iUOQey4c742mlMxuI6
 JDEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfUjbePZJ3aj6cgnXYB5rKlaFuMIbkEUZaf9xSQnTQdAAD0vavjeK2p8/h971xB3Tkx1aac8ye8sD2wlv5bAHmOahrBmhJ2/USD7nDYB0Vd6I3eLxA79qT
X-Gm-Message-State: AOJu0YyEEeFwDWwy3xofiX7PTOeFc25M5eRcifhSZbAInmW43jZNCQIA
 BIFthrScis+GKiN8iNcCJzfHNVs2U7XCcO5hxUbhO4nSgxlJtOd1
X-Google-Smtp-Source: AGHT+IGB+vRrdX/B/2dg/ESisrGwMj2AyPaJblfTpT4noAFpKg4KyVyg7wAt53T8pHgMroSEYzYs/Q==
X-Received: by 2002:a17:907:96a0:b0:a7a:a0c9:124e with SMTP id
 a640c23a62f3a-a7d3ffadf1amr581593566b.4.1722245867939; 
 Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:36 +0200
Message-Id: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOBip2YC/42NQQ6CMBBFr0JmbU2pINSV9zCkgXaESaQlHdJoC
 He3cgKX7+fnvQ0YIyHDrdggYiKm4DOoUwF26v2IglxmUFJVslG1sMHzatg7w8EaG+YlePSrcZE
 SRjHoq9K9rgddtZAlS8QnvY/Ao8s8Ea8hfo5eKn/r3+pUCikurkGULZZKD/dx7ul1zkfo9n3/A
 ucOmcHMAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=2529;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dUb6XFAWURF5fTzbw/+1MFJZCob3+hK/YpTTVucusdc=;
 b=RPp7DAhUclessfFNFbcWgORq5LFwt1sEuXGSZwmnwQyt6PJKpGQSAD09Ku+TP7WOneIIyaxWv
 s/TEiuxzbZNCW6/irPcZOG1uLKlqLQvxJpgMvBhbXL3qIH7lZwJQGEF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: alsa-devel@alsa-project.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/2] {ASoC,
 media}: constify snd_soc_component_driver when used as read-only
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

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections for the drivers that do not modify the struct
after its declaration.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

To: Tim Harvey <tharvey@gateworks.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- drop cs43130 and sti-sas, as they modifiy the struct in the probe
  function.
- Link to v1: https://lore.kernel.org/r/20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com

---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
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
 12 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
