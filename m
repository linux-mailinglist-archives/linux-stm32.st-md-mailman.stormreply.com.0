Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFE9F1922
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 23:32:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D6A3C78011;
	Fri, 13 Dec 2024 22:32:56 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A4EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 22:32:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BF71103B8FD5; Fri, 13 Dec 2024 23:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734129167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3lMENMefBk6pUR9W4xYAZB0rcngf/adMQ7Rd64R32A=;
 b=TtUhHujoQYV7chB9SEaTrnGogUxwq5ffO+LBzAu0R980y8NtSb8AGVxW1K6Nii5SKgzXqp
 D4wlV6E0Y3vRsVIGQmaE9VDzvj8NxFJqeDvjwrQJr88EnPeIRqz/5sgIA9HtGAbfz5T9i3
 rR9O+tS5cdGYRSWhiKb3MtLf0vRp9xK6hOfImDmIBDiviWgBYHmpJ/Z+Scs94CCO3s7sjz
 DOI2UUaZoAcru0Jcx+rVY28NPHjS9uRXPTDlJYIih00GwzdDfNWP7dmSoVYx4bacBlzusK
 HBZkuG3tWujNwgrEEOuuwJkNGR8II1x6qCwBjpql5fW7o+t6OfekUWkYK/8VUQ==
Message-ID: <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
Date: Fri, 13 Dec 2024 23:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, kernel@dh-electronics.com,
 Pavel Machek <pavel@ucw.cz>, Lukasz Majewski <lukma@denx.de>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] leds: trigger: netdev: Check offload
 ability on interface up
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

On 10/3/24 2:06 PM, Andrew Lunn wrote:
> On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
>> The trigger_data->hw_control indicates whether the LED is controlled by HW
>> offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
>> currently called only from netdev_led_attr_store(), i.e. when writing any
>> sysfs attribute of the netdev trigger instance associated with a PHY LED.
>>
>> The can_hw_control() calls validate_net_dev() which internally calls
>> led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
>> for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
>> is not attached.
>>
>> At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
>> only when the interface is brought up and is detached again when the
>> interface is brought down. In case e.g. udev rules configure the netdev
>> LED trigger sysfs attributes before the interface is brought up, then when
>> the interface is brought up, the LEDs are not blinking.
>>
>> This is because trigger_data->hw_control = can_hw_control() was called
>> when udev wrote the sysfs attribute files, before the interface was up,
>> so can_hw_control() resp. validate_net_dev() returned false, and the
>> trigger_data->hw_control = can_hw_control() was never called again to
>> update the trigger_data->hw_control content and let the offload take
>> over the LED blinking.
>>
>> Call data->hw_control = can_hw_control() from netdev_trig_notify() to
>> update the offload capability of the LED when the UP notification arrives.
>> This makes the LEDs blink after the interface is brought up.
>>
>> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
>> in place, boot the machine with cable plugged in, and the LEDs won't work
>> without this patch once the interface is brought up, even if they should:
>> "
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
>> "
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Is there anything blocking this patch from being picked up ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
