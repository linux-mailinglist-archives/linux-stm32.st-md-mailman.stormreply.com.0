Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B89920DC
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2024 21:47:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC33CC6C841;
	Sun,  6 Oct 2024 19:47:06 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7D3C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2024 19:46:59 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B5DC1A0B7C;
 Sun,  6 Oct 2024 21:46:59 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6486A1A074D;
 Sun,  6 Oct 2024 21:46:59 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 37236202E3;
 Sun,  6 Oct 2024 21:47:00 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:46:59 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <ZwLpMylhr/mHgV3Y@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <0104f251-f032-4082-835f-01ca2279c1b1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0104f251-f032-4082-835f-01ca2279c1b1@intel.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, dl-S32 <S32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add
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

On Tue, Aug 20, 2024 at 02:15:46PM -0700, Jacob Keller wrote:
> 
> 
> On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> > NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> > that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> > 
> > The basic driver supports only RGMII interface.
> > 
> 
> You mention that it only supports RGMII.. so...
> 
> > +static int s32cc_gmac_write_phy_intf_select(struct s32cc_priv_data *gmac)
> > +{
> > +	u32 intf_sel;
> > +
> > +	switch (gmac->intf_mode) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		intf_sel = PHY_INTF_SEL_SGMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		intf_sel = PHY_INTF_SEL_RGMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		intf_sel = PHY_INTF_SEL_RMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_MII:
> > +		intf_sel = PHY_INTF_SEL_MII;
> > +		break;
> > +	default:
> > +		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> > +			phy_modes(gmac->intf_mode));
> > +		return -EINVAL;
> > +	}
> > +
> > +	writel(intf_sel, gmac->ctrl_sts);
> > +
> > +	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(gmac->intf_mode));
> > +
> 
> Why does this code seem to support others?
> 
> Is that support just not yet fully baked?

Exactly. I have more functionality already implemented, but I started
from very basic driver to simplify review process.

I will remove all occurence of other interfaces but RGMII in v3.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
