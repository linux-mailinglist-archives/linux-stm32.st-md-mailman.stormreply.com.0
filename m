Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1047E54E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 16:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 674B4C5F1F7;
	Thu, 23 Dec 2021 15:03:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E9F0C5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640271808; x=1671807808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aD1mewvXbqqunsX5Xqpz33bfhSDk3Xx9zQNCwf7UKxU=;
 b=ebzepBVGKfuuWQvY7bb4HIoC6KbhWJuGQg5nbu3DV5pS2UFJCZMDShmX
 hoI461ZTa1CNSgVX3bneFoq1NL1/Lyu2wpU0/XIdOzFh3GOFn+HqOT48c
 EZN95OEDciNMvP/9G6ya5zKpd2+b2KSZd/Nrs80iHE6Neau8b7Kydm8/J
 CcaMZ+Yqu1sWpOYA8u3+owLGi6tpAucqGYNveCMqgThG+h4xW15gltiGW
 jvpaWK2KYqv3KTCerbGX+d9RxApFNZnuMN6zNwpFDKKZkO7xwsXWZQvC3
 /bB3AMvRP+f70vyqij85A0mPWZsQ06eGb6w2HdM9u2zM2nSLrjZkUBgUl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="221512495"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="221512495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 07:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="614220192"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga002.fm.intel.com with SMTP; 23 Dec 2021 07:03:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Dec 2021 17:03:19 +0200
Date: Thu, 23 Dec 2021 17:03:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Message-ID: <YcSPt+81fuzteeCu@intel.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
 <YcRkB7uWyt4EbcZm@intel.com>
 <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
X-Patchwork-Hint: comment
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 tzimmermann@suse.de, kernel@pengutronix.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@foss.st.com, linux-imx@nxp.com, benjamin.gaignard@linaro.org,
 rodrigo.vivi@intel.com, dmitry.baryshkov@linaro.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make?=
 =?iso-8859-1?q?_format=5Fmod=5Fsupported_truly=A0optional?=
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Dec 23, 2021 at 01:42:32PM +0000, Simon Ser wrote:
> On Thursday, December 23rd, 2021 at 12:56, Ville Syrj=E4l=E4 <ville.syrja=
la@linux.intel.com> wrote:
> =

> > > -	/* If we can't determine support, just bail */
> > > -	if (!plane->funcs->format_mod_supported)
> > > -		goto done;
> > > -
> > >  	mod =3D modifiers_ptr(blob_data);
> > >  	for (i =3D 0; i < plane->modifier_count; i++) {
> > >  		for (j =3D 0; j < plane->format_count; j++) {
> > > -			if (plane->funcs->format_mod_supported(plane,
> > > +			if (!plane->funcs->format_mod_supported ||
> > > +			    plane->funcs->format_mod_supported(plane,
> > >  							       plane->format_types[j],
> > >  							       plane->modifiers[i])) {
> >
> > So instead of skipping the whole loop you just skip doing anything
> > inside the loop? Can't see how that achieves anything at all.
> =

> No, the check is skipped when the function isn't populated by the driver.

Ah right. So we advertise all modifiers in that case. Looks like
drm_plane_check_pixel_format() does support that model, so seems OK.

Another related thing that might be worth checking is whether
drivers generally do anything to validate the modifiers in
the addfb2 ioctl. Looks like i915 and amdgpu are the only ones
to use drm_any_plane_has_format() for that, so all the other
drivers must either be checking it manually (or they're just
potentially broken when handed unexpected modifiers by evil
userspace).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
