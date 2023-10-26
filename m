Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E467D8230
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Oct 2023 14:04:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18F26C6C85A;
	Thu, 26 Oct 2023 12:04:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D828FC6C857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Oct 2023 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698321850; x=1729857850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bPxFPOB+uABI4b6Z29a2Va3fCZZ8fMnOaXE6EGDl+gA=;
 b=SY9PgCic+hostvKEjhdGF1Ap5kxljmnGeZdCtvNGs7ISUBvd9HpddCaC
 tDWBl472C/BlSuTwFxJtTpZNV9JB0bHkqWqGqOYgCA1ObVjnQsyBqTsXa
 8cwNensaYYHozIT/YzzBWY++DHACdA1OefQsJoz4wTED8ezTRup8Dl5i7
 XFH6lP5S1PqVr5P8vX45c79+zSO3A75tJ6e5wW1SOJWj6z6TeZ4Ya/sv8
 K7uT354xxj1hA/mAeskPMupYk2NESGTVFgLlimb7yEbZIZphnbn4kAIfB
 UXrhNqlvKLIL3GE9IolvIoCEe3tlyOg4BXBzgSXGAGSVovf0ZRn1HRMJG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390388816"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="390388816"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 05:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829607382"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="829607382"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 05:04:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 4CEBF11F758;
 Thu, 26 Oct 2023 15:04:00 +0300 (EEST)
Date: Thu, 26 Oct 2023 12:04:00 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <ZTpVsO9pHoPjF_JX@kekkonen.localdomain>
References: <20231010082413.1717919-1-alain.volmat@foss.st.com>
 <20231010082413.1717919-4-alain.volmat@foss.st.com>
 <ZTpJecRqYS0lMEQb@kekkonen.localdomain>
 <20231026113610.GA26306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026113610.GA26306@pendragon.ideasonboard.com>
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

On Thu, Oct 26, 2023 at 02:36:10PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Oct 26, 2023 at 11:11:53AM +0000, Sakari Ailus wrote:
> > On Tue, Oct 10, 2023 at 10:24:03AM +0200, Alain Volmat wrote:
> > > From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > 
> > > This V4L2 subdev driver enables Digital Camera Memory Interface
> > > Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> > > 
> > > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > > ---
> > >  drivers/media/platform/st/stm32/Kconfig       |  15 +
> > >  drivers/media/platform/st/stm32/Makefile      |   1 +
> > >  .../platform/st/stm32/stm32-dcmipp/Makefile   |   4 +
> > >  .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 916 ++++++++++++++++++
> > >  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 555 +++++++++++
> > >  .../st/stm32/stm32-dcmipp/dcmipp-common.c     | 106 ++
> > >  .../st/stm32/stm32-dcmipp/dcmipp-common.h     | 216 +++++
> > >  .../st/stm32/stm32-dcmipp/dcmipp-core.c       | 603 ++++++++++++
> > >  .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   | 441 +++++++++
> > >  9 files changed, 2857 insertions(+)
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > >  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
> 
> [snip]
> 
> > > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> > > new file mode 100644
> > > index 000000000000..4f784c5791e7
> > > --- /dev/null
> > > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> > > @@ -0,0 +1,916 @@
> 
> [snip]
> 
> > > +static const struct dcmipp_bytecap_pix_map *
> > > +dcmipp_bytecap_pix_map_by_pixelformat(u32 pixelformat)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
> > 
> > No need for braces. Up to you.
> 
> For what it's worth, I usually ask for braces in my reviews for these
> kind of cases :-)

Well, if you read the coding style document, you may find this, but people
don't interpret it as strictly anymore anyway. I think it's fine without.

-- 
Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
