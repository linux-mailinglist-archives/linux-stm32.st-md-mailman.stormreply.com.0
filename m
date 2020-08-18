Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2F2488E5
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Aug 2020 17:15:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B12EC32E8F;
	Tue, 18 Aug 2020 15:15:51 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C807C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Aug 2020 15:15:49 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A038779F2590DCA4521A;
 Tue, 18 Aug 2020 23:15:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.108) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 18 Aug 2020 23:15:44 +0800
To: Andreas Schwab <schwab@linux-m68k.org>
References: <20200818143952.50752-1-yuehaibing@huawei.com>
 <87ft8katwz.fsf@igel.home>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <e8c4e539-d230-2add-6840-ebe1097b8130@huawei.com>
Date: Tue, 18 Aug 2020 23:15:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87ft8katwz.fsf@igel.home>
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Cc: ajayg@nvidia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix signedness bug in
 stmmac_probe_config_dt()
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

On 2020/8/18 22:51, Andreas Schwab wrote:
> On Aug 18 2020, YueHaibing wrote:
> 
>> The "plat->phy_interface" variable is an enum and in this context GCC
>> will treat it as an unsigned int so the error handling is never
>> triggered.
>>
>> Fixes: b9f0b2f634c0 ("net: stmmac: platform: fix probe for ACPI devices")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index f32317fa75c8..b5b558b02e7d 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -413,7 +413,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
>>  	}
>>  
>>  	plat->phy_interface = device_get_phy_mode(&pdev->dev);
>> -	if (plat->phy_interface < 0)
>> +	if ((int)plat->phy_interface < 0)
>>  		return ERR_PTR(plat->phy_interface);
> 
> I don't think the conversion to long when passed to ERR_PTR will produce
> a negative value either (if long is wider than unsigned int).

Thanks, will respin.
> 
> Andreas.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
