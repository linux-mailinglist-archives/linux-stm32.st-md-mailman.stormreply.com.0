Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757898EEB5
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 14:05:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07621C78023;
	Thu,  3 Oct 2024 12:05:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AAC6C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ywp8+VbD741GfBOGthIuAH6MqIGxO+3sHTl82q7Wcco=; b=uMu7pMwxdY6KPL7wmrrjGHvWyB
 8JuKegoLWB4c5n4Wfx/EmEtqSrfUEauxj7TiycArOWrq768ErX0Kd5S7AYVdpqIH3C/JdUWBR2Mqd
 0UEzYXP23/uIU3iQQ/hrUU+AKHWy9OwxEIvvbCdoUmWtSvOMWicSABCtt4PENCSRR+vk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1swKa3-008wW8-W6; Thu, 03 Oct 2024 14:05:15 +0200
Date: Thu, 3 Oct 2024 14:05:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Message-ID: <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
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

> > Nice use of udev. I had not thought about using it for this.

> Is there some other way to configure the netdev-triggered PHY LEDs ?
> I still feel the udev rule is somewhat brittle and fragile, and also not
> available early enough for default PHY LED configuration, i.e. the LEDs are
> not blinking when I use e.g. ip=/nfsroot= when booting from NFS root until
> the userspace started, which is not nice. The only alternative I can imagine
> is default configuration in DT, which was already rejected a few years ago.

Device tree is the only early way i can think of, especially for NFS
root.

What has clearly been rejected is each vendor having their own DT
binding. But i think we might have more success with one generic
binding for all MAC/PHY LEDs.

The way i was thinking about it, was to describe the label on the
front panel. That is hardware you are describing, so fits DT.

We are clearly in the grey area for DT, so i can understand some push
back on this from the DT Maintainers.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
