Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29488C572
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 15:42:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AFD0C6B45B;
	Tue, 26 Mar 2024 14:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AC84C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 14:42:41 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QCBklK007694; Tue, 26 Mar 2024 15:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=9pRVmSnmGKK7LB7PnddfDWHBQ6XSXKYj11IRLNtwqSQ=; b=N7
 QBY2ec7CNT8qV5bVJxFwCDKNtHCHQLL1A2stjMn/y2a4mdDZEu0nBAlJV+jMjui2
 LYszZwLbZByRXeHRFaejhU3MjTETCjwfNjUV4Njk6S49C7OFaHuZE0vstFESInfg
 aFKxKYfkE0yQr0qm0EIQkqonrNGxlKa7j1DR0xai5h+k1qWGd0XjS0ljqbziXDH9
 IXA0/FVPB/FuzD1YgnAEdDcCXk82T1afpRWlcIyoxY10xDZz/x3b7U5N05QolwH1
 E5JdYkwfgD8f4fw3SFTHtD1z/PVr8jNDN3aCM2bf/IcLIN9I+tesoV12ZYhQlA0L
 lxrGKJQnhPk5G8mFWXdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x29h5ueb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 15:42:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 119E840044;
 Tue, 26 Mar 2024 15:42:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5347A220B61;
 Tue, 26 Mar 2024 15:41:15 +0100 (CET)
Received: from [10.201.21.128] (10.201.21.128) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Mar
 2024 15:41:13 +0100
Message-ID: <a19b20ae-d12a-47c8-9d1f-482a84924e6c@foss.st.com>
Date: Tue, 26 Mar 2024 15:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20240326125849.226765-1-christophe.roullier@foss.st.com>
 <20240326125849.226765-2-christophe.roullier@foss.st.com>
 <0e14ad5d-3c25-40ab-981a-fbc4e245fc94@lunn.ch>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <0e14ad5d-3c25-40ab-981a-fbc4e245fc94@lunn.ch>
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_06,2024-03-21_02,2023-05-22_02
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
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: net: add phy-supply
 property for stm32
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


On 3/26/24 14:58, Andrew Lunn wrote:
> On Tue, Mar 26, 2024 at 01:58:48PM +0100, Christophe Roullier wrote:
>> Phandle to a regulator that provides power to the PHY. This
>> regulator will be managed during the PHY power on/off sequence.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> index fc8c96b08d7dc..80937b28fa046 100644
>> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> @@ -82,6 +82,9 @@ properties:
>>         Should be phandle/offset pair. The phandle to the syscon node which
>>         encompases the glue register, and the offset of the control register
>>   
>> +  phy-supply:
>> +    description: PHY regulator
> ~/linux/drivers/net/ethernet/stmicro/stmmac$ grep regulator_get *
> dwmac-rk.c:	bsp_priv->regulator = devm_regulator_get(dev, "phy");
> dwmac-sun8i.c:	gmac->regulator = devm_regulator_get_optional(dev, "phy");
> dwmac-sunxi.c:	gmac->regulator = devm_regulator_get_optional(dev, "phy");
>
> Maybe i'm missing something, but i don't see an actual implementation
> of this binding?
>
> 	Andrew

Hi Andrew,

You are right, my next step is to upstream support of Ethernet MP13 glue 
and some update like Phy regulator support

(it is look like 
https://lore.kernel.org/linux-arm-kernel/20230928122427.313271-9-christophe.roullier@foss.st.com/)

Regards,

Christophe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
