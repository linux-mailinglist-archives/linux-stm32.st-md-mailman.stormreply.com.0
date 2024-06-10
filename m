Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B211C9020D7
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 13:56:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61281C78013;
	Mon, 10 Jun 2024 11:56:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C0EC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 11:56:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A8Xick019005;
 Mon, 10 Jun 2024 13:56:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ljxA0CMixUpfWg1txgwTXMZ7NWYzNR9MGl6rj1rR4Us=; b=Z2gvYhORT3qNBZUJ
 4aIzn/P4fL5XmmKy0Zc2CWu0f3Yev282KotP0hkcZhn+84tHa4l9qWcoav4oQTef
 oAq2sFzNQ+X1LoTBJsqRK2AjojTRJtr/ssRFjsJTIQiZQcOxdEPzb1+J2KgWscdC
 /n+k86q6vCdP8A9VmWJNAJALKk90xEGiAFMZ20nnGn4oU6u57FFQqJ45Id6DYh1C
 zMkUqBzt/nxxp4/Gi0QW7cRAduIIZmgSDiU5w9Qi+j8QaDUrWDRKoSTGKwsMAaxl
 fDi8WE/NMTHoQ1cxvGfiJYBoniJSa+sD/UGWD47B+9oWPzg8/j+k51XkrUmH1AUf
 m0SG0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn0v14m1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 13:56:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A670B4002D;
 Mon, 10 Jun 2024 13:55:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E0F921685E;
 Mon, 10 Jun 2024 13:54:39 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 13:54:38 +0200
Message-ID: <e4614975-a7a8-4bfa-a1e2-bf9c31547be9@foss.st.com>
Date: Mon, 10 Jun 2024 13:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ratheesh Kannoth <rkannoth@marvell.com>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-3-christophe.roullier@foss.st.com>
 <20240610114607.GA3818685@maili.marvell.com>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <20240610114607.GA3818685@maili.marvell.com>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 02/12] net: stmmac: dwmac-stm32:
 Separate out external clock rate validation
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

Hi Ratheesh,

On 6/10/24 13:46, Ratheesh Kannoth wrote:
> On 2024-06-07 at 15:27:44, Christophe Roullier (christophe.roullier@foss.st.com) wrote:
>> +static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
>> +{
>> +	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
>> +	const u32 clk_rate = clk_get_rate(dwmac->clk_eth_ck);
> nit: reverse xmas tree, split definitions and assignment.

It is not possible ;-)

second declaration need first one.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
