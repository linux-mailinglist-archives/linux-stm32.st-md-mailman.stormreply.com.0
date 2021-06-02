Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AF397F10
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 04:28:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664CEC57B74;
	Wed,  2 Jun 2021 02:28:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E08C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 02:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4JoMGfga1VbTByDb+krUTuutqYAcuOdoQ70Y27jTzf8=; b=fJXgFc/GRD6OG68GN6GC7fmcNJ
 sCxWFlYEPPu4yPMgLkS+5YrzUpNY5fCDZ0fhqbHEIo9tjUD3owCdEJNgisENn7quOI6GK7UPcesrt
 1I8Qv271k43/RVjJiIT/byYplg7l0n5DINSoQjQynWPfsSi4PXfnM+ZMOGjUgGwdSuSs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1loGcD-007NlP-ME; Wed, 02 Jun 2021 04:28:17 +0200
Date: Wed, 2 Jun 2021 04:28:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YLbswWVdgGgAKpwo@lunn.ch>
References: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
 <YLawrTO4pkgc6tnb@lunn.ch> <20210601225332.GA28151@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601225332.GA28151@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable platform
 specific safety features
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

On Wed, Jun 02, 2021 at 06:53:32AM +0800, Wong Vee Khee wrote:
> On Wed, Jun 02, 2021 at 12:11:57AM +0200, Andrew Lunn wrote:
> > On Tue, Jun 01, 2021 at 09:52:35PM +0800, Wong Vee Khee wrote:
> > > On Intel platforms, not all safety features are enabled on the hardware.
> > 
> > Is it possible to read a register is determine what safety features
> > have been synthesised?
> >
> 
> No. The value of these registers after reset are 0x0. We need to set it
> manually.

That is not what i asked. Sometimes with IP you synthesise from VHDL
or Verilog, there are registers which describe which features you have
actually enabled/disabled in the synthesis. Maybe the stmmac has such
a register describing which safety features are actually available in
your specific version of the IP? You could go ask your ASIC engineers.
Or maybe Synopsys can say that there are no such registers.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
