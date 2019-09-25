Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF13BE93E
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2019 01:53:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FBF0C35E01;
	Wed, 25 Sep 2019 23:53:15 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 900ECC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 23:53:14 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id p11so253803ybc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cyFQHO0gt5mJktt3yKr7R9c1YLgMmxQPz4clIN4BByc=;
 b=NX4N++Ilhb/J+QxCl+m9OQKuUep7vJMws423VnLxrI+JJZb5igg7Ogezjt8G6BXZ37
 eBuYE2PXNvyxQncoy1SlWgggQP4mi/THz6D4OzUqZnWQK1horxAdXZaOv0iqYoJeqhqq
 jxopXY9GPAAub44F6/pzw4LBObdtDZhYX13loPzxMGZ1Qxe22MtqUpkBmCdMgwKIKSxc
 CV9AhCou7Ps3aYHlF4I74Pu/uipvq+O9ZBi7ZXJn/yUlpRhWC4hTw6xpKG1Z/q2pj11M
 ak/wzvln0BXE9SykOMtCUYfrpjvB7tD67nt9VFxZtw+Xv2iz/Kq9JQqBpfXAdUFGGeIv
 LHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cyFQHO0gt5mJktt3yKr7R9c1YLgMmxQPz4clIN4BByc=;
 b=IQNjGISr/lsJ+qM8cM86x2zQ0zDs1AQPgjCY+kcJEDtDabDuaKcU2cDn052QsSm9zE
 zyNodtx45FEpon3k4bIwBUEL3FSaaX5ZkS5ciBJ84HxhXRB+xCdEsDBsy2hm2kl7M0nZ
 MD9Xkr2Xf9bON570kQPenbqcyMnsIg5oEWQnEBcxb5I4m5q0wEnbX5Ho4JgCrZ6QSwpV
 nUoaZPgaZwu5ekk6bB4Mq8pZYHFJvG4EzLvlCK2Adfjg8iz1XSUKFTgUf7q8mc0Fxv4S
 uFxcrHIGL4QP815d5bAF1LFL3PZxb6s+D8sIVcf0x15laf0eEuIZHSZ7u49O9biZsha9
 k0/g==
X-Gm-Message-State: APjAAAXVh6GvxHcQB3w7OiyRNnwdmvtFYTP0z4w2q/6a++wFtzLkvgYj
 A0ByyEbskWUeQ0jAZbsiI1I=
X-Google-Smtp-Source: APXvYqyCs6ReFo44FRjG9X8YZDHHS+am/bMANP6oopGV1Zd787odaVvfpd//Pc4OS1/U5biQgJ7CJg==
X-Received: by 2002:a25:a469:: with SMTP id f96mr185130ybi.23.1569455593438;
 Wed, 25 Sep 2019 16:53:13 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id x145sm77056ywx.2.2019.09.25.16.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 16:53:12 -0700 (PDT)
Date: Wed, 25 Sep 2019 19:53:10 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@jic23.retrosnub.co.uk
Message-ID: <20190925235310.GD14133@icarus>
References: <1568809323-26079-1-git-send-email-fabrice.gasnier@st.com>
 <20190925234927.GB14133@icarus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925234927.GB14133@icarus>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix a
	kernel-doc warning
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

On Wed, Sep 25, 2019 at 07:49:27PM -0400, William Breathitt Gray wrote:
> On Wed, Sep 18, 2019 at 02:22:03PM +0200, Fabrice Gasnier wrote:
> > Fix the following warning when documentation is built:
> > drivers/counter/stm32-timer-cnt.c:37: warning: cannot understand function
> > prototype: 'enum stm32_count_function'
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> > index 644ba18..e425dd1 100644
> > --- a/drivers/counter/stm32-timer-cnt.c
> > +++ b/drivers/counter/stm32-timer-cnt.c
> > @@ -28,7 +28,7 @@ struct stm32_timer_cnt {
> >  };
> >  
> >  /**
> > - * stm32_count_function - enumerates stm32 timer counter encoder modes
> > + * enum stm32_count_function - enumerates stm32 timer counter encoder modes
> >   * @STM32_COUNT_SLAVE_MODE_DISABLED: counts on internal clock when CEN=1
> >   * @STM32_COUNT_ENCODER_MODE_1: counts TI1FP1 edges, depending on TI2FP2 level
> >   * @STM32_COUNT_ENCODER_MODE_2: counts TI2FP2 edges, depending on TI1FP1 level
> > -- 
> > 2.7.4
> 
> Fixes: 597f55e3f36c ("counter: stm32-lptimer: add counter device")
> 
> Jonathan, please pick this fix up through IIO.
> 
> Thanks,
> 
> William Breathitt Gray

Sorry, that's the wrong Fixes line. Here's the right one:

Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
