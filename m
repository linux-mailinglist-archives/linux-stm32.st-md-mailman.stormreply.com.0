Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EAD2C2B01
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:17:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0345C56630;
	Tue, 24 Nov 2020 15:17:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12BC4C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWfLAcAT1INi74TfOZLY1HvU7v23wTyWejlZ0NL7uwk=; b=w5g4mbPT0BpyAjVykZdZXHzn6
 QmvJI18WaGUcyiQRltuKNgUlTPzHV0v7uzlrCHkF2NXkoQUuJV9JXj2olyS+AWqYoTSr2VMhNUZZJ
 rPgVMStAqj95qDC/EPXE0mmLnWpKR88PK9fmvIbjkBI+3RlG07hqgh3S9q1fbjdvimu5JQRJnjkyZ
 FczBx+28cEHD5eWPgR5lCI0765yLIbaTT8xfxgqEWjhIKfIgBebBrbvyeHI88sOlkvk0+L6xdoqXo
 vQZLi7R/IFmCR3HNdqF1DofGYdPJ/oSd10Xf1nX+W2uOgcbSRu4PtaRASDbSX6Y2plc3ebBKIH9YD
 /cZ2wRB2w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35534)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kha4D-0007s9-UQ; Tue, 24 Nov 2020 15:17:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kha4C-0007Rn-Bj; Tue, 24 Nov 2020 15:17:16 +0000
Date: Tue, 24 Nov 2020 15:17:16 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20201124151716.GG1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <4684304a-37f5-e0cd-91cf-3f86318979c3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4684304a-37f5-e0cd-91cf-3f86318979c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

On Tue, Nov 24, 2020 at 04:03:40PM +0100, Heiner Kallweit wrote:
> Am 24.11.2020 um 15:38 schrieb Antonio Borneo:
> > If the auto-negotiation fails to establish a gigabit link, the phy
> > can try to 'down-shift': it resets the bits in MII_CTRL1000 to
> > stop advertising 1Gbps and retries the negotiation at 100Mbps.
> > 
> I see that Russell answered already. My 2cts:
> 
> Are you sure all PHY's supporting downshift adjust the
> advertisement bits? IIRC an Aquantia PHY I dealt with does not.
> And if a PHY does so I'd consider this problematic:
> Let's say you have a broken cable and the PHY downshifts to
> 100Mbps. If you change the cable then the PHY would still negotiate
> 100Mbps only.

From what I've seen, that is not how downshift works, at least on
the PHYs I've seen.

When the PHY downshifts, it modifies the advertisement registers,
but it also remembers the original value. When the cable is
unplugged, it restores the setting to what was previously set.

It is _far_ from nice, but the fact is that your patch that Antonio
identified has broken previously working support, something that I
brought up when I patched one of the PHY drivers that was broken by
this very same problem by your patch.

That said, _if_ the PHY has a way to read the resolved state rather
than reading the advertisement registers, that is what should be
used (as I said previously) rather than trying to decode the
advertisement registers ourselves. That is normally more reliable
for speed and duplex.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
