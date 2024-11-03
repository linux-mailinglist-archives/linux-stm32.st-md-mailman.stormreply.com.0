Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FF9BA75A
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Nov 2024 19:13:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FA4C6DD9E;
	Sun,  3 Nov 2024 18:13:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205C2C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=TEDfJQj5mI10kN+wwdoFMrm2dhK/uEbxmEe+uWSOm58=; b=XAVMEtgHPm/CP5wWXga647XAud
 6XcRKMh9aHdy/WSXMnyv0lcsVsP31xBUkB6gt42dk51LOeK3mP3vGzZuDO+BynAXr8RbffNaPwisr
 b2A1/qOYDLd8KJEtKXHJyUx7QCvA+t1cet2cGFBMPtnX33cs9f23+P0TUkemsaAqOD3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t7f5M-00C1y2-MF; Sun, 03 Nov 2024 19:12:24 +0100
Date: Sun, 3 Nov 2024 19:12:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/2] Add the dwmac driver
 support for T-HEAD TH1520 SoC
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

On Sun, Nov 03, 2024 at 08:57:58AM -0800, Drew Fustini wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> 
> The gigabit ethernet on these boards does need pinctrl support to mux
> the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> related dts patches are in linux-next. However, they are not yet in
> net-next/main.
> 
> Therefore, I am dropping the dts patch for v5 as it will not build on
> net-next/main due to the lack of the padctrl0_apsys pin controller node
> in next-next/main version th1520.dtsi.

You should send the .dts patch to the Maintainer responsible for
merging all the RISC-V DT patches, maybe via a sub Maintainer. All the
different parts will then meet up in linux-next.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
