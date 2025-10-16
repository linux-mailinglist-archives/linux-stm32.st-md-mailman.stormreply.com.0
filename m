Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01552BE23AC
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 10:53:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57797C57A43;
	Thu, 16 Oct 2025 08:53:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D479AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGaGxMpVNgSqeQ9n2WyrmVjFRKdNFeYqvaUsm2e9gZw=; b=OL5a+pi/A12eJjtMu+Zl+xG+6b
 uwur0eUa7WIZGxalvgkrU+0CYfHE0zFYEV6HEsuUYO1qD48/NEPqCt29fRRdXbmjXnZQNHzn3/zcm
 VWfZtq/EEO+YOxhfIZZEQbR4/MtO1yMmVSDLfiveFUIlq+PrwACRDgA91/Y6zoF4wQJG2PbxGsFq9
 8R9HUQGN1i7joMrJXfzirY1Apw5O2q/iRtOHFGdTYjqYza0vrccSNiNq3dnlCYLWvz+D5iAMlcrbP
 7DeQuDkhZCvxu7TCdO5Q6lZFcndkcwuomyJmWnemd21nFunshOu92PgemoDsQwRlDIbSaCpR+qhB3
 hJSYpmag==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56192)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v9JjZ-0000000061L-2CVx;
 Thu, 16 Oct 2025 09:53:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v9JjU-0000000038g-252V; Thu, 16 Oct 2025 09:53:12 +0100
Date: Thu, 16 Oct 2025 09:53:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <aPCyeCOMX7FHnZkY@shell.armlinux.org.uk>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
 <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: ethtool: tsconfig:
 Re-configure hwtstamp upon provider change
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

On Wed, Oct 15, 2025 at 02:45:26PM +0200, Kory Maincent wrote:
> On Wed, 15 Oct 2025 12:27:23 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > When a hwprov timestamping source is changed, but without updating the
> > timestamping parameters, we may want to reconfigure the timestamping
> > source to enable the new provider.
> > 
> > This is especially important if the same HW unit implements 2 providers,
> > a precise and an approx one. In this case, we need to make sure we call
> > the hwtstamp_set operation for the newly selected provider.
> 
> This is a design choice.
> Do we want to preserve the hwtstamp config if only the hwtstamp source is
> changed from ethtool?

This depends what is meant by "preserve". If the hwtstamp capabilities
of the two sources being switched between are the same in terms of how
userspace configures them, then it's fine.

However, it's my understanding that the hwtstamp configuration is a
negotiation between kernel and userspace - drivers are required to
return back to userspace what they're actually doing when userspace
requests a certain configuration. If the hwtstamp capabilities are
different, it breaks this model because what the previous instance
reports back to userspace for a certain configuration could be
different to that which the new instance would report back.

This could get worse when a configuration is set on the previous
instance that isn't supported by the new instance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
