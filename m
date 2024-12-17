Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104C9F5884
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 22:13:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15697C78012;
	Tue, 17 Dec 2024 21:13:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97DF0C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734469991; x=1766005991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RSlut8jUC8sevFzKiIGq9DG8Ecu/yvybyXCy7aSosFQ=;
 b=lOwrjf0gQ6XeudG9LwEfbw7aZyGyM+2a1hEsisWodRsH9xXOojOQnwlW
 CGDUZsDiOGFJl9SD0CncFoTfpS8BO8PQjIPcupbujeimXcwsdzCF1UtGp
 w7ksGenzJuKHX9trFEtFKnRQTMcQfxjZqFEESkX2SH13ysDbjSN2NrSMa
 6neSfqo303niNROpLVkK46KBxY5/n98fdLRmuv2/N/8WBFXrG3lLkGPhE
 dWrTS7FGtcOIK+cw6Mu1UEwGqXi8LPaHPG45Pakdhv5yYJxluzrXXiKRS
 6pT9in3NvZ1HC9mA3pcw0yz2d8tE7sASJ5g1baKLJSy35R1TanE6bPBqG Q==;
X-CSE-ConnectionGUID: OmfnLTpKTJup1WpLgGp7Og==
X-CSE-MsgGUID: vVWMWnn0ToeQUWAp9QBYhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34640516"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34640516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 13:13:03 -0800
X-CSE-ConnectionGUID: zNA3MaSrSiiBsrQK8IoBcA==
X-CSE-MsgGUID: TS6rTs+rQfySfEs9bMD6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98457163"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 13:12:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id E9F8C11F89A;
 Tue, 17 Dec 2024 23:12:55 +0200 (EET)
Date: Tue, 17 Dec 2024 21:12:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217-crawfish-tiring-792c535301d0@spud>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: media: clarify stm32 csi
 & simplify example
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

Hi Conor,

On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > D-PHY.
> 
> > Remove the bus-type property from the example.
> 
> Why? What's there to gain from the example being (seemingly?) less
> comprehensive?

As the device has D-PHY, other options are excluded. I.e. that property is
redundant for this device.

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > index 33bedfe41924..e9fa3cfea5d2 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: STMicroelectronics STM32 CSI controller
> >  
> >  description:
> > -  The STM32 CSI controller allows connecting a CSI based
> > -  camera to the DCMIPP camera pipeline.
> > +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
> > +  based camera to the DCMIPP camera pipeline.
> >  
> >  maintainers:
> >    - Alain Volmat <alain.volmat@foss.st.com>
> > @@ -109,7 +109,6 @@ examples:
> >                  endpoint {
> >                      remote-endpoint = <&imx335_ep>;
> >                      data-lanes = <1 2>;
> > -                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                  };
> >              };
> >  
> > 

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
