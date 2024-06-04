Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 750428FAE8C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 11:17:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BAEAC71288;
	Tue,  4 Jun 2024 09:17:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE6C5C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 09:17:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4549DsjD012859;
 Tue, 4 Jun 2024 11:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OQe/uADEFpVniANl2HPBtkrGxr/1Jkhh9ScZYTBH7MU=; b=eyBkfZ3cqtw3pYoe
 F9n5Ujb2ZempFMCIcweE4Yd5LD9jXfOUg+cJFoPSNxyel/TMmdWX2w25O0aGghHO
 /NGfcb0JihUC/q9171VEtsnidPfKp7+jOEi1o4GlQ009Hsd8KyoJTSreZHK0duIL
 atXVY54YNxe8GP/MHtIDXlOKNzgKAsSDzm7zkQrntAEyXjS8FJzRG7W5yl5O1Ogu
 DcHuTqEYjffYhm0M5F12BvMEK85t/7K9Z75NPUZTrId+5mILu83I72oypNeLWo9G
 OqZP1/4ScYDR7VrgxNUWX4DdWtq1sLlWv1LOdAcmHMZRPt5ggArJ4A4iEFpVOUdE
 e8r8Kg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw3wjx6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 11:16:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F094040044;
 Tue,  4 Jun 2024 11:16:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 980B72122EA;
 Tue,  4 Jun 2024 11:15:38 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 11:15:36 +0200
Message-ID: <0a9f494e-94ae-43b2-84fa-6d984c4106cd@foss.st.com>
Date: Tue, 4 Jun 2024 11:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-8-christophe.roullier@foss.st.com>
 <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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


On 6/3/24 13:30, Rasmus Villemoes wrote:
> On 03/06/2024 11.27, Christophe Roullier wrote:
>
>> @@ -259,13 +268,17 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>>   
>>   	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>>   
>> +	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
>> +	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
>> +
>>   	/* Need to update PMCCLRR (clear register) */
>> -	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
>> -		     dwmac->ops->syscfg_eth_mask);
>> +	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
>> +		     dwmac->mode_mask);
>>   
>>   	/* Update PMCSETR (set register) */
>>   	return regmap_update_bits(dwmac->regmap, reg,
>> -				 dwmac->ops->syscfg_eth_mask, val);
>> +				 dwmac->mode_mask, val);
>>   }
>>   
>>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
> This hunk is broken, and makes the patch not apply:
>
> Applying: net: ethernet: stmmac: add management of stm32mp13 for stm32
> error: corrupt patch at line 70
>
> The -259,13 seems correct, and the net lines added by previous hunks is
> indeed +9, but this hunk only adds three more lines than it removes, not
> four, so the +268,17 should have been +268,16.
>
> Have you manually edited this patch before sending? If so, please don't
> do that, it makes people waste a lot of time figuring out what is wrong.

Hi Rasmus,

Yes sorry :-(

>
> Also, please include a base-id in the cover letter so one knows what it
> applies to.
>
> Finally, I think you also need to sign-off on the patches you send
> authored by Marek.
Yes, you are right
>
> Rasmus
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
