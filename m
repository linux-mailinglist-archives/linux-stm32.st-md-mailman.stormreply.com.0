Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BD99209B
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2024 21:18:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC6CAC71287;
	Sun,  6 Oct 2024 19:18:02 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 770B7C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2024 19:17:56 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 22ACC200AFA;
 Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0AD0E200030;
 Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D0FEE202E3;
 Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:17:56 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <ZwLiZOaQ0X1NkfPu@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506A4B49180F34117B93655E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <35fd8e73-2225-4644-82f1-037294710d30@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35fd8e73-2225-4644-82f1-037294710d30@intel.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 1/7] net: driver: stmmac: extend CSR
	calc support
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

On Tue, Aug 20, 2024 at 02:09:56PM -0700, Jacob Keller wrote:
> 
> 
> On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> > Add support for CSR clock range up to 800 MHz.
> > 
> > When in, fix STMMAC_CSR_250_300M divider comment.
> > 
> 
> The phrasing of this was somewhat confusing. I would also have chosen to
> do this as a separate fix, since it makes reading the change somewhat
> more difficult. A separate change could also explain how it was wrong in
> the first place and add more context.

OK, divided to the two commits for v3.

> 
> Either way, I think its a minor enough change and it only affects a code
> comment. Not a huge deal.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thanks you.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
