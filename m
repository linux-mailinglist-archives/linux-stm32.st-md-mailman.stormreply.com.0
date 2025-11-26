Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DFC89962
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 12:46:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBEA2C58D7A;
	Wed, 26 Nov 2025 11:46:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A772C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=idZH2h/5MOn2BpvO2NsaMW9MH0PQn/xXe34joZcJV90=; b=k+oI7hx2JT1gTwNlxw/iufN1GT
 7bt0/SdgGFl5jlQEdkfaSucsJojlmITuzJwAn229N3JVCTWmhCnMfSZPeeh/ccu5uC9qEEcc8MXLp
 7FjQvYmR5gJQeJ6crmXSOMbMcKuRcuOqXqnhiQffmCeEYUsdeRF8AKlMEbUZyWpx1NWudpsImv9yg
 USevgdzZANgGK9MVBYLJwilcW/iTX37QoMpWvidMCi2rIsFEcIp1cM+9I1zcRGjMVf4VbaCr+J9MN
 eBrKYxh2q/KGiFxSfEE6/fKErhEuNP/VqFGrhyMpjesHyJH9K8omSJQozflB7ZRiHIbtn8SR7lHUP
 31XfM12w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41852)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vODyj-000000003vq-3gDf;
 Wed, 26 Nov 2025 11:46:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vODye-000000001gr-06HK; Wed, 26 Nov 2025 11:46:28 +0000
Date: Wed, 26 Nov 2025 11:46:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <aSbok34XaG1DrlKp@shell.armlinux.org.uk>
References: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
Cc: Furong Xu <0x1207@gmail.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Piotr Raczynski <piotr.raczynski@intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix rx limit check
 in stmmac_rx_zc()
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

On Wed, Nov 26, 2025 at 10:43:27AM +0000, Alexey Kodanev wrote:
> The extra "count >= limit" check in stmmac_rx_zc() is redundant and
> has no effect because the value of "count" doesn't change after the
> while condition at this point.
> 
> However, it can change after "read_again:" label:
> 
>         while (count < limit) {
>             ...
> 
>             if (count >= limit)
>                 break;
>     read_again:
>             ...
>             /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
>             if (likely(status & rx_not_ls)) {
>                 xsk_buff_free(buf->xdp);
>                 buf->xdp = NULL;
>                 dirty++;
>                 count++;
>                 goto read_again;
>             }
>             ...
> 
> This patch addresses the same issue previously resolved in stmmac_rx()
> by commit fa02de9e7588 ("net: stmmac: fix rx budget limit check").
> The fix is the same: move the check after the label to ensure that it
> bounds the goto loop.
> 
> Detected using the static analysis tool - Svace.
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
> 
> After creating the patch, I also found the previous attempt to fix this issue
> from 2023, but I'm not sure what went wrong or why it wasn't applied:
> https://lore.kernel.org/netdev/ZBRd2HyZdz52eXyz@nimitz/

It was because:

https://lore.kernel.org/netdev/871qli0wap.fsf@henneberg-systemdesign.com/

indicated that the author was going to do further work on the patchset,
so the patch submission was marked as "Changes Requested":

https://patchwork.kernel.org/project/netdevbpf/list/?series=730639&state=*

My guess is the author never came back with any patches.

netdev is based on patchwork, which means once a patch series has been
marked in such a way that it isn't going to be applied, it won't get
looked at again, and it's up to the author to resubmit. If the author
doesn't resubmit, no action will happens, especially for a driver such
as stmmac which doesn't have a maintainer.

I think this is a safe change.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
