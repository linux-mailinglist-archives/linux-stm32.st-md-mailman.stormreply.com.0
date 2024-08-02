Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74340946604
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 00:59:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21FA0C7129D;
	Fri,  2 Aug 2024 22:59:47 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7235FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 22:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2ftwNXrX2dXrmGqkEavOurs8H08rzbSsBllQvHtYN8g=; b=vIRi5f6uKAKKULYcDhEb5UInie
 wLV84cuk1HZzx3x3Ki+PYtPU97tQ5ICrCQUZ1KLD8vF4W+1mk1vLpaVJQXJVxyxO7B1nIt/6zZaOf
 2m2md9BZ8E+6Rz4rrVsB5suqs+Ahy0aHlf9rfD5FcDjFHQJpWkLpgKt7vTjtcCVSiuM0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sa1F8-003tiM-KT; Sat, 03 Aug 2024 00:59:26 +0200
Date: Sat, 3 Aug 2024 00:59:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jitendra.vegiraju@broadcom.com
Message-ID: <1e6e6eaa-3fd3-4820-bc1d-b1c722610e2f@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

> +	user_ver = stmmac_get_user_version(priv, GMAC4_VERSION);
> +	if (priv->synopsys_id == DWXGMAC_CORE_4_00 &&
> +	    user_ver == DWXGMAC_USER_VER_X22)
> +		mac->dma = &dwxgmac400_dma_ops;

I know nothing about this hardware....

Does priv->synopsys_id == DWXGMAC_CORE_4_0 not imply
dwxgmac400_dma_ops?

Could a user synthesise DWXGMAC_CORE_4_00 without using
dwxgmac400_dma_ops? Could dwxgmac500_dma_ops or dwxgmac100_dma_ops be
used?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
