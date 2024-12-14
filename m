Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD79F1FA3
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2024 16:21:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06596C6DD9A;
	Sat, 14 Dec 2024 15:21:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55DF6C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2024 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=eC7p2BcNvf10KUA1ibKd+voMFY/6hc63cpdb/UAGvB8=; b=h+8KQAhXXR7yPFgzBI2B7fUwVN
 LaLWN4UtcIE80mbO5hbxUSv2K6D5rN6NTvuL82Sb94O1gzs3WHELTTkE0/OK+GOMEGbkdGQYl4xeP
 i6xR1H4PoszhE0xrTFrSXYxqSewU/GIrN/4XrefeDaqZXOSVGINHnXi2nZA3zNdXgmq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tMTwX-000S73-BT; Sat, 14 Dec 2024 16:20:33 +0100
Date: Sat, 14 Dec 2024 16:20:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Message-ID: <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
 <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
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

On Fri, Dec 13, 2024 at 11:15:09PM +0100, Marek Vasut wrote:
> On 10/3/24 2:06 PM, Andrew Lunn wrote:
> > On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
> > > The trigger_data->hw_control indicates whether the LED is controlled by HW
> > > offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> > > currently called only from netdev_led_attr_store(), i.e. when writing any
> > > sysfs attribute of the netdev trigger instance associated with a PHY LED.
> > > 
> > > The can_hw_control() calls validate_net_dev() which internally calls
> > > led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> > > for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> > > is not attached.
> > > 
> > > At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
> > > only when the interface is brought up and is detached again when the
> > > interface is brought down. In case e.g. udev rules configure the netdev
> > > LED trigger sysfs attributes before the interface is brought up, then when
> > > the interface is brought up, the LEDs are not blinking.
> > > 
> > > This is because trigger_data->hw_control = can_hw_control() was called
> > > when udev wrote the sysfs attribute files, before the interface was up,
> > > so can_hw_control() resp. validate_net_dev() returned false, and the
> > > trigger_data->hw_control = can_hw_control() was never called again to
> > > update the trigger_data->hw_control content and let the offload take
> > > over the LED blinking.
> > > 
> > > Call data->hw_control = can_hw_control() from netdev_trig_notify() to
> > > update the offload capability of the LED when the UP notification arrives.
> > > This makes the LEDs blink after the interface is brought up.
> > > 
> > > On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> > > in place, boot the machine with cable plugged in, and the LEDs won't work
> > > without this patch once the interface is brought up, even if they should:
> > > "
> > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> > > "
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Is there anything blocking this patch from being picked up ?

I think this should be going via the LED Maintainer. Please check with
Lee.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
