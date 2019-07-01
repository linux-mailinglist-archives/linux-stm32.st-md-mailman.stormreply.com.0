Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F5E3F7
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 15:51:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD22EC35E06
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 13:51:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D16A2C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 13:51:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TDfSYh002048; Mon, 29 Apr 2019 15:51:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=9GS1U02m14roUfdQRKfcCyy7nzTcnCZDQ41WVznJybE=;
 b=R08hjEzpsf96ONP83JV8SeiuAePyDkIyC0dCsvskt+d/g/ZoXpggqFek340m65LBxXYO
 aStkoRILZRgtNSsMmKWWXBSbBgFrASDIbicsXTji6gAW0Ct7Pgn2DhRHSiZocjv+EJmb
 aBW+sUzaUhjR8NddPcwb3UmuHYCuDXEzaNfPZ9s0/EdRj3IbwljYlz0Fk684vq1XXnVa
 iv21zYeIbSsK42aNPdEzwghWlnWVogPCPj2sRkaCZAVYmOVgBgY1mvEV1e/BApiRIOR3
 j6OKTbwiouCAKMNNuAiy0wqO4g+o40oY5Rozdt2UdteG/mvRLPsZ4BQy1Gh7sVjOxMq7 rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r407vb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 15:51:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 700243A;
 Mon, 29 Apr 2019 13:51:02 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41076263D;
 Mon, 29 Apr 2019 13:51:02 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.49) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 15:51:01 +0200
To: Guenter Roeck <linux@roeck-us.net>
References: <1556286075-29496-1-git-send-email-ludovic.Barre@st.com>
 <20190426141651.GA1715@roeck-us.net>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <192f7556-89e4-68f1-2274-f3bdbe0083ae@st.com>
Date: Mon, 29 Apr 2019 15:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426141651.GA1715@roeck-us.net>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] watchdog: stm32: add dynamic prescaler
	support
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

Hi Guenter

