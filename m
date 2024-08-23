Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF095C34A
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 04:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E411C71287;
	Fri, 23 Aug 2024 02:31:30 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89744C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 02:31:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WqkY15t0Sz1xvr5;
 Fri, 23 Aug 2024 10:29:25 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 0F7CF1400E8;
 Fri, 23 Aug 2024 10:31:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 23 Aug 2024 10:31:20 +0800
Message-ID: <ef36a703-929b-2fb1-6d8b-58c17f37c964@huawei.com>
Date: Fri, 23 Aug 2024 10:31:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20240820123707.1788370-1-ruanjinjie@huawei.com>
 <ZsdR-G9S5nYbQX4s@finisterre.sirena.org.uk>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZsdR-G9S5nYbQX4s@finisterre.sirena.org.uk>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32-qspi: Simpify resource
	lookup
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



On 2024/8/22 22:58, Mark Brown wrote:
> On Tue, Aug 20, 2024 at 08:37:07PM +0800, Jinjie Ruan wrote:
>> Use the devm_platform_ioremap_resource_byname() helper instead of
>> calling platform_get_resource_byname() and devm_ioremap_resource()
>> separately.
> 
> This breaks boot on the Avenger96 board, it causes a NULL pointer
> dereference:
> 
> [    2.350480] Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> 
> ...
> 
> [    2.695787] Call trace:
> [    2.695807]  stm32_qspi_probe from platform_probe+0x5c/0xb0
> [    2.703914]  platform_probe from really_probe+0xc8/0x2c8
> [    2.709284]  really_probe from __driver_probe_device+0x88/0x19c
> [    2.715145]  __driver_probe_device from driver_probe_device+0x30/0x104
> 
> https://lava.sirena.org.uk/scheduler/job/650792
> 
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi");
>> -	qspi->io_base = devm_ioremap_resource(dev, res);
>> +	qspi->io_base = devm_platform_ioremap_resource_byname(pdev, "qspi");
>>  	if (IS_ERR(qspi->io_base))
>>  		return PTR_ERR(qspi->io_base);
>>  
>>  	qspi->phys_base = res->start;
>>  
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mm");
>> -	qspi->mm_base = devm_ioremap_resource(dev, res);
>> +	qspi->mm_base = devm_platform_ioremap_resource_byname(pdev, "qspi_mm");
>>  	if (IS_ERR(qspi->mm_base))
>>  		return PTR_ERR(qspi->mm_base);
> 
> I can't identify any obvious error here, these look like a direct
> subsitution - the implementation of devm_platform_ioremap_resource_byname()
> looks to be the same as the replaced code and dev is set to &pdev->dev
> but I'm seeing the above behaviour.

Mark, thank you very much, I can't identify the error here too. This bug
may be easy to locate if have a reproduction environment, but it's good
to keep it the way it is.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
