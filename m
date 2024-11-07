Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDA9C016D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 10:51:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42BECC6C83A;
	Thu,  7 Nov 2024 09:51:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DFFFC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 09:51:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A75cHeY006257;
 Thu, 7 Nov 2024 10:50:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 de6Kcufr6UT1ym/eWTdGsV5OFcqLnwSoWKhUAhTVrZw=; b=NfeoeYa8ACbnyhVC
 f26OqBc2GLDkv/KnG0DOaovJoSIIMtWjfIuXMnSDBwcxtGq2wFUIiINqHj+ybLAV
 Ae6sL8Xi40JABcOCkfUwbWOivXvKgkQidqEHJFQyR3Ahs9gsQdJaTpsqgUHQ0qoG
 2LVdln6ztK02pCa9aE4AW1ZF3nsw+1KsUb5LlvmfYHpOXpP2O4WlKSR4C4j4P2gl
 IVAFp/DOpjg3T//MokmTu2PY4XaOUyFpa8ftQ0901DEK0+Kt4A682W9jW6adBjih
 sVAxRCjRCTV5datzzg9hY0Anl3D+Pxx0l5liNSwDEYnCbcyiRQ+cRlBMM1CBNA9e
 Irv0PA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh43e5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2024 10:50:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D1AA40047;
 Thu,  7 Nov 2024 10:48:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4164B268999;
 Thu,  7 Nov 2024 10:48:13 +0100 (CET)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 10:48:12 +0100
Message-ID: <e40beda1-56cf-4757-8eac-a9263f88e2fc@foss.st.com>
Date: Thu, 7 Nov 2024 10:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luo Yifan <luoyifan@cmss.chinamobile.com>
References: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
 <20241107015936.211902-1-luoyifan@cmss.chinamobile.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20241107015936.211902-1-luoyifan@cmss.chinamobile.com>
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm: Prevent potential division by
 zero in stm32_sai_get_clk_div()
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

On 11/7/24 02:59, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation is safe to perform.
> 
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> ---
>   sound/soc/stm/stm32_sai_sub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 7bc4a96b7..43fb1dcb9 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -317,7 +317,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
>   	int div;
>   
>   	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
> -	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
> +	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
>   		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
>   		return -EINVAL;
>   	}

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
