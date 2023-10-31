Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 803917DC91B
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 10:09:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F905C6B44B;
	Tue, 31 Oct 2023 09:09:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01A61C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IMJYz5PL4lee6U7IF6ZC/L+9tCsfFfPvBLsrgdkwPIk=; b=sUZmG/RFEtT5CUSTwWE84dNfmj
 Lu7041AN7U9klqaW8qufPLdh7gVEr/ZttDINRJsQeInEQtiIoabyLVUanZcXffJzzUVd96iQvvYUq
 sj0QBZbpJHd0kFjId7JBvALESJjns77y0mHAIctZa8yWM1gIlVkTRkkdj/KULHoRtV/Y7wYUWhDtO
 xS3ZRlsrjYMja2FXFObosjqMAceNoaU8FvOL044cJnhW8Sfu9b27Q4ab+4hPezKHPAdGf/wrtsVJ0
 gio1oRWo/stVF+v137iItzb57Vav67q3/e+5cFrrFR9LyY/FcJUihQwZdE94xxH+z96kSEzGoXVTx
 1hrCZMxA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44018)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qxkjy-0002V5-1u;
 Tue, 31 Oct 2023 09:08:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qxkjx-0004yS-7I; Tue, 31 Oct 2023 09:08:49 +0000
Date: Tue, 31 Oct 2023 09:08:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <ZUDEIZwKMl88hGcX@shell.armlinux.org.uk>
References: <20231027065054.3808352-1-yi.fang.gan@intel.com>
 <ZTtpBCZuB+bjVt9D@shell.armlinux.org.uk>
 <DM6PR11MB3306A3162F6A6086A4CBA049B9A0A@DM6PR11MB3306.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3306A3162F6A6086A4CBA049B9A0A@DM6PR11MB3306.namprd11.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Ahmad Tarmizi, Noor Azura" <noor.azura.ahmad.tarmizi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "Looi, Hong Aun" <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add check for
 advertising linkmode request for set-eee
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

On Tue, Oct 31, 2023 at 08:44:23AM +0000, Gan, Yi Fang wrote:
> Hi Russell King,
> 
> > Why should this functionality be specific to stmmac?
> This functionality is not specific to stmmac but other drivers can have their
>  own implementation. 
> (e.g. https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/qlogic/qede/qede_ethtool.c#L1855)

This is probably wrong (see below.)

> 
> > Why do we need this?
> Current implementation will not take any effect if user enters unsupported value but user might
> not aware. With this, an error will be prompted if unsupported value is given.

Why can't the user read back what settings were actually set like the
other ethtool APIs? This is how ETHTOOL_GLINKSETTINGS works.

> > What is wrong with the checking and masking that phylib is doing?
> Nothing wrong with the phylib but there is no error return back to ethtool commands 
> if unsupported value is given.

Maybe because that is the correct implementation?

> > Why should we trust the value in edata->supported provided by the user?
> The edata->supported is getting from the current setting and the value is set upon bootup.
> Users are not allowed to change it.

"not allowed" but there is nothing that prevents it. So an easy way to
bypass your check is:

	struct ethtool_eee eeecmd;

	eeecmd.cmd = ETHTOOL_GEEE;
	send_ioctl(..., &eeecmd);

	eeecmd.cmd = ETHTOOL_SEEE;
	eeecmd.supported = ~0;
	eeecmd.advertised = ~0;
	error = send_ioctl(..., &eeecmd);

and that won't return any error. So your check is weak at best, and
relies upon the user doing the right thing.

> > Sorry, but no. I see no reason that this should be done, especially not in the stmmac driver.
> I understand your reasoning. From your point of view, is this kind of error message/ error handling 
> not needed?

It is not - ethtool APIs don't return errors if the advertise mask is
larger than the supported mask - they merely limit to what is supported
and set that. When subsequently querying the settings, they return what
is actually set (so the advertise mask will always be a subset of the
supported mask at that point.)

So, if in userspace you really want to know if some modes were dropped,
then you have to do a set-get-check sequence.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
