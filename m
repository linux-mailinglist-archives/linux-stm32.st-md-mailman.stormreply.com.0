Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F9A35E6A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 14:10:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74551C78F8C;
	Fri, 14 Feb 2025 13:10:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5EC1C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=WVC5KPxHIUTpQJAWz4Yd0Tr3K7nMkABHyOzsn0Ycnho=; b=GMat5fW/wTe2S9Xc13bsmUgHVp
 BSKW20FGbgUDU2G628ymjJcueeL0WXBX702Wr9IeQ67colXklE/H+g5+B3a8DtXQ8qLrhA1kKa8+I
 l4YYAWTKEKK3W9u0MPt6QyRtnhoSlP2hh5zW85j+tOTIHUJWo29swQCGqLzhfRxLwLi0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tivSH-00E4Ry-UD; Fri, 14 Feb 2025 14:10:05 +0100
Date: Fri, 14 Feb 2025 14:10:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com,
 'Pankaj Dubey' <pankaj.dubey@samsung.com>, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS
 device tree bindings
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

On Fri, Feb 14, 2025 at 10:47:39AM +0530, Swathi K S wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 14 February 2025 05:50
> > To: Swathi K S <swathi.ks@samsung.com>
> > Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> > edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> > robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> > mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> > rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
> > bindings
> > 
> > > +  phy-mode:
> > > +    enum:
> > > +      - rgmii-id
> > 
> > phy-mode is normally a board property, in the .dts file, since the board
> might
> > decide to have extra long clock lines and so want 'rgmii'.
> > 
> > The only reason i can think of putting rgmii-id here is if the MAC only
> > supports 'rgmii-id', it is impossible to make it not add delays.
> > If that is true, a comment would be good.
> 
> 
> Hi Andrew,
> Thanks for reviewing.
> I think we already discussed this part some time back here [1]
> [1] :
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.7
> 0453-2-sriranjani.p@samsung.com/#25879995
> Please do let me know if there is any other concern on this.

We partially discussed this in this thread.

As i said, what value you need here depends on the board design. The
PCB could provide the 2ns delay, in which case, 'rgmii' would be the
correct value to have in the board .dts file. Hence the binding should
not restrict the value of phy-mode to just rgmii-id. All 4 rmgii
values should be accepted.

The only reason you would force only rgmii-id is if the MAC/PHY pair
cannot do anything else. If that really is true, i would expect a
comment in the binding, and the MAC driver to return -EINVAL for
anything but rgmii-id.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
