Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0058D187E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 12:24:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84201C6B47E;
	Tue, 28 May 2024 10:24:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECE55CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O36LPsodbr+2D1LuW6n/mh2TD3fN2BTOqCrbAVe7KjQ=; b=gDfb6/LalxU55OpMYkI7ZZw5PA
 pa6zDAdGyYDPpF4jr1O93jiILKaH6JB0fDzzYMMKoUz2JDGWJHsTVelvgnDjpcIhYRnFaQTHR0lrC
 9YEaI3enubY6Aerfr5oFRqqGQZXkQAbjDJ2iirS1PX1GstNNEq4n6jF1q/KisjnxOw77yYlvXNSA+
 I/nwWk+1JIT4hDHfREMujDorQqroyelNkYEtFLFzs86KcCPmBdetpOBeigq3A3AbtDU6jDmRSwO5z
 +pjV1gqtMRhzuN/VKM1XN0QuKCtwU6+w8dig8X9OR9EG43+NDArukdzLifVQr8okHRnXuAo5V1f8L
 snrqv0Rw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33096)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sBu0L-0004cr-1n;
 Tue, 28 May 2024 11:24:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sBu0M-0003BW-RI; Tue, 28 May 2024 11:24:30 +0100
Date: Tue, 28 May 2024 11:24:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZlWw3hJdOARzdl2S@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524210304.9164-1-fancer.lancer@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/3] net: stmmac: Prevent
	RGSMIIIS IRQs flood
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

On Sat, May 25, 2024 at 12:02:57AM +0300, Serge Semin wrote:
> Without reading the GMAC_RGSMIIIS/MAC_PHYIF_Control_Status the IRQ line
> won't be de-asserted causing interrupt handler executed over and over. As
> a quick-fix let's just dummy-read the CSR for now.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

I think it would make sense to merge these into the patches that do the
conversion to avoid a git bisect hitting on a patch that causes an
interrupt storm. Any objection?

(I'm now converting these two in separate patches, so would need to
split this patch...)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
