Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E6AFDEC2
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 06:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60EF9C36B2B;
	Wed,  9 Jul 2025 04:25:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75B4EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 04:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aQhCFUQXqPLefJ8ih+mruiWIMzk9Nrdb8hgYrHL70VE=; b=MsmRFSigcjwHp0/QI7Y+z2ad1J
 OzLRdnjHBrSem8CT+BNtEr0BbPkjhzGoFsa1LbsaUYxWHeXYMcJVKktOo9a9MV4eqJdtbiAut7gV5
 lnpQ+Q1frb/YoQaniLYJiURHOU+AmNJHwZpEyC+Pvb4ZI2PtUNsTUVwIpjIImJHU2Z1EDk5/9kCyG
 19W6fUV9LeNj9HoVjeF4J4VjtLPkWFQBdniGEckrsA1QYBjmRJB8bWP3Xy0CBJ2HYXz8dTe0jb01C
 dG0J0wR8oEyLHinHhRXPuwXtBU8eCITvAaHdkZYsCvr4IImrHSA37oMbERsb7+Trttb6kiB46XqQm
 wdxltntA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59580)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uZMMq-0007Pm-0q;
 Wed, 09 Jul 2025 05:25:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uZMMi-0002Dj-0p;
 Wed, 09 Jul 2025 05:25:04 +0100
Date: Wed, 9 Jul 2025 05:25:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Message-ID: <aG3vIMHkPezr4rJT@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <aG1X9pPYDGO8kfM9@shell.armlinux.org.uk>
 <2588871d.189d.197ece7c486.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2588871d.189d.197ece7c486.Coremail.sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Support gpio high-level
 reset for devices requiring it
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

On Wed, Jul 09, 2025 at 09:58:21AM +0800, lizhe wrote:
> Hi, 
> 
> Thx !
> 
> i conducted an experiment, and no matter whether i configured it as 
> GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH in the dts, the resulting
> GPIO pin state was 0, indicating a low level.
> 
> 
> if (delays[2])
>     msleep(DIV_ROUND_UP(DELAYS[2], 1000));
> 
> + gpio_state = gpiod_get_value_can_sleep(reset_gpio);
> + pr_info("gpio_state: %d\n", gpio_state);

Use gpiod_get_raw_value_cansleep().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
