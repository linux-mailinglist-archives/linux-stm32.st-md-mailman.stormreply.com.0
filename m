Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518618BD73
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 18:05:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B38CAC36B0B;
	Thu, 19 Mar 2020 17:05:31 +0000 (UTC)
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D39B8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 17:05:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1AAD32002D;
 Thu, 19 Mar 2020 18:05:24 +0100 (CET)
Date: Thu, 19 Mar 2020 18:05:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <20200319170522.GA29213@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
 <20200319141954.GA25036@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319141954.GA25036@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=9MVmhzcSsuuJt3ktV8oA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Jose Roberto de Souza <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mediatek@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v1 0/3] drm: drm_encoder_init() =>
 drm_encoder_init_funcs()
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

On Thu, Mar 19, 2020 at 03:19:54PM +0100, Sam Ravnborg wrote:
> On Fri, Mar 13, 2020 at 09:17:41PM +0100, Sam Ravnborg wrote:
> > Thomas Zimmermann had made a nice patch-set that introduced
> > drm_simple_encoder_init() which is already present in drm-misc-next.
> > 
> > While looking at this it was suddenly obvious to me that
> > this was functionalty that really should be included in drm_encoder.c
> > The case where the core could handle the callback is pretty
> > common and not part of the simple pipe line.
> > 
> > So after some dialog on dri-devel the conclusion was to go for
> > a change like this:
> > 
> >     drm_encoder_init_funcs() for all users that specified a
> >     drm_encoder_funcs to extend the functionality.
> > 
> >     drm_encoder_init() for all users that did not
> >     need to extend the basic functionality with
> >     drm_encoder_funcs.
> > 
> > A similar approach with a _funcs() prefix is used elsewhere in drm/
> > 
> > This required a rename of the existing users, and
> > a follow-up patch that moves drm_simple_encoder_init()
> > to drm_encoder.c
> > 
> > Patches 3 in this set demonstrate the use of drm_encoder_init().
> > There are many more drivers that can be converted as Thomas
> > has already demonstrated.
> > 
> > This is all based on work done by Thomas Zimmermann,
> > I just wanted to implement my suggestion so
> > we could select the best way forward.
> > 
> > Note: Daniel Vetter has hinted the approach implemented
> > here smelled like middle-layer.
> > IMO this is not so, it is just a way to handle cleanup
> > for the simple cases.
> 
> We discussed this patch-set briefly on irc.
Just to clarify, we in this context was Daniel Vetter & me.

	Sam

> With the upcoming drmm_ changes and such this is bad timing..
> And in the end this may be pointless code-chrunch.
> 
> Patch-set shelfed for now - may re-visit it later.
> 
> 	Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
