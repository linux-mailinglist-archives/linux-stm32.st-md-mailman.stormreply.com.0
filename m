Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52D140F80
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 17:59:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C535C36B0F;
	Fri, 17 Jan 2020 16:59:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D3A0C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 16:59:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HGx69g006850; Fri, 17 Jan 2020 17:59:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=0cs5EBI+B7VMqeNxss3ihARGjvxrGtqQE0GQfTimhDs=;
 b=ApqtfgETVdlth0/eN3VNEJcdHAKO5jMO+PcHOWtAFdo3cwcY+F8f9J3U2quP0fsBTulK
 GN8d+Hd9L/UEzjGbo3CyPPqEzfi0hr/y1GaARn3Y0jfEaVrHFe36k+qyekXm6wLLuno8
 5ORRFTVn6Ga3F/X9x5/UZr6t79wqNkxcsy9YA34EiEoE7UKfLLazmbvGVlSyhA2qw0xj
 Z2vwj1zTU6LIb3Fd1EEBC1DZaZFR7i1E61O6fPNVyXdNCL/SM8gO5gR1KHVrrXrbpW72
 8recZ8NRcoqyi5qwRaCkkjyfdslo+1/7HSzSj1nrfL8YpRqI3juq7+BEDGt5EP7bvCbN kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0qy4ju5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 17:59:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE04C10002A;
 Fri, 17 Jan 2020 17:59:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B21212B1878;
 Fri, 17 Jan 2020 17:59:40 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 17:59:40 +0100
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>
References: <20200115094608.154386-1-marex@denx.de>
 <521254538ec74534a533b8ca4448855e@SFHDAG6NODE3.st.com>
 <cef4c2db-9ce9-760b-e392-74a52c7d1e38@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2d53accb-9ea2-6c54-1963-3f5b389a2b2b@st.com>
Date: Fri, 17 Jan 2020 17:59:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cef4c2db-9ce9-760b-e392-74a52c7d1e38@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_04:2020-01-16,
 2020-01-17 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add missing ETHCK clock
	to ethernet node
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

Hi Marek

On 1/17/20 1:50 PM, Marek Vasut wrote:
> On 1/15/20 5:45 PM, Patrick DELAUNAY wrote:
>> Hi Marek;
> 
> Hi,
> 
>> Add the Linux Maintainers for STM32M linux patch:
> 
> Added, if there is a need for V2.
> [...]
>>
>> Hi Alexandre,
>>
>> Can you review this patch.
>>
>> Regards
>>
>> Patrick
>>
>>> From: Marek Vasut <marex@denx.de>
>>> Sent: mercredi 15 janvier 2020 10:46
>>>
>>> Add missing 'eth-ck' clock to the ethernet node. These clock are used to generate
>>> external clock signal for the PHY in case 'st,eth_ref_clk_sel'
>>> is specified.
>>>

Just indicate in commit title that this commit is done for stm32mp15 
family. Otherwise it looks good.

Thanks
Alex

>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Christophe ROULLIER <christophe.roullier@st.com>
>>> Cc: Patrice Chotard <patrice.chotard@st.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>>> ---
>>>   arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
>>> b/arch/arm/boot/dts/stm32mp151.dtsi
>>> index fb41d0778b00..e0ecc5ee7d83 100644
>>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>>> @@ -1369,10 +1369,12 @@ ethernet0: ethernet@5800a000 {
>>>   			clock-names = "stmmaceth",
>>>   				      "mac-clk-tx",
>>>   				      "mac-clk-rx",
>>> +				      "eth-ck",
>>>   				      "ethstp";
>>>   			clocks = <&rcc ETHMAC>,
>>>   				 <&rcc ETHTX>,
>>>   				 <&rcc ETHRX>,
>>> +				 <&rcc ETHCK_K>,
>>>   				 <&rcc ETHSTP>;
>>>   			st,syscon = <&syscfg 0x4>;
>>>   			snps,mixed-burst;
>>> --
>>> 2.24.1
>>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
