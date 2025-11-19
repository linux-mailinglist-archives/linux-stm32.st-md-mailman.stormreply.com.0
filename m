Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D3C6FFA9
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 17:13:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989DCC36B30;
	Wed, 19 Nov 2025 16:13:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9EF6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I2Z8/xcjTHwwelfJUI+eSlYaVGFYtTXFWiaz6vN1dqc=; b=BRLKTIepSCsk2GgXJg5XJJxzcW
 Q01F6+TnlEaz2bHGlKhI12kgEN1NM7BDaQppp5zAAEQgLiaRYg1O8m3hrzul7eWn3PeUTAEyNQOpa
 Rgx0+25rJnZ+ulN9XZymfV0agn8derlOjokbo4zNIdphtx5TCR/mRxSrDnlp8i+i0nKmehDwFPUh5
 wCiOZr9B+8svl8RWRnQAv4a7S5L+t4Ywut5foMAGHWsPDrty6gcPagQvHCDtrhcOxfMou91DOitEY
 et5g38666G9rqA8DRHBDFSgfKlGwdg5LklhRdBbShOvASvSTou/TSBZ6hhPE1dz82M9F44q8Kr8CQ
 VvsZowzA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33292)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vLko3-0000000058C-3sRn;
 Wed, 19 Nov 2025 16:13:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vLko1-000000003Yg-3fGV; Wed, 19 Nov 2025 16:13:17 +0000
Date: Wed, 19 Nov 2025 16:13:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
References: <20251119153526.13780-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119153526.13780-1-jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 resend] net: stmmac: add support for
	dwmac 5.20
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

On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> The dwmac 5.20 IP can be found on some synaptics SoCs. 
> 
> The binding doc has been already upstreamed by
> commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> version")
> 
> So we just need to add a compatibility flag in dwmac generic driver.

Do we _need_ to add it to the generic driver? Do the platforms that are
using this really not need any additional code to support them?

Looking at all the DT that mention dwmac-5.20 in their compatible
strings, that is always after other compatibles that point to other
platform specific drivers.

So, can you point to a platform that doesn't have its own platform
glue, and would be functional when using the dwmac-generic driver?

For reference, the dts that refer to dwmac-5.20 are:

arch/arm64/boot/dts/renesas/r9a09g047.dtsi
arch/arm64/boot/dts/renesas/r9a09g056.dtsi
arch/arm64/boot/dts/renesas/r9a09g057.dtsi
arch/arm64/boot/dts/st/stm32mp251.dtsi
arch/arm64/boot/dts/st/stm32mp253.dtsi
arch/arm64/boot/dts/st/stm32mp233.dtsi
arch/arm64/boot/dts/st/stm32mp231.dtsi
arch/riscv/boot/dts/starfive/jh7110.dtsi

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
