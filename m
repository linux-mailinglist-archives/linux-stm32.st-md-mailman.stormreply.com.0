Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A965E194103
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 15:10:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66D8AC36B0B;
	Thu, 26 Mar 2020 14:10:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FCAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 14:10:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CF95206F8;
 Thu, 26 Mar 2020 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585231815;
 bh=PeDZLWIRhhe2o42I/gqvyiiMuKNamoLO8nfHcq+EkCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+HavB7wzgTYW3kPySjLPPoFLj+9aNlpEq50YxNDKKRzsgG7ARI+2fa1J4sYhcmvd
 BTOyHlkLNotN2GwwHNkryJ4W1nlUR+pAx11lVOgV1quJL231pXotHGVltvYV2fn+QM
 DqMa1ugiLPJgmlRKMJI7hjcDNVP3f/Fapum5Uwqg=
Date: Thu, 26 Mar 2020 15:10:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200326141011.GA1313869@kroah.com>
References: <20200324042213.GA10452@asgard.redhat.com>
 <CANLsYkwVybRG9L6gDJTzZ=eXut66vJYfuEtOfLzaYaVpdybT1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANLsYkwVybRG9L6gDJTzZ=eXut66vJYfuEtOfLzaYaVpdybT1A@mail.gmail.com>
Cc: Michael Williams <michael.williams@arm.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Eugene Syromiatnikov <esyr@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.chunyan@linaro.org>,
 Pratik Patel <pratikp@codeaurora.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] coresight: do not use the BIT() macro in
	the UAPI header
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

On Tue, Mar 24, 2020 at 09:31:15AM -0600, Mathieu Poirier wrote:
> On Mon, 23 Mar 2020 at 22:22, Eugene Syromiatnikov <esyr@redhat.com> wrote:
> >
> > The BIT() macro definition is not available for the UAPI headers
> > (moreover, it can be defined differently in the user space); replace
> > its usage with the _BITUL() macro that is defined in <linux/const.h>.
> >
> > Fixes: 237483aa5cf4 ("coresight: stm: adding driver for CoreSight STM component")
> > Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> > ---
> >  include/uapi/linux/coresight-stm.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/coresight-stm.h b/include/uapi/linux/coresight-stm.h
> > index aac550a..8847dbf 100644
> > --- a/include/uapi/linux/coresight-stm.h
> > +++ b/include/uapi/linux/coresight-stm.h
> > @@ -2,8 +2,10 @@
> >  #ifndef __UAPI_CORESIGHT_STM_H_
> >  #define __UAPI_CORESIGHT_STM_H_
> >
> > -#define STM_FLAG_TIMESTAMPED   BIT(3)
> > -#define STM_FLAG_GUARANTEED    BIT(7)
> > +#include <linux/const.h>
> > +
> > +#define STM_FLAG_TIMESTAMPED   _BITUL(3)
> > +#define STM_FLAG_GUARANTEED    _BITUL(7)
> 
> Greg, if you want to pick this up right away:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> Otherwise let me know and I'll add it to my next tree.

I'll take it now, thanks.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
