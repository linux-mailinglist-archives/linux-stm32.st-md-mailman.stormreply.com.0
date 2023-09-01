Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92653790306
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Sep 2023 22:59:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40501C6A61D;
	Fri,  1 Sep 2023 20:59:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 570A9C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 20:59:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E8E4A8657B;
 Fri,  1 Sep 2023 22:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693601962;
 bh=9odOAZuqxqO3GhfS6yAgN5dZud26TQQRpQz8qJzUt3Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I+ivvHeYkjFe1Kpu8pWMoIthhgR77ENC6LgA+fvAI2PslskRiSX6QdzjBygV0uXBG
 nkKapZ7ZfetcqKv46aQ7mKPhn7Oo3BwlI0v7b/RGn0L7ez6qcFnsq0O2qsLh4XmL/Z
 9QBwM3CnnPj86KskMIa64mgyMSNnYpbCWd97NVeYzEXejm37bBzo0SqRCALPHpdIM+
 Q2pR2shH6Xnl73f//upYtJqfRSIiCIW/wjHJynIuCe3tj3ZuBhDDVwEhgQO0XfxA3s
 CsIDA2CT5CZHouZU/WapAkdjuJ1pDC7uklVaulX3ZeHvCpBYXvXU4i3QhG1pBMzKvb
 YtQgA2q/rvDrw==
Message-ID: <2cbf879d-8052-29e4-5f2a-40a6562dc4b4@denx.de>
Date: Fri, 1 Sep 2023 22:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
References: <20230517194349.105745-1-marex@denx.de>
 <20230517194349.105745-2-marex@denx.de>
 <ba596dd5-e9b9-4972-a768-e42e69897fea@roeck-us.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ba596dd5-e9b9-4972-a768-e42e69897fea@roeck-us.net>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] watchdog: stm32_iwdg: Add
	pretimeout support
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

On 8/6/23 16:19, Guenter Roeck wrote:
> On Wed, May 17, 2023 at 09:43:48PM +0200, Marek Vasut wrote:
>> The STM32MP15xx IWDG adds registers which permit this IP to generate
>> pretimeout interrupt. This interrupt can also be used to wake the CPU
>> from suspend. Implement support for generating this interrupt and let
>> userspace configure the pretimeout. In case the pretimeout is not
>> configured by user, set pretimeout to half of the WDT timeout cycle.

[...]

>>   static int stm32_iwdg_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -253,6 +340,11 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>>   	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
>>   				    1000) / wdt->rate;
>>   
>> +	/* Initialize IRQ, this might override wdd->info, hence it is here. */
>> +	ret = stm32_iwdg_irq_init(pdev, wdt);
>> +	if (ret)
>> +		return ret;
>> +
> 
> What if the interrupt fires for whatever reason and the watchdog
> isn't registered yet and the driver data is not set and the
> watchdog core doesn't know about the watchdog ?

That cannot happen since the pretimeout IRQ was not configured yet.
That can only happen once the core is aware of the WDT and calls 
set_pretimeout .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
