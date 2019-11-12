Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA294F936A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2019 15:56:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76E77C36B0B;
	Tue, 12 Nov 2019 14:56:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD9ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CC6CDOjq53lam0n3yDiGEmY1dG4I1rOGEfq4W7Fmwjw=; b=Ah4mAq6xeMy0RJp4jo/JkpuRf
 8hfsp1qtuvNn+wWx+lc6z+YAcUxqHvrqbqBkYnd0Vhpffd5Ooy3oI9PmOFUFwAMf2MCZ0E8bkKWVy
 qnql9BefveI2ESRbHqnV5FTIPK5//sb8dTaZDdyOdrr2NweIC/cfBF3c3k4NmRMVy3Yh4TaQmWYU3
 PcyMMv5qmWCXrjX9FkzlbLHIkSXCfMGRlPEsfq7/069xjqRVs79HJXIZ596SjfcGMgnFloIR3WDZQ
 N4FzaSiG2ev1S5TbOdBMSyg6WDvC7yDskKCTdHP02N6XRAFDBqw3fl9IQGZXvOsHaZn/7Inls3ms/
 A7jqS2qhg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38692)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iUXaC-0006Gb-1Q; Tue, 12 Nov 2019 14:55:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iUXa1-0001Td-TE; Tue, 12 Nov 2019 14:55:41 +0000
Date: Tue, 12 Nov 2019 14:55:41 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20191112145541.GK25745@shell.armlinux.org.uk>
References: <20191112120625.20173-1-benjamin.gaignard@st.com>
 <alpine.DEB.2.21.1911121547490.1833@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911121547490.1833@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gregkh@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] arm: kernel: initialize broadcast hrtimer
 based clock event device
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

On Tue, Nov 12, 2019 at 03:48:10PM +0100, Thomas Gleixner wrote:
> On Tue, 12 Nov 2019, Benjamin Gaignard wrote:
> 
> > On platforms implementing CPU power management, the CPUidle subsystem
> > can allow CPUs to enter idle states where local timers logic is lost on power
> > down. To keep the software timers functional the kernel relies on an
> > always-on broadcast timer to be present in the platform to relay the
> > interrupt signalling the timer expiries.
> > 
> > For platforms implementing CPU core gating that do not implement an always-on
> > HW timer or implement it in a broken way, this patch adds code to initialize
> > the kernel hrtimer based clock event device upon boot (which can be chosen as
> > tick broadcast device by the kernel).
> > It relies on a dynamically chosen CPU to be always powered-up. This CPU then
> > relays the timer interrupt to CPUs in deep-idle states through its HW local
> > timer device.
> > 
> > Having a CPU always-on has implications on power management platform
> > capabilities and makes CPUidle suboptimal, since at least a CPU is kept
> > always in a shallow idle state by the kernel to relay timer interrupts,
> > but at least leaves the kernel with a functional system with some working
> > power management capabilities.
> > 
> > The hrtimer based clock event device is unconditionally registered, but
> > has the lowest possible rating such that any broadcast-capable HW clock
> > event device present will be chosen in preference as the tick broadcast
> > device.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks.  Benjamin, please put it in the patch system, thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
