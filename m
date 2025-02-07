Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F309A2C3A3
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 14:33:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F6C6C78F8B;
	Fri,  7 Feb 2025 13:33:07 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5796AC78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7B6nKxsZ/sgpbYSbmczXl/HDAlWGMnjUjIEUqDEu3fE=; b=ikZHdtybyl/A4VFw2VkwQGYUTI
 I5VXMO2Dsq9C6j9NPVSnVHI8byHRtV/uaWU/t71xO8V9YWONlWrw4NkA31Qgj7jaXKhYUM+5sSJwd
 EGZH7ss/mH8O6TO7DqY00Yy1HTQRU6CUGICBH3CUAKUQ5s0GbwiSc7s9zIREc3Phv1Fs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tgOT6-00Br1x-S2; Fri, 07 Feb 2025 14:32:28 +0100
Date: Fri, 7 Feb 2025 14:32:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
 <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/7] net: pcs: xpcs:
 re-initiate clause 37 Auto-negotiation
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

> Good point. I cannot find this scenario in the datasheet. Please allow me
> some time to test this scenario. I will update you with the results.

By data sheet, do you mean documentation from Synopsis, or is this an
internal document? Assuming the hardware engineers have not hacked up
the Synopsis IP too much, the Synopsis documentation is probably the
most accurate you have.

> > What about 1000BASE-X when AN is enabled or disabled and then switching
> > to SGMII?
> > 
> According to the datasheet, a soft reset is required.

Do you know if this is specific to Intels integration of the Synopsis
IP, or this is part of the core licensed IP?

We need to understand when we need a quirk because intel did something
odd, or it is part of the licensed IP and should happen for all
devices using the IP.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
