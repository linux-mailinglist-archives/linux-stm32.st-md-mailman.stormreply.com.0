Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E172D376C
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 04:12:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B7FFC36B0C;
	Fri, 11 Oct 2019 02:12:43 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94175C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 02:12:41 +0000 (UTC)
X-UUID: c8bb1d54c12b4c2c909a5e83407ef4fb-20191011
X-UUID: c8bb1d54c12b4c2c909a5e83407ef4fb-20191011
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1085104326; Fri, 11 Oct 2019 10:12:34 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 11 Oct 2019 10:12:32 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 11 Oct 2019 10:12:31 +0800
Message-ID: <1570759952.5044.8.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Fri, 11 Oct 2019 10:12:32 +0800
In-Reply-To: <20191010160103.63c3c0ed@cakuba.netronome.com>
References: <20191009085649.6736-1-biao.huang@mediatek.com>
 <20191010160103.63c3c0ed@cakuba.netronome.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F7643B356362A8360A90F87B3603E8770E963BC1A7E4CEA65264E423A255D792000:8
X-MTK: N
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: disable/enable ptp_ref_clk
 in suspend/resume flow
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
Content-Type: multipart/mixed; boundary="===============7491688782928807054=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7491688782928807054==
Content-Type: multipart/alternative; boundary="=-Q3P5tXzJvEwDmVurNQeT"

--=-Q3P5tXzJvEwDmVurNQeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Appreciate your comments!

On Thu, 2019-10-10 at 16:01 -0700, Jakub Kicinski wrote:

> On Wed, 9 Oct 2019 16:56:49 +0800, Biao Huang wrote:
> > disable ptp_ref_clk in suspend flow, and enable it in resume flow.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index c7c9e5f162e6..b592aeecc3dd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4469,6 +4469,8 @@ int stmmac_suspend(struct device *dev)
> >  		stmmac_mac_set(priv, priv->ioaddr, false);
> >  		pinctrl_pm_select_sleep_state(priv->device);
> >  		/* Disable clock in case of PWM is off */
> > +		if (priv->plat->clk_ptp_ref)
> > +			clk_disable_unprepare(priv->plat->clk_ptp_ref);
> 
> I don't know much embedded, but it seems like this should perhaps just
> be clk_disable() without the unprepare? stmmac_hw_teardown() is called
> when driver is removed so it needs to unprepare as well.
> 
> Please feel free to explain to me why this needs to be
> clk_disable_unprepare(), as I said - not an expert.
> 

As our clock owner's advice, there are prepare/unprepare clk_ops for
pll, no enable/disable clk_ops for it, and pll will be off only when the
prepare reference count decrease to 0.

so for the sake of power saving, we'd better call clk_disable_unprepare
to turn the parent pll off.



> Also - if this is a bug fix and you'd like to have it backported to
> older releases you need to add a Fixes tag.

Thanks for the reminder, I'll add the fixes tag in the next version.

> 
> Thanks!
> 
> >  		clk_disable(priv->plat->pclk);

maybe it should be clk_disable_unprepare(priv->plat->pclk); here.

> >  		clk_disable(priv->plat->stmmac_clk);
> >  	}
> > @@ -4535,6 +4537,8 @@ int stmmac_resume(struct device *dev)
> >  		/* enable the clk previously disabled */
> >  		clk_enable(priv->plat->stmmac_clk);
> >  		clk_enable(priv->plat->pclk);
> > +		if (priv->plat->clk_ptp_ref)
> > +			clk_prepare_enable(priv->plat->clk_ptp_ref);
> >  		/* reset the phy so that it's ready */
> >  		if (priv->mii)
> >  			stmmac_mdio_reset(priv->mii);
> 



