Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5E7D81DF
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Oct 2023 13:36:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E3F4C6C857;
	Thu, 26 Oct 2023 11:36:08 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19CCBC6C83F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Oct 2023 11:36:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C6E983B;
 Thu, 26 Oct 2023 13:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698320152;
 bh=3J1zW6vJbN0ZPEVT41jA29B2NH3cxfkd2aquGwq/Rl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmSyXJohwrhb64vD0qAeYE5ZQKFoszfn9eG61TKV56cR6LOaJncpo388lxekwAb0V
 Cf4auU/IuQi+fHPzxDbtMRrc9W44M1fQfd4UVbhOBSBmVUXQuLoQH9ynKibt5VWu0l
 GnhH5CsdythbIc9q1J35p5BBs6KHoL2JAZB242o4=
Date: Thu, 26 Oct 2023 14:36:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20231026113610.GA26306@pendragon.ideasonboard.com>
References: <20231010082413.1717919-1-alain.volmat@foss.st.com>
 <20231010082413.1717919-4-alain.volmat@foss.st.com>
 <ZTpJecRqYS0lMEQb@kekkonen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTpJecRqYS0lMEQb@kekkonen.localdomain>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] media: stm32-dcmipp: STM32 DCMIPP
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

Hi Sakari,

On Thu, Oct 26, 2023 at 11:11:53AM +0000, Sakari Ailus wrote:
> On Tue, Oct 10, 2023 at 10:24:03AM +0200, Alain Volmat wrote:
> > From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > 
> > This V4L2 subdev driver enables Digital Camera Memory Interface
> > Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> > 
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  drivers/media/platform/st/stm32/Kconfig       |  15 +
> >  drivers/media/platform/st/stm32/Makefile      |   1 +
> >  .../platform/st/stm32/stm32-dcmipp/Makefile   |   4 +
> >  .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 916 ++++++++++++++++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 555 +++++++++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-common.c     | 106 ++
> >  .../st/stm32/stm32-dcmipp/dcmipp-common.h     | 216 +++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-core.c       | 603 ++++++++++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   | 441 +++++++++
> >  9 files changed, 2857 insertions(+)
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

[snip]

> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> > new file mode 100644
> > index 000000000000..4f784c5791e7
> > --- /dev/null
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> > @@ -0,0 +1,916 @@

[snip]

> > +static const struct dcmipp_bytecap_pix_map *
> > +dcmipp_bytecap_pix_map_by_pixelformat(u32 pixelformat)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
> 
> No need for braces. Up to you.

For what it's worth, I usually ask for braces in my reviews for these
kind of cases :-)

> > +		if (dcmipp_bytecap_pix_map_list[i].pixelformat == pixelformat)
> > +			return &dcmipp_bytecap_pix_map_list[i];
> > +	}
> > +
> > +	return NULL;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
