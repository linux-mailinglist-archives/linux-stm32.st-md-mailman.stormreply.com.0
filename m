Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CD98E7EB
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 02:47:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18B66C78023;
	Thu,  3 Oct 2024 00:47:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4D63C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 00:47:49 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 88D83889C3;
 Thu,  3 Oct 2024 02:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727916469;
 bh=kIblb8tGR6fk/1wR5vCritv1LtoFcFNCSySBUU+XPx8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cb6D0MH5j8MPVSNecFq5+UjcoqBXGD0bI70hb15EmHgLR8mhYuOy+jrqBhSI2d4eh
 KezSv347rGjv3JmESwhsV5DRNNomAohAefOPsQRrsp/oQ1vKEF2gDUIAUDxMD4XgNa
 /yzyEK+pZXf6sWgxH40GsBu4RRiOXPViHr8Hk+FY0M655pdJ3YW2ZjBFZieEg6gJca
 Z9hhANyO7UMJHQaN3NuXubrtGYVUpbZUTBQtZHU56RmyAmAKn/Bphm3mU4hafIHoTU
 HOI7sQMdRFVMjGdgU6/JGhgE/SjhYXovEzIIzQQpk+iGEyrLpbasRU5GqGWS1F/K/J
 V8pvm9wuq5dww==
Message-ID: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Date: Thu, 3 Oct 2024 02:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/3/24 1:21 AM, Andrew Lunn wrote:
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
> 
> Have you run this code with lockdep enabled? There have been some
> deadlocks, or potential deadlocks in this area.

Now I did on next 20241002 , no lockdep splat reported .

>> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
>> in place, boot the machine with cable plugged in, and the LEDs won't work
>> without this patch once the interface is brought up, even if they should:
>> "
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
>> "
> 
> Nice use of udev. I had not thought about using it for this.
Is there some other way to configure the netdev-triggered PHY LEDs ?
I still feel the udev rule is somewhat brittle and fragile, and also not 
available early enough for default PHY LED configuration, i.e. the LEDs 
are not blinking when I use e.g. ip=/nfsroot= when booting from NFS root 
until the userspace started, which is not nice. The only alternative I 
can imagine is default configuration in DT, which was already rejected a 
few years ago.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
