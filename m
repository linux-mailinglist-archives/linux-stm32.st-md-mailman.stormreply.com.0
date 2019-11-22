Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA65107341
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 14:31:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BCC4C36B0B;
	Fri, 22 Nov 2019 13:31:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F3E1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 13:31:29 +0000 (UTC)
Received: from [2001:67c:670:100:6a05:caff:fe2d:a9b1]
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1iY91y-0007Iq-PR; Fri, 22 Nov 2019 14:31:26 +0100
To: Christophe ROULLIER <christophe.roullier@st.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20191122082442.21695-1-christophe.roullier@st.com>
 <ea80ec65-8621-453c-4d5b-af38d8afeb70@pengutronix.de>
 <70c319bd-866c-5305-e535-ead663652c5f@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <53b2f559-3456-d378-587d-d220920e9bf7@pengutronix.de>
Date: Fri, 22 Nov 2019 14:31:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <70c319bd-866c-5305-e535-ead663652c5f@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:100:6a05:caff:fe2d:a9b1
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
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

Hello Christophe,

On 11/22/19 2:15 PM, Christophe ROULLIER wrote:
>> On 11/22/19 9:24 AM, Christophe Roullier wrote:
>>> +	/*
>>> +	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
>>> +	 * (Means U-Boot/bootloaders leaves the watchdog running)
>>> +	 * When we get here we should make a decision to prevent
>>> +	 * any side effects before user space daemon will take care of it.
>>> +	 * The best option, taking into consideration that there is no
>>> +	 * way to read values back from hardware, is to enforce watchdog
>>> +	 * being run with deterministic values.
>> What about the "ONF: Watchdog enable status bit" in the IWDG_SR register?

> Thanks Ahmad for your feedback, it is a mistake in our ref manual. This 
> bit is not present
> 
> in our iwdg IP, we will update our documentation accordingly.

Thanks for the info. I think it would be nice to have this information in
the driver as well, something like:

* The best option, taking into consideration that that the ONF
* watchdog status bit is non-functional, is to enforce watchdog
* being run with deterministic values.

This way it's clear that it's a deliberate choice to do it this way.

Cheers
Ahmad



-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
