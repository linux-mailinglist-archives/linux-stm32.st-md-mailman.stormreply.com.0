Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EE5576D5
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 11:41:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 955DDC57B6C;
	Thu, 23 Jun 2022 09:41:23 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32703C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 09:41:22 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N7fLsF004327;
 Thu, 23 Jun 2022 04:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=i32Dkqu6yqHdJkz3oPGSblt6FxDAn2yx5mHso4uT6jY=;
 b=nIE3n9kDrMoH4e/LAawz+RzUC2VoQWASFOauN4tM5A1H8JMc8tTXY2cVBGOwMqIrQM6K
 STuS8s6JFijovnai1W2MNLfVUjobxH6CViDtDBBPJUDXBmHrZJCFNVYS9HIj6iGziz+r
 VnKUwYrgOKvFYjTYgJ7g8SHsa+TlwYy2/uQ+7BQ2M5FiknT1aLaBacYmzVf4gZibj1KF
 +x6MXDk3uwUf66jBJA5uO/c3MJHdGz1TvkpWGO+3eq+mJ5MeXOg5XvUPhCzW0RdI3EaW
 UeEhW8dhlBiL29hjgLxwPY+qxBlb9eORf5BQNruocf4tI6GNJ6GP/Mzs9siqoEV7xXtG sA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6jm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 04:39:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1797D11D1;
 Thu, 23 Jun 2022 09:39:51 +0000 (UTC)
Date: Thu, 23 Jun 2022 09:39:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
Message-ID: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202206230910.wUXKFP3z-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-ORIG-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 27/96] ASoC: au1x: Migrate to new style
 legacy DAI naming flag
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

On Thu, Jun 23, 2022 at 09:59:06AM +0800, kernel test robot wrote:
> Hi Charles,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on broonie-sound/for-next]
> >> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
>      227 |         .legacy_dai_name        = 1,
>          |          ^~~~~~~~~~~~~~~
>          |          legacy_dai_naming

Hmm... apologies for this not sure how that snuck through my
build testing, must have somehow missed this one.

Mark do you want me to send a v2 for the whole series? Or given
the size would it be better to just resend this patch?

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
