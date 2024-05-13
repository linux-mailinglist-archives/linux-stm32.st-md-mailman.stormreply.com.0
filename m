Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE768C42D6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 16:08:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F007AC6A61D;
	Mon, 13 May 2024 14:08:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4272C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 14:08:04 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DBs1dp004575;
 Mon, 13 May 2024 16:07:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IAj0zC/NmxIhXGebLMPF7t3BBODE7eX8o0Rp4kLw+l4=; b=r5
 DR/mAPfO0af1cfHGG8N/uerGaz91NZ08BGOZcx5GX59tZxkfka/tPdOhKVFF2tU5
 gbIhF6+lMSzPa4UKYyeo85vR8ETb+qmw3PutIOR+nuy09ct5Zd9WiVohL1Pwkv6R
 NURIk6T71vmtvmy2OM2+FfPgHvyFno484apDzTRBdkUZe6rIM1jOxlh2fUKZKyHZ
 vNr7Ufzf5mT9EDA7ZHtW8l0TzHgB801y0buH6SHAfugbQ1q17QBeCN+HjHmQAtG3
 NYf/fRxxU/vcx/pBKDQO3wcYtRB83J19U+WOLHVUSyi4BD64r2VrxbJS1XA/CfL9
 lP08LaX2lY8lPuSCH+Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y2j80n46s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 16:07:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BCBAD4004A;
 Mon, 13 May 2024 16:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93D9F220B7C;
 Mon, 13 May 2024 16:06:19 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 16:06:18 +0200
Message-ID: <a2a631a0-9a16-4068-aed2-6bdaa71e3953@foss.st.com>
Date: Mon, 13 May 2024 16:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-3-christophe.roullier@foss.st.com>
 <20240426153010.GA1910161-robh@kernel.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <20240426153010.GA1910161-robh@kernel.org>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_10,2024-05-10_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: net: add phy-supply
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

Hi

On 4/26/24 17:30, Rob Herring wrote:
> On Fri, Apr 26, 2024 at 02:56:58PM +0200, Christophe Roullier wrote:
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
>> index b901a432dfa9..7c3aa181abcb 100644
>> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> @@ -84,6 +84,9 @@ properties:
>>             - description: offset of the control register
>>             - description: field to set mask in register
>>   
>> +  phy-supply:
>> +    description: PHY regulator
> This is for which PHY? The serdes phy or ethernet phy? This only makes
> sense here if the phy is part of the MAC. Otherwise, it belongs in the
> phy node.
>
> Rob

You are right, normally it should be managed in Ethernet PHY (Realtek, 
Microchip etc...)

Lots of glue manage this like this. Does it forbidden now ? if yes need 
to update PHY driver to manage this property.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
