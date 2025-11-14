Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE40C5C764
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 11:09:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C0F3C628D4;
	Fri, 14 Nov 2025 10:09:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4BFEC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 10:09:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7487843EF8;
 Fri, 14 Nov 2025 10:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0E2C4CEF8;
 Fri, 14 Nov 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763114984;
 bh=3FPisBOj9ak9xPE4SRE6FfLYTzBMXBsTCrX3XBItwsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAH3EZ89a4elLYpbNHW8qvo2f6IxnT+9vSDLnBIzISDEtTbgFR6RfLxV/HqIwtjrJ
 0b1wt4Gezo3lqYZgOJcHiWo1ow/pVPe+xx5r9Uo1XNuhJOf4wVObbRJodU4j7FeJd9
 q6uXtcaDGCEMoHazQ8enQKc2//ot+OApLd2z5n/BLVoAinejtYeALxPEFjdhcrCnbO
 K5pd7GmCAbYPH+PfMNW4q1mgdcIh5YZzbyGa2PgevNCYwZECQsajWcl1gBOICKeLZQ
 aNH63QF0rClbWlrfFDyKdwM6Fr7JGpShEwEVFygr78BGU0B6PaJGyjtfP1leUudVd4
 Hx9qeKgz8COCQ==
Date: Fri, 14 Nov 2025 10:09:39 +0000
From: Simon Horman <horms@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <aRb_42Er4k9tMGZO@horms.kernel.org>
References: <20251111093000.58094-1-ovidiu.panait.rb@renesas.com>
 <20251111093000.58094-2-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111093000.58094-2-ovidiu.panait.rb@renesas.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Fix VLAN 0
 deletion in vlan_del_hw_rx_fltr()
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

On Tue, Nov 11, 2025 at 09:29:59AM +0000, Ovidiu Panait wrote:
> When the "rx-vlan-filter" feature is enabled on a network device, the 8021q
> module automatically adds a VLAN 0 hardware filter when the device is
> brought administratively up.
> 
> For stmmac, this causes vlan_add_hw_rx_fltr() to create a new entry for
> VID 0 in the mac_device_info->vlan_filter array, in the following format:
> 
>     VLAN_TAG_DATA_ETV | VLAN_TAG_DATA_VEN | vid
> 
> Here, VLAN_TAG_DATA_VEN indicates that the hardware filter is enabled for
> that VID.
> 
> However, on the delete path, vlan_del_hw_rx_fltr() searches the vlan_filter
> array by VID only, without verifying whether a VLAN entry is enabled. As a
> result, when the 8021q module attempts to remove VLAN 0, the function may
> mistakenly match a zero-initialized slot rather than the actual VLAN 0
> entry, causing incorrect deletions and leaving stale entries in the
> hardware table.
> 
> Fix this by verifying that the VLAN entry's enable bit (VLAN_TAG_DATA_VEN)
> is set before matching and deleting by VID. This ensures only active VLAN
> entries are removed and avoids leaving stale entries in the VLAN filter
> table, particularly for VLAN ID 0.
> 
> Fixes: ed64639bc1e08 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
