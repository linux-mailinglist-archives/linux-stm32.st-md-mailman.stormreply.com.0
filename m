Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A564289835A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Apr 2024 10:45:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C568C6B45B;
	Thu,  4 Apr 2024 08:45:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E05C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 08:45:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3437efea0ecso513437f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Apr 2024 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220323; x=1712825123;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=8fo6r6+GpOmbs58KA8H03fqz5IfKM9XbnGIu84c+CU0=;
 b=Ae/HD9AS6yQgg8gXTPyBBfLxChYQtEcZ6iHo3xM/W/mvzUdc+a43aAs+myW6EqRIwB
 lCE9CfJECOXNoa3m1W/Rm2sVP756/iaFbvi5t0rzottTAtR//Wyh2ZDR6nTqTNRaqMij
 sv9OCstxre1mpPUwH4A2DII6ylXJCqcxHoS5mcEAFBUw8U9CJrHt//uIH4BjljbJxXVF
 sB38AfOvyhSpfRhpYT4/YjVC+AdDTIgan1zfr5zUWVV53qbtvoLu75lYov+7tGL0XA/+
 x4B/bN7gOCbeot7Z1vwagDn5kZaOaNpZ1XYPmZvqDFOJRLlHW+7vgnc6DV/OxnS5L177
 nPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712220323; x=1712825123;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fo6r6+GpOmbs58KA8H03fqz5IfKM9XbnGIu84c+CU0=;
 b=uJhEWkM2fnKnX8qZPKUdTeTWqlgTk8D2isv5iP6MdWXjHDv5pdfiG5eK/H/6WRXypm
 H90mKNKC+oRwNryRP0xeUa6GmeHpTCJyEUfLHAmQE+ZSCSZgzyTMZqOegjEC87vw63o/
 avQn7763p2jgLIJZ3tPvpQ8pQt/8JlgQSniloRn66r9BqYDGysxcUVGj07KP0waxcK2D
 bA5B3EuNZFpdfrK3aSBj9U3IdeGyurgXzKlVARqBaV01pViFMgbf2UhzDy4kgI0r0dd9
 OV9Ws+ALtfVxqRN7EmSg3tGoQGsUUH9NmHaaHpJVxLvsJ6xZlk5nMMkaHtpbfa6qSf+x
 qe2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+953a/dJRIz3DWr93m91KC0csdCXZoUneIocS/I+gJpzVqrph11JqccGllfvaafE7JJF5eAa9zPQn1E7PMFXWGxbX/zolVfc5dX3RTKzUXiTnC8VNPS/m
X-Gm-Message-State: AOJu0Ywuat6u5z90cDU+oiOATxi7PoaRZ85WG5ntqMo2MBz86qW9V5TF
 zIv9SQdD1+gJz2bq1MYJbxOrcChLF3VsuW93kfZzC/Xi/3EpPqeeqXimVMaEEMg=
X-Google-Smtp-Source: AGHT+IEAcsOPc4S1DUcCXvM+g9yxoPEXC4apjaO2kFEGisIgkysCQizj9ZAWeb5epN2r4xqgWw8tKA==
X-Received: by 2002:adf:fec4:0:b0:343:61bb:115d with SMTP id
 q4-20020adffec4000000b0034361bb115dmr1666179wrs.26.1712220323243; 
 Thu, 04 Apr 2024 01:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
 by smtp.gmail.com with ESMTPSA id
 bs26-20020a056000071a00b003439b45ca08sm3621056wrb.17.2024.04.04.01.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:45:22 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 04 Apr 2024 10:27:11 +0200
In-reply-to: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 linux-sound@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/16] ASoC: Replace
 dpcm_playback/capture to playback/capture_only
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


On Mon 01 Apr 2024 at 00:27, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark
>
> This is v2 patch-set
>
> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM doesn't need such special flags.
>
> OTOH, it cares playback/capture_only flag. It is needed.
>
> This patch remove DPCM special flag, and replace it playback/capture_only
> flag if needed.

Hi Kuninori-san,

Thanks for taking the time to clean the dpcm flags.
While at it, I wonder if it would be worth taking it a step further.

playback_only and capture_only have implication on each other. If one is
set, the other can/must not be set. This leads to conditions which can
be fairly hard to read and possibly bugs.

I had to re-read the meson patch a few times to make sure it still had the
same meaning, TBH

Wouldn't it be better to replace those 2 flags with a single bitfield ?

something like:

unsigned int directions;
#define PLAYBACK_VALID	BIT(0)
#define CAPTURE_VALID BIT(1)

... or something similar.

I think conditions on the enabled stream would become much clearer like
this. The only invalid configuation would be '!directions', which again
is easier to read, instead of checking if both flags are set.

It would be easy to keep playback_only/capture_only tests, where
necessary, with an helper function.

What do you think ?

Sorry if it is a bit late to discuss this.

