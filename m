Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC6888CEC
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 05:35:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24B5FC6B444;
	Mon, 25 Mar 2024 04:35:51 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2089.outbound.protection.outlook.com [40.107.113.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB41C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 04:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fksZZ2ZpjO8kF5+Dn3fCh/2hvd35BedCIMyVHzMkNdQAV7UCCJIIPzlgriOx0u0a0tiNdcOIv/ngIATjm1tKHvmJWHzixZnoUXSDZrkj8JRoF0DbH290gLs2vOyt1oADmCKjKn5+YFG/EkhkqEwvOvrPgGQg6xobf5qdZTVn9GIC4VLAVUGz0FTt1T5spEhVxID1ode/EofyVaCQYN6/AVoPpm4QmezxHphNpeZ4ghA8EG1KCLw5qyyAxavvMvTmHaR7/xg9/vTggvtaNuX3D2DIbTWmugsdvaUeW7CxdYQLQQx4Yd6/uHzEXDB9eVPoFHWHF3QFTiMSjiGUE4U0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ivvTZ3DSaAbYHKeV10W6H4zjQ0i4JMJzscVG4DQ+3I=;
 b=AtDyNWli4FkyhSKXIFPK07xKOCjPicI4L5TCJqEb7cuMPDQZcNw6i1hs07LPiQlmzdeQSSPMAOgITB2FGwGvD8qvZddxgpAKXsrLMgj767MjxEwDix5al6tZ2zlq4OXI69J8vHo1+n2hQgMazP4R1ucMp1vaRX1guZnliscgCVUOO/+j6oPO6suQV/lCKhl7FE+hTXeaogZInUzYvuLzBrRh94bFJNEV0pyhLPrnEszo3fDMqneY8hNYHni9ABbgV1T0CnhWoNKfRwVfCkXC7l4wu+Vcp2TvUQOWibLNicSrE8tcW5AVBL6EBD2yK5t2qpTJcku954hlvxYLjdBrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ivvTZ3DSaAbYHKeV10W6H4zjQ0i4JMJzscVG4DQ+3I=;
 b=TCccBGko6qLciHXZtdjEifOFcvrr/GxuV/4jBwkDOSsT1xNRp254QO5RgNQ961fmmNpgWrAY6e+Sd0nzbIdrNx8X3xashSlKNNhzr1tz6hckfe6xOkIj8+QBtpizdFZGgRfqj6Pxz3BaFlulVIw0+O4tb6iGEfnX+UqQ0Wcx6v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:35:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:35:45 +0000
Message-ID: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 25 Mar 2024 04:35:45 +0000
X-ClientProxiedBy: TYAPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:404:29::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f86deb-99ba-4a72-fda4-08dc4c850971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32TQN0hedUjRDYVlXAT3jmzqc7R1UdBCf1EjBgkm13RhkYzzaCKGaP+rJULoA19EDbEbWwdBo9OWMVDPjdSj/0xQgvPsCQBXHpC+dI7js/ydshStq9z8W36LNo7WXHEtUDTOkjQvqknrNhgLDh63ZRlpN6uVsJ6uKcgweREZOOIhEkTvZGJssOPp3kr0GD0+1dDKtrgcVwhzIw7t1UqNOky7IbLUdM1Sh6TuaxowTWqIKXSwt4RFTaike2RMrt3sIwz/2WCzDEiRib0f2fNF+40zTRybOpLTFp30XBDDiEUeOu63ABv3VTxYS03CMfGmqnwq/2S7Cf6ZZNFXnpozq8+nmOLrO6iUboSbGNrL76d5EWpPnsdz1c0IJQVwq9Fu0zCIljp8ADlkCsSywLbqZJUdpv6gmwMiXacVcViKDGAqBsDHSKLgYRMhgW0vnp4c0N8UYjaoX1ipyaXTR643YAAsSRAEUMfuuumyfBimffvmFiFM4KVwaPtTxo48RAZOIx1xEVSW/v/3j8FrN8YJHRzRcroqyWAOPVEYkRBqsZ31egr8BeED2ORiQ20ZTSTZ6rT5xd7aN3WTrfNKHoAE0+U6LWza3cq2H9XytWqZK0utCFI0AN5CJqVA+/+afXWAIHRQF+0Su69/TSog0brRw3obvQaxDtY2tlvXO/30sJWHnlAxEbZ9ni0UaFTbsg/5ElghHVAvU5OV/AlzfTHnb/B9PiCObFVWUaKi5/PqxXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrblTj5P7wx6mm/EEIOa5H5K02E0+so2OFLlaSWnkkcC94B9CDuzg8RHwR4R?=
 =?us-ascii?Q?fSNMf+Uwn581wzkBDmji23fB+WjwxSs3ZzL4cRrTwd8xqqsSUH64VjGRfSEH?=
 =?us-ascii?Q?CnZMK6SYoygwj7+GHTaeBnZe+ua/nbpJRefc65ZdzCsAeVBGVWhM494yB3ED?=
 =?us-ascii?Q?WDWb+XOY8tKzHvl8OKCUT/j2Ww8mcTkQybnrzk/pNYbtm3znZpjvJ0jZeG70?=
 =?us-ascii?Q?LpEQ3qBt8+7jsWocywKMUTeGb0+wqR6VpwKnsI+t0F4FSttfFvqyBlchbJF4?=
 =?us-ascii?Q?5mV00vDcEDLMDwYPVTyWMDyNtjqqEG0bs2YPppxY5W+mOr1p3sm2D9YgauwU?=
 =?us-ascii?Q?lbUMsLfzSN4lmarS52T4zI/JojlEhLX7CpElkuuOgO2Fqf9VaE8Xe3xY5+s5?=
 =?us-ascii?Q?VgWr6WQG44pte0EFNm2px9cM7Al8da9i1X2rJsk1pDPOfaKHsf7yXwiYo9iB?=
 =?us-ascii?Q?l8gCr9uVIBKfaFY/mLgXj3k35qYtHehIuhvMTKDXIGHImDBUfCcKbZYxQT4J?=
 =?us-ascii?Q?hkoolNR5EglgtaOr0WDQAZC9U+tFDOS4FBoUr+Ow3jhpCrYOvziou37Ghc7Y?=
 =?us-ascii?Q?b046lEl5qEpFMgG3ASpcGZ6ftR3Z6pl7W96L/tAxQSnDDkBiiAO2mDFUkU1J?=
 =?us-ascii?Q?GMLKRsn2IDvcQYG0BLuFObsy/NCEh54KXGRjgpBp5AmDA8TNwkW6+OLTPW5i?=
 =?us-ascii?Q?WqDshx2bgijK2IBw+ucGHlWgpddvnM6zQND7u0B1ki1DqjvrwnFpPlUcoWVB?=
 =?us-ascii?Q?4D54xVfYFTaI0iJS01sbUm4BxfMeMaDZhHuGzLLEuIsHKh6QBKe9pk4lWm3E?=
 =?us-ascii?Q?UrvMGM/fQNgMg73oFZWNf02poGPon8W2kNKYoqwRUi/AqhTg3O+pUgmJqlfd?=
 =?us-ascii?Q?kcgTrYEXkPvqqqShVqDFYNBazPctr7ukZjCPxhB/Gh5FCQpCJKW5P+SnmTaX?=
 =?us-ascii?Q?EvW6Lq0kCkhIwquzkgJRSdaLGnBd3XWlUyzU2Dr7dkTGOGuWUJKxUKtjFmT7?=
 =?us-ascii?Q?tcu6TiBDXN7fTWo/T/EEgXFucheJVfu3Ihu2nABEOXKtoWSaywRGkfmfnt44?=
 =?us-ascii?Q?Tz4v8qc10F/qeREwrNWGAgb/LBtUrKyYB0vHupMiz4O1LkJ1VnkTB4O3Q5kV?=
 =?us-ascii?Q?5X401/mHtn+/CPW1H5IhEhUHlBoFSBGzRjxQ2Zy3WPMVS4gq67nLtdQ3vhbr?=
 =?us-ascii?Q?ZcqYajjprHnrxH2cQo1TSFOhReT8XUc6tkkiN+gtzMIFUmy+k8Q4amNedQ91?=
 =?us-ascii?Q?+LettbptB2auhzsyag60+BT0J0R5NfPb/rdIzzvpr7Iyz4qarHNa4JzfRojb?=
 =?us-ascii?Q?bkNoOE0muwT0TwRMjBoLWuGQS0fLJx3DBP7wu3Tb6UllFiTP5DDNGs0eaFq6?=
 =?us-ascii?Q?8Fl7HY63aX2sxkIKutbtMTksfxYijNYwcMTEAH7FcwsANiuabEdYfNME9eIW?=
 =?us-ascii?Q?Ac9YZxwCCBnOueVt4qoVOcCtAgu1wQmtm/NOclc5uyoLot7nEEmMk5q1EkGB?=
 =?us-ascii?Q?/Jbx0NEqfPqM9MthimDhAE7hPFsfETjIxV4RvgaM3kFI2jvrOntO4lTgNsQQ?=
 =?us-ascii?Q?hrmb7Bnkc4yX92wAkrIaWtz3hBbF7SXRftC1OBb0WXTJTYG3F1trduD70SQ5?=
 =?us-ascii?Q?BDoniq0J9m8n1ZYay4JcmnE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f86deb-99ba-4a72-fda4-08dc4c850971
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:35:45.3851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb2ZsEu21k1TiexFqDuYz6U+2rah67Zxl4v/zsqbJ65RGTfcpfRlRt4tQDzfUJYVbijpjIV1VzXRZkU6SxN6ub0oMLCfM3HH61S7xxB7mi/uCiDGkY0gbYQE0vOSSBpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698
Subject: [Linux-stm32] [PATCH 00/15] ASoC: replace dpcm_playback/capture to
	playback/capture_only
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


Hi Mark

When we use DPCM, we need to set dpcm_playback/capture flag.
If these flag are set, soc_get_playback_capture() will check its
availability, but non DPCM case is checked without special flags.

OTOH, it cares playback/capture_only flag. It is needed.

This patch remove DPCM special flag, and replace it playback/capture_only
flag if needed.

Kuninori Morimoto (15):
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
  ASoC: amd: replace dpcm_playback/capture to playback/capture_only
  ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
  ASoC: sof: replace dpcm_playback/capture to playback/capture_only
  ASoC: meson: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
  ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
  ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel/avs: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: remove snd_soc_dai_link_set_capabilities()
  ASoC: soc-pcm.c: remove dpcm_playback/capture
  ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings

 include/sound/soc-dai.h                       |  1 -
 include/sound/soc.h                           |  4 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++---
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 16 ++--
 sound/soc/fsl/imx-audmix.c                    |  6 +-
 sound/soc/fsl/imx-card.c                      |  7 +-
 sound/soc/generic/audio-graph-card.c          |  2 -
 sound/soc/generic/audio-graph-card2.c         |  2 -
 sound/soc/generic/simple-card.c               |  2 -
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++---
 sound/soc/intel/boards/bxt_rt298.c            | 26 +++---
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 14 ++-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++----
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++---
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++-------
 sound/soc/intel/boards/kbl_rt5660.c           | 18 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++-----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++---
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++-
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++---
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 +++---
 sound/soc/intel/boards/skl_rt286.c            | 26 +++---
 sound/soc/intel/boards/sof_board_helpers.c    | 12 +--
 sound/soc/intel/boards/sof_da7219.c           | 33 +++----
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +-
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++-----------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++-----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++--------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++-------
 sound/soc/meson/axg-card.c                    |  9 +-
 sound/soc/meson/gx-card.c                     |  1 -
 sound/soc/meson/meson-card-utils.c            |  4 +-
 sound/soc/qcom/common.c                       |  1 -
 sound/soc/samsung/odroid.c                    | 11 ++-
 sound/soc/soc-compress.c                      | 10 ++-
 sound/soc/soc-core.c                          | 20 +----
 sound/soc/soc-dai.c                           | 38 --------
 sound/soc/soc-pcm.c                           | 88 ++++++++-----------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  4 -
 91 files changed, 507 insertions(+), 876 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
