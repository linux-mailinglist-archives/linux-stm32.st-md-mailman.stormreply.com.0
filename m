Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A92A18274
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 18:01:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4F16C7802D;
	Tue, 21 Jan 2025 17:01:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E9B0CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7Pnocolf/+FMPBsjA4XKBOck60bqAiKE6Tl4dgyzfRI=; b=qu9hGiLEi/SYW6d2f1eyaAFdCs
 1qp0YPhycK5jWI/BYvXgioC80c/Q4WXVxCidQ7YVf1kQrT7B3cdzujhe1g7BNEjoZb0oQxDhzuxw+
 dn0VRXrCxykMPy7+z+08vb44I4S9nuAzxCpnkjyPfaKSN75ZWLb8i2LpNQE6FrwbtW/Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1taHcX-006hE0-M8; Tue, 21 Jan 2025 18:00:57 +0100
Date: Tue, 21 Jan 2025 18:00:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <69954039-96bf-42d9-850d-48676a530ec6@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
 <20250121140840.18f85323@device-291.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121140840.18f85323@device-291.home>
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Yijie Yang <quic_yijiyang@quicinc.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: net:
 ethernet-controller: Correct the definition of phy-mode
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

On Tue, Jan 21, 2025 at 02:08:40PM +0100, Maxime Chevallier wrote:
> On Tue, 21 Jan 2025 15:54:53 +0800
> Yijie Yang <quic_yijiyang@quicinc.com> wrote:
> 
> > Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> > added by the board, not the MAC, to prevent confusion and ensure accurate
> > documentation.
> 
> That's not entirely correct though. The purpose of the RGMII variants
> (TXID, RXID, ID) are mostly to know whether or not the PHY must add
> internal delays. That would be when the MAC can't AND there's no PCB
> delay traces. Some MAC can insert delays.
> 
> There's documentation here as well on that point :
> 
> https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

This is part of the problem. This describes
PHY_INTERFACE_MODE_RGMII_*, and the value passed to phylib. The
documentation even says:

   The values of phy_interface_t must be understood from the
   perspective of the PHY device itself,

But the value in DT is about the board as a whole, it describes the
hardware. Software gets to decide if the MAC or the PHY adds the
delays, if the board does not provide the delay.

> So, MACs may insert delays. A modification for the doc, if needed,
> would rather be :
> 
> -      # RX and TX delays are added by the MAC when required
> +      # RX and TX delays are added by the MAC or PCB traces when required

From the perspective of the board, this is wrong. 'rgmii' means the
board provides the delays.

There is a parallel discussion going on, about how aspeed have also
got there implementation wrong. See:

https://lore.kernel.org/netdev/0ee94fd3-d099-4d82-9ba8-eb1939450cc3@lunn.ch/

and the test of that thread.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
