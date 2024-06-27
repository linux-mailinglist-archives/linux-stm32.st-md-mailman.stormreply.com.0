Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB9919BA0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 02:15:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F63C6DD9F;
	Thu, 27 Jun 2024 00:15:14 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20042C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 00:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ggjfhvPJJwWye9h4/ZgqoG3NghwCXPnWkxN0KYeXeWg=; b=CmIexwDUID5YCYFoDDX84Ean0h
 JVAehrX0J1l4PzAy8Zrkq+yawMLvUQZfhOmhfxW91bSoFzLuXMR+fmmMMeHYv6Sqoi+Pj17rOhKgk
 uf1cLBXnzf+jWWdVQY5pVAGPt3AXtXkVsSES8MdO9S0E0dV0zuJU8z1jrAN0KhjBCCy8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMcmr-0015jx-Bu; Thu, 27 Jun 2024 02:14:53 +0200
Date: Thu, 27 Jun 2024 02:14:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
 <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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

On Wed, Jun 26, 2024 at 04:38:34PM -0700, Sagar Cheluvegowda wrote:
> 
> 
> On 6/26/2024 7:54 AM, Andrew Halaney wrote:
> > On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
> >> Add interconnect support to vote for bus bandwidth based
> >> on the current speed of the driver.This change adds support
> >> for two different paths - one from ethernet to DDR and the
> >> other from Apps to ethernet.
> > 
> > "APPS" is a qualcomm term, since you're trying to go the generic route
> > here maybe just say CPU to ethernet?
> > 
> I can update this in my next patch.
> 
> Sagar

Please trim emails when replying to just the needed context.

Also, i asked what Apps meant in response to an earlier version of
this patch. I think you ignored me....

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
