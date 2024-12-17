Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C33C9F54FC
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:51:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66E29C71292;
	Tue, 17 Dec 2024 17:51:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8247C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:51:08 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDBdTH020718;
 Tue, 17 Dec 2024 18:50:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=3oP6+2VfItySxxZd4IKwb6Ta
 Bv9qEDS8nvQbQadTer4=; b=2r7r1D6AP+fumgUQkT1l+AbeZhXaNhZ6eJQ3daX3
 Pf8TCj3FmP1gW/DEzkOBJnRZt9ewzd5R1sQhfCUVMVeV9NctC32nyY7sa7dNtYP/
 7/qXdKcjRe6GMs+7RCIwXLGJR2Do7rtiQ8PK4uoLvvzgalMxnH9LQngT/7sJ6yma
 SAVd89+W7gjuw08ibK0kKGwJUOcnvN5Ek8eWbo0EW/arpXVdeMAMtEh7wngAVGqT
 slzPG+LwOsLFwJFTtSFJ88pY7SAMbascpUG+30Wsa75H/xPTv48xBij+fbVLNV6h
 pa5OpUr+51J1BNxtVkoOPVPx7GpFT6If/ZKyR7ZC3LB7QA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5dgtyp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:50:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D4F340044;
 Tue, 17 Dec 2024 18:49:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3E5B28FD92;
 Tue, 17 Dec 2024 18:47:24 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:47:24 +0100
Date: Tue, 17 Dec 2024 18:47:22 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Message-ID: <20241217174722.GC3784949@gnbcxd0016.gnb.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
 <20241212-csi_dcmipp_mp25-v4-13-fbeb55a05ed7@foss.st.com>
 <Z17Ry6Z9OMqP1MV-@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z17Ry6Z9OMqP1MV-@valkosipuli.retiisi.eu>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 13/15] media: stm32: dcmipp: add core
 support for the stm32mp25
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

Hi Sakari,

