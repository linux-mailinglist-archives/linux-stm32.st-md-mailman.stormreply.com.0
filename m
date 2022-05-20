Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F852E97D
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 11:57:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CFCBC03FFB;
	Fri, 20 May 2022 09:57:49 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C559C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 09:57:47 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCw9026795;
 Fri, 20 May 2022 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OE6raZbucX9LQfP+TUClB+u691iV9kBCVX1IaiFUTRE=;
 b=OZjWqUg2GB9AJ9JqFusRILLr+RJoWNaMdCe9RA8DZ3zC+BqhasJKotr9r087ufLn2CfT
 ImDGP7AQdM1dEhMs05cuGKULUV2UMVhWKhwv1lv9aIYxP58hsADDle5oYJD73+1i/5E/
 DJ4PIeWt9ouGrMRIwpVZYIv2N+Hl3NLhwUKoEL7upZzJBlhj+H8WMUIA+0c0utHrFXib
 6St0njUEwySoagUHdfOhKQMIhve6czUMiuHZthPtAEsJdIL2UVkqXmo+S/ET4vQeKKCR
 eK2EWlTLp4WJJ/WhIR7yVYO0bDmrZEz1nQCC+kwy9kogs86oLbScSXA9l5o3Xs/ta2/U LQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg5ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 04:56:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42FB3476;
 Fri, 20 May 2022 09:56:54 +0000 (UTC)
Date: Fri, 20 May 2022 09:56:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20220520095654.GK38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
 <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-ORIG-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jarkko.nikula@bitmer.com,
 kernel@pengutronix.de, shawnguo@kernel.org, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 22/56] ASoC: sunxi: Update to use
	set_fmt_new callback
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

On Thu, May 19, 2022 at 06:40:11PM -0500, Samuel Holland wrote:
> On 5/19/22 10:42 AM, Charles Keepax wrote:
> > As part of updating the core to directly tell drivers if they are clock
> > provider or consumer update these CPU side drivers to use the new direct
> > callback.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
> >  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> > diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> > index 0bea2162f68d9..6e9ef948d6621 100644
> > --- a/sound/soc/sunxi/sun8i-codec.c
> > +++ b/sound/soc/sunxi/sun8i-codec.c
> > @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> >  	u32 dsp_format, format, invert, value;
> >  
> >  	/* clock masters */
> > -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> > +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> > +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */
> 
> This is a codec driver, and it is only ever used on the codec end of a link, so
> I would not expect it to be changed.
> 

Thanks for spotting that, silly mistake on my part. Will fix for
a rev 2.

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
