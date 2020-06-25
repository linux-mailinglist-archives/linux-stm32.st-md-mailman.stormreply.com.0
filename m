Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66025209AD0
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2020 09:53:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E287C36B0C;
	Thu, 25 Jun 2020 07:53:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B4CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 07:53:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f18so4912645wml.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QhFF+JhtH5OrbA2XVfa4DEMoq1rPmq5A541noBohoEI=;
 b=dbum92HacgzVfcv5HyBVk4jTj4zjsMSRuPnugG4qBlK9zxfz+PiLRjLwKR6lr2PW+0
 E8QWSPaMgLpkHkyRw5PCAzc4dC2wDWRk37C+K0E2B7QdTiRDa73eLJG7aZG706RoTmKe
 4AlhpK9mFuUPoMxycv+1Km95Zufyc/4TO2i0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QhFF+JhtH5OrbA2XVfa4DEMoq1rPmq5A541noBohoEI=;
 b=JU0XAmc1HFE84G0Ne0x9Ce4wwuEmhf+IEd32FvRg8h4ByzoYwT7O3jFcAmpgDK5wdW
 B1Tnxt0dBHN/wELBCBo1lpzM+IlO5BCYsNubjo5fGCMWo8BGL17Xf6P3Bx+N+hdNa8OD
 f54PbEvpz6kfNKe0Vh7bYXV/JufLcoNG9582TZl4rEKfBPOAoQoTClBTEZATkARK0Fyi
 weK0+Ow983hlkyhfrlp2sQO+Z33L36gY5AGnRqODpe1pcMIDlckFVkRUpdUSqpEpncHp
 5Z3CPHJF/ZFBDO477Dcy6tkctd3fnS9BZB3L7AQICSeeRZi7adPqxYu1u4VJ6X4S0fsN
 jiZQ==
X-Gm-Message-State: AOAM5310y56HhtSW0oBf0oTn1ZF+omigSIOYqY4CGZ2BP9HMlY0C/Jla
 9wV5VV0xg0RK/cFy6yrLDRgySw==
X-Google-Smtp-Source: ABdhPJwk5m6H2Tp1NSk8W7Q7efXaGQpX9fClYnMmVqGc/bGphvNrVx6oIBY7RwQwAd9rZkulo8fFvg==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr1996753wmh.165.1593071620044; 
 Thu, 25 Jun 2020 00:53:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k126sm5848415wme.17.2020.06.25.00.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 00:53:39 -0700 (PDT)
Date: Thu, 25 Jun 2020 09:53:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yannick FERTRE <yannick.fertre@st.com>
Message-ID: <20200625075336.GB3278063@phenom.ffwll.local>
Mail-Followup-To: Yannick FERTRE <yannick.fertre@st.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
References: <171ff1fb3918664a570dc8f2f34b446612505f76.1585832665.git.angelo.ribeiro@synopsys.com>
 <669d5484-b1e5-dd5c-b4e5-f3b5a8b436b4@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <669d5484-b1e5-dd5c-b4e5-f3b5a8b436b4@st.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: dw-mipi-dsi.c: remove unused
	header file
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

On Wed, Jun 24, 2020 at 03:08:22PM +0000, Yannick FERTRE wrote:
> Hello Angelo,
> thank for patch.
> 
> Reviewed-by: Yannick Fertre <yannick.fertre@st.com>

Patch applied, thanks.
-Daniel

> 
> 
> 
> On 4/3/20 3:30 PM, Angelo Ribeiro wrote:
> > dw-mipi-dsi does not use any definition from drm_probe_helper.
> > 
> > Coverity output:
> > Event unnecessary_header:
> > Including .../include/drm/drm_probe_helper.h does not provide any
> > needed symbols.
> > 
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Cc: Jose Abreu <jose.abreu@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index 024acad..582635d 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -27,7 +27,6 @@
> >   #include <drm/drm_modes.h>
> >   #include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> > -#include <drm/drm_probe_helper.h>
> >   
> >   #define HWVER_131			0x31333100	/* IP version 1.31 */
> >   
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