On Sun, Dec 15, 2024 at 12:55:39PM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Thu, Dec 12, 2024 at 10:17:37AM +0100, Alain Volmat wrote:
> > The stm32mp25 supports both parallel & csi inputs.
> > An additional clock control is necessary.
> > Skeleton of the subdev structures for the stm32mp25 is added,
> > identical for the time being to the stm32mp13 however more subdeves
> > will be added in further commits.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> > v4:
> >   - correct clock handling within dcmipp_runtime_resume
> > ---
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 104 +++++++++++++++++----
> >  1 file changed, 85 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > index 62dd17e0488d..71acf539e1f3 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -40,6 +40,7 @@ struct dcmipp_device {
> >  
> >  	/* Hardware resources */
> >  	void __iomem			*regs;
> > +	struct clk			*mclk;
> >  	struct clk			*kclk;
> >  
> >  	/* The pipeline configuration */
> > @@ -132,6 +133,40 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
> >  	.hw_revision	= DCMIPP_STM32MP13_VERR
> >  };
> >  
> > +static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
> > +	{
> > +		.name = "dcmipp_input",
> > +		.init = dcmipp_inp_ent_init,
> > +		.release = dcmipp_inp_ent_release,
> > +	},
> > +	{
> > +		.name = "dcmipp_dump_postproc",
> > +		.init = dcmipp_byteproc_ent_init,
> > +		.release = dcmipp_byteproc_ent_release,
> > +	},
> > +	{
> > +		.name = "dcmipp_dump_capture",
> > +		.init = dcmipp_bytecap_ent_init,
> > +		.release = dcmipp_bytecap_ent_release,
> > +	},
> > +};
> > +
> > +static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
> > +	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
> > +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> > +	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
> > +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> > +};
> > +
> > +#define DCMIPP_STM32MP25_VERR  0x30
> > +static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
> > +	.ents		= stm32mp25_ent_config,
> > +	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
> > +	.links		= stm32mp25_ent_links,
> > +	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
> > +	.hw_revision    = DCMIPP_STM32MP25_VERR
> > +};
> > +
> >  #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
> >  			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
> >  			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
> > @@ -212,6 +247,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
> >  
> >  static const struct of_device_id dcmipp_of_match[] = {
> >  	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg },
> > +	{ .compatible = "st,stm32mp25-dcmipp", .data = &stm32mp25_pipe_cfg },
> >  	{ /* end node */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, dcmipp_of_match);
> > @@ -261,13 +297,22 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  {
> >  	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
> >  	unsigned int ret;
> > -	int src_pad;
> > +	int src_pad, i;
> 
> unsigned int?

Done

> 
> >  	struct dcmipp_ent_device *sink;
> > -	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_PARALLEL };
> > +	struct v4l2_fwnode_endpoint vep = { 0 };
> >  	struct fwnode_handle *ep;
> > +	enum v4l2_mbus_type supported_types[] = {
> > +		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	int supported_types_nb = ARRAY_SIZE(supported_types);
> >  
> >  	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
> >  
> > +	/* Only MP25 supports CSI input */
> > +	if (!of_device_is_compatible(dcmipp->dev->of_node,
> > +				     "st,stm32mp25-dcmipp"))
> 
> This would be much cleaner with match data. You seem to already be using it
> for other purposes. 

Added a new boolean within the match structure to indicate if csi is
supported or not.

> 
> > +		supported_types_nb--;
> > +
> >  	/*
> >  	 * Link this sub-device to DCMIPP, it could be
> >  	 * a parallel camera sensor or a CSI-2 to parallel bridge
> > @@ -284,21 +329,23 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  		return -ENODEV;
> >  	}
> >  
> > -	/* Check for parallel bus-type first, then bt656 */
> > -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -	if (ret) {
> > -		vep.bus_type = V4L2_MBUS_BT656;
> > +	/* Check for supported MBUS type */
> > +	for (i = 0; i < supported_types_nb; i++) {
> > +		vep.bus_type = supported_types[i];
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -		if (ret) {
> > -			dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> > -			fwnode_handle_put(ep);
> > -			return ret;
> > -		}
> > +		if (!ret)
> > +			break;
> >  	}
> >  
> >  	fwnode_handle_put(ep);
> >  
> > -	if (vep.bus.parallel.bus_width == 0) {
> > +	if (ret) {
> > +		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> > +		return ret;
> > +	}
> > +
> > +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> > +	    vep.bus.parallel.bus_width == 0) {
> >  		dev_err(dcmipp->dev, "Invalid parallel interface bus-width\n");
> >  		return -ENODEV;
> >  	}
> > @@ -311,11 +358,13 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  		return -ENODEV;
> >  	}
> >  
> > -	/* Parallel input device detected, connect it to parallel subdev */
> > +	/* Connect input device to the dcmipp_input subdev */
> >  	sink = dcmipp->entity[ID_INPUT];
> > -	sink->bus.flags = vep.bus.parallel.flags;
> > -	sink->bus.bus_width = vep.bus.parallel.bus_width;
> > -	sink->bus.data_shift = vep.bus.parallel.data_shift;
> > +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> > +		sink->bus.flags = vep.bus.parallel.flags;
> > +		sink->bus.bus_width = vep.bus.parallel.bus_width;
> > +		sink->bus.data_shift = vep.bus.parallel.data_shift;
> > +	}
> >  	sink->bus_type = vep.bus_type;
> >  	ret = media_create_pad_link(&subdev->entity, src_pad, sink->ent, 0,
> >  				    MEDIA_LNK_FL_IMMUTABLE |
> > @@ -414,7 +463,7 @@ static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
> >  static int dcmipp_probe(struct platform_device *pdev)
> >  {
> >  	struct dcmipp_device *dcmipp;
> > -	struct clk *kclk;
> > +	struct clk *kclk, *mclk;
> >  	const struct dcmipp_pipeline_config *pipe_cfg;
> >  	struct reset_control *rstc;
> >  	int irq;
> > @@ -474,12 +523,20 @@ static int dcmipp_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	kclk = devm_clk_get(&pdev->dev, NULL);
> > +	kclk = devm_clk_get(&pdev->dev, "kclk");
> >  	if (IS_ERR(kclk))
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
> >  				     "Unable to get kclk\n");
> >  	dcmipp->kclk = kclk;
> >  
> > +	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
> 
> Same here.

Done as well via match structure.

> 
> > +		mclk = devm_clk_get(&pdev->dev, "mclk");
> > +		if (IS_ERR(mclk))
> > +			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> > +					     "Unable to get mclk\n");
> > +		dcmipp->mclk = mclk;
> > +	}
> > +
> >  	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
> >  				      sizeof(*dcmipp->entity), GFP_KERNEL);
> >  	if (!dcmipp->entity)
> > @@ -542,6 +599,7 @@ static int dcmipp_runtime_suspend(struct device *dev)
> >  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
> >  
> >  	clk_disable_unprepare(dcmipp->kclk);
> > +	clk_disable_unprepare(dcmipp->mclk);
> >  
> >  	return 0;
> >  }
> > @@ -551,9 +609,17 @@ static int dcmipp_runtime_resume(struct device *dev)
> >  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > +	ret = clk_prepare_enable(dcmipp->mclk);
> > +	if (ret) {
> > +		dev_err(dev, "%s: Failed to prepare_enable mclk\n", __func__);
> > +		return ret;
> > +	}
> > +
> >  	ret = clk_prepare_enable(dcmipp->kclk);
> > -	if (ret)
> > +	if (ret) {
> > +		clk_disable_unprepare(dcmipp->mclk);
> >  		dev_err(dev, "%s: Failed to prepare_enable kclk\n", __func__);
> > +	}
> >  
> >  	return ret;
> >  }
> > 
> > 
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
