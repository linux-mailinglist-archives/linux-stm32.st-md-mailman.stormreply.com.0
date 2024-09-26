Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46291987914
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 20:23:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2647C78002;
	Thu, 26 Sep 2024 18:23:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 451D3C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Xyxq1hzO7uPxbClYISo8yIzxqOiUVL2N8zCxWxmwYmk=; b=KIQv53zqR76AnG7/XgXxwA6gAR
 Ka9x8fFapRY9dNxso8ODjLZPmuQjTos01ZAN8ukm47V0V4o/HRV8EXRhH3523KP0MaRyhDQ/4L4Qt
 XFk4kUp3tkHq/lr7L2TAC1gBfbYTwMUzYUEqGDVt67NVXHJttIOdayxCXD4xQDKMhoaM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1stt8y-008P2y-EE; Thu, 26 Sep 2024 20:23:12 +0200
Date: Thu, 26 Sep 2024 20:23:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Add the dwmac driver support for
	T-HEAD TH1520 SoC
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

> Regarding rx and tx internal delays, that same section in the manual
> doesn't specify what unit is represented by the delay_ctrl bit field in
> GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
> a max value of 31 seems too small to represent picoseconds. The vendor
> kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
> doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
> rx and tx delay properties so that is what I've now done in this series.
> Note: the hardware default value of 0 for delay_ctrl works okay for the
> TH1520 hardware that I have.

I assume you are talking about RGMII delays here?

Do you have a board which needs to set these delays? In general, linux
has the PHY provide the 2ns delay. You only need the MAC to add the
delays if a PHY is being used which cannot add the needed
delays. Occasionally you need to fine tune the delay, and the MAC
delays can then be interesting. But since you have no idea what the
units are, i would prefer to simply hard code it to 0, unless is it
really needed.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
