Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED39BE289
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 10:30:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE8C0C78015;
	Wed,  6 Nov 2024 09:30:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57262C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 09:30:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66feWa015451;
 Wed, 6 Nov 2024 10:30:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5Na2ucu6fM7s6QJT4BMpvEJuv3sVjdI3XxnANZwd4Dc=; b=dU9+ycmjtE42sb8w
 oTYYQKvMNf1mPliKCo9eSgYQpE/QmiAd/sjx5QYvDH8uK094O+5veClJIWnzfbMa
 JUaO12T9ZFiRddmBSaZ/FBllub9nuF8dW0ROzl5v3coLwKIzCs/wURciEvYL2/Yv
 QRhOIPpiWHciYVylXkGVrgqnqH5MjSMb1DuB9lPXp+A1kPSEYIPufORvYirLC9F/
 FvVLk2WVQKKNzeAgvy9TLNYh9sz1iZxna52SpgCyU5GoThmCt+uF/2GJBIt5kR5o
 JL2wIIjI0biOOqd+/2/N4vOjFpV/aVIXifefsl6bwwLHgS5qEPeRnD1SBO5p5Zei
 ySAKJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxc0cj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:30:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EDD3F40058;
 Wed,  6 Nov 2024 10:28:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F30C2251D3;
 Wed,  6 Nov 2024 10:27:56 +0100 (CET)
Received: from [10.252.15.15] (10.252.15.15) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 6 Nov
 2024 10:27:55 +0100
Message-ID: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
Date: Wed, 6 Nov 2024 10:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luo Yifan <luoyifan@cmss.chinamobile.com>, <arnaud.pouliquen@foss.st.com>, 
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
References: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
X-Originating-IP: [10.252.15.15]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm: Prevent potential division by
 zero in stm32_sai_mclk_round_rate()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Luo,

On 11/6/24 02:46, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.
> 
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> ---
>   sound/soc/stm/stm32_sai_sub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 7bc4a96b7..2570daa3e 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -378,8 +378,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	int div;
>   
>   	div = stm32_sai_get_clk_div(sai, *prate, rate);
> -	if (div < 0)
> -		return div;
> +	if (div <= 0)
> +		return -EINVAL;
>   
>   	mclk->freq = *prate / div;
>   

Thanks for your patch. It looks fine, but I think that it has to
be extended.

In CR1 register, MCKDIV = 0 gives the same result as MCKDIV = 1.
But while MCKDIV = 0 is valid, for sure div = 0 is not valid.

I agree that that div = 0 has to be managed as an error
This could be rather handled in stm32_sai_get_clk_div() function itself,
by returning an error, if div is null.
This is relevant as we may also get an error on test "if (input_rate % 
div)".
I suggest to add a specific test and error message to handle this case 
in stm32_sai_get_clk_div().
Something like:
if (!div)) {
	dev_err(&sai->pdev->dev, "Invalid null divider\n");
	return -EINVAL;
}

BRs
Olivier




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
