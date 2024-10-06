Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B1992064
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2024 20:24:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBE78C71287;
	Sun,  6 Oct 2024 18:24:54 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F174FC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2024 18:24:47 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A745C20077D;
 Sun,  6 Oct 2024 20:24:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 932F6200076;
 Sun,  6 Oct 2024 20:24:47 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 61DBA203BD;
 Sun,  6 Oct 2024 20:24:48 +0200 (CEST)
Date: Sun, 6 Oct 2024 20:24:47 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZwLV7zpfQht0errK@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85066576AD6848E2402DA354E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <ff9b3d88-9fe7-47fa-a425-4661181f9321@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff9b3d88-9fe7-47fa-a425-4661181f9321@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 0/7] Add support for Synopsis DWMAC IP
 on NXP Automotive SoCs S32G2xx/S32G3xx/S32R45
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

On Mon, Aug 19, 2024 at 08:03:30AM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 23:50, Jan Petrous (OSS) wrote:
> > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > interface over Pinctrl device or the output can be routed
> > to the embedded SerDes for SGMII connectivity.
> > 
> > The provided stmmac glue code implements only basic functionality,
> > interface support is restricted to RGMII only.
> > 
> > This patchset adds stmmac glue driver based on downstream NXP git [0].
> > 
> > [0] https://github.com/nxp-auto-linux/linux
> 
> All your threading is completely broken which makes it difficult to
> apply and compare patchsets. Just try - use b4 diff on this...
> 

Sorry for that. I had some difficulties with enabling SMTP traffic,
so I used Outlook what I see is totally unusable solution.

Now I have all b4/lei/msmtp/mutt tools installed and will use
it for v3.

BR.
/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
