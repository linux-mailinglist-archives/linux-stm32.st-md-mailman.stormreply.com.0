Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA7A17E27
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 13:58:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6401FC78F6E;
	Tue, 21 Jan 2025 12:58:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89320C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uA940mkLL9KHlcuBfwiSIb3vbphWe9IhllR+VjD8CvI=; b=mdoYhlVkty1GpM8FmQVp5QiD8B
 Ey/KgEeTwABBdYcLZ8oufPHyJNj06JsuXdwDZ2At1jFQYoY8NSrNxToQMKjJJgXDVmAte4E5SWw4j
 /PwfJf345eUnb/jLHwSizUujKKl1TbDiLYZ6wB2+ZT7TPBSNq3R/ozp9G9Wa7k7zovVTx6XoIFOFA
 a6P2hkmZ+NpyKk1TU2ThKzoUm4aDcZzWLwM/L92ii27ehWKOJlgO+d9B64cqK0IP+3Gq7cfxMCcon
 urxGSXPMgPVEoj5FX0zOmw9JlirdcMaDtjWzgNZAujqR3hMI7qoY8WW3vlSBsPqlLbRuvgalgAsJn
 OGHodGUA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60812)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1taDpM-0007FN-2u;
 Tue, 21 Jan 2025 12:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1taDpI-0003uT-0r;
 Tue, 21 Jan 2025 12:57:52 +0000
Date: Tue, 21 Jan 2025 12:57:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos:
 Mask PHY mode if configured with rgmii-id
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

On Tue, Jan 21, 2025 at 01:47:55PM +0100, Krzysztof Kozlowski wrote:
> On 21/01/2025 08:54, Yijie Yang wrote:
> > The Qualcomm board always chooses the MAC to provide the delay instead of
> > the PHY, which is completely opposite to the suggestion of the Linux
> > kernel.

You still need to explain why it's preferable to match this in the mainline
kernel. Does it not work when you use the phylib maintainers suggestion
(if that is so, you need to state as much.)

> How does the Linux kernel suggest it?

It's what phylib maintainers prefer, as documented in many emails from
Andrew Lunn and in Documentation/networking/phy.rst:

"Whenever possible, use the PHY side RGMII delay for these reasons:

* PHY devices may offer sub-nanosecond granularity in how they allow a
  receiver/transmitter side delay (e.g: 0.5, 1.0, 1.5ns) to be specified. Such
  precision may be required to account for differences in PCB trace lengths

* PHY devices are typically qualified for a large range of applications
  (industrial, medical, automotive...), and they provide a constant and
  reliable delay across temperature/pressure/voltage ranges

* PHY device drivers in PHYLIB being reusable by nature, being able to
  configure correctly a specified delay enables more designs with similar delay
  requirements to be operated correctly
"

> > The usage of phy-mode in legacy DTS was also incorrect. Change the
> > phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> > to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> > the definition.

If the delays dependent on the phy-mode are going to be implemented at
the MAC end, then changing the PHY mode indicated to phylink and phylib
to PHY_INTERFACE_MODE_RGMII is the right thing to be doing. However,
as mentioned in the documentation and by Andrew, this is discouraged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
