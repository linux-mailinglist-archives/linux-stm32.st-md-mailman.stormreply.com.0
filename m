Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9DE1C1C67
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 19:59:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1885C36B0F;
	Fri,  1 May 2020 17:59:43 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39171C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 17:59:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n11so4849722pgl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SrJ+suZtBWr1oaesi/k2ktaEJnaAc56s/fpYYwm6YkQ=;
 b=rtUe86ofD35Jm4kswBmEsEiDvYps/sFLvc+ucRqtIMN6Wg3XEGcRYzZyWhpnEWffql
 I3cAVYkpNiJg9tmvu7bXzxraGLxCbRGRO4ZxtZkJohoMaBUoJdbTCyYKximei2dOynJ3
 hxG6dZLTt74LX5VnwHPk1A1McsjT/SzfbUN1AkGAUJMPYcY8CHlx5nZ5z7wEiqkT4tU6
 ArTfBHszH1/lrdfolV+z/4bLsFO7PgN+KXYar26fPiH2TFLda7soTzqU5Ks1iXxpQ7Xl
 lhRMVyBkTCHNR9RhjR++rAN8EYAFapQFr+yPZ2+hm8nhAtuoAAUy1pE5YWIx7KXTNgj1
 Q2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SrJ+suZtBWr1oaesi/k2ktaEJnaAc56s/fpYYwm6YkQ=;
 b=TfxdQpHaazmtmK/2loLmU+f5pWKGEVB2/vgBEZaBV4ZaS7SEaPDtslQsezKwy7wKjj
 P35PUkDYxDyNoEUmarN9AHCdLu18ECPBam/I1pR+zmyweU0Bu78I7MShFhODogCVv9yr
 yd+oDAcI8oKH8rb1zN7MzZLOQLQ0OoESg8gpNdF8E/P9oHerzaaJYslcVnJCoS8PDVKd
 kxQp+STN5BHu8B0bpvL2xtc4Ogy5+ba3HS9v1m1VkWGBezmvn1cRrFx7hEeyLg2lRQp1
 5+cmTZ3p0i3eX30p0m7IdcmVEHYMLccM3V7CnXhVqvt5W3RnlWLlQJewUTm6VWMKwL1R
 2vXw==
X-Gm-Message-State: AGi0PuaQBy2FJ9+XjGw0dFNaCUnSPWN50qv/gZBNVpK8CrA2mpo5Ag8z
 gHbeJtspg79bGZlB2RQu+Vs+aA==
X-Google-Smtp-Source: APiQypKSvb3juH8yufYz3pZtYJr5I7jYwQqi+KNzHP8QMg+pl6CzWIz0QI5ety/mLdAJyEKbW8lq+w==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr5189526pgv.174.1588355980303; 
 Fri, 01 May 2020 10:59:40 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id e16sm2510386pgg.8.2020.05.01.10.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 10:59:39 -0700 (PDT)
Date: Fri, 1 May 2020 11:59:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20200501175937.GG18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <219771d3-b0a5-0ec7-7f20-d2055bcb0217@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <219771d3-b0a5-0ec7-7f20-d2055bcb0217@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/12] remoteproc: stm32: Add support
 for synchronising with M4
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

On Wed, Apr 29, 2020 at 05:08:32PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> > This patchset needs to be applied on top of this one [1].
> > 
> > It refactors the STM32 platform code in order to introduce support for
> > synchronising with the M4 remote processor that would have been started by
> > the boot loader or another entity.
> > 
> > It carries the same functionatlity as the previeous revision but account
> > for changes in the remoteproc core to support synchronisation scenarios.
> > Some RB tags have been removed when the content of the patch has strayed 
> > too far from the original version. See patch 3, 8, 9 and 12 for more
> > details.
> 
> I reviewed the series, and made some tests on my side.
> FYI, I do not answer to patches when tagged "Reviewed-by: Loic Pallardy" 
> and with no extra remark. So consider them as Reviewed-by me but not
> necessary to add the tag in commit, Reviewed-by: loic in commit is sufficient. 

Well, if you spent all this time reviewing the code might as well get credit for
it...  And it also helps maintainers get a feel for how many eyes have looked
at the code.

> 
> Concerning tests, it works find except the crash recovery from a sync start.
> But i suppose that you know the limitation, waiting Loic patches[1] update :)

As I commented in the patch itself, I'll fix this so that the condition leading
to the recovery limbo can't happen.

Thanks,
Mathieu

> 
> [1]: https://lkml.org/lkml/2020/3/11/403
> 
> Thanks a lot for your work!
> Arnaud
>  
> 
> > 
> > Tested on ST's mp157c board.
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=277049
> > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> > 
> > Mathieu Poirier (12):
> >   remoteproc: stm32: Decouple rproc from memory translation
> >   remoteproc: stm32: Request IRQ with platform device
> >   remoteproc: stm32: Decouple rproc from DT parsing
> >   remoteproc: stm32: Remove memory translation from DT parsing
> >   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
> >   remoteproc: stm32: Get coprocessor state
> >   remoteproc: stm32: Get loaded resource table for synchronisation
> >   remoteproc: stm32: Introduce new start ops for synchronisation
> >   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
> >   remoteproc: stm32: Introduce new parse fw ops for synchronisation
> >   remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
> >   remoteproc: stm32: Set synchronisation state machine if needed
> > 
> >  drivers/remoteproc/stm32_rproc.c | 262 ++++++++++++++++++++++++++++---
> >  1 file changed, 244 insertions(+), 18 deletions(-)
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
