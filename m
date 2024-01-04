Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B838824221
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 14:00:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF882C6B452;
	Thu,  4 Jan 2024 13:00:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 031D4C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=em8656SBmFHuCoSI6Hw7pHiwOvfMbL7DUtlbPOdcosg=; b=IIIPJc9QzwaijPod1f+lYfIUlU
 AYiygKn9dmrcgfr6FR8efPlyPxk7oGMaN60icGgMu2P2bEcU69iCW1SSbkdk/5b7dVh1BiBOujbRP
 WUxVzR6jyKZ7V5NdAC/HyYy+R13rrQ3o4w8K3QiHH7J3Wk3BZ+QN0meADrxgLU1N2zq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rLNKd-004LX7-Ub; Thu, 04 Jan 2024 14:00:19 +0100
Date: Thu, 4 Jan 2024 14:00:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <b1b962d1-403f-41b4-9ef8-f2cdb33795e7@lunn.ch>
References: <20231221085109.2830794-1-yi.fang.gan@intel.com>
 <20231221085109.2830794-3-yi.fang.gan@intel.com>
 <0f85171e-cb9c-47dd-bb7d-f58537e24a54@lunn.ch>
 <MW6PR11MB8310E51E5EEDA8EE98BC37D4B967A@MW6PR11MB8310.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW6PR11MB8310E51E5EEDA8EE98BC37D4B967A@MW6PR11MB8310.namprd11.prod.outlook.com>
Cc: "Voon, Weifeng" <weifeng.voon@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, "Lai,
 Peter Jun Ann" <peter.jun.ann.lai@intel.com>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 John Stultz <jstultz@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, "Choong,
 Yong Liang" <yong.liang.choong@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: phylink: Add
	module_exit_stub()
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

On Thu, Jan 04, 2024 at 09:45:47AM +0000, Gan, Yi Fang wrote:
> Hi Andrew,
> 
> The function phylink_init() is introduced by others.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=eca68a3c7d05b38b4e728cead0c49718f2bc1d5a 
> The module_exit() is added by referring to
> https://elixir.bootlin.com/linux/latest/source/kernel/module/main.c#L738.
> Since the macro function is rejected, I will send a V3.
> Let's see if Rusell King has any comment. Thanks.

Please don't top post when using linux kernel mailing lists.

> > You are missing justification it is actually safe to remove phylink. Maybe Russell
> > King deliberately did not implement
> > module_exit() because it can explode in interesting ways if it was?

You still need to explain why it is safe to implement it.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
