Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 560B799286E
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0236EC78F70;
	Mon,  7 Oct 2024 09:42:42 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B08CC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2024 19:29:00 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 11A741A1065;
 Sun,  6 Oct 2024 21:29:00 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE45A1A0E06;
 Sun,  6 Oct 2024 21:28:59 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C0CC9202E3;
 Sun,  6 Oct 2024 21:29:00 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:28:59 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZwLk+/GgMeUB7303@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <d2e32a56-3020-47ac-beef-3449053c5d4c@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2e32a56-3020-47ac-beef-3449053c5d4c@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: dl-S32 <S32@nxp.com>, Eric Dumazet <edumazet@google.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 4/7] net: phy: add helper for mapping
 RGMII link speed to clock rate
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

On Mon, Aug 19, 2024 at 05:49:58PM +0200, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> > ---
> > We seem to have multiple cases of very similar logic in lots of stmmac
> > platform drivers, and I think it's about time we said no more to this.
> > So, what I think we should do is as follows:
> > 
> > add the following helper - either in stmmac, or more generically
> > (phylib? - in which case its name will need changing.)
> > 
> > static long stmmac_get_rgmii_clock(int speed)
> > {
> > 	switch (speed) {
> > 	case SPEED_10:
> > 		return 2500000;
> > 
> > 	case SPEED_100:
> > 		return 25000000;
> > 
> > 	case SPEED_1000:
> > 		return 125000000;
> > 
> > 	default:
> > 		return -ENVAL;
> > 	}
> > }
> > 
> > Then, this can become:
> > 
> > 	long tx_clk_rate;
> > 
> > 	...
> > 
> > 	tx_clk_rate = stmmac_get_rgmii_clock(speed);
> > 	if (tx_clk_rate < 0) {
> > 		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> > 		return;
> > 	}
> > 
> > 	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> > ---
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> This Signed-off-by: needs to be above the first ---, otherwise it gets
> discard.
> 

I see, it is used as delimiter, my fault.
I will change formating for v3.

> When you repost, please do try to get threading correct.
> 

Yeh, I already got the same feedback from Krzysztof.
I'm switching to b4/lei/mutt for v3 what I hope fixed
the threading issue.

BR.
/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
