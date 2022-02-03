Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DEB4AC634
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:44:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F34FAC60465;
	Mon,  7 Feb 2022 16:44:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FBA6C5F1EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jThIhFNBrb3xj2YQLkczkGqkTy9wIvQP7gVhgnzkrew=; b=zGqOR7+LqSrG510WGhf1Ch1m+Q
 zInXDUP+4zUsUrFPitgFSW+BwbHex8XmIlJT7thj0wp4BGrUyfHA+/mkPSu8CAYR2a8B7LsJpIVbA
 N5gpuO+O7H3tPq8CUi8kGBhgqdRTkcgxmXICWE+dL+up2T1R+KeuuXYuzT7Gp4Cuf1mw3+s6E46yj
 lg6bKHZlj4VFjSRnTYgs2sGXT/CoQbquXe3QK9Wwygp0lxg2M8kzhI/PcsZALiYg8Eqq511/Xxd+m
 yInasAcEDOvhjUF3etd1bOFnYK37Zl3SlsnaKMYrH5FZyOWqqY69AUQdLoYSsrGcGv+5TW1HIoyo+
 JgXhnVbQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57016)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nFfDf-0002s5-AV; Thu, 03 Feb 2022 16:44:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nFfDc-00049q-6H; Thu, 03 Feb 2022 16:44:24 +0000
Date: Thu, 3 Feb 2022 16:44:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yannick Vignon <yannick.vignon@oss.nxp.com>
Message-ID: <YfwGaD06/3W1UFQ+@shell.armlinux.org.uk>
References: <20220203160025.750632-1-yannick.vignon@oss.nxp.com>
 <YfwCnV2TV8fznZ33@shell.armlinux.org.uk>
 <13dc6f72-8ef4-6990-1c67-2b92c6894e87@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13dc6f72-8ef4-6990-1c67-2b92c6894e87@oss.nxp.com>
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>, linux-kernel@vger.kernel.org,
 Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>, mingkai.hu@nxp.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, sebastien.laveze@oss.nxp.com,
 Jose Abreu <joabreu@synopsys.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: ensure PTP time register
 reads are consistent
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

On Thu, Feb 03, 2022 at 05:38:10PM +0100, Yannick Vignon wrote:
> On 2/3/2022 5:28 PM, Russell King (Oracle) wrote:
> > On Thu, Feb 03, 2022 at 05:00:25PM +0100, Yannick Vignon wrote:
> > > From: Yannick Vignon <yannick.vignon@nxp.com>
> > > 
> > > Even if protected from preemption and interrupts, a small time window
> > > remains when the 2 register reads could return inconsistent values,
> > > each time the "seconds" register changes. This could lead to an about
> > > 1-second error in the reported time.
> > 
> > Have you checked whether the hardware protects against this (i.o.w. the
> > hardware latches the PTP_STSR value when PTP_STNSR is read, or vice
> > versa? Several PTP devices I've looked at do this to allow consistent
> > reading.
> > 
> 
> It doesn't. I was able to observe inconsistent values doing reads in either
> order, and we had already observed the issue with that same IP on another
> device (Cortex-M based, not running Linux). It's not easy to reproduce, the
> time window is small, but it's there.

Okay, thanks.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
