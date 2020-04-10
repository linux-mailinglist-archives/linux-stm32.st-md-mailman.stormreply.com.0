Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D31A3E1D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 04:16:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14856C36B0B;
	Fri, 10 Apr 2020 02:16:51 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2795AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 02:16:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m16so210478pls.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2020 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=epcePNPH75ZrOgRmkPaWETOFUufSwk1exuBAOcMmYKU=;
 b=pjfn/IP8jAV7H7R+w1ysZc+k8OBRHDB+7tnnwKs9KOlerSrQpXe+PcIJfqm/jgAfrK
 Zv8qRfcT4RqhPlTiGwjYle9eLBeczRlE6OCGR8Ap3OJXpPVyDfxxTrbErDCQUyltqm1f
 AX2lzP5P+Z9q7nOWpd+ib1y8DAR391Ers/N0LqsMn/uBK2EsoZQCiiIlAwmHdjyLU4mk
 LoR0nHuuDquB04+10oLTkQCAPwjKTa6UcFE/KxLXt5sgtYgo00JfW5lIUzxmsq0gNlwP
 oqHFrMQn1H3/YWhoksSyKOI1P9dvFP0a8q/kBjAoPxLQZ4ux7c9M+Jh90W1N+7YPeFs0
 uFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=epcePNPH75ZrOgRmkPaWETOFUufSwk1exuBAOcMmYKU=;
 b=aE/ErEoG1OgOPVL44DXj24BkKq0la2EiutoYMX9gUQNs+KEzsEjjFGNtDkRiNlHUgq
 6UahUZ6HED7cS7wdTY+NuUuqTg7gn6cJ1iddBY9or2MmXqr/ZQDXOKoPZ4/KpiO1QofU
 j7fGcWVMiFV4GLs+PZ4QTJBTGvcFasjSHGfNLrPI/1K764X189raK4883d0w2We+a80n
 OVIFzmPyAacAG75/bFfEGSMK7NH6MYP/907HICW3iyoeFQnJS5+keiQRw5JfrUjEUFwj
 tpqE41y0TXRd6FLc23TcPsb0gpn8JlJ9x3C6apiX+bOQ/gqYNkvNm/hv1J53UhDEutJu
 jwVw==
X-Gm-Message-State: AGi0PubEm0w8B1qe099PMxATntkn6MhQBfeCRXB1Wkwqn99gKV50Ebjr
 iDYUz3gzUWtAnVNNaXdaMtQHAg==
X-Google-Smtp-Source: APiQypJqyKR3rsDc5ml7bDajSOWFoKnB5Kl1YpiY804f+Y5ThLwopJ6r9asJ14nxdI4SJULEUHHkNg==
X-Received: by 2002:a17:902:ab83:: with SMTP id
 f3mr2612236plr.197.1586485007444; 
 Thu, 09 Apr 2020 19:16:47 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q15sm381086pgj.4.2020.04.09.19.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 19:16:46 -0700 (PDT)
Date: Thu, 9 Apr 2020 19:16:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200410021655.GA20625@builder.lan>
References: <20200409211054.12091-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409211054.12091-1-mst@redhat.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] remoteproc: pull in slab.h
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

On Thu 09 Apr 14:10 PDT 2020, Michael S. Tsirkin wrote:

> In preparation to virtio header changes, include slab.h directly as
> this module is using it.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a18f88044111..7ef931e9605c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
> +#include <linux/slab.h>
>  #include <linux/workqueue.h>
>  
>  #include "remoteproc_internal.h"
> -- 
> MST
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