On 4/26/19 4:16 PM, Guenter Roeck wrote:
> On Fri, Apr 26, 2019 at 03:41:15PM +0200, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch allows to define the max prescaler by compatible.
>> To set a large range of timeout, the prescaler should be set
>> dynamically (from the timeout request) to improve the resolution
>> in order to have a timeout close to the expected value.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>> ---
>>   drivers/watchdog/stm32_iwdg.c | 70 +++++++++++++++++++++++++------------------
>>   1 file changed, 41 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
>> index e00e3b3..91d0a89 100644
>> --- a/drivers/watchdog/stm32_iwdg.c
>> +++ b/drivers/watchdog/stm32_iwdg.c
>> @@ -34,18 +34,10 @@
>>   #define KR_KEY_EWA	0x5555 /* write access enable */
>>   #define KR_KEY_DWA	0x0000 /* write access disable */
>>   
>> -/* IWDG_PR register bit values */
>> -#define PR_4		0x00 /* prescaler set to 4 */
>> -#define PR_8		0x01 /* prescaler set to 8 */
>> -#define PR_16		0x02 /* prescaler set to 16 */
>> -#define PR_32		0x03 /* prescaler set to 32 */
>> -#define PR_64		0x04 /* prescaler set to 64 */
>> -#define PR_128		0x05 /* prescaler set to 128 */
>> -#define PR_256		0x06 /* prescaler set to 256 */
>> +#define PR_SHIFT	2
>>   
>>   /* IWDG_RLR register values */
>> -#define RLR_MIN		0x07C /* min value supported by reload register */
>> -#define RLR_MAX		0xFFF /* max value supported by reload register */
>> +#define RLR_MAX		GENMASK(11, 0) /* max value of reload register */
>>   
>>   /* IWDG_SR register bit mask */
>>   #define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
>> @@ -55,15 +47,28 @@
>>   #define TIMEOUT_US	100000
>>   #define SLEEP_US	1000
>>   
>> -#define HAS_PCLK	true
>> +struct stm32_iwdg_data {
>> +	bool has_pclk;
>> +	u32 max_prescaler;
>> +};
>> +
>> +static const struct stm32_iwdg_data stm32_iwdg_data = {
>> +	.has_pclk = false,
>> +	.max_prescaler = 256,
>> +};
>> +
>> +static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
>> +	.has_pclk = true,
>> +	.max_prescaler = 1024,
>> +};
>>   
>>   struct stm32_iwdg {
>>   	struct watchdog_device	wdd;
>> +	const struct stm32_iwdg_data *data;
>>   	void __iomem		*regs;
>>   	struct clk		*clk_lsi;
>>   	struct clk		*clk_pclk;
>>   	unsigned int		rate;
>> -	bool			has_pclk;
>>   };
>>   
>>   static inline u32 reg_read(void __iomem *base, u32 reg)
>> @@ -80,21 +85,30 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
>>   {
>>   	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
>>   	u32 val = FLAG_PVU | FLAG_RVU;
>> -	u32 reload;
>> +	u32 timeout, presc, iwdg_rlr, iwdg_pr;
>>   	int ret;
>>   
>>   	dev_dbg(wdd->parent, "%s\n", __func__);
>>   
>> -	/* prescaler fixed to 256 */
>> -	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
>> -			 RLR_MIN, RLR_MAX);
>> +	timeout = clamp_t(unsigned int, wdd->timeout,
>> +			  wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
>> +
>> +	if (timeout != wdd->timeout)
>> +		dev_warn(wdd->parent, "timeout skrinked to %d\n", timeout);
>> +
> 
> Valid values for timeout should be set in the set_timeout function,
> not here. As such, there is no need for this warning. More specifically,
> if the selected timeout is between min_timeout and max_hw_heartbeat_ms,
> and the hardware can not meet the exact requested value, the set_timeout
> function should adjust wdd->timeout value accordingly.
> 

Ok, so I will adjust the timeout (with prescaler and reload look-up)
value in set_timeout function. thanks

> Example: The requested timeout is 55 seconds, but the hardware can
> only support either 32 or 64 seconds. The set_timeout function should
> then set wdd->timeout to either 32 or 64.
> 
> Furthermore, this is a valid condition. For example, the timeout could
> be set for one hour (or day), and the maximum heartbeat could be one
> minute. In that situation, the watchdog core handles heartbeat/ping
> requests. Again, this does not warrant a warning.
> 
> On top of all that, if the hardware can not set a minimum timeout of
> 1 second, min_timeout should not be set to 1 second. It should be set
> to the actual minimum supportable value if that value is larger than
> 1 second.
> 
>> +	presc = DIV_ROUND_UP(timeout * wdt->rate, RLR_MAX + 1);
>> +
>> +	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
>> +	presc = roundup_pow_of_two(presc);
>> +	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
>> +	iwdg_rlr = ((timeout * wdt->rate) / presc) - 1;
>>   
>>   	/* enable write access */
>>   	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
>>   
>>   	/* set prescaler & reload registers */
>> -	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
>> -	reg_write(wdt->regs, IWDG_RLR, reload);
>> +	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
>> +	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
>>   	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
>>   
>>   	/* wait for the registers to be updated (max 100ms) */
>> @@ -150,7 +164,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>>   	}
>>   
>>   	/* optional peripheral clock */
>> -	if (wdt->has_pclk) {
>> +	if (wdt->data->has_pclk) {
>>   		wdt->clk_pclk = devm_clk_get(&pdev->dev, "pclk");
>>   		if (IS_ERR(wdt->clk_pclk)) {
>>   			dev_err(&pdev->dev, "Unable to get pclk clock\n");
>> @@ -191,8 +205,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
>>   };
>>   
>>   static const struct of_device_id stm32_iwdg_of_match[] = {
>> -	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
>> -	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
>> +	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
>> +	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
>>   	{ /* end node */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
>> @@ -200,20 +214,17 @@ MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
>>   static int stm32_iwdg_probe(struct platform_device *pdev)
>>   {
>>   	struct watchdog_device *wdd;
>> -	const struct of_device_id *match;
>>   	struct stm32_iwdg *wdt;
>>   	struct resource *res;
>>   	int ret;
>>   
>> -	match = of_match_device(stm32_iwdg_of_match, &pdev->dev);
>> -	if (!match)
>> -		return -ENODEV;
>> -
>>   	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
>>   	if (!wdt)
>>   		return -ENOMEM;
>>   
>> -	wdt->has_pclk = match->data;
>> +	wdt->data = of_device_get_match_data(&pdev->dev);
>> +	if (!wdt->data)
>> +		return -ENODEV;
>>   
>>   	/* This is the timer base. */
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> @@ -231,8 +242,9 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>>   	wdd = &wdt->wdd;
>>   	wdd->info = &stm32_iwdg_info;
>>   	wdd->ops = &stm32_iwdg_ops;
>> -	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
>> -	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
>> +	wdd->min_timeout = 1;
> 
> Is this guaranteed to be no larger than 1 under all circumstances ?
> 
> [ Not that the old code was necessarily correct - it might have set
>    min_timeout to 0 if wdt->rate is high ]

Infact, for not guaranteed the min timeout at 1s, the input clock
(wdt->rate) should be < at 12Hz.

On ST micro controller/processor the wdt->rate is based on LSI
(Low Speed Internal) clock which is defined around 32KHz-39KHz

I wanted avoid to set 0, due to min_timeout definition
("unsigned int" in struct watchdog_device) and comparator used
in watchdog_timeout_invalid function.

if the calculated value is < 1 => I could set 1,
else I round on UP or Down value?

Regards,
Ludo

> 
>> +	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
>> +				    1000) / wdt->rate;
>>   	wdd->parent = &pdev->dev;
>>   
>>   	watchdog_set_drvdata(wdd, wdt);
>> -- 
>> 2.7.4
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
