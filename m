Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9AEC09EBF
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 20:52:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FABDC55586;
	Sat, 25 Oct 2025 18:52:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A18A8C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vzMDiq5tlTgX1W/21WhiBB6gzelJCaOUjEZfpZPw2jo=; b=FlOF+A82rwYsAN7j4qoNpJgXtF
 iWSNKWO8eYN/x0dET5c9+Js9JoENDh1Q5nuo4uZl6XJtc+wddCkclErWajJuho0AAVCCNlW9BtOny
 7kFFe0pahZ/Ypmi5vZswSMO2q8XAXspt+qxQ7cPRb2z6ojln7nkxHRXc1u6ZFnl7yeKiL+6NFL5KP
 pdqzgLGgxtbt9xuNsWLKzj68BKWXm9M2Cwot1WLin+o+jWtRoseNWYEIh9Z+Qfx4s030zrPhlwmDn
 nxnEDjLNwimpjuvy8+OxtEbfKUHMGOnwNuCUb7Cynqu2POed4jzv6q6MW3wdAQA9a/3/O3mnxFilD
 tnpPQnCg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56072)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCjN1-000000000IZ-2XQq;
 Sat, 25 Oct 2025 19:52:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCjMy-000000003tv-0P2Z; Sat, 25 Oct 2025 19:52:04 +0100
Date: Sat, 25 Oct 2025 19:52:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <aP0cU1mygKbt9DBQ@shell.armlinux.org.uk>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
Cc: Eric Dumazet <edumazet@google.com>, Austin Zhang <austin.zhang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-arm-kernel@lists.infradead.org,
 "Tham, Mun Yew" <mun.yew.tham@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v5 00/10] arm64: dts: socfpga: agilex5:
 enable network and add new board
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

On Fri, Oct 24, 2025 at 01:49:52PM +0200, Steffen Trumtrar wrote:
> Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
> needed patches to support the network on current mainline.
> 
> Currently only QSPI and network are functional as all other hardware
> currently lacks mainline support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

You haven't included which tree you are targetting with this series. I'm
assuming net-next for the following review. Please be explicit via
[PATCH net ...] or [PATCH net-next ...] in the subject line of the cover
message and each patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
