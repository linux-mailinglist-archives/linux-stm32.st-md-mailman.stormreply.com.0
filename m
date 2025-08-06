Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A2B1C700
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 15:49:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2539C36B12;
	Wed,  6 Aug 2025 13:49:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50E7DC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hx75GfJBE17gahFtByj409jMkcTDImb3a5kJ8Lf/J/o=; b=HIj33Esb5PfQk7IBwUmIlHkHUA
 LRuy+nHOQx2DwWZCk/jisqrsCt8fo5S8Jx/N+tYAAJKTWiLXwROaNNmqInc9CviRg+tof3dzGs5df
 tcaakCTGvzKPOHUt37VX4VWBIJ7ljBcud31mWEagk93ylSie7vhn0KKS+ZuX3MU+jiJfUZ+h0hbQi
 AEJYzuP68hqbqsRS/o0ARTZSSW3K5taUDByDOaKPBHdQeZ6idA4TwSfkeTO143/Mf5Qk/ScIqS6y4
 FfNbZ3L41f3L5G9icNbagOYuj/QeTQ5IG/KYt5CUa+DuFW1MwxPXdRYRBTXj5piPS85kyD3WjjYWZ
 L8TU60yQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54790)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ujeVb-0004cA-2P;
 Wed, 06 Aug 2025 14:48:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ujeVV-00079n-1X;
 Wed, 06 Aug 2025 14:48:41 +0100
Date: Wed, 6 Aug 2025 14:48:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <aJNdOTZHfyG7fMgE@shell.armlinux.org.uk>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-12-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-12-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
 catalin.marinas@arm.com, Frank.Li@nxp.com, edumazet@google.com,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, festevam@gmail.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, ulf.hansson@linaro.org,
 pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, linux-pm@vger.kernel.org,
 othacehe@gnu.org, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v8 11/11] net: stmmac: imx: add i.MX91
	support
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

On Wed, Aug 06, 2025 at 07:41:19PM +0800, Joy Zou wrote:
> Add i.MX91 specific settings for EQoS.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
