Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1904F8BDC
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 03:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11A28C628B0;
	Fri,  8 Apr 2022 01:42:22 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82E43C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 01:42:19 +0000 (UTC)
X-UUID: 860e54d77ec040c5a98a4ae2c7253c72-20220408
X-UUID: 860e54d77ec040c5a98a4ae2c7253c72-20220408
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 972807619; Fri, 08 Apr 2022 09:42:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 09:42:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 09:42:10 +0800
Message-ID: <429d177cf655c82fbe37e93b3cb452bd08ab3b5e.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 8 Apr 2022 09:42:10 +0800
In-Reply-To: <f04154f2908d3420bc48ed35273a1d4866bd40af.camel@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
 <f04154f2908d3420bc48ed35273a1d4866bd40af.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, moudy.ho@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com, hsinyi@chromium.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, postmaster@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Fabien
 Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 John 'Warthog9' Hawley <warthog9@eaglescrag.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND v17 3/7] soc: mediatek: add mtk-mmsys
 support for mt8195 vdosys0
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

Hi CK,

Thanks for the reviews.

On Thu, 2022-04-07 at 13:58 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> > 1. Add mt8195 mmsys compatible for vdosys0.
> > 2. Add mt8195 routing table settings and fix build fail.
> > 3. Add clock name, clock driver name and routing table into the
> > driver data
> >    of mt8195 vdosys0.
> > 4. Add get match data by clock name function and clock platform
> > labels
> >    to identify which mmsys node is corresponding to vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > 
> 
> [snip]
> 
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data
> > = {
> > +	.clk_name = "cfg_vdo0",
> > +	.clk_driver = "clk-mt8195-vdo0",
> > +	.routes = mmsys_mt8195_routing_table,
> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +};
> > +
> > 
> 
> [snip]
> 
> >  
> > +static int mtk_mmsys_get_match_data_by_clk_name(const struct
> > mtk_mmsys_driver_data **data,
> > +						struct device *dev)
> > +{
> > +	int i;
> > +	struct clk *clk;
> > +	const char *clk_name;
> > +	const struct of_device_id *of_id =
> > of_match_node(mtk_clk_platform_labels,
> > +							 dev->of_node);
> > +	const struct mtk_mmsys_driver_data *drvdata[] = {
> > +		&mt8195_vdosys0_driver_data,
> > +	};
> > +
> > +	if (!of_id || !of_id->data) {
> > +		dev_err(dev, "Can't find match clk platform labels\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(dev, "failed to get mmsys clk\n");
> > +		return PTR_ERR(clk);
> > +	}
> > +
> > +	clk_name = __clk_get_name(clk);
> > +	if (!clk_name) {
> > +		dev_err(dev, "invalid mmsys clk name\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
> > +		if (strncmp(drvdata[i]->clk_name, clk_name,
> > strlen(clk_name)) == 0 &&
> 
> Why not
> 
> strcmp(drvdata[i]->clk_name, clk_name) == 0
> 
> Regards,
> CK
> 

I would like to block strings without '\0', but it doesn't seem
necessary. So I will change to strcmp at the next version.

Regards,
Jason-JH.Lin

> > +		    strncmp(drvdata[i]->clk_driver, of_id->data,
> > strlen(of_id->data)) == 0) {
> > +			*data = drvdata[i];
> > +			return 0;
> > +		}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0MJsfiFOYUann5GooGDcIv4Lgm1FaCXDl8dDFCwiONgD0zJn0PQwJuV05-tZNZwVBxVS$
>  
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
