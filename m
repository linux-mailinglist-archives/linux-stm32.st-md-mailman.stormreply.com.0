Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B81929E617A
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 00:45:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A4B1C78033;
	Thu,  5 Dec 2024 23:45:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9426C7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=nFvZvTOTWkFAKfzfMvGEvGDyWsbLuq+WNKubNabn3ak=; b=mHVOvvyQgCyWfgoPAr3LiGnfz4
 fLb6P1bbHxqjaEFTW1q4clehusxop5BBrefUE1xXna2wpS1cyIHo9ISILDLLanxDO/rMnVJsnER4D
 FXyxm4hEtxxfvWN3tCUFXhvX+UeVGFfhWvMwv8iSgf5nZ9FEGh/TwpaBb3XKo/hzzVtA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tJLXB-00FMhW-Qp; Fri, 06 Dec 2024 00:45:25 +0100
Date: Fri, 6 Dec 2024 00:45:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <2706b154-737e-467c-8ea4-c9356bdc0720@lunn.ch>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
 <Z1HaB6hT0QX4Jlyx@shell.armlinux.org.uk>
 <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, 0x1207@gmail.com, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v8 01/15] net: stmmac: Fix CSR
	divider comment
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

On Thu, Dec 05, 2024 at 05:55:22PM +0100, Jan Petrous wrote:
> On Thu, Dec 05, 2024 at 04:51:19PM +0000, Russell King (Oracle) wrote:
> > On Thu, Dec 05, 2024 at 05:42:58PM +0100, Jan Petrous via B4 Relay wrote:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > > 
> > > The comment in declaration of STMMAC_CSR_250_300M
> > > incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
> > > but the DWC Ether QOS Handbook version 5.20a says it is
> > > CSR clock/124.
> > > 
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > I gave my reviewed-by for this patch in the previous posting, but you
> > haven't included it.
> > 
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Hi Russell,
> sorry for that, I missed it. Should I resend the v8 series?

b4 is pretty good at handling this, it will find such tags and add
them to your patchset if you are using b4 to manage it.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
