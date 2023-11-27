Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFD7F9DDE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 11:43:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB216C6B457;
	Mon, 27 Nov 2023 10:43:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECED8C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701081833; x=1732617833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AH0RtqoF4KI3vHwA85rjVB2jP494O9yweQmmJkW6BU0=;
 b=dKt/UvcZxwSs7nqpGDaZ3kTVIp4xUA+9+f+4LSBxEwXZ7W2xYCTSuIZ9
 3cNmshHr7N6+Na83BLv9Cx//gjLJlnmvLLTfKw5FGl34H9xxeOSapECQw
 3CChZfmmr6pPTS9yxrEzhYw3N5XnU+EsszfRRI4gw5ZxPKriFLKFmyVKZ
 sFanx1KMIkDNb8Wd9rZiIjhDkyOWWSvelD219s+7AsKhwnBsDkVMABKF1
 /2SNM5k4P3S1MWqA0po3pE075peV7OjylUHNF8zB4bRt4e9+MhYLkRWA7
 9eFwZ9QSLFl8lCTt3Bpsq+KsQFeWKdbjY1Fp9aNLAnpASASsHXF1nKhnh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389825255"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="389825255"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="838661037"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="838661037"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:43:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 77F4511FCD0;
 Mon, 27 Nov 2023 12:33:15 +0200 (EET)
Date: Mon, 27 Nov 2023 10:33:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZWRwa2ImfkZMI8Xz@kekkonen.localdomain>
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-1-alain.volmat@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v8 0/5] Add support for DCMIPP camera
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

On Wed, Nov 22, 2023 at 08:39:14AM +0100, Alain Volmat wrote:
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

The DTS changes will presumably be merged via a different tree, right?

-- 
Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
