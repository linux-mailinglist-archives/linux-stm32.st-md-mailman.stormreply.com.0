Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD89249E7B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 14:46:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FA9DC32E8F;
	Wed, 19 Aug 2020 12:46:10 +0000 (UTC)
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CB1C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 12:46:06 +0000 (UTC)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id B9E2EF04E3E9F5AFE1FB;
 Wed, 19 Aug 2020 20:46:02 +0800 (CST)
Received: from DGGEML505-MBX.china.huawei.com ([169.254.12.146]) by
 DGGEML403-HUB.china.huawei.com ([fe80::74d9:c659:fbec:21fa%31]) with mapi id
 14.03.0487.000; Wed, 19 Aug 2020 20:45:54 +0800
From: qiuguorui <qiuguorui1@huawei.com>
To: Marc Zyngier <maz@kernel.org>
Thread-Topic: [PATCH] irqchip/stm32-exti: avoid interrupts losing due to
 clearing pending bit by mistake
Thread-Index: AdZ2DMaF/HB72ziASqawGY+By7fWQg==
Date: Wed, 19 Aug 2020 12:45:53 +0000
Message-ID: <85F0D3A887C4C146A2824A628E698AE51FFAC5E2@dggeml505-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.103.69]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: chenjianguo <chenjianguo3@huawei.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zengweilin <zengweilin@huawei.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32-exti: avoid interrupts
 losing due to clearing pending bit by mistake
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

On 2020-08-19 16:24, Marc Zyngier wrote:
>On 2020-08-19 03:39, qiuguorui1 wrote:
>> In the previous code, when the eoi handle of the exti clears the 
>> pending bit of the current interrupt, it will first read the values of 
>> fpr and rpr, then logically OR the corresponding bit of the interrupt 
>> number, and finally write back to fpr and rpr.
>> 
>> We found through experiments that if two exti interrupts, we call them 
>> int1/int2, arrive almost at the same time. in our scenario, the time 
>> difference is 30 microseconds, assuming int1 is triggered first.
>> 
>> there will be an extreme scenario: both int's pending bit are set to 
>> 1, the irq handle of int1 is executed first, and eoi handle is then 
>> executed, at this moment, all pending bits are cleared, but the int 2 
>> has not finally been reported to the cpu yet, which eventually lost 
>> int2.
>> 
>> According to stm32's TRM description about rpr and fpr: Writing a 1 to 
>> this bit will trigger a rising edge event on event x, Writing 0 has no 
>> effect.
>> 
>> Therefore, when clearing the pending bit, we only need to clear the 
>> pending bit of the irq.
>
>Interesting findings!
Thanks!
>
>> 
>> Signed-off-by: qiuguorui1 <qiuguorui1@huawei.com>
>
>This definitely needs a Fixes: tag and a Cc: stable, as lost interrupts are not fun at all.
OK.I will do this in the 2nd version of patch.
>
>> ---
>>  drivers/irqchip/irq-stm32-exti.c | 18 ++++++++++++------
>>  1 file changed, 12 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/irqchip/irq-stm32-exti.c
>> b/drivers/irqchip/irq-stm32-exti.c
>> index 03a36be757d8..ee4faf5c90b8 100644
>> --- a/drivers/irqchip/irq-stm32-exti.c
>> +++ b/drivers/irqchip/irq-stm32-exti.c
>> @@ -26,6 +26,11 @@
>> 
>>  #define HWSPNLCK_TIMEOUT	1000 /* usec */
>> 
>> +enum reg_ops {
>> +	REG_WRITE_ONLY,
>> +	REG_READ_WRITE
>> +};
>> +
>>  struct stm32_exti_bank {
>>  	u32 imr_ofst;
>>  	u32 emr_ofst;
>> @@ -416,13 +421,14 @@ static void stm32_irq_ack(struct irq_data *d)
>>  	irq_gc_unlock(gc);
>>  }
>> 
>> -static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg)
>> +static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg,
>> enum reg_ops op)
>>  {
>>  	struct stm32_exti_chip_data *chip_data = 
>> irq_data_get_irq_chip_data(d);
>>  	void __iomem *base = chip_data->host_data->base;
>> -	u32 val;
>> +	u32 val = 0;
>> 
>> -	val = readl_relaxed(base + reg);
>> +	if (op == REG_READ_WRITE)
>> +		val = readl_relaxed(base + reg);
>>  	val |= BIT(d->hwirq % IRQS_PER_BANK);
>>  	writel_relaxed(val, base + reg);
>> 
>> @@ -449,9 +455,9 @@ static void stm32_exti_h_eoi(struct irq_data *d)
>> 
>>  	raw_spin_lock(&chip_data->rlock);
>> 
>> -	stm32_exti_set_bit(d, stm32_bank->rpr_ofst);
>> +	stm32_exti_set_bit(d, stm32_bank->rpr_ofst, REG_WRITE_ONLY);
>>  	if (stm32_bank->fpr_ofst != UNDEF_REG)
>> -		stm32_exti_set_bit(d, stm32_bank->fpr_ofst);
>> +		stm32_exti_set_bit(d, stm32_bank->fpr_ofst, REG_WRITE_ONLY);
>> 
>>  	raw_spin_unlock(&chip_data->rlock);
>> 
>> @@ -478,7 +484,7 @@ static void stm32_exti_h_unmask(struct irq_data *d)
>>  	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
>> 
>>  	raw_spin_lock(&chip_data->rlock);
>> -	chip_data->mask_cache = stm32_exti_set_bit(d, stm32_bank->imr_ofst);
>> +	chip_data->mask_cache = stm32_exti_set_bit(d, stm32_bank->imr_ofst,
>> REG_READ_WRITE);
>>  	raw_spin_unlock(&chip_data->rlock);
>> 
>>  	if (d->parent_data->chip)
>
>I think this could be made much simpler by simply providing an accessor that doesn't do a RMW. Something like this (untested):
Thanks for your advice! I will optimize in the 2nd version of patch.
>
>diff --git a/drivers/irqchip/irq-stm32-exti.c
>b/drivers/irqchip/irq-stm32-exti.c
>index 03a36be757d8..e35c5561a10d 100644
>--- a/drivers/irqchip/irq-stm32-exti.c
>+++ b/drivers/irqchip/irq-stm32-exti.c
>@@ -416,6 +416,14 @@ static void stm32_irq_ack(struct irq_data *d)
>  	irq_gc_unlock(gc);
>  }
>
>+static void stm32_exti_write_bit(struct irq_data *d, u32 reg) {
>+	struct stm32_exti_chip_data *chip_data =
>irq_data_get_irq_chip_data(d);
>+	void __iomem *base = chip_data->host_data->base;
>+
>+	writel_relaxed(BIT(d->hwirq % IRQS_PER_BANK), base + reg); }
>+
>  static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg)
>  {
>  	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d); @@ -449,9 +457,9 @@ static void stm32_exti_h_eoi(struct irq_data *d)
>
>  	raw_spin_lock(&chip_data->rlock);
>
>-	stm32_exti_set_bit(d, stm32_bank->rpr_ofst);
>+	stm32_exti_write_bit(d, stm32_bank->rpr_ofst);
>  	if (stm32_bank->fpr_ofst != UNDEF_REG)
>-		stm32_exti_set_bit(d, stm32_bank->fpr_ofst);
>+		stm32_exti_write_bit(d, stm32_bank->fpr_ofst);
>
>  	raw_spin_unlock(&chip_data->rlock);
>
>Thanks,
>
>         M.
>--
>Jazz is not dead. It just smells funny...
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
