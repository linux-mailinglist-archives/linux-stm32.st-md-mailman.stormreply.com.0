Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0298E6B8
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 01:22:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C80C78023;
	Wed,  2 Oct 2024 23:22:11 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E60CBC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 23:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ogYWyS7RAZoXViNTRdYZLASKV4THtoT8ZMkRewJJ5F4=; b=468asTggrzrNPNoHkwN3Ca69HC
 DRz4GLWoi6pRBDQP83dTTrKSiOQSxW8q6pB2tfjFCMb6GwW472ZojnW4D+LPzlnnew8GbPOIN0VWv
 MFwarHKq5lsOfZCw/94UonjTD3u9eEEqxfJqxhLlSeX8SsM3BmLM9BPAAsYi5rNvEFws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sw8fK-008u2t-3v; Thu, 03 Oct 2024 01:21:54 +0200
Date: Thu, 3 Oct 2024 01:21:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Message-ID: <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001024731.140069-1-marex@denx.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
> The trigger_data->hw_control indicates whether the LED is controlled by HW
> offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> currently called only from netdev_led_attr_store(), i.e. when writing any
> sysfs attribute of the netdev trigger instance associated with a PHY LED.
> 
> The can_hw_control() calls validate_net_dev() which internally calls
> led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> is not attached.
> 
> At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
> only when the interface is brought up and is detached again when the
> interface is brought down. In case e.g. udev rules configure the netdev
> LED trigger sysfs attributes before the interface is brought up, then when
> the interface is brought up, the LEDs are not blinking.
> 
> This is because trigger_data->hw_control = can_hw_control() was called
> when udev wrote the sysfs attribute files, before the interface was up,
> so can_hw_control() resp. validate_net_dev() returned false, and the
> trigger_data->hw_control = can_hw_control() was never called again to
> update the trigger_data->hw_control content and let the offload take
> over the LED blinking.
> 
> Call data->hw_control = can_hw_control() from netdev_trig_notify() to
> update the offload capability of the LED when the UP notification arrives.
> This makes the LEDs blink after the interface is brought up.

Have you run this code with lockdep enabled? There have been some
deadlocks, or potential deadlocks in this area.

> 
> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> in place, boot the machine with cable plugged in, and the LEDs won't work
> without this patch once the interface is brought up, even if they should:
> "
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> "

Nice use of udev. I had not thought about using it for this.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
