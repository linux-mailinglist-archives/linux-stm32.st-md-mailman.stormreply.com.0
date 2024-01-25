Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA583C776
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 17:05:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C8FC6B477;
	Thu, 25 Jan 2024 16:05:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB22C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706198733; x=1737734733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DNTN/lYZe7yjys99DYPQCerRcHwd8OfuFtEe4wkoNhQ=;
 b=GS1wZg1n0DiDbi3jXmJWivhwZ2l8ld6TLe6x3F/6898w6HW3LAn7/l6X
 iA89k1VylP5yHdGCT2YR3dKSqZWfxhMvPy2B508RnCslFBjgopsYBJzgl
 k6xvYI/BInHravdRcwLGXLXvuAnTmwC4GTVYuxaA+B6rq0hvI23ecy4jr
 ywoJvh5twnh8A297Mn6zmH9jpm0uFRDZpYggHJA/cH6goWyBjoAvaVhYp
 hi1ZoYqqNPaQ49rD7a337FkLyyT+/DYvgDdmW66yyE0skilafbDFFag0V
 rnc/bYSBIpYMRdYMagG41mjC+EyyPIEGrTo4P94Ss0D5Gojr23V9kMkkc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401855471"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401855471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="820834834"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820834834"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:03:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 1F56A11FB9B;
 Thu, 25 Jan 2024 18:03:11 +0200 (EET)
Date: Thu, 25 Jan 2024 16:03:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ZbKGPyDkunFgetYG@kekkonen.localdomain>
References: <20240110104642.532011-1-hugues.fruchet@foss.st.com>
 <f7f8344c-7a72-4450-81c7-8bff4569f044@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7f8344c-7a72-4450-81c7-8bff4569f044@foss.st.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [RESEND PATCH v6 0/5] Add support for video
 hardware codec of STMicroelectronics STM32 SoC series
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

Hi Alexandre,

On Wed, Jan 24, 2024 at 01:36:02PM +0100, Alexandre TORGUE wrote:
> > Hugues Fruchet (5):
> >    dt-bindings: media: Document STM32MP25 VDEC & VENC video codecs
> >    media: hantro: add support for STM32MP25 VDEC
> >    media: hantro: add support for STM32MP25 VENC
> >    arm64: dts: st: add video decoder support to stm32mp255
> >    arm64: dts: st: add video encoder support to stm32mp255
> > 
> 
> Sakari, Mauro, do you plan to take patches 1 to 3 on your next branch ?
> I will take DT pacthes in mine but I would like to be sure that dt-binding
> will be applied in a next branch (for the next v6.9 cycle);

This being a codec driver, I presume Hans would pick these.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
