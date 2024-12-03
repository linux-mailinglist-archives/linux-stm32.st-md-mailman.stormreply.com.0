Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A049E16B3
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 10:07:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B088C6C83D;
	Tue,  3 Dec 2024 09:07:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4CE8C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 09:07:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7AE1BA40F77;
 Tue,  3 Dec 2024 09:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D721C4CECF;
 Tue,  3 Dec 2024 09:07:33 +0000 (UTC)
Message-ID: <832ee6b4-8238-4ef6-b870-f541b744880b@xs4all.nl>
Date: Tue, 3 Dec 2024 10:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
 <20241118-csi_dcmipp_mp25-v3-13-c1914afb0a0f@foss.st.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-13-c1914afb0a0f@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 13/15] media: stm32: dcmipp: add core
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

Hi Alain,

On 18/11/2024 14:35, Alain Volmat wrote:
> The stm32mp25 supports both parallel & csi inputs.
> An additional clock control is necessary.
> Skeleton of the subdev structures for the stm32mp25 is added,
> identical for the time being to the stm32mp13 however more subdeves
> will be added in further commits.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 98 ++++++++++++++++++----
>  1 file changed, 80 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index d2cc19bb40d77f67a1f5fe565bc62f45eff2d266..0087f9017f024ba6b918b99c1ef39212ad6b881a 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -40,6 +40,7 @@ struct dcmipp_device {
>  
>  	/* Hardware resources */
>  	void __iomem			*regs;
> +	struct clk			*mclk;
>  	struct clk			*kclk;
>  
>  	/* The pipeline configuration */
> @@ -132,6 +133,40 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
>  	.hw_revision	= DCMIPP_STM32MP13_VERR
>  };
>  
> +static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
> +	{
> +		.name = "dcmipp_input",
> +		.init = dcmipp_inp_ent_init,
> +		.release = dcmipp_inp_ent_release,
> +	},
> +	{
> +		.name = "dcmipp_dump_postproc",
> +		.init = dcmipp_byteproc_ent_init,
> +		.release = dcmipp_byteproc_ent_release,
> +	},
> +	{
> +		.name = "dcmipp_dump_capture",
> +		.init = dcmipp_bytecap_ent_init,
> +		.release = dcmipp_bytecap_ent_release,
> +	},
> +};
> +
> +static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
> +	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +};
> +
> +#define DCMIPP_STM32MP25_VERR  0x30
> +static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
> +	.ents		= stm32mp25_ent_config,
> +	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
> +	.links		= stm32mp25_ent_links,
> +	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
> +	.hw_revision    = DCMIPP_STM32MP25_VERR
> +};
> +
>  #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
>  			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
>  			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
> @@ -212,6 +247,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  
>  static const struct of_device_id dcmipp_of_match[] = {
>  	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg },
> +	{ .compatible = "st,stm32mp25-dcmipp", .data = &stm32mp25_pipe_cfg },
>  	{ /* end node */ },
>  };
>  MODULE_DEVICE_TABLE(of, dcmipp_of_match);
> @@ -261,13 +297,22 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  {
>  	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
>  	unsigned int ret;
> -	int src_pad;
> +	int src_pad, i;
>  	struct dcmipp_ent_device *sink;
> -	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_PARALLEL };
> +	struct v4l2_fwnode_endpoint vep = { 0 };
>  	struct fwnode_handle *ep;
> +	enum v4l2_mbus_type supported_types[] = {
> +		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
> +	};
> +	int supported_types_nb = ARRAY_SIZE(supported_types);
>  
>  	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
>  
> +	/* Only MP25 supports CSI input */
> +	if (!of_device_is_compatible(dcmipp->dev->of_node,
> +				     "st,stm32mp25-dcmipp"))
> +		supported_types_nb--;
> +
>  	/*
>  	 * Link this sub-device to DCMIPP, it could be
>  	 * a parallel camera sensor or a CSI-2 to parallel bridge
> @@ -284,21 +329,23 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  		return -ENODEV;
>  	}
>  
> -	/* Check for parallel bus-type first, then bt656 */
> -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -	if (ret) {
> -		vep.bus_type = V4L2_MBUS_BT656;
> +	/* Check for supported MBUS type */
> +	for (i = 0; i < supported_types_nb; i++) {
> +		vep.bus_type = supported_types[i];
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -		if (ret) {
> -			dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> -			fwnode_handle_put(ep);
> -			return ret;
> -		}
> +		if (!ret)
> +			break;
>  	}
>  
>  	fwnode_handle_put(ep);
>  
> -	if (vep.bus.parallel.bus_width == 0) {
> +	if (ret) {
> +		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> +		return ret;
> +	}
> +
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    vep.bus.parallel.bus_width == 0) {
>  		dev_err(dcmipp->dev, "Invalid parallel interface bus-width\n");
>  		return -ENODEV;
>  	}
> @@ -311,11 +358,13 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  		return -ENODEV;
>  	}
>  
> -	/* Parallel input device detected, connect it to parallel subdev */
> +	/* Connect input device to the dcmipp_input subdev */
>  	sink = dcmipp->entity[ID_INPUT];
> -	sink->bus.flags = vep.bus.parallel.flags;
> -	sink->bus.bus_width = vep.bus.parallel.bus_width;
> -	sink->bus.data_shift = vep.bus.parallel.data_shift;
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		sink->bus.flags = vep.bus.parallel.flags;
> +		sink->bus.bus_width = vep.bus.parallel.bus_width;
> +		sink->bus.data_shift = vep.bus.parallel.data_shift;
> +	}
>  	sink->bus_type = vep.bus_type;
>  	ret = media_create_pad_link(&subdev->entity, src_pad, sink->ent, 0,
>  				    MEDIA_LNK_FL_IMMUTABLE |
> @@ -414,7 +463,7 @@ static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
>  static int dcmipp_probe(struct platform_device *pdev)
>  {
>  	struct dcmipp_device *dcmipp;
> -	struct clk *kclk;
> +	struct clk *kclk, *mclk;
>  	const struct dcmipp_pipeline_config *pipe_cfg;
>  	struct reset_control *rstc;
>  	int irq;
> @@ -474,12 +523,20 @@ static int dcmipp_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	kclk = devm_clk_get(&pdev->dev, NULL);
> +	kclk = devm_clk_get(&pdev->dev, "kclk");
>  	if (IS_ERR(kclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
>  				     "Unable to get kclk\n");
>  	dcmipp->kclk = kclk;
>  
> +	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
> +		mclk = devm_clk_get(&pdev->dev, "mclk");
> +		if (IS_ERR(mclk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> +					     "Unable to get mclk\n");
> +		dcmipp->mclk = mclk;
> +	}
> +
>  	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
>  				      sizeof(*dcmipp->entity), GFP_KERNEL);
>  	if (!dcmipp->entity)
> @@ -542,6 +599,7 @@ static int dcmipp_runtime_suspend(struct device *dev)
>  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
>  
>  	clk_disable_unprepare(dcmipp->kclk);
> +	clk_disable_unprepare(dcmipp->mclk);
>  
>  	return 0;
>  }
> @@ -551,6 +609,10 @@ static int dcmipp_runtime_resume(struct device *dev)
>  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
>  	int ret;
>  
> +	ret = clk_prepare_enable(dcmipp->mclk);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to prepare_enable mclk\n", __func__);
> +

Shouldn't this return on error?

>  	ret = clk_prepare_enable(dcmipp->kclk);
>  	if (ret)
>  		dev_err(dev, "%s: Failed to prepare_enable kclk\n", __func__);

And on error here, it should call clk_disable_unprepare for mclk.

> 

This was reported by smatch:

.../dcmipp-core.c:620 dcmipp_runtime_resume() warn: 'dcmipp->mclk' from clk_prepare_enable() not released on lines: 620.

Everything else in this series looks good to me, so you can either post a fix for this
and I will fold it into this 13/15 patch, or you post an updated v3.1 13/15 patch.
Or of course a v4, if you prefer.

Regards,

	Hans
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
