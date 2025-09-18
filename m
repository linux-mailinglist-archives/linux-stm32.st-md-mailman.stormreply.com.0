Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC2B1B205
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 12:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30274C3F92E;
	Tue,  5 Aug 2025 10:30:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4338CC3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Aug 2025 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/N+pabulBvha5ZEhN29wupcgWLXk3sW2tBjPgU74Mpk=; b=1OPuWg8/x1VCIQSz1+viSjZdDU
 698zT2qyHXZDGe+4K8fpJnRl13r6a/YyMNqF2vKIljJk5TZcNu/3/OZICgz7kH/DyaQrIVvF/VOuO
 RKo7+PAI+2C5XKRTzqyaDg5Ruazmq2KWOTZoSvO8fEOtGYJnn2DyXUWQPBiSJPPEx3nssI3Z+r8cG
 OSv6ugU7fCyaZ7u2TA6RmftMbisSlWxNRnACxFJGob+lLOedoQ00kPZi7tvFZRZuVhx/A2itZraVB
 EdxsabgA+oGpGUEN24zU+HjT29x8mGZoUjfSBwORfixBnjRI23pCStEW6vmI9JfWbMJqamoD7B3Ky
 BZ66+4dA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53592)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ujEvw-0002us-1r;
 Tue, 05 Aug 2025 11:30:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ujEvs-00060p-2B;
 Tue, 05 Aug 2025 11:30:12 +0100
Date: Tue, 5 Aug 2025 11:30:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aJHdNMWPqNsU9AiK@shell.armlinux.org.uk>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250724-relative_flex_pps-v1-1-37ca65773369@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-relative_flex_pps-v1-1-37ca65773369@foss.st.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] drivers: net: stmmac: add
 STMMAC_RELATIVE_FLEX_PPS
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

On Thu, Jul 24, 2025 at 02:31:18PM +0200, Gatien Chevallier wrote:
> +config STMMAC_RELATIVE_FLEX_PPS
> +	bool "Support for STMMAC system time relative flexible PPS generation"
> +	default n

There is no need for "default n" because the default default is n.

> +	help
> +	  Say Y to add the MAC system time to the arguments passed to the
> +	  PTP driver when requesting a flexible PPS generation. This avoids
> +	  the tedious task of passing an absolute time value when using sysfs
> +	  entry.

How does a distro decide whether to enable or disable this option? What
does it depend on?

If it's only for some platforms and not others (due to causing
regressions) then what is a distro supposed to do with their kernels
that support multiple platforms?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
