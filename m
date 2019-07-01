Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAEF29A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 11:15:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78095C35E0B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 09:15:52 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B848FC35E08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 09:15:50 +0000 (UTC)
X-UUID: 4abeeb068a474662a8d7693ede82dd06-20190430
X-UUID: 4abeeb068a474662a8d7693ede82dd06-20190430
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1089139566; Tue, 30 Apr 2019 17:15:47 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 30 Apr 2019 17:15:45 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 30 Apr 2019 17:15:45 +0800
Message-ID: <1556615745.24897.40.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 30 Apr 2019 17:15:45 +0800
In-Reply-To: <738b37cd-4719-9257-18fc-aab1dc7424f4@st.com>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-3-git-send-email-biao.huang@mediatek.com>
 <24f4b268-aa7f-e1f7-59fc-2bc163eb8277@st.com>
 <1556525353.24897.30.camel@mhfsdcap03>
 <738b37cd-4719-9257-18fc-aab1dc7424f4@st.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] net: stmmac: fix csr_clk can't be
	zero issue
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

On Mon, 2019-04-29 at 10:26 +0200, Alexandre Torgue wrote:
> 
> On 4/29/19 10:09 AM, biao huang wrote:
> > Hi,
> > 
> > On Mon, 2019-04-29 at 09:18 +0200, Alexandre Torgue wrote:
> >> Hi
> >>
> >> On 4/28/19 8:30 AM, Biao Huang wrote:
> >>> The specific clk_csr value can be zero, and
> >>> stmmac_clk is necessary for MDC clock which can be set dynamically.
> >>> So, change the condition from plat->clk_csr to plat->stmmac_clk to
> >>> fix clk_csr can't be zero issue.
> >>>
> >>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> >>> ---
> >>>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >>> index 818ad88..9e89b94 100644
> >>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >>> @@ -4376,7 +4376,7 @@ int stmmac_dvr_probe(struct device *device,
> >>>    	 * set the MDC clock dynamically according to the csr actual
> >>>    	 * clock input.
> >>>    	 */
> >>> -	if (!priv->plat->clk_csr)
> >>> +	if (priv->plat->stmmac_clk)
> >>>    		stmmac_clk_csr_set(priv);
> >>>    	else
> >>>    		priv->clk_csr = priv->plat->clk_csr;
> >>>
> >>
> >> So, as soon as stmmac_clk will be declared, it is no longer possible to
> >> fix a CSR through the device tree ?
> > 
> > let's focus on the condition:
> > 1. clk_csr may be zero, it should not be the condition. or the clk_csr =
> > 0 will jump to the wrong block.
> > 2. Since stmmac_clk_csr_set will get_clk_rate from stmmac_clk,
> > the plat->stmmac_clk is a more proper condition.
> > 
> 
> Ok, but here you remove one possibility: stmmac_clk and clk_csr defined. 
> no ?
> 
> Other way could be the following code + initialize priv->plat->clk_csr 
> with a non null value before read it in device tree (in stmmac_platform).
> 
> if (priv->plat->clk_csr >= 0)
> 	priv->clk_csr = priv->plat->clk_csr;
> else
> 	stmmac_clk_csr_set(priv);
> 
> 
> 
> > In some case, it's impossible to get the clk rate of stmmac_clk,
> > so it's better to remain the clk_csr flow.
> > 
Agree.

Maybe we should initialize plat->clk_csr to -1
in stmmac_probe_config_dt:

plat->clk_csr = -1;
/* Get clk_csr from device tree */                                      
of_property_read_u32(np, "clk_csr", &plat->clk_csr); 

Then the condition can write as you proposed:
if (priv->plat->clk_csr >= 0)
 	priv->clk_csr = priv->plat->clk_csr;
else
 	stmmac_clk_csr_set(priv);

> > 
> > 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
