Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A89AFEBF2
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 16:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 259C3C36B2A;
	Wed,  9 Jul 2025 14:30:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D0C3C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ajTS+ah2xlTtyM+2OdyBW0mQCdQADRwx6tcLGItIUGs=; b=BU0Lh4cVcC9JYAhMHeec6iLzAT
 8B5BDM6aSsgVyvlRIMF6YCm8hNDqSUb2nGDVOWOmgXMvbpfgML81+XLGjklzaaYdNmPIpIZNnReXE
 XlOqfQTEeMzFTwwOKatkqx/5Kn5NqNQT5YPQalMmTq4IzcFAVHjTJG9Q5S2RwwqWa9at6i13H580M
 bku1dmWB+UoihrDFufqoiIoFAmKf8H+67IYEVLSeyIScCP9VR+z3Jx01MAHmZYnaK5BC8EaDKx2Qy
 gfctDV+yS+iGIo50Y7Si6JdllgeBE9inn4Dlo+524ULJ8HmSVIK2IM9sgxHLbjlNPBBddZkkO16va
 GPhq0umw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51968)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uZVo2-00086d-16;
 Wed, 09 Jul 2025 15:29:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uZVnv-0002hv-0I;
 Wed, 09 Jul 2025 15:29:47 +0100
Date: Wed, 9 Jul 2025 15:29:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Message-ID: <aG582lPgpOr8oyyx@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
 <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
 <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
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

On Wed, Jul 09, 2025 at 07:42:55PM +0800, lizhe wrote:
> Hi,
>     i have already declared it in the DTS.
> 
>     &gmac {
>             snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
>     };

Active high means that the reset is in effect when the output is at the
logic '1' state. So, gpiod_get_value*() will return the same as
gpiod_get_raw_value*().

Active low means that the reset is in effect when the output is at the
logic '0' state, and in that case the return value of
gpiod_get_value*() will return true when the reset is active (at logic
'0' state) whereas gpiod_get_raw_value*() will return zero.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
