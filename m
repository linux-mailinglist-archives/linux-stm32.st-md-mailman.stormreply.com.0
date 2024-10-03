Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248798F028
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 15:16:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44143C78023;
	Thu,  3 Oct 2024 13:16:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E4E2C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 13:16:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D78B888C78;
 Thu,  3 Oct 2024 15:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727961375;
 bh=QNI2Ifkjuw3+hHr7PhkjBjn+usr+32yD+CflAXc2zQA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lsWdX9r1EwinVgs+8Tw893RPggI001Ps85Jh4jNEgd6Y6ZnoKJtvZnS2IO6P2c9iY
 t7EIZIXNcktJ5IYhxWStI1rdjkAKxLfzaTb4nbMVt7eurLAl1AGQS7026L/qzuXYJ3
 Fvd8TZqFwSFIe+sVCDwlZUxT8bdVtYnCbLgvE5XmS4/UEZL57kEp2+7NQRTTxI4EOg
 nHmIURvpzAMYYE1Wanif5Quzvt/xiiNJynQoB55qpJfxg6i2Iy1tFV3jrlNhfuDyAy
 qjMcwG4CNWNMV4KuxnYEowAfuwraLeu+HeiYhG1ayGJEImEDlOuJODjNUmfVs0djfh
 h1XFUEYH5R9lA==
Message-ID: <dcad968d-b305-4c0a-b377-1a147d156756@denx.de>
Date: Thu, 3 Oct 2024 14:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
 <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
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

On 10/3/24 2:05 PM, Andrew Lunn wrote:
>>> Nice use of udev. I had not thought about using it for this.
> 
>> Is there some other way to configure the netdev-triggered PHY LEDs ?
>> I still feel the udev rule is somewhat brittle and fragile, and also not
>> available early enough for default PHY LED configuration, i.e. the LEDs are
>> not blinking when I use e.g. ip=/nfsroot= when booting from NFS root until
>> the userspace started, which is not nice. The only alternative I can imagine
>> is default configuration in DT, which was already rejected a few years ago.
> 
> Device tree is the only early way i can think of, especially for NFS
> root.
> 
> What has clearly been rejected is each vendor having their own DT
> binding. But i think we might have more success with one generic
> binding for all MAC/PHY LEDs.

Right now I have this (for one of the PHY LEDs):

led@0 {
         reg = <0>;
         color = <LED_COLOR_ID_GREEN>;
         function = LED_FUNCTION_WAN;
         linux,default-trigger = "netdev";
};

What about be useful is to set the link_10/100/1000 and rx/tx flags here 
somehow. It cannot be 'function' because that is already used to define 
the port purpose.

Maybe something like 'led-pattern' property used by 'pattern' trigger 
would work ? Some sort of "led-netdev-flags = LINK10 | LINK100;" ?

> The way i was thinking about it, was to describe the label on the
> front panel. That is hardware you are describing, so fits DT.
> 
> We are clearly in the grey area for DT, so i can understand some push
> back on this from the DT Maintainers.

It would be a policy, yes.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
