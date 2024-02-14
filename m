Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9785558C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 23:08:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C34C57194;
	Wed, 14 Feb 2024 22:08:04 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99EABC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 22:08:03 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0BEC4240029
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 23:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1707948483; bh=kk0R2G/YjOd1hA/HNk8g9v7ksPlfTh04eDSOWoYDd4o=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
 Content-Transfer-Encoding:From;
 b=keCfEwEUTqi9U1Dca/BJAbvJ1nX7aqfiHGg0EGaORv53DgUimF6H73hNxPpc6zKcq
 g9PbWwK9+GJVrZWQ8LxgsBQGQ45xVFXrana687MEL6WkxN9GeAx/Pqxq6yOId5BPpZ
 5nI9CFoV+bQhL7ZtQgKZVjKueicY8NPzE20jUvmqPq/T+erdIUjGLZh3cgqFvLU9va
 Fmu3E249bcADfo/ueZ+Eay1xDOupsm3Qa5uNSSHD5WYJTWpxMyMOPEHksnGJbsrom8
 RQp1YKcaQ8liKkpVo1kZKLsrnR5f7fv8BhWAlyE6bZmCG/8n/ZHB7uUlcICjP8RivL
 Y7LsGWc6lRW8A==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4TZsl33Bl6z9rxG;
 Wed, 14 Feb 2024 23:07:59 +0100 (CET)
Message-ID: <867da21e-7f30-4caf-9f78-260d426e4186@posteo.net>
Date: Wed, 14 Feb 2024 22:07:58 +0000
MIME-Version: 1.0
To: Jacob Keller <jacob.e.keller@intel.com>, linux-kernel@vger.kernel.org
References: <20240212154319.907447-1-shiftee@posteo.net>
 <44c29a45-86fa-4e41-b4b5-e69187f0712e@intel.com>
Content-Language: en-US
From: Mark O'Donovan <shiftee@posteo.net>
In-Reply-To: <44c29a45-86fa-4e41-b4b5-e69187f0712e@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: xgmac: fix initializer
 element is not constant error
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

On 14/02/2024 20:31, Jacob Keller wrote:
> 
> 
> On 2/12/2024 7:43 AM, Mark O'Donovan wrote:
>> GCC prior to 8.x gives an "initializer element is not constant"
>> error for the uses of dpp_tx_err in dwxgmac3_dma_dpp_errors.
>> Newer compilers accept either version.
>>
>> More info here:
>> https://lore.kernel.org/all/20240103-fix-bq24190_charger-vbus_desc-non-const-v1-1-115ddf798c70@kernel.org
>>
>> Signed-off-by: Mark O'Donovan <shiftee@posteo.net>
>> ---
> 
> I'm not sure whether the Linux kernel project has an explicit cutoff for
> what versions of GCC (or other compilers) are supported. GCC 8 was first
> released in 2018.
> 
> The fix provided here is fairly straight forward, and while I do think
> the benefit of using builtin types vs using the macros is nice, I don't
> see that as a strong enough reason to hold up supporting the older compiler.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> 
>>   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>> index 323c57f03c93..c02c035b81c0 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>> @@ -830,8 +830,8 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
>>   	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
>>   };
>>   
>> -static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
>> -static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
>> +#define dpp_rx_err "Read Rx Descriptor Parity checker Error"
>> +#define dpp_tx_err "Read Tx Descriptor Parity checker Error"
>>   static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
>>   	{ true, "TDPES0", dpp_tx_err },
>>   	{ true, "TDPES1", dpp_tx_err },
>>
>> base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de

Thanks Jacob.

The minimum versions for compilers and other tools are documented here:
https://www.kernel.org/doc/html/latest/process/changes.html

I am using a SLES 15 server to build, the first version of which came out in 2017.

Mark
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
