Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFCF82AF54
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 14:17:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F300C6DD73;
	Thu, 11 Jan 2024 13:17:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9629CC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=il+w8FtfhJHoKZMk6/3PRsXBylrA/EgWONxoBacvEFk=; b=Mi/7EUkk+96Fu+e4grIj30OKjw
 s9UyrmWftnrF5wN6Wzm7wk3Z+2ni4VbciRb89fFHNdz7XOhm6n6z8y4JbQdPiM695s0KR7w/ilFeA
 XRWAAsLwqU88g7nnIBgdyaaEn9mfjf3/lxxelTjQKnISiOWvECOfxFpBj0eCdTv5gTDI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rNuvm-00506I-0z; Thu, 11 Jan 2024 14:17:10 +0100
Date: Thu, 11 Jan 2024 14:17:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <3e87a5f7-e637-401c-8fe1-9b0c5e6d8289@lunn.ch>
References: <20240104101255.3056090-1-yi.fang.gan@intel.com>
 <fb1cc3a4-8615-4cee-8fe7-29966c4cb7c7@lunn.ch>
 <MW6PR11MB8310698247DD950C5EBF5F2CB9682@MW6PR11MB8310.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW6PR11MB8310698247DD950C5EBF5F2CB9682@MW6PR11MB8310.namprd11.prod.outlook.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Choong,
 Yong Liang" <yong.liang.choong@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v3 1/1] net: phylink: Add module_exit()
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

> Hi Andrew,
> 
> Regarding the justification on why it is safe to remove phylink, 
> we had done some memory leak check when unloading the phylink module.
>  
> root@localhost:~# lsmod | grep "phylink"
> phylink               73728  0
> root@localhost:~# rmmod phylink
> root@localhost:~# echo scan > /sys/kernel/debug/kmemleak
> root@localhost:~# cat /sys/kernel/debug/kmemleak
> root@localhost:~#
>  
> So far, we didn't observe any memory leaking happened when unloading
> phylink module. Is it sufficient or do you have any other suggestions to check 
> on whether the module is safe to remove?

In general, leaked memory is safe. Being leaked, nothing is using
it. If nothing is using it, how can it cause an opps, corrupt a file
system, etc.

What you need to do is review all users of phylink, and determine if
any of them retains a pointer to anything which phylink manages and
will not be freed or uninitialized when it is unloaded. Is all polling
of GPIOs cleanly stopped? Are interrupt handlers disabled and
removed. Are PCS and MAC drivers cleanly unloaded first? Are hwmon
entries cleanly removed, taking into account that user space might
have them open? All ethtool ioctl/netlink calls are out of the code
before it is removed, etc.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
