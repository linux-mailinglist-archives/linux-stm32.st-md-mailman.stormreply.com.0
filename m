Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21244A031CB
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 22:05:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD60DC78011;
	Mon,  6 Jan 2025 21:05:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CC26C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=eDDQkkpqbkCsGa2J3B58yILeZtgFMY6XLVrsYIvsNhA=; b=CPs858+YJWwWF23l1a8Ms63Hb7
 20deuNmLXH9hjPK5Inbeta9Y47I3UZgaj5N4/mflqEagCOk7V7LpPfPEBjnNxf98bOWtMP9lTpMlG
 ZTsIgS3YVHRro27D03qsmYiwsZtIj/BUdQeuSKu6+yliFHuHo6UGxfUNz2OPnxyjQduU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tUuIC-001zXE-Br; Mon, 06 Jan 2025 22:05:44 +0100
Date: Mon, 6 Jan 2025 22:05:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <6f0b5132-9695-4da6-ae87-1e0757253c07@lunn.ch>
References: <20250106062845.3943846-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106062845.3943846-1-0x1207@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Unexport
 stmmac_rx_offset() from stmmac.h
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

> +static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
> +{
> +	if (stmmac_xdp_is_enabled(priv))
> +		return XDP_PACKET_HEADROOM;
> +
> +	return 0;
> +}

Please drop the inline keyword. You don't need it in a .c file, it is
better to let the compiler to decide.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
