Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D84BF6A0703
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 12:06:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88333C6A5F8;
	Thu, 23 Feb 2023 11:06:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD6A1C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UrlychQoRbSfgh80gi+2XZK8/268XFVHwKj39NwBSs8=; b=xUa9rmvZLYJ2m3P6qnhKpcwW2L
 6pE/p2VJDZW6BPcpyR8NPTO0wmUSIn5YbLDMPxJyzxyRO9zjIPipXyq+Z/3QrRUXJ0+Ae1jaylVrE
 mr/d/pwzRleSFeSq31MvfYGSQH+WtM1SpxCgxHXRTPm2T6lpxnGQBFPaoW8Id/0fUZsu32dMETN1O
 aWHSqvnh6KuveNx54cZMYS+0AwTylcOt6Gb/rlVcqaDOJFUygwR9ur+kOIS4Ozi0t/BHq7jU7PTjP
 pAMqVb747gtccCfKrhftWyYu3qVNTzJXBh8Y2v4dchdG6SIODvLYrwJidZraOhfFpiR/n/cOBWNvq
 7OxI7dhg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45996)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pV9QT-0007wk-5f; Thu, 23 Feb 2023 11:06:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pV9QO-00047N-G4; Thu, 23 Feb 2023 11:06:08 +0000
Date: Thu, 23 Feb 2023 11:06:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Clark Wang <xiaoning.wang@nxp.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Message-ID: <Y/dIoAqWfazh9k6F@shell.armlinux.org.uk>
References: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
 <83a8fb89ac7a69d08c9ea1422dade301dcc87297.camel@redhat.com>
 <Y/c+MQtgtKFDjEZF@shell.armlinux.org.uk>
 <HE1PR0402MB2939A09FD54E72C80C19A467F3AB9@HE1PR0402MB2939.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB2939A09FD54E72C80C19A467F3AB9@HE1PR0402MB2939.eurprd04.prod.outlook.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH V3 1/2] net: phylink: add a function to
 resume phy alone to fix resume issue with WoL enabled
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Feb 23, 2023 at 10:27:06AM +0000, Clark Wang wrote:
> Hi Russel,
> =

> I have sent the V4 patch set yesterday.
> You can check it from: https://lore.kernel.org/linux-arm-kernel/202302220=
92636.1984847-2-xiaoning.wang@nxp.com/T/
> =


Ah yes, sent while net-next is closed.

Have you had any contact with Cl=E9ment L=E9ger ? If not, please can you
reach out to Cl=E9ment, because he has virtually the same problem. I
don't want to end up with a load of different fixes in the mainline
kernel for the same "we need the PHY clock enabled on stmmac" problem
from different people.

Please try to come up with one patch set between you both to fix this.

(effectively, that's a temporary NAK on your series.)

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
