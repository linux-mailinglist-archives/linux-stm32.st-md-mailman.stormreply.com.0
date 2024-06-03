Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB88D8500
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FC14C7129F;
	Mon,  3 Jun 2024 14:30:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A504C7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:30:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CF707882AF;
 Mon,  3 Jun 2024 16:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717425013;
 bh=lqnIEjB6gWuRJxieyOxq6KGZD2sIbDGcg8/jyWxGVSc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EFtn/JfOq8gVGoTUIGT88zgMKJdOYAup8klZKLrB82doMp1py1obVTTJXe2BpUIeR
 AYFek3j5tCkT+4z3pQvHFLUYGWyhxA2DQan2T0pJ6qZXTsViQTAhbbsPdSqxYurwji
 iSfQw3kDOl3zvzebhv94FFhZH5eyWlLFDEJgK6Wf8rd5h8YTRfajSDge1NrP+4NhQS
 5vB94HQM2L/nrbp3bR19CKsKLqtlyH6KRqfVLi2jY346dyMALK3YKHtuPN0/k5SZI0
 JYQwymvNc1ey+iOlJGZRnYCZe7X8lfcnWzm0wlQPizRWF+tPykwetTGTwi9TG8YSXq
 8rVtZxnRK1UAQ==
Message-ID: <d1aac0b0-c985-40c2-8a6f-29a4617edaf8@denx.de>
Date: Mon, 3 Jun 2024 16:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sai Krishna Gajula <saikrishnag@marvell.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20240427215113.57548-1-marex@denx.de>
 <BY3PR18MB4707314AE781472140361D62A01B2@BY3PR18MB4707.namprd18.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <BY3PR18MB4707314AE781472140361D62A01B2@BY3PR18MB4707.namprd18.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [net-next, RFC,
 PATCH 1/5] net: stmmac: dwmac-stm32: Separate out external clock
 rate validation
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

On 4/29/24 9:19 AM, Sai Krishna Gajula wrote:
> 
>> -----Original Message-----
>> From: Marek Vasut <marex@denx.de>
>> Sent: Sunday, April 28, 2024 3:21 AM
>> To: netdev@vger.kernel.org
>> Cc: Marek Vasut <marex@denx.de>; David S. Miller <davem@davemloft.net>;
>> Alexandre Torgue <alexandre.torgue@foss.st.com>; Christophe Roullier
>> <christophe.roullier@foss.st.com>; Eric Dumazet <edumazet@google.com>;
>> Jakub Kicinski <kuba@kernel.org>; Jose Abreu <joabreu@synopsys.com>;
>> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Paolo Abeni
>> <pabeni@redhat.com>; linux-arm-kernel@lists.infradead.org; linux-
>> stm32@st-md-mailman.stormreply.com
>> Subject: [net-next,RFC,PATCH 1/5] net: stmmac: dwmac-stm32:
>> Separate out external clock rate validation
>>
>> Pull the external clock frequency validation into a separate function, to avoid
>> conflating it with external clock DT property decoding and clock mux register
>> configuration. This should make the code easier to read and understand.
>>
>> This does change the code behavior slightly. The clock mux PMCR register
>> setting now depends solely on the DT properties which configure the clock
>> mux between external clock and internal RCC generated clock. The mux
>> PMCR register settings no longer depend on the supplied clock frequency, that
>> supplied clock frequency is now only validated, and if the clock frequency is
>> invalid for a mode, it is rejected.
>>
>> Previously, the code would switch the PMCR register clock mux to internal RCC
>> generated clock if external clock couldn't provide suitable frequency, without
>> checking whether the RCC generated clock frequency is correct. Such behavior
>> is risky at best, user should have configured their clock correctly in the first
>> place, so this behavior is removed here.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
>> Cc: Eric Dumazet <edumazet@google.com>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: Jose Abreu <joabreu@synopsys.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Paolo Abeni <pabeni@redhat.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: netdev@vger.kernel.org
>> ---
>>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 54 +++++++++++++++----
>>   1 file changed, 44 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>> index c92dfc4ecf570..43340a5573c64 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>> @@ -157,25 +157,57 @@ static int stm32_dwmac_init(struct
>> plat_stmmacenet_data *plat_dat, bool resume)
>>   	return stm32_dwmac_clk_enable(dwmac, resume);  }
>>
>> +static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data
>> +*plat_dat) {
>> +	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
>> +	const u32 clk_rate = clk_get_rate(dwmac->clk_eth_ck);
> 
> Please check reverse x-mass tree is followed for these variables, if possible.
> 
>> +
>> +	switch (plat_dat->mac_interface) {
>> +	case PHY_INTERFACE_MODE_MII:
>> +		if (clk_rate == ETH_CK_F_25M)
>> +			return 0;
>> +		break;
>> +	case PHY_INTERFACE_MODE_GMII:
>> +		if (clk_rate == ETH_CK_F_25M)
>> +			return 0;
>> +		break;
> 
> Please check, whether we can combine the two cases..

I hope those would be addressed in v4 of:

[PATCH v3 02/11] net: stmmac: dwmac-stm32: Separate out external clock 
rate validation

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
