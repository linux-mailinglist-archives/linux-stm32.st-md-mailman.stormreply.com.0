Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A77F1EA0
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Nov 2023 22:18:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF83EC6B469;
	Mon, 20 Nov 2023 21:18:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27BBDC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Nov 2023 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515130; x=1732051130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xYtfmY3EVWUKUBltmFEPvtVvDbJhLP5vaAHjt99/IKw=;
 b=fsWWbF5z4275N8cuvz7H14KGSA0YHnhRcq1yjm4UgqLTssv0EhqpgQSu
 OUvFupaEUFlpW+7ELrf8BkEpbEvXXAvRM2yJthRqg7HEDs+LYwQJnPfRY
 p1Dx+o+Bb6aXeRGpVBYv/Z53HgrlQ1rg/+OaYRGXnxPaNbjz9I+/miI/M
 YsRlJQWhqnQECmUQuWZo2zGManAzsEbWtfO57yN5S+fFKP+UTE3vkTzvS
 Xexyt4ka6qCoGdKg9FbFEk2rU3Pu6RIc8OMY4FtbZHoWcYKUE2oezd9xS
 rTjB+5KpsHRG81KBs98I90cvZvackFI6jFZlktioulea93fYnUtOb65Zg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388860361"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="388860361"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716329079"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="716329079"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:18:42 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 423A911FAC4;
 Mon, 20 Nov 2023 23:18:40 +0200 (EET)
Date: Mon, 20 Nov 2023 21:18:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231120170809.728941-1-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Mon, Nov 20, 2023 at 06:07:56PM +0100, Alain Volmat wrote:
> This patchset introduces support for Digital Camera Memory Interface
> Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.
> 
> This initial support implements a single capture pipe
> allowing RGB565, YUV, Y, RAW8 and JPEG capture with
> frame skipping, prescaling and cropping.
> 
> DCMIPP is exposed through 3 subdevices:
> - dcmipp_dump_parallel: parallel interface handling
> - dcmipp_dump_postproc: frame skipping, prescaling and cropping control
> - dcmipp_dump_capture: video device capture node
> 
> v7:
>   - correct byteproc set_fmt handling and compose/crop/fmt handling
>   - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*

Can you rebase this on my my linuxtv.org tree master branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>?

These will be called v4l2_subdev_state_get_* now.

Thanks.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
