Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F37B9CB7
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 13:22:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68359C6C835;
	Thu,  5 Oct 2023 11:22:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C327CC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 11:22:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3959P2ic025839; Thu, 5 Oct 2023 13:21:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=oOAMUa8QHt1EayBhxponDpCbVvi1SUCV24Wc/HHeOKY=; b=0f
 cywv3obWAgJQBYEXI4/dgQLqEjH1oy533VfjoI+gYBgTLtAf6qFRJVxNNKjFKepR
 8zzC8g/Y9YI/KFHVM5G6vxtuYZz4V4S1Q8t6GRCzrtvc0nK5XTR4giRrvrsqHR7I
 EI3F+rNwk1bq353Ky6z4CkrgW0h8eWolja6fQm4hQ+ABqyXKw+MJwLj4JihHcGKx
 KrG+2lVhytLQNUjcpZT1Eg4n6FkpEv0tH1OoLvMDEVig9Up2v+fKZejUBs30BABs
 a7/KYwl4PqvPl7fvK4DvTu9mp5TipcT9JuOIPYDZz3YsYl8cYvMwullXtOyEEyrQ
 G9TgL9qXzaRhvIALSGLg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thtg7gg7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 13:21:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21D3510005C;
 Thu,  5 Oct 2023 13:21:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBA6423C695;
 Thu,  5 Oct 2023 13:21:41 +0200 (CEST)
Received: from [10.252.31.76] (10.252.31.76) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:21:38 +0200
Message-ID: <c8bc893c-cb86-6de5-4346-fe48be6ebe86@foss.st.com>
Date: Thu, 5 Oct 2023 13:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
 <20230928122427.313271-9-christophe.roullier@foss.st.com>
 <12332a87-e8c3-4cf3-849a-080e4e3f4521@lunn.ch>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <12332a87-e8c3-4cf3-849a-080e4e3f4521@lunn.ch>
X-Originating-IP: [10.252.31.76]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/12] net: ethernet: stmmac: stm32:
 support the phy-supply regulator binding
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


On 9/28/23 19:53, Andrew Lunn wrote:
>> +static int phy_power_on(struct stm32_dwmac *bsp_priv, bool enable)
> I find this function name confusing, since 50% of the time it does not
> actually power the PHY on. You never call it with anything other than
> a static true/false value. So it might was well be two functions,
> phy_power_on() and phy_power_off().

Hi,

I wanted to keep same implementation of all others Ethernet glues 
(dwmac-rk.c ...) to be consistent.

>> +{
>> +	int ret;
>> +	struct device *dev = bsp_priv->dev;
>> +
>> +	if (!bsp_priv->regulator)
>> +		return 0;
>> +
>> +	if (enable) {
>> +		ret = regulator_enable(bsp_priv->regulator);
>> +		if (ret)
>> +			dev_err(dev, "fail to enable phy-supply\n");
> Not all PHYs are usable in 0 picoseconds. You probably want a delay
> here. Otherwise the first few accesses to it might not work.
>
>        Andrew

You're right I will add a delay.

Thanks

Christophe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
