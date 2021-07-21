Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AF3D1103
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 16:18:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BAE4C5A4C0;
	Wed, 21 Jul 2021 14:18:05 +0000 (UTC)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8887EC597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:18:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 76fd54e8-ea2e-11eb-9082-0050568c148b;
 Wed, 21 Jul 2021 14:18:05 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 983C9194B7B;
 Wed, 21 Jul 2021 16:18:17 +0200 (CEST)
Date: Wed, 21 Jul 2021 16:17:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <YPgsl5M6P86iJADt@ravnborg.org>
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: display: panel: Add
 ilitek ili9341 panel bindings
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

Hi Linus,
On Wed, Jul 21, 2021 at 04:00:35PM +0200, Linus Walleij wrote:
> On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:
> 
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Add documentation for "ilitek,ili9341" panel.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

will you take care to push the patches now you did the review?

	Sam
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
