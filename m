Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE990B70B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 18:51:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 218B9C6B45B;
	Mon, 17 Jun 2024 16:51:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C509C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 16:51:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E564861365;
 Mon, 17 Jun 2024 16:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35318C2BD10;
 Mon, 17 Jun 2024 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718643107;
 bh=JQ9/ew7gNBZkCvIaaYqgstiKB/4Vesu8cj+i8F8ugsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=js6dk8wqM2vGwMzBeUoVi9zTNzBclB3440OFZMVql27MEzKvs9qPHQ+iFbYjg4RPl
 e6LfgSYfhvTz/ZAASx9i/y+n5osVCeyw3wyX+2V1Bybmxn/iiL2uTEy5IWrMUCin4o
 NFHkjg/Dq2HSuud6miltzRHaXxmuMoQGnzsv6/wj2ODGlySkqlZuR8+GL9qw8oofio
 xc0xNZpCkErpd/26ZwF9hyqUBISr53j5kzktT6RQYO8O6D86cHHXwqCupZMCVRwbgH
 FzsB4/rTrfpP48RKMUaUsOOTHBeB6bUehepbWadDtqo2CErEnNq5ARbmlXF/+auxme
 eFHf/oNq/37Cg==
Date: Mon, 17 Jun 2024 17:51:42 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240617165142.GX8447@kernel.org>
References: <20240615095611.517323-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615095611.517323-1-0x1207@gmail.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Corinna Vinschen <vinschen@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac: Enable TSO on
	VLANs
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

On Sat, Jun 15, 2024 at 05:56:11PM +0800, Furong Xu wrote:
> The TSO engine works well when the frames are not VLAN Tagged.
> But it will produce broken segments when frames are VLAN Tagged.
> 
> The first segment is all good, while the second segment to the
> last segment are broken, they lack of required VLAN tag.
> 
> An example here:
> ========
> // 1st segment of a VLAN Tagged TSO frame, nothing wrong.
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1518: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [.], seq 1:1449
> 
> // 2nd to last segments of a VLAN Tagged TSO frame, VLAN tag is missing.
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 1449:2897
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 2897:4345
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 4345:5793
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [P.], seq 5793:7241
> 
> // normal VLAN Tagged non-TSO frame, nothing wrong.
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1022: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [P.], seq 7241:8193
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 70: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [F.], seq 8193
> ========
> 
> When transmitting VLAN Tagged TSO frames, never insert VLAN tag by HW,
> always insert VLAN tag to SKB payload, then TSO works well on VLANs for
> all MAC cores.
> 
> Tested on DWMAC CORE 5.10a, DWMAC CORE 5.20a and DWXGMAC CORE 3.20a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>   Changes in v4:
>     - Re-arrange variables to keep reverse x-mas tree order.
> 
>   Changes in v3:
>     - Drop packet and increase stats counter when vlan tag insert fails.
> 
>   Changes in v2:
>     - Use __vlan_hwaccel_push_inside() to insert vlan tag to the payload.

Thanks this both seems correct to me and
I believe it addresses the review of earlier revisions.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
