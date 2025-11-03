Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C7C2B212
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 11:47:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C171FC62D2D;
	Mon,  3 Nov 2025 10:47:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2A97C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SfoQUh36QE7h8qt3hF9rnB1Y0l49JXwFNS9QZ6PhD74=; b=ZD7a9bk8YePsQT1gCLHkpemXYH
 jhhr//2fwcanBJEPfFnIzR9Kj5qNOUYwkH/a2hZUUeo9NW1VBzJeZBdCOSQJg1LuxKtAWVpqNl7wU
 aUrLae87cb5hpCzJf7bIRkrKc+vIbuclKrSXn0N4OdXXbNGTDAeg7RjZTptf4kBAyfmHpK22Dwuf6
 SaplTqH3s6g/mBJxCDzqVf5asyAAGEH4ta90oPgzCzczsoOCtn0G9WlKvLC+3cA52CrK9c2KBR9hE
 JNMLsgrK3LBJKihiVC0FBn8OlXBiB36aFp/3i4YCquBgToxfch366UNf5WzynDG+TPyOCB7NTnYvU
 ixOPMqZA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42202)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vFs5z-000000000a9-1PlG;
 Mon, 03 Nov 2025 10:47:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vFs5v-000000003jm-0uly; Mon, 03 Nov 2025 10:47:27 +0000
Date: Mon, 3 Nov 2025 10:47:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <aQiIP0_sQmdwrzu2@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

On Mon, Nov 03, 2025 at 03:48:53PM +0530, Mohd Ayaan Anwar wrote:
> My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
> putting its testing on hold until we sort everything out on QCS9100
> first.
> 
> So, for AQR115C, what should be the way forward? It has support for rate
> matching. For 10M should I remove its .get_rate_matching callback?

Yes, AQR115C has support for rate matching, but it depends how the
firmware is configured. Different firmwares for this PHY default to
different settings for this.

Some operate at a fixed speed on the host interface and do rate
matching. Others don't. The registers in the PHY can be reprogrammed
to change this behaviour and the PHY reset to change the provisioned
firmware's behaviour, but mainline doesn't have that code.

If you enable debugging in drivers/net/phy/aquantia/aquantia_main.c,
then aqr_gen2_read_global_syscfg() will print its configuration for
each speed via:

	"Media speed %d uses host interface %s with %s\n"

messages. Unfortunately, aqr_gen2_get_rate_matching() does not take
account of this configuration, and just assumes they're all the
same (reporting rate adaption for 2500BASE-X and 10GBASE-R interfaces.)

One thing occurs to me is maybe your PHY firmware is provisioned for
rate adaption with the 2500BASE-X interface for 1G and 100M speeds,
but for 10M, it's using SGMII. The above messages will tell us.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
