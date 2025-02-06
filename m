Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B49A2B592
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 23:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECC9EC78F88;
	Thu,  6 Feb 2025 22:49:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63BB2C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=XOSx2sfWIkI9mBDKykXkoY9x3FYft266g8j9/dZB04w=; b=juRHjv2n+fKYuD6WHRHIhhjvlh
 Vtjwc9Xzmg7ts41hb/43PvfAfwxPd9MLLH/y29BoqJABpBBgu22W//cuSVwMjd2uxaAP2r23YSybs
 v/04cy12RHHAmaMg3Q9oLy6gSYR1UdA3DKKT5UbSKLYry/46OQfOKlvTLQEujH8VaXTA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tgAfS-00Bemr-0z; Thu, 06 Feb 2025 23:48:18 +0100
Date: Thu, 6 Feb 2025 23:48:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dave Hansen <dave.hansen@intel.com>
Message-ID: <9f6f009d-a2c0-4a6c-b9df-4045f767f8ab@lunn.ch>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Mengyuan Lou <mengyuanlou@net-swift.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Borislav Petkov <bp@alien8.de>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] arch: x86: add IPC
 mailbox accessor function and add SoC register access
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

On Thu, Feb 06, 2025 at 08:46:24AM -0800, Dave Hansen wrote:
> On 2/6/25 05:18, Choong Yong Liang wrote:
> > 
> > - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> > - Add support to use IPC command allows host to access SoC registers 
> > through PMC firmware that are otherwise inaccessible to the host due
> > to security policies.
> 
> I'm not quite parsing that second bullet as a complete sentence.
> 
> But that sounds scary! Why is the fact that they are "otherwise
> inaccessible" relevant here?

And i wounder what other interesting things can be accessed in this
indirect manor, which the security policy would not otherwise allow.

Somebody is going to have fun here. Or is already have fun here.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
