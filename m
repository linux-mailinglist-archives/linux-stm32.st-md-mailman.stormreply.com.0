Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDFDA8242A
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 14:04:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 003DBC78F98;
	Wed,  9 Apr 2025 12:04:43 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10010C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 12:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=OAVZ/6PMd5CIYGP1LffsV13Ct6MPa7aS43NNYUi9Muc=; b=Do2eW7o21PD63tUeD1m2JPMF3Y
 GA5PJ2TY9XpQdy9chWaHuYljs1HgVw6p5M9TaxjWcsYXPcY68Nmh+BBlqBEFfjV182S1AM0QCVxcE
 Mg97XRoHA317XEdNLGpJRIrwHtQCfQNRRgkRtx6Y8UULja95mNyri9hyyr5XhP3K1DcA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1u2UAX-008X2W-Vg; Wed, 09 Apr 2025 14:04:37 +0200
Date: Wed, 9 Apr 2025 14:04:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Ng, Boon Khai" <boon.khai.ng@altera.com>
Message-ID: <3eb3bb21-eee9-44b6-b680-4c629df29d34@lunn.ch>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-3-boon.khai.ng@altera.com>
 <c65bfe99-a6e1-4485-90ee-aee0b8e0984d@lunn.ch>
 <BN8PR03MB5073B710F5040EAC06595AE2B4B42@BN8PR03MB5073.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR03MB5073B710F5040EAC06595AE2B4B42@BN8PR03MB5073.namprd03.prod.outlook.com>
Cc: "Ang, Tien Sung" <tien.sung.ang@altera.com>,
 Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Russell King <linux@armlinux.org.uk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, "Tham,
 Mun Yew" <mun.yew.tham@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Gerlach, Matthew" <matthew.gerlach@altera.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: dwxgmac2:
 Add support for HW-accelerated VLAN stripping
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

On Wed, Apr 09, 2025 at 03:12:53AM +0000, Ng, Boon Khai wrote:
> > This appears to be identical to dwmac4_wrback_get_rx_vlan_tci() ?
> > 
> > Can it be moved into the shared code, or am i missing something?
> > 
> >         Andrew
> 
> Hi Andrew thanks for the quick response.
> 
> For the dwmac4 IP it has the following format at the 
> Receive Normal Descriptor 0 (RDES0)
> 
>            31                                                                                                0
>               ------------------------------------- -----------------------------------
> RDES0 |   Inner VLAN TAG [31:16]   | Outer VLAN TAG [31:16   |
>               ------------------------------------- -----------------------------------
> 
> While for dwxgmac2 IP it has the following format at the RDES0
> Depending on the Tunneled Frame bit (TNP)
> 
> For Non-Tunneled Frame (TNP=0)
>            31                                                                                                0
>               ------------------------------------- -----------------------------------
> RDES0 |   Inner VLAN TAG [31:16 ]  | Outer VLAN TAG [31:16]   |
>               ------------------------------------- -----------------------------------
> 
> For Tunneled Frame (TNP=1)
>            31                                        8 7                          3 2                  0
>               -------------------------------- ----------------------- ----------------
> RDES0 |   VNID/VSID                    |    Reserved         | OL2L3         |
>               -------------------------------- ----------------------- ----------------
> 
> While the logic for handling Tunneled Frame and Non-Tunneled
> Frame is not yet implemented in the 
> dwxgmac2_wrback_get_rx_vlan_tci() function, I believe it is
> prudent to maintain separate functions within their respective
> descriptor driver files, (dwxgmac2_descs.c and dwmac4_descs.c)

Please add a comment, or describe this in the commit message.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
