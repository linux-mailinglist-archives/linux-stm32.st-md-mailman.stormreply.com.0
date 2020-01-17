Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62B140A38
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 13:54:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D591C36B0F;
	Fri, 17 Jan 2020 12:54:02 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0678CC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 12:51:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47zgtf3Vkmz1qr4k;
 Fri, 17 Jan 2020 13:51:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47zgtf2d2rz1qr2t;
 Fri, 17 Jan 2020 13:51:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PYTb3qutoQKF; Fri, 17 Jan 2020 13:51:52 +0100 (CET)
X-Auth-Info: 4Pg3u1nHcyBe2DMyGQhsc1BQZp+AoLb2psEia6r0i/g=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 17 Jan 2020 13:51:52 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200115094608.154386-1-marex@denx.de>
 <521254538ec74534a533b8ca4448855e@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cef4c2db-9ce9-760b-e392-74a52c7d1e38@denx.de>
Date: Fri, 17 Jan 2020 13:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <521254538ec74534a533b8ca4448855e@SFHDAG6NODE3.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Jan 2020 12:54:01 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/15/20 5:45 PM, Patrick DELAUNAY wrote:
> Hi Marek;

Hi,

> Add the Linux Maintainers for STM32M linux patch:

Added, if there is a need for V2.
[...]
> 
> Hi Alexandre,
> 
> Can you review this patch.
> 
> Regards
> 
> Patrick
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: mercredi 15 janvier 2020 10:46
>>
>> Add missing 'eth-ck' clock to the ethernet node. These clock are used to generate
>> external clock signal for the PHY in case 'st,eth_ref_clk_sel'
>> is specified.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Christophe ROULLIER <christophe.roullier@st.com>
>> Cc: Patrice Chotard <patrice.chotard@st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>  arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
>> b/arch/arm/boot/dts/stm32mp151.dtsi
>> index fb41d0778b00..e0ecc5ee7d83 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -1369,10 +1369,12 @@ ethernet0: ethernet@5800a000 {
>>  			clock-names = "stmmaceth",
>>  				      "mac-clk-tx",
>>  				      "mac-clk-rx",
>> +				      "eth-ck",
>>  				      "ethstp";
>>  			clocks = <&rcc ETHMAC>,
>>  				 <&rcc ETHTX>,
>>  				 <&rcc ETHRX>,
>> +				 <&rcc ETHCK_K>,
>>  				 <&rcc ETHSTP>;
>>  			st,syscon = <&syscfg 0x4>;
>>  			snps,mixed-burst;
>> --
>> 2.24.1
> 


-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
