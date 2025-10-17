Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403EBE89EA
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 14:42:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61FFDC5978D;
	Fri, 17 Oct 2025 12:42:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD795C58D74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGyYcC+d3YKTIer3CKrB01eeg5KvZEEyEjcSchgym/I=; b=W/2CuL+hGNToi9Z5Ya9VSH3ZG5
 WXVDOEvDRj1FSTKN61nZaKm5ZqpQcULX9Rlh5dVV1ggi4dYw4MJWDeoC777XmSJTFF599UZfuatXs
 M7bv9lYTfOo3uU+7M0R3YywZwdYEixlTiwaN080t7d22vLUv+nIk9uLoeiv0OIPbFnFVFMgdJDNOl
 /3QSlONY2oqkPNc63j4RAvUFifA2YC/Ey0yBO4X5NksD4hgiFDRXO7gnQb7becUfjqtEduVUI8JhG
 rfwNt9ohYZxv/MEpKWS36L2TfV4KLZlYSUsEZzea4G55cBQW5tD+kqSq8F4vHiLXBCEn32jx1OZgd
 U+bUqVqA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43812)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v9jmi-000000007sy-3bmI;
 Fri, 17 Oct 2025 13:42:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v9jme-000000004Jn-4AHz; Fri, 17 Oct 2025 13:42:13 +0100
Date: Fri, 17 Oct 2025 13:42:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Message-ID: <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: stmmac: vlan: Disable
 802.1AD tag insertion offload
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

On Fri, Oct 17, 2025 at 02:11:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 650d75b73e0b0ecd02d35dd5d6a8742d45188c47..dedaaef3208bfadc105961029f79d0d26c3289d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4089,18 +4089,11 @@ static int stmmac_release(struct net_device *dev)
>  static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
>  			       struct stmmac_tx_queue *tx_q)
>  {
> -	u16 tag = 0x0, inner_tag = 0x0;
> -	u32 inner_type = 0x0;
> +	u16 tag = 0x0;
>  	struct dma_desc *p;

#include <stdnetdevcodeformat.h> - Please maintain reverse christmas-
tree order.

I haven't yet referred to the databook, so there may be more comments
coming next week.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
