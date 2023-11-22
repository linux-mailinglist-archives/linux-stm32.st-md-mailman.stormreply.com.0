Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 502487F3FA6
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 09:07:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9BC8C6B475;
	Wed, 22 Nov 2023 08:07:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0562EC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700640444; x=1732176444;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=HzCmIqjiD/db2OVbbJ6fw6PB9pWnFmcUdmjHwNUjwaw=;
 b=MOalOvKJ78Ct2uiEiEwC6arlT7jvSHo1IuETCBAjuksslUAJPivSstbi
 b5Wm3HiBZAhK2ghDGCgTCwSCKI+MTCXd+xTfVna901sxl+oj2zhhqnYu+
 b6FutLNiPY4fNtGhoQk88kRhrWm4VGV7C+oOhDu9LzoaBXJBATpXqOUM2
 bdiSzvo6cjLXrIvn8IccRENbY03TmwKl8/nArv/6dhW78Mm2Ug9ZfpCRi
 fReQU2InmbQYy7dJ29cvjvzKdCW6dft3xsI7tQonStInTslJz5NmqLWGa
 vhT6H8++XBLi6voQi1szSHb+lzSV2++8a2EgDrjglSm90Q6I4jNLXAimm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478214284"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="478214284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832934951"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="832934951"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:07:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 110AF1202B6;
 Wed, 22 Nov 2023 10:07:14 +0200 (EET)
Date: Wed, 22 Nov 2023 08:07:14 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <ZV22srRYwqKf3eKs@kekkonen.localdomain>
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
 <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
 <20231122074404.GA787777@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122074404.GA787777@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH v7 0/5] Add support for DCMIPP camera
 interface of STMicroelectronics STM32 SoC series
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

On Wed, Nov 22, 2023 at 08:44:04AM +0100, Alain Volmat wrote:
> Hi Sakari,
> 
> On Mon, Nov 20, 2023 at 09:18:40PM +0000, Sakari Ailus wrote:
> > Hi Alain,
> > 
> > On Mon, Nov 20, 2023 at 06:07:56PM +0100, Alain Volmat wrote:
> > > This patchset introduces support for Digital Camera Memory Interface
> > > Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.
> > > 
> > > This initial support implements a single capture pipe
> > > allowing RGB565, YUV, Y, RAW8 and JPEG capture with
> > > frame skipping, prescaling and cropping.
> > > 
> > > DCMIPP is exposed through 3 subdevices:
> > > - dcmipp_dump_parallel: parallel interface handling
> > > - dcmipp_dump_postproc: frame skipping, prescaling and cropping control
> > > - dcmipp_dump_capture: video device capture node
> > > 
> > > v7:
> > >   - correct byteproc set_fmt handling and compose/crop/fmt handling
> > >   - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*
> > 
> > Can you rebase this on my my linuxtv.org tree master branch
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>?
> > 
> > These will be called v4l2_subdev_state_get_* now.
> 
> Ok, serie v8 is now rebased on top of the master branch of your tree.
> I'm going to push the rebased gc2145 sensor driver as well in a moment.

Thanks. Hans said he's going to merge the API change later this week (Mauro
might do that earlier), I'll take these then.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
