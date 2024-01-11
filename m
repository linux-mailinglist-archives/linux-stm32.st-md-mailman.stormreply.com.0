Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DF82AB5E
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 10:55:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86030C6DD66;
	Thu, 11 Jan 2024 09:55:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D79DC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgiHrGWYBA6aL4HOR5JD3n9X8Y9twX1PfVqPn+eiAKA=; b=IpU5IN+B34WDy0CdImrjCB5WZe
 OHDlJQaJKmKSVHc2w2Nh09yX4A+VhlZ9fwiWHxwOcL1G0tF3VMReE0HxmMDgNZpHTAojewAc2A/Sk
 XNYSABtgl+5qpYwKsAHCN2OsOgA4OQ2/fwFMiktkuoFJUmItKYSKmHQw/eq9J/2DvkJH56s6Uh9ka
 HxF2fqLpJOsUMyFWEByfyhCExC/8evs5UiBE3ipBoP0s9M91B0YguVS30aGydIXhZPgYFqOp0svMI
 3u2sryub2gSy2g5+betsApN85KWVayl+YMFRJb3hZtJ5M/ECsNey1MOBCke7lVpdn0ORhrXWPWkap
 fS5FdDjg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47350)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rNrm2-0006Li-2J;
 Thu, 11 Jan 2024 09:54:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rNrm2-0006Fz-K2; Thu, 11 Jan 2024 09:54:54 +0000
Date: Thu, 11 Jan 2024 09:54:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <ZZ+67poJKiNsVmKw@shell.armlinux.org.uk>
References: <20240104101255.3056090-1-yi.fang.gan@intel.com>
 <fb1cc3a4-8615-4cee-8fe7-29966c4cb7c7@lunn.ch>
 <MW6PR11MB8310698247DD950C5EBF5F2CB9682@MW6PR11MB8310.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW6PR11MB8310698247DD950C5EBF5F2CB9682@MW6PR11MB8310.namprd11.prod.outlook.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, "Choong,
 Yong Liang" <yong.liang.choong@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Thu, Jan 11, 2024 at 06:38:58AM +0000, Gan, Yi Fang wrote:
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

I have no idea why one would think that memory leaks are in some way
related to whether a module can be removed or not. To me at least they
are two separate issues.

I'll continue waiting for the justification...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