--=-Q3P5tXzJvEwDmVurNQeT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.6">
</HEAD>
<BODY>
Appreciate your comments!<BR>
<BR>
On Thu, 2019-10-10 at 16:01 -0700, Jakub Kicinski wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
On Wed, 9 Oct 2019 16:56:49 +0800, Biao Huang wrote:
<FONT COLOR="#737373">&gt; disable ptp_ref_clk in suspend flow, and enable it in resume flow.</FONT>
<FONT COLOR="#737373">&gt; </FONT>
<FONT COLOR="#737373">&gt; Signed-off-by: Biao Huang &lt;<A HREF="mailto:biao.huang@mediatek.com">biao.huang@mediatek.com</A>&gt;</FONT>
<FONT COLOR="#737373">&gt; ---</FONT>
<FONT COLOR="#737373">&gt;  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++</FONT>
<FONT COLOR="#737373">&gt;  1 file changed, 4 insertions(+)</FONT>
<FONT COLOR="#737373">&gt; </FONT>
<FONT COLOR="#737373">&gt; diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c</FONT>
<FONT COLOR="#737373">&gt; index c7c9e5f162e6..b592aeecc3dd 100644</FONT>
<FONT COLOR="#737373">&gt; --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c</FONT>
<FONT COLOR="#737373">&gt; +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c</FONT>
<FONT COLOR="#737373">&gt; @@ -4469,6 +4469,8 @@ int stmmac_suspend(struct device *dev)</FONT>
<FONT COLOR="#737373">&gt;  		stmmac_mac_set(priv, priv-&gt;ioaddr, false);</FONT>
<FONT COLOR="#737373">&gt;  		pinctrl_pm_select_sleep_state(priv-&gt;device);</FONT>
<FONT COLOR="#737373">&gt;  		/* Disable clock in case of PWM is off */</FONT>
<FONT COLOR="#737373">&gt; +		if (priv-&gt;plat-&gt;clk_ptp_ref)</FONT>
<FONT COLOR="#737373">&gt; +			clk_disable_unprepare(priv-&gt;plat-&gt;clk_ptp_ref);</FONT>

I don't know much embedded, but it seems like this should perhaps just
be clk_disable() without the unprepare? stmmac_hw_teardown() is called
when driver is removed so it needs to unprepare as well.

Please feel free to explain to me why this needs to be
clk_disable_unprepare(), as I said - not an expert.

</PRE>
</BLOCKQUOTE>
As our clock owner's advice, there are prepare/unprepare clk_ops for pll, no enable/disable clk_ops for it, and pll will be off only when the prepare reference count decrease to 0.<BR>
<BR>
so for the sake of power saving, we'd better call clk_disable_unprepare to turn the parent pll off.<BR>
<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
Also - if this is a bug fix and you'd like to have it backported to
older releases you need to add a Fixes tag.
</PRE>
</BLOCKQUOTE>
Thanks for the reminder, I'll add the fixes tag in the next version.
<BLOCKQUOTE TYPE=CITE>
<PRE>

Thanks!

<FONT COLOR="#737373">&gt;&nbsp; 		clk_disable(priv-&gt;plat-&gt;pclk)</FONT>;
</PRE>
</BLOCKQUOTE>
maybe it should be clk_disable_unprepare(priv-&gt;plat-&gt;pclk); here.
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#737373">&gt;  		clk_disable(priv-&gt;plat-&gt;stmmac_clk);</FONT>
<FONT COLOR="#737373">&gt;  	}</FONT>
<FONT COLOR="#737373">&gt; @@ -4535,6 +4537,8 @@ int stmmac_resume(struct device *dev)</FONT>
<FONT COLOR="#737373">&gt;  		/* enable the clk previously disabled */</FONT>
<FONT COLOR="#737373">&gt;  		clk_enable(priv-&gt;plat-&gt;stmmac_clk);</FONT>
<FONT COLOR="#737373">&gt;  		clk_enable(priv-&gt;plat-&gt;pclk);</FONT>
<FONT COLOR="#737373">&gt; +		if (priv-&gt;plat-&gt;clk_ptp_ref)</FONT>
<FONT COLOR="#737373">&gt; +			clk_prepare_enable(priv-&gt;plat-&gt;clk_ptp_ref);</FONT>
<FONT COLOR="#737373">&gt;  		/* reset the phy so that it's ready */</FONT>
<FONT COLOR="#737373">&gt;  		if (priv-&gt;mii)</FONT>
<FONT COLOR="#737373">&gt;  			stmmac_mdio_reset(priv-&gt;mii);</FONT>

</PRE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-Q3P5tXzJvEwDmVurNQeT--

--===============7491688782928807054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7491688782928807054==--
