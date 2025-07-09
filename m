Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A1AFE719
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 13:11:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26C1FC36B19;
	Wed,  9 Jul 2025 11:11:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A1EFC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vvZq130tiT45bvyCEcIJ+K9zjA5skCS0X4i6X4l6Bi0=; b=YvNUzQZEcwdbrQV8j3ZTIqZJZa
 4HP+dnk7X61abQxSvtPEiHSu67e/O70tubpndvJGshW1wE7Rw645Ghcv6TIyLcFBige9a9uYqop0I
 R+OOU+roJBWbQIWazOyqgOYN03OH07FCTN1B+SCFOc+GyasPNYxKsT+rRiyl9Miig+bNXl/9jzseA
 Ex/MpQ1pYFn0Z9pAdk4tUwreZdx4z7qxGTsudBKN75fGUIXOFkF8Ld2b3KcO2bX2CqnUyg7K2HQls
 mQhCdO2KqiqrVlw89GJpy1CPr2OQLsJyqVOieoY5DpNj0+86Jd41OsT+AMSNe/oyayroPljcDFRWQ
 S4S+1uCw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55728)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uZShg-0007qh-2n;
 Wed, 09 Jul 2025 12:11:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uZSha-0002bB-1i;
 Wed, 09 Jul 2025 12:11:02 +0100
Date: Wed, 9 Jul 2025 12:11:02 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Message-ID: <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 09, 2025 at 03:48:25PM +0800, lizhe wrote:
> Hi, 
> 
> after replacing with this function, the function returns 0, meaning the gpio is
> still at a low voltage level.
> 
> +              int gpio_state = -1;
> 
> 
>                 if (delays[2])
>                         msleep(DIV_ROUND_UP(delays[2], 1000));
> +
> +               gpio_state = gpiod_get_raw_value_cansleep(reset_gpio);
> +               pr_info("gpio_state: %d\n", gpio_state);
> +               pr_info("gpio_state: %d\n", gpio_state);
> 
>  gpio-111 (                    |snps,reset          ) out lo
> 
> 
> [    3.899319] gpio_state: 0
> [    3.899324] gpio_state: 0

How have you declared the snps,reset-gpio property in DT?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
