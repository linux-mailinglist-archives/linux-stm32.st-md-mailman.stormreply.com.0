Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E896B52C5B
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 10:58:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A047C349C1;
	Thu, 11 Sep 2025 08:58:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F941C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPLuj/xTIdlTADyQSmFwiDNGb2wswqT9CA7Ixd8e3JM=; b=LWPQrx41+Rmfg6soc8oQ3DEebT
 bVi4OQPrsC+xG5p3CX+gQM//aAIc3Fnm7CMBogIaJolTkGVZpz2Pq+qCDdf6M9oASVduVjkTUMkDE
 tkqEKyQ4V0gmgNaLeX5b14pHDON4ar7eA4rlZSv0JkApnRdB5RIlEZRTj0D0s5cD2x/NFYbAvbAd3
 szZLZ1NVhaUdbLgJFt8OgaW3ECtv6UMA3JqySsjpdMqATN+8kKmDE9peKt/5dsZ6xXNmv93m5GeTg
 Hih91SSLoTQ4FYfTqr7bzcGsNJaSWHwmiZmVpQp+ElZ58lMPYeUOq0qVfZWAd/s5KzzoiEdSdGda8
 T5s8PQkA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55362)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uwd89-000000002hN-1Tq6;
 Thu, 11 Sep 2025 09:58:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uwd84-000000002Db-3VMI; Thu, 11 Sep 2025 09:58:08 +0100
Date: Thu, 11 Sep 2025 09:58:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aMKPIFmOS1riOajH@shell.armlinux.org.uk>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

On Wed, Sep 10, 2025 at 06:04:28PM +0200, Andrew Lunn wrote:
> > +    ethernet: ethernet@7a80000 {
> > +        compatible = "qcom,sa8255p-ethqos";
> > +        reg = <0x23040000 0x10000>,
> > +              <0x23056000 0x100>;
> > +        reg-names = "stmmaceth", "rgmii";
> > +
> > +        iommus = <&apps_smmu 0x120 0x7>;
> > +
> > +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq", "sfty";
> > +
> > +        dma-coherent;
> > +
> > +        snps,tso;
> > +        snps,pbl = <32>;
> > +        rx-fifo-depth = <16384>;
> > +        tx-fifo-depth = <16384>;
> > +
> > +        phy-handle = <&sgmii_phy1>;
> > +        phy-mode = "2500base-x";
> 
> Nitpicking: It is clearly not an SGMII PHY if it support
> 2500BaseX. You might want to give the node a better name.
> 
> > +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> > +        snps,ps-speed = <1000>;
> 
> Since this MAC can do 2.5G, is 1000 correct here?

The driver only accepts 10, 100 and 1000 here. Not sure if that's
documented in the binding.

Also, does snps,ps-speed need to be set if we're not immitating a PHY
with the PCS? My understanding is that snps,ps-speed is only relevant
in that circumstance. (I suspect many DTS get this wrong.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
