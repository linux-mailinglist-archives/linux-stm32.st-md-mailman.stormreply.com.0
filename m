Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC392C4670
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 18:07:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A3E4C5662F;
	Wed, 25 Nov 2020 17:07:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E1CFC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OMSN3bVHjMv7vKaV6DqN9uaT7htqeGYHppfGfEgyak4=; b=izvc4kvl+GJKxr/C9b6YCgPhV
 pxPKNfUO8V15Qjyg/0liNvzNU5/Bcjvxyi1WjyNakY8aUvr2jv6xQU3YCCfAQq2GeEQ6W2rY65k7C
 MNavth1EFSDaom2OjMlrEE069IKqKCbK/FzJ3odo5VKuSvNBLtP+vYpK595RET6YnB1KR7PKb/95N
 MAEvqYolGIn3JXYEt8JSkGdAoE+dWLapiyzZrr4US9xr3Lp3XH0in5oIYb9WvKDhtoxzpAFYHdWFa
 O802Mun5Lo+3R20ZX5ek/l0z9B90ZKLERMvsl5v+7oVVDQ5UltSUBnmJ2bkp8zZypV9RsOErIIjus
 6QzTKg5Jw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35984)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1khyGN-0000rp-9v; Wed, 25 Nov 2020 17:07:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1khyGA-00004x-D7; Wed, 25 Nov 2020 17:07:14 +0000
Date: Wed, 25 Nov 2020 17:07:14 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Yonglong Liu <liuyonglong@huawei.com>
Message-ID: <20201125170714.GK1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124230756.887925-1-antonio.borneo@st.com>
 <d62710c3-7813-7506-f209-fcfa65931778@huawei.com>
 <f24476cc-39f0-ea5f-d6af-faad481e3235@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f24476cc-39f0-ea5f-d6af-faad481e3235@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linuxarm@huawei.com, Willy Liu <willy.liu@realtek.com>,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: phy: realtek: read
 actual speed on rtl8211f to detect downshift
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Nov 26, 2020 at 12:57:37AM +0800, Yonglong Liu wrote:
> Hi, Antonio:
> =

> =A0=A0=A0 Could you help to provide a downshift warning message when this=
 happen?
> =

> =A0=A0=A0 It's a little strange that the adv and the lpa support 1000M, b=
ut
> finally the link speed is 100M.

That is an identifying feature of downshift.

Downshift can happen at either end of the link, and since we must not
change the "Advertised link modes" since this is what userspace
configured, if a downshift occurs at the local end, then you will get
the ethtool output you provide, where the speed does not agree with
the reported advertisements.

You should already be getting a warning in the kernel log when this
happens; phy_check_downshift() which is part of the phylib core code
will check this every time the link comes up. You should already
have a message "Downshift occurred ..." in your kernel log. Please
check.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
