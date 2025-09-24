Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0BDB9C718
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 01:05:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F40FC3F938;
	Wed, 24 Sep 2025 23:05:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06170C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:05:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 91D71415F2;
 Wed, 24 Sep 2025 23:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB16C4CEE7;
 Wed, 24 Sep 2025 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758755137;
 bh=5nkOcXtCrUSyUylrHVFJ3GThi+rvDI6+s49nr6gVhIE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o2B+AppW01bYd+MqBDecD+SP/V9GbfDTxn/PBf73IXN0zz71y/75bOrFOH1ffL15l
 USGG9YEhz/ZHlUOgLnforvbQS70LJIVGswy1eM+35tuLEoraYhcsC4TOMRB/nDPuP9
 UADMv215SbIq3RyGg+xQmp5dQE3fV9nuKNwp0YJI2/OLnxu07gQV3lZez3r72J2WPx
 HSVgGio6T3k726XlmEkC3RNro04vRJDTrStw/cz/LJD4R/4yLir25W9T8CwRkGhQtw
 zFjHFI+2VjPlHvpJveCKeZrMfZC6ylNEHRf2mC9dv1I/l9MGMjgTl68qnLo78IAmRP
 QtvXZM8V6kR2g==
Date: Wed, 24 Sep 2025 16:05:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250924160535.12c14ae9@kernel.org>
In-Reply-To: <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org>
 <20250917155412.7b2af4f1@kernel.org>
 <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

On Wed, 24 Sep 2025 10:24:44 +0530 G Thomas, Rohan wrote:
> >> Is the device adding the same VLAN tag twice if the proto is 8021AD?
> >> It looks like it from the code, but how every strange..
> >>
> >> In any case, it doesn't look like the driver is doing anything with
> >> the NETIF_F_HW_VLAN_* flags right? stmmac_vlan_insert() works purely
> >> off of vlan proto. So I think we should do the same thing here?  
> > 
> > I suppose the double tagging depends on the exact SKU but first check
> > looks unnecessary. Maybe stmmac_vlan_insert() should return the number
> > of vlans it decided to insert?
> >   
> 
> I overlooked the behavior of stmmac_vlan_insert(). It seems the hardware
> supports inserting only one VLAN tag at a time, with the default setting
> being SVLAN for 802.1AD and CVLAN for 802.1Q. I'll update the patch to
> simply add VLAN_HLEN when stmmac_vlan_insert() returns true. Please let
> me know if you have any further concerns.

SG, no further concerns.

Please make sure to CC "Ng, Boon Khai" <boon.khai.ng@altera.com>
who wrote the VLAN support (IIRC).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
