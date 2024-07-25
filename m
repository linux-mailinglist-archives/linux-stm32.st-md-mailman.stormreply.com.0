Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B593BFED
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2024 12:31:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44B70C78018;
	Thu, 25 Jul 2024 10:31:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50A6DC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2024 10:31:42 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so42977966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2024 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721903502; x=1722508302;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
 b=Er3swuE6oeXyDcBrOAE1mTMwDoLV6LaTxlerZlO+pUp1tsTSatYNrkQ22klZLNaWHb
 tii/xK7OWFTf7OxTiFx2mjvzvXXUKcfIRWn4SUZ/gYcdxwupUT0OJe2dgJm00aAkKFqd
 VP/WfGJ0Xp48jNHSaxr6OvAjqXGqi4ezzIp852vNyncDaWEBPpJE59k5ZVxVmJB+v6lF
 u1FktqgmwXm4Fy+qEIJy0ODwhzb3jkbroElQoJArWYQG0QyX1ix4CMhSp9R38r5vQUrZ
 nh57TWRDWnwdFvUAzduOgE0kLH+M3e3ld+BZ9ZTFnAzOL8vJdJ2jY+J1OJfs758et9qv
 BWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721903502; x=1722508302;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
 b=NeogQszAm9ikUBeaJQluhBUMj76X0zqWkb8Wb2UZ1uBT1X05oDX8EmxC0gG4YFygqz
 4lshZCNV4Qek+iHH/eBNjIEvSVOMAXEW8mL351sH1DwJoV9uO7l6iSftW8w9MYzqjhxH
 5o7VR9TzPVzD+Xnh6M+C53BhkngjQRu9yO6Rck9XVc265QBSlkyfa7XSJwfbEUgZ2kd6
 c1CXDFmg6agxW+ioHQzbiV2eo07rkgx2r/mcee9vftOVlE+J8VPFv4YhRzs1w5Q0kKz2
 Z6yxDsgKgvF2L1oQjqjVksdylkfqyHoN1p4Lx4DiLgHIf19aOlwdlv218ZjcouNuhgab
 rPLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvw87G8fwAaiJWpMAfgtUQNSPKmxqo8YWjw46NOcJmooNBP369pttMzdhhEpKVD17FWvD2y69oEpUR9f7ISH2wT/hOF8zPNjeMq9JlXNEPl440/cZ7TLvN
X-Gm-Message-State: AOJu0Yyy+Qg2XpQozApgDYZjHSMqGJyfsPlYkruBH9LhmvZaR9G8L8aV
 NiI75IvBsc116eJXGHJYOyReaLdnicmPA3kzTxwQolZz6pwd41cR
X-Google-Smtp-Source: AGHT+IGAu3zvUQHfsTC/UTH4WJiceuCvU2xMUjNKMn2kBRL9RuFZai32Qp0okX0mkrFdHSC/S11Q/A==
X-Received: by 2002:a17:907:97d0:b0:a7a:ab1a:2d64 with SMTP id
 a640c23a62f3a-a7ac506f3a4mr176339666b.58.1721903501593; 
 Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 25 Jul 2024 12:31:38 +0200
Message-Id: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIopomYC/x3NwQqDMAyA4VeRnC24os7uVUSKttmWg4kkIgPx3
 Vc8fpf/P8FQCQ1e1QmKBxkJFzzqCtJ35g86ysXgG982T9+5JGx7NM7RJMUk6yaMvMesdKC6JfQ
 +zKFbQjtAiWyKb/rdg3G6rj8V+brQcAAAAA==
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=1490;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=htIX0gNZEQ2pwJvqGxD+l3IATOPpwVwt2PCD5KSSKn4=;
 b=vBDKmvKNwCIRMMTYycPXUCa0VMk1znrRDaTVxp1ewj0Yo659ha2gfmiErmmqJzC2lEeS99wV6
 S0Y8WTWXCEJB+QZG9JPwzy0tFzzO75Pecq8vABwhbjWvw6sKrkIMHfw
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: alsa-devel@alsa-project.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] {ASoC,
	media}: constify snd_soc_component_driver struct
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

The `snd_soc_component_driver` struct is never modified after its
declaration, and its only direct user
`devm_snd_soc_register_component()` expects a constant value anyway.

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/cs43130.c           | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/sti-sas.c           | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
