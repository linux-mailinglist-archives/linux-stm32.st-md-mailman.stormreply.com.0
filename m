Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4088B5245D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 01:02:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0B52C32EB0;
	Wed, 10 Sep 2025 23:02:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8334C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XfBP9bG2tl0NXE5ziSY+fRi8/aEFKp1uutR7MpEd4G0=; b=ehZy0YEK3SoZWMNLnS8hKW++R6
 pi9lEWn+q4alBozXX1FaURdClBIU4Z5Ux1mM46qU7Q+NYXL5Pj+sl0js1xL/1xetnjETmOEYWD/Qf
 qodDqbNGiam30JDn0x1DQu2TwRw+I9IKEfiIKyRHGjHYxiu6TEjJkch4izOOutaDK6F768vBcrBjz
 yK88UxY5COOJzzRn/yty70Dmj2AEHm469DSqzf5nDtUAh9/R6XDv6vF0ITiNv8+zXSebv/nhZnUan
 I5xsrDBuQxLw/zChwYSGWrbK7fLtYxo6bpFvE8h48p9mNX4RfK1tlpIqZgBm7wRRKrKx4/4ZNOJ5B
 C7KeTHFw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56228)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uwTpC-000000002E4-1Vz1;
 Thu, 11 Sep 2025 00:02:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uwTp7-000000001lV-0Zix; Thu, 11 Sep 2025 00:01:57 +0100
Date: Thu, 11 Sep 2025 00:01:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aMIDZE0mLHAa5pdr@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
 <E1uw1Vk-00000004MCX-38Zs@rmk-PC.armlinux.org.uk>
 <94e20b19-eb89-43c1-9a7c-3a529c60be8b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94e20b19-eb89-43c1-9a7c-3a529c60be8b@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: rename
 stmmac_init_ptp()
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

On Wed, Sep 10, 2025 at 04:42:18PM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 9/9/25 18:48, Russell King (Oracle) wrote:
> > In preparation to cleaning up the (re-)initialisation of timestamping,
> > rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
> > which better reflects its functionality.
> > 
> 
> I agree it's mostly about time stamping but if the ptp_clk_freq_config()
> ops is implemented, then it's not only about timestamping. Wasn't it
> fine as is?

No, if you look at the history, various bits of PTP initialisation
have had to be moved out of stmmac_init_ptp() due to various problems,
and this includes initialisation of the TAI timekeeping block block
(or what we call ptp_clock in the kernel.) It's become less about
initialising the entire PTP subsystem, more about just the time-
stamping part.

So, the rename is justified, even though there's still bits in there
that need to be re-architected.

However, continuing to call it "init_ptp" when it doesn't initialise
all of PTP, especially as the patches after this adds another function
that _does_ to the full initialisation just doesn't make sense - in
fact, it becomes down-right confusing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
