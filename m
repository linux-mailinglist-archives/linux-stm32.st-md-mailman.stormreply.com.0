Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA087F9D93
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 11:32:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46933C6B457;
	Mon, 27 Nov 2023 10:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6B01C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701081157; x=1732617157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ZsD2/0d829tjp3/J12DPotTKkJoMGcOkrsxN0arhzI=;
 b=GO47Tq/49HUgcEb2DDdwI/IXsylQWbxXG+IH5xC+KKrLU/HJ7jEPLLpW
 EOdL3j6dOjqLl/DAx5mNNL/MEeBJgSf5WDGWW/SqMsWJV8/fSfE3OtZry
 HmpcufxQN7DuwaJBAr2Htn5XTXOXefABz8trgMoz/EQp3wK62i2A3ajyt
 0EVUGHq3quJbKeLDyHfAD0WcFdyO9nAsoGtLhMn7aTKweZaQepbIJg7Uu
 ETgXMHCWNhnRIrVECXO7q0WjO0Q+tknIwXbrYz1aSLK+LJK07C64T7MFq
 PmATZ4nhm4A1ZLUa1ojb7orBXCd0JjcLZawxmmgbXfwUbC21MZbVfvyMT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377710261"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="377710261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891693461"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="891693461"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:32:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id C8A9711FCD0;
 Mon, 27 Nov 2023 12:32:28 +0200 (EET)
Date: Mon, 27 Nov 2023 10:32:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZWRwPJQA_wNEVD8Y@kekkonen.localdomain>
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
 <20231122073927.788810-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>
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

Hi Alain,

On Wed, Nov 22, 2023 at 08:39:17AM +0100, Alain Volmat wrote:
> From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> 
> This V4L2 subdev driver enables Digital Camera Memory Interface
> Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

One more thing. I think you're missing all the link_validate ops, meaning
it's possible to start the hardware with invalid configuration.

Could you add them? It can be a separate patch. I'll postpone these until
that.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
