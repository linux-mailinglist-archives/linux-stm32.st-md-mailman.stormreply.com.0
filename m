Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A18AF7FA19C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 14:55:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 512B4C6B469;
	Mon, 27 Nov 2023 13:55:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FDBDC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 13:55:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AR8W491020325; Mon, 27 Nov 2023 14:55:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=selector1; bh=c7sVCLbdbIsSSVXrD1aEo
 LgXUO8xa7qqmhRYF03VJgc=; b=1XjDfyKOELRTgDd6RM601zZBHKa4C6eUWK7Tj
 Ml4RnWHCCSMR8PjBTOkvJqqUvJ4/3XZycnRSif74GQKGsp5JsyyT7sOCLRGl7Bud
 +JkYOozYc2E81/a81bSylEIkSoM6A4qe+wgrsfhyCWxaXCTroo3+8E06iowGGTdx
 OouPXrukmWxNgndazEobvaFEbF5jjPvJ14E1GuWAZMgKF6OTNM3SIeHaHUfrBq/A
 lX6jbm7BxMmA3YQCBdqe650rbxtN73bdvs9SssGs/5AfdE4i/7hP120VxQIhd/fM
 gs6ka3dMgkBzhNNbg28xc0JwqNrijwS63dHQA4YbT7QUzWVEA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjqq1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 14:55:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAF7610002A;
 Mon, 27 Nov 2023 14:55:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D189A2291C4;
 Mon, 27 Nov 2023 14:55:08 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 27 Nov
 2023 14:55:08 +0100
Date: Mon, 27 Nov 2023 14:55:03 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Message-ID: <20231127135503.GA1423796@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
 <20231122073927.788810-4-alain.volmat@foss.st.com>
 <ba856a09de62a6ddbf1c19d5fd502de1cbc3e273.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba856a09de62a6ddbf1c19d5fd502de1cbc3e273.camel@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_11,2023-11-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP
 camera interface driver
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

Hi Philipp,

On Mon, Nov 27, 2023 at 12:38:21PM +0100, Philipp Zabel wrote:
> On Mi, 2023-11-22 at 08:39 +0100, Alain Volmat wrote:
> > From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > 
> > This V4L2 subdev driver enables Digital Camera Memory Interface
> > Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> > 
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> [...]
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > new file mode 100644
> > index 000000000000..28ddb26314c3
> > --- /dev/null
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -0,0 +1,604 @@
> [...]
> > +struct dcmipp_device {
> > +	/* The platform device */
> > +	struct platform_device		pdev;
> > +	struct device			*dev;
> > +
> > +	/* Hardware resources */
> > +	struct reset_control		*rstc;
> 
> As long as rstc is only used in dcmipp_probe(), there is no need to
> carry it around in struct dcmipp_device.

Oups, thanks.  Indeed, in first series reset was being used in another
place but this is no longer necessary now.  Thanks.

I fixed this and will push it into the v9.

Regards,
Alain
> 
> [...]
> > +static int dcmipp_probe(struct platform_device *pdev)
> > +{
> > +	struct dcmipp_device *dcmipp;
> > +	struct clk *kclk;
> 
> rstc could be a local variable here.
> 
> [...]
> 
> > +	/* Get hardware resources from devicetree */
> > +	dcmipp->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +	if (IS_ERR(dcmipp->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dcmipp->rstc),
> > +				     "Could not get reset control\n");
> [...]
> > +	/* Reset device */
> > +	ret = reset_control_assert(dcmipp->rstc);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to assert the reset line\n");
> > +		return ret;
> > +	}
> > +
> > +	usleep_range(3000, 5000);
> > +
> > +	ret = reset_control_deassert(dcmipp->rstc);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
> > +		return ret;
> > +	}
> 
> regards
> Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