>
> v1 -> v2
> 	- based on latest ASoC branch
> 	- keep comment on Intel
> 	- tidyup patch title
> 	- tidyup DPCM BE warning output condition
> 	- Add new patch for Document
>
> Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com
>
> Kuninori Morimoto (16):
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
>   ASoC: amd: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: fsl: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: sof: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: meson: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: Intel: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: samsung: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: mediatek: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-topology: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: soc-compress: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: Intel: avs: boards: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: remove snd_soc_dai_link_set_capabilities()
>   ASoC: soc-pcm: remove dpcm_playback/capture
>   ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings
>   ASoC: doc: remove .dpcm_playback/capture flags
>
>  Documentation/sound/soc/dpcm.rst              | 14 ++-
>  include/sound/soc-dai.h                       |  1 -
>  include/sound/soc.h                           |  4 -
>  sound/soc/amd/acp-da7219-max98357a.c          | 20 ++---
>  sound/soc/amd/acp-es8336.c                    |  2 -
>  sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
>  sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
>  sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
>  sound/soc/fsl/fsl-asoc-card.c                 | 16 ++--
>  sound/soc/fsl/imx-audmix.c                    |  6 +-
>  sound/soc/fsl/imx-card.c                      |  7 +-
>  sound/soc/generic/audio-graph-card.c          |  2 -
>  sound/soc/generic/audio-graph-card2.c         |  2 -
>  sound/soc/generic/simple-card.c               |  2 -
>  sound/soc/intel/avs/boards/da7219.c           |  2 -
>  sound/soc/intel/avs/boards/dmic.c             |  4 +-
>  sound/soc/intel/avs/boards/es8336.c           |  2 -
>  sound/soc/intel/avs/boards/hdaudio.c          |  4 -
>  sound/soc/intel/avs/boards/i2s_test.c         |  2 -
>  sound/soc/intel/avs/boards/max98357a.c        |  2 +-
>  sound/soc/intel/avs/boards/max98373.c         |  2 -
>  sound/soc/intel/avs/boards/max98927.c         |  2 -
>  sound/soc/intel/avs/boards/nau8825.c          |  2 -
>  sound/soc/intel/avs/boards/rt274.c            |  2 -
>  sound/soc/intel/avs/boards/rt286.c            |  2 -
>  sound/soc/intel/avs/boards/rt298.c            |  2 -
>  sound/soc/intel/avs/boards/rt5514.c           |  2 +-
>  sound/soc/intel/avs/boards/rt5663.c           |  2 -
>  sound/soc/intel/avs/boards/rt5682.c           |  2 -
>  sound/soc/intel/avs/boards/ssm4567.c          |  2 -
>  sound/soc/intel/boards/bdw-rt5650.c           |  4 -
>  sound/soc/intel/boards/bdw-rt5677.c           |  4 -
>  sound/soc/intel/boards/bdw_rt286.c            | 10 +--
>  sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++---
>  sound/soc/intel/boards/bxt_rt298.c            | 26 +++---
>  sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
>  sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
>  sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
>  sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
>  sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
>  sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
>  sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
>  sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
>  sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
>  sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
>  sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
>  sound/soc/intel/boards/cml_rt1011_rt5682.c    | 15 ++--
>  sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
>  sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++----
>  sound/soc/intel/boards/hsw_rt5640.c           | 10 +--
>  sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++---
>  sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++-------
>  sound/soc/intel/boards/kbl_rt5660.c           | 18 ++--
>  sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++-----
>  .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++---
>  sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++-
>  .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++---
>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 +++---
>  sound/soc/intel/boards/skl_rt286.c            | 26 +++---
>  sound/soc/intel/boards/sof_board_helpers.c    | 13 +--
>  sound/soc/intel/boards/sof_es8336.c           |  8 +-
>  sound/soc/intel/boards/sof_pcm512x.c          |  8 +-
>  sound/soc/intel/boards/sof_sdw.c              |  4 +-
>  sound/soc/intel/boards/sof_wm8804.c           |  2 -
>  sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
>  sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
>  sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
>  sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
>  sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
>  sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
>  .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
>  .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
>  .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++-----------
>  .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++-----------
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++-------
>  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
>  sound/soc/meson/axg-card.c                    |  9 +-
>  sound/soc/meson/gx-card.c                     |  1 -
>  sound/soc/meson/meson-card-utils.c            |  4 +-
>  sound/soc/qcom/common.c                       |  1 -
>  sound/soc/samsung/odroid.c                    | 11 ++-
>  sound/soc/soc-compress.c                      | 10 ++-
>  sound/soc/soc-core.c                          | 20 +----
>  sound/soc/soc-dai.c                           | 38 --------
>  sound/soc/soc-pcm.c                           | 87 ++++++++-----------
>  sound/soc/soc-topology-test.c                 |  2 -
>  sound/soc/soc-topology.c                      |  4 +-
>  sound/soc/sof/nocodec.c                       |  4 -
>  91 files changed, 502 insertions(+), 863 deletions(-)


-- 
Jerome
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
