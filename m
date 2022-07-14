Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA954574492
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jul 2022 07:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B188C640FE;
	Thu, 14 Jul 2022 05:37:44 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E2FEC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jul 2022 05:37:42 +0000 (UTC)
X-UUID: a829b66066ab4fe5a0dfb8632003a6d2-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:35acadad-c735-4ee9-9101-ce7f9dbbaa1c, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:51
X-CID-INFO: VERSION:1.1.8, REQID:35acadad-c735-4ee9-9101-ce7f9dbbaa1c, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:51
X-CID-META: VersionHash:0f94e32, CLOUDID:604575d7-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:7f55e8085048,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: a829b66066ab4fe5a0dfb8632003a6d2-20220714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2048630554; Thu, 14 Jul 2022 13:37:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 14 Jul 2022 13:37:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 13:37:31 +0800
Message-ID: <9a7fd7770b013c95983e700d2f1e132fbf5429a6.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 14 Jul 2022 13:37:31 +0800
In-Reply-To: <20220713203910.74d36732@kernel.org>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
 <20220713101002.10970-4-biao.huang@mediatek.com>
 <20220713203910.74d36732@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 linux-kernel@vger.kernel.org, Jisheng
 Zhang <jszhang@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v4 3/3] net: stmmac: fix unbalanced
 ptp clock issue in suspend/resume flow
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

Dear Jakub,
	Thanks for your comments~

On Wed, 2022-07-13 at 20:39 -0700, Jakub Kicinski wrote:
> On Wed, 13 Jul 2022 18:10:02 +0800 Biao Huang wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 197fac587ad5..c230b8b9aab1 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -839,14 +839,6 @@ int stmmac_init_tstamp_counter(struct
> > stmmac_priv *priv, u32 systime_flags)
> >  	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
> >  		return -EOPNOTSUPP;
> >  
> > -	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
> > -	if (ret < 0) {
> > -		netdev_warn(priv->dev,
> > -			    "failed to enable PTP reference clock:
> > %pe\n",
> > -			    ERR_PTR(ret));
> > -		return ret;
> > -	}
> > -
> >  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
> >  	priv->systime_flags = systime_flags;
> >  
> 
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:837:6: warning:
> unused variable 'ret' [-Wunused-variable]
>         int ret;
>             ^
OK, I'll fix it in next send.

Best Regards!
Biao

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
