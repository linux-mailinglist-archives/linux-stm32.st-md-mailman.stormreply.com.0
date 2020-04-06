Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1319F2D2
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Apr 2020 11:45:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFFB2C36B0B;
	Mon,  6 Apr 2020 09:45:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95C72C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Apr 2020 09:45:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0369gowF031596; Mon, 6 Apr 2020 11:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2a3UrR0vvKbfCVyVukYQyK/7BqGP/1N0NHAtHA/piFE=;
 b=PUSP/zZS8e/q90fhP5DzpLOfRx8kh8mju3tyakiTGOgw4uFUJtWZJBdjVLPSKMIcZTdV
 KHjZEbpwdD96F3obw1oICbJgV+PkGT7HkP5iTSZbdNoZEUJDSjZnfYd7veE+D+iNZRR8
 uKuwFooa+ZRuhf57Co/midAgESknOjMaiX2zCcxrzKR4k45ngo+CR24gn3T6KIQHcCJq
 tXfsrjdFWnZc+Oq4lqZjAGUe3qtOYCuW7vWyE4uY/1i4uy2pJ+XA69nkbMdN0nYE8+6B
 N7K0bSlzNNYr/ATG5C1mrs84dKRgHb+en12wupcx6D9KOZ163GrHTSjTQ8xAsvs/gYcy qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306g0w13j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 11:44:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B83CC100034;
 Mon,  6 Apr 2020 11:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DDD92B1868;
 Mon,  6 Apr 2020 11:44:13 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Apr
 2020 11:44:12 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Mon, 6 Apr 2020 11:44:13 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Thread-Topic: [PATCH] ASoC: stm32: sai: Add missing cleanup
Thread-Index: AQHWC2DSIRg6JhgxIEC65JTRjgXANKhrt4mA
Date: Mon, 6 Apr 2020 09:44:13 +0000
Message-ID: <1df96e7b-89fa-7822-1a57-b9a87e8388c0@st.com>
References: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A296B775786CD642978E621365BD0C9A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_05:2020-04-03,
 2020-04-06 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Add missing cleanup
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


On 4/5/20 5:03 PM, Julia Lawall wrote:
> The commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
> converts some function calls to their non-devm equivalents.  The
> appropriate cleanup code was added to the remove function, but not
> to the probe function.  Add a call to snd_dmaengine_pcm_unregister
> to compensate for the call to snd_dmaengine_pcm_register in case
> of subsequent failure.
>
> Fixes: commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>
> Not tested.
>
>   sound/soc/stm/stm32_sai_sub.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
Hi Julia,
Thanks for the patch.

Acked-by: Olivier Moysan <olivier.moysan@st.com>
>
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 2bd280c..0d0c9af 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -1556,8 +1556,10 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
>   
>   	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
>   					 &sai->cpu_dai_drv, 1);
> -	if (ret)
> +	if (ret) {
> +		snd_dmaengine_pcm_unregister(&pdev->dev);
>   		return ret;
> +	}
>   
>   	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
>   		conf = &stm32_sai_pcm_config_spdif;
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
