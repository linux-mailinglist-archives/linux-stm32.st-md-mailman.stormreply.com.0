Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9293CF5F
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 10:14:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3E7CC78018;
	Fri, 26 Jul 2024 08:14:32 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 417D4C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 08:14:26 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q6nlm2014217;
 Fri, 26 Jul 2024 03:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=PODMain02222019; bh=Fsrg6RkL3ljELUDbdF
 raOMnuDGBzLzBG9berJqeS99w=; b=o9qLQSb/6FYQi/W15D8/Q6B22hsutkg88J
 mNvNh/AZ9dtqrOtTI2R79TLXpy8lg1lRKFhIl6wq6uiLWlhJxh1WDOawKX7VlaCO
 eU4rIuRfd03jDKIDXA77BqwjD/sjpjlrViwwSQ4PT0Lh9y7BbLCx3sB5ScZRuZYJ
 vNZcORfK21t/q+SSA5prVTMc95eHtVjvLmZqXGyBKNQbnzb9vRk/fzqO4TR9DyPL
 kzPctMSGrBR/TxYyv0GJbep/oRCXMW0g49lRFREAm4X4hdll9PMJyP+uXK1OcV7U
 L5pHZHo0u48Al18wep6LoWHV38jlkQySIDlmkNZa06BVjUwfSSdg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40m1mdr9bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 03:13:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 09:13:54 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 26 Jul 2024 09:13:54 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8AA4D820244;
 Fri, 26 Jul 2024 08:13:54 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:13:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Message-ID: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
X-Proofpoint-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-ORIG-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Lu <kevin-lu@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Baojun Xu <baojun.xu@ti.com>, linux-media@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Tim Harvey <tharvey@gateworks.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] ASoC: constify
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

On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
> The instances of the `snd_soc_component_driver` struct are not modified
> after their declaration, and they are only passed to
> `devm_snd_soc_register_component()`, which expects a constant
> `snd_soc_component_driver`.
> 
> Move all instances of `snd_soc_component_driver` to read-only sections
> by declaring them const.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  sound/soc/codecs/cs43130.c           | 2 +-

> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>  	.probe			= cs43130_probe,
>  	.controls		= cs43130_snd_controls,
>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),

This won't work for cs43130, whilst what the driver does is
clearly slightly sketch it directly modifies this struct before
registering it with ASoC. That would need fixed first before this
change can be made.

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
