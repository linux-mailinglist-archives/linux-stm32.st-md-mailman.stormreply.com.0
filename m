Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F053A3A14E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 16:33:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CD07C78F95;
	Tue, 18 Feb 2025 15:33:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47AADC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+SR6bZ23Iqbr9gYinpkbLkkCfOXGYiitlLTZ/pTqB2k=; b=2bQybeC3IMlugSflIXxflyUFQz
 ovuJU1pjz1QG/81pSg5ugxg5hB52YnTM9JviZUPcxWW+02PWxwtJG/2R39OAWS84C02ERiduOm2v/
 WnAjHF/KStEfYdvt4Uiq2cMlCCWvGzA7invLn7XTZUaqt6YqNpW6HooEoKkh5YgbQCgA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tkPbD-00FKur-Pa; Tue, 18 Feb 2025 16:33:27 +0100
Date: Tue, 18 Feb 2025 16:33:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <69d1b0fe-d35f-4242-bf80-6c024cf72dd1@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
 <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
 <011901db80fb$8e968f60$abc3ae20$@samsung.com>
 <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
 <015601db81b8$ee7237f0$cb56a7d0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <015601db81b8$ee7237f0$cb56a7d0$@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
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

> Hi Andrew, 
> Thanks for the clarification.
> Will post v7 with the following updates:
> 
> 1. Changing phy-mode in dt-binding as shown below:
>   phy-mode:
>     enum:
>       - rgmii
>       - rgmii-id
>       - rgmii-rxid
>       - rgmii-txid
> 	  
> 2. Removing phy-mode from .dtsi and example given in dt-binding

The example can use phy-mode, since the example is the combination of
the .dtsi and the .dts parts of the device tree. And having the
example using 'rgmii-id' will hopefully prevent some people wrongly
using 'rgmii'

> 3. Add phy-mode to .dts file and specify 'rgmii-id' there.

Great. History shows if you get the example and the first user
correct, everybody blindly copies it and gets it right by accident. If
the first user is wrong, everybody blindly copies it, and get is wrong
by not sanity checking what they copy.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
