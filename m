Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B6302482
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 12:57:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AA1AC5663B;
	Mon, 25 Jan 2021 11:57:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C54F3C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 11:57:30 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1l40Uq-0006VJ-Rx; Mon, 25 Jan 2021 12:57:28 +0100
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
References: <20210125112127.1583-1-a.fatoum@pengutronix.de>
 <b649a0fd-b229-8a54-b374-72ecedca9e64@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b6413a27-9cdf-9f60-be49-03398ee3f1f6@pengutronix.de>
Date: Mon, 25 Jan 2021 12:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b649a0fd-b229-8a54-b374-72ecedca9e64@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Holger Assmann <has@pengutronix.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] iio: adc: stm32-adc: enable
 timestamping for non-DMA usage
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



On 25.01.21 12:49, Marc Kleine-Budde wrote:
> On 1/25/21 12:21 PM, Ahmad Fatoum wrote:
>> For non-DMA usage, we have an easy way to associate a timestamp with a
>> sample: iio_pollfunc_store_time stores a timestamp in the primary
>> trigger IRQ handler and stm32_adc_trigger_handler runs in the IRQ thread
>> to push out the buffer along with the timestamp.
>>
>> For this to work, the driver needs to register an IIO_TIMESTAMP channel.
>> Do this.
>>
>> For DMA, it's not as easy, because we don't push the buffers out of
>> stm32_adc_trigger, but out of stm32_adc_dma_buffer_done, which runs in
>> a tasklet scheduled after a DMA completion.
>>
>> Preferably, the DMA controller would copy us the timestamp into that buffer
>> as well. Until this is implemented, restrict timestamping support to
>> only PIO. For low-frequency sampling, PIO is probably good enough.
>>
>> Cc: Holger Assmann <has@pengutronix.de>
>> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>> v2 -> v3:
>>   - explicitly specify alignment (Jonathan)
>>   - increase buffer size to hold additional timestamp
>> v1 -> v2:
>>   - Added comment about timestamping being PIO only (Fabrice)
>>   - Added missing DMA resource clean up in error path (Fabrice)
>>   - Added Fabrice's Acked-by
>> ---
>>  drivers/iio/adc/stm32-adc.c | 39 +++++++++++++++++++++++++++++--------
>>  1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
>> index c067c994dae2..ab2f440d7afb 100644
>> --- a/drivers/iio/adc/stm32-adc.c
>> +++ b/drivers/iio/adc/stm32-adc.c
>> @@ -177,7 +177,7 @@ struct stm32_adc_cfg {
>>   * @offset:		ADC instance register offset in ADC block
>>   * @cfg:		compatible configuration data
>>   * @completion:		end of single conversion completion
>> - * @buffer:		data buffer
>> + * @buffer:		data buffer + 8 bytes for timestamp if enabled
>                                       ^
>>   * @clk:		clock for this adc instance
>>   * @irq:		interrupt for this adc instance
>>   * @lock:		spinlock
>> @@ -200,7 +200,7 @@ struct stm32_adc {
>>  	u32			offset;
>>  	const struct stm32_adc_cfg	*cfg;
>>  	struct completion	completion;
>> -	u16			buffer[STM32_ADC_MAX_SQ];
>> +	u16			buffer[STM32_ADC_MAX_SQ + 8] __aligned(8);
>          ^^                                               ^
> 
> How does that fit together?

Ah indeed, that's a little longer than needed.
Thanks for catching.

> 
> Marc
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
