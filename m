Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE989D289D
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 15:51:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6025C78F99;
	Tue, 19 Nov 2024 14:51:13 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226E5C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 14:51:07 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A8AA9201A7C;
 Tue, 19 Nov 2024 15:51:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8CBF0200A3E;
 Tue, 19 Nov 2024 15:51:06 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ACB32037C;
 Tue, 19 Nov 2024 15:51:05 +0100 (CET)
Date: Tue, 19 Nov 2024 15:51:06 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <Zzyl2q7D1GIA1vUG@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
 <ZyOXgdqUgg2qlCah@lsv051416.swis.nl-cdc01.nxp.com>
 <b9aefcf2-8f0d-431c-865b-34c9b8e69c4d@kernel.org>
 <ZyO7fn3NWULA9bGG@lsv051416.swis.nl-cdc01.nxp.com>
 <ZyO9Mfq+znZdJJrJ@lsv051416.swis.nl-cdc01.nxp.com>
 <9e876379-c555-45e6-8a8a-752d90fdc8ed@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e876379-c555-45e6-8a8a-752d90fdc8ed@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 14/16] net: stmmac: dwmac-s32: add
 basic NXP S32G/S32R glue driver
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

On Fri, Nov 01, 2024 at 04:40:50PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2024 18:24, Jan Petrous wrote:
> > On Thu, Oct 31, 2024 at 06:16:46PM +0100, Jan Petrous wrote:
> >> On Thu, Oct 31, 2024 at 04:44:45PM +0100, Krzysztof Kozlowski wrote:
> >>> On 31/10/2024 15:43, Jan Petrous wrote:
> >>>> On Tue, Oct 29, 2024 at 08:13:40AM +0100, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> >>>>>> +	plat->init = s32_gmac_init;
> >>>>>> +	plat->exit = s32_gmac_exit;
> >>>>>> +	plat->fix_mac_speed = s32_fix_mac_speed;
> >>>>>> +
> >>>>>> +	plat->bsp_priv = gmac;
> >>>>>> +
> >>>>>> +	return stmmac_pltfr_probe(pdev, plat, &res);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static const struct of_device_id s32_dwmac_match[] = {
> >>>>>> +	{ .compatible = "nxp,s32g2-dwmac" },
> >>>>>> +	{ .compatible = "nxp,s32g3-dwmac" },
> >>>>>> +	{ .compatible = "nxp,s32r-dwmac" },
> >>>>>
> >>>>> Why do you need three same entries?
> >>>>>
> >>>>
> >>>> We have three different SoCs and in v3 review you told me
> >>>> to return all back:
> >>>> https://patchwork.kernel.org/comment/26067257/
> >>>
> >>> It was about binding, not driver.
> >>>
> >>> I also asked there: use proper fallback and compatibility. Both comments
> >>> of course affect your driver, but why choosing only first part?
> >>>
> >>
> >> Does it mean I should remove first two (G2/G3) members from match array
> >> and use "nxp,s32r-dwmac" as fallback for G2/G3? And similarly change
> >> the bindings to:
> >>
> >>   compatible:
> >>     oneOf:
> >>       - const: nxp,s32r-dwmac
> >>       - items:
> >> 	  - enum:
> >> 	      - nxp,s32g2-dwmac
> >> 	      - nxp,s32g3-dwmac
> >>           - const: nxp,s32r-dwmac
> >>
> >> And add here, into the driver, those members back when some device
> >> specific feature will be needed? Am I understand your hints right?
> >>
> > 
> > Sorry, it's not correct. This way I'm not able to detect S32R which is
> > the only one with higher speed.
> > 
> > Then I could use the G2 as fallback I think, Ie.:
> > 
> >   compatible:
> >     oneOf:
> >       - const: nxp,s32g2-dwmac
> >       - items:
> > 	  - enum:
> >               - nxp,s32g3-dwmac
> >               - nxp,s32r-dwmac
> >            - const: nxp,s32g2-dwmac
> 
> I don't understand. In both cases you can 'detect r', if by this you
> meant match and bind. I don't care which one is the fallback, but if one
> does not work it points to different issues with your code.
> 

I see. I will use the last variant (with s32g2 as fallback) in v5.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
