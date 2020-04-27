Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC41BABD4
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 19:59:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9F1C36B0C;
	Mon, 27 Apr 2020 17:59:41 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A747CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 17:59:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 499sx50vRCz1qsjt;
 Mon, 27 Apr 2020 19:59:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 499sx46dKXz1r5Pw;
 Mon, 27 Apr 2020 19:59:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id cP7Ci3_fzOg3; Mon, 27 Apr 2020 19:59:35 +0200 (CEST)
X-Auth-Info: 3Q/kzkEfkeKb3xddfAmFowML8Maab4nXQx8zhUFn5rA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Apr 2020 19:59:35 +0200 (CEST)
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christophe Kerello <christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
Date: Mon, 27 Apr 2020 19:59:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427194747.224a2402@xps13>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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

On 4/27/20 7:47 PM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 15 Apr
> 2020 17:57:28 +0200:
> 
>> This patch defers its probe when the expected reset control is not
>> yet ready. This patch also handles properly all errors cases at probe
>> time.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> index b6d45cd..0a96797 100644
>> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> @@ -1967,7 +1967,11 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	rstc = devm_reset_control_get(dev, NULL);
>> -	if (!IS_ERR(rstc)) {
>> +	if (IS_ERR(rstc)) {
>> +		ret = PTR_ERR(rstc);
>> +		if (ret == -EPROBE_DEFER)
>> +			goto err_clk_disable;
>> +	} else {
>>  		reset_control_assert(rstc);
>>  		reset_control_deassert(rstc);
>>  	}
>> @@ -1975,7 +1979,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	/* DMA setup */
>>  	ret = stm32_fmc2_dma_setup(fmc2);
>>  	if (ret)
>> -		return ret;
>> +		goto err_dma_setup;
>>  
>>  	/* FMC2 init routine */
>>  	stm32_fmc2_init(fmc2);
>> @@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	/* Scan to find existence of the device */
>>  	ret = nand_scan(chip, nand->ncs);
>>  	if (ret)
>> -		goto err_scan;
>> +		goto err_dma_setup;
>>  
>>  	ret = mtd_device_register(mtd, NULL, 0);
>>  	if (ret)
>> @@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  err_device_register:
>>  	nand_cleanup(chip);
>>  
>> -err_scan:
>> +err_dma_setup:
>>  	if (fmc2->dma_ecc_ch)
>>  		dma_release_channel(fmc2->dma_ecc_ch);
>>  	if (fmc2->dma_tx_ch)
>> @@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>  	sg_free_table(&fmc2->dma_data_sg);
>>  	sg_free_table(&fmc2->dma_ecc_sg);
>>  
>> +err_clk_disable:
>>  	clk_disable_unprepare(fmc2->clk);
>>  
>>  	return ret;
> 
> I didn't spot it during my earlier reviews but I really prefer using
> labels explaining what you do than having the same name of the function
> which failed. This way you don't have to rework the error path when
> you handle an additional error.
> 
> So, would you mind doing this in two steps:
> 
> 1/
> Replace
> 
>     err_scan:
> 
> with, eg.
> 
>     release_dma_objs:

The ^err_ prefix in failpath labels is useful, since it's easily
possible to match on it with regexes ; not so much on arbitrary label name.

btw would it make sense to split the first three patches of this series
into a separate series ? This rawnand part seems more like an unrelated
cleanup.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
