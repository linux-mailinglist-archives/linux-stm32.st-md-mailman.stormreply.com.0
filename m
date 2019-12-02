Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4410EA2B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2019 13:40:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54089C36B0B;
	Mon,  2 Dec 2019 12:40:49 +0000 (UTC)
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
 [213.251.177.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D2EEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 12:40:48 +0000 (UTC)
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1ibl0L-0000Rr-2B; Mon, 02 Dec 2019 13:40:41 +0100
To: Daode Huang <huangdaode@hisilicon.com>
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Mon, 02 Dec 2019 12:40:40 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <8acaa494701c91b8a8acd60a2390d810@www.loen.fr>
References: <1574931880-168682-1-git-send-email-huangdaode@hisilicon.com>
 <8acaa494701c91b8a8acd60a2390d810@www.loen.fr>
Message-ID: <028744c349410eb1f74b7e2b18590c75@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: huangdaode@hisilicon.com, jason@lakedaemon.net,
 linux-kernel@vger.kernel.org, fabien.dessenne@st.com,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
Cc: jason@lakedaemon.net, linux-kernel@vger.kernel.org, fabien.dessenne@st.com,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
	=?utf-8?q?=5BPATCH=5D_irqchip/stm32=3A_Fix_=22WARNI?=
	=?utf-8?q?NG=3A_invalid_free_of_devm=5F_allocated?=
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

On 2019-12-02 12:29, Marc Zyngier wrote:
> On 2019-11-28 09:04, Daode Huang wrote:
>> Since devm_ allocated data can be automaitcally released, it's no
>> need to free it apparently, just remove it.
>>
>> Fixes: cfbf9e497094 ("irqchip/stm32: Use a platform driver for
>> stm32mp1-exti device")
>> Signed-off-by: Daode Huang <huangdaode@hisilicon.com>
>> ---
>>  drivers/irqchip/irq-stm32-exti.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-stm32-exti.c
>> b/drivers/irqchip/irq-stm32-exti.c
>> index e00f2fa..46ec0af 100644
>> --- a/drivers/irqchip/irq-stm32-exti.c
>> +++ b/drivers/irqchip/irq-stm32-exti.c
>> @@ -779,8 +779,6 @@ static int __init stm32_exti_init(const struct
>> stm32_exti_drv_data *drv_data,
>>  	irq_domain_remove(domain);
>>  out_unmap:
>>  	iounmap(host_data->base);
>> -	kfree(host_data->chips_data);
>> -	kfree(host_data);
>>  	return ret;
>>  }
>
> Applied, thanks.

Scratch that. This patch is just wrong, and just reading the code
makes it obvious. stm32_exti_init() is only called on paths
that allocate the memory with kmalloc.

Clearly you haven't tried to understand what is going on.

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
