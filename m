Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB024C7C9
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 00:32:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D897C32E8F;
	Thu, 20 Aug 2020 22:32:43 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18B0AC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 22:32:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f5so1686162plr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cqYejF0FPIa+d7AlSTm/Gc7YgLZloIvNKdqMBUt+AsY=;
 b=ZmSuTZ6KCJTKQKYPSjUEzF+uUSfIT436CakTl8Wsy2kuSFOCKhSZFNeBCpXzco52S5
 4Hs2YyW722vCbqGe6gp2y9myXYF2tYNIalRG2jhoX2/cyZAGdMOrE1magYkANmez1tkB
 WJzvolLoKBbHKRRGw8UYPOxKughFUpBFbelIKntmosFIOYkKVD1X59zjvpxAew/7dkN+
 /76RUY4lJF2MnQ4++9d31b9hChdA83/hAYV41+1UwncGCXplygCGZgsFiMQC1+PVYi2m
 6kluZlpaiDDUXJEeTXDU2yg5NXK2UUtGo0gmLTKDBKXQrrpwxO7E9qijtMURRvVMHul4
 JkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cqYejF0FPIa+d7AlSTm/Gc7YgLZloIvNKdqMBUt+AsY=;
 b=aI2LMxoUEVStuuVPmW+XQHCNuO38X6GetJnEte7LnEx1yxlcllfy0X+R1s1L2TIdgV
 3glz0NZtJwWccjSJT5OxnIzN/k3+WiesUhhhp8EYkccUqyhzQpKIlxDXsbYBi4V6O1cg
 fYTZ0l4SvuT2E9gpfsqHAt2AmGRmt9mng0BjambOTgM+jVDvY3KcQU2cRogchWt+GkpA
 t0ZMiiAcBRqBDKjjODBIQrlOCZTbTyeA5Vz7s6B2tWci5z2nRXk90c8lgK0/gbAV+tHe
 SiNSIfUcwxaEINfFeYO50YL8bR0ey/KlcbUWkYwfXvpjgakgTc7Gj+9zYtZjW8aSUPrK
 EKLQ==
X-Gm-Message-State: AOAM533kt400Dzty5fwSwkb4Wpjib/EkCTYxo9NTPVpdo0k70hWKRJVC
 Yxm1RPihAWEBlYQtzyLDXzQCbw==
X-Google-Smtp-Source: ABdhPJzIZKSmzqbOJ/OvBUM7dtVdBJmB4A1oPC9M9oRFcPdN/Poitr5UR9RtoyQf6dkCuvOxp8hm5g==
X-Received: by 2002:a17:902:82c1:: with SMTP id
 u1mr451157plz.224.1597962758478; 
 Thu, 20 Aug 2020 15:32:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id h19sm11668pjv.41.2020.08.20.15.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 15:32:38 -0700 (PDT)
Date: Thu, 20 Aug 2020 16:32:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200820223236.GB3938186@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-1-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 0/9] introduce name service announcement
	rpmsg driver
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

On Fri, Jul 31, 2020 at 01:47:23PM +0200, Arnaud Pouliquen wrote:
> The NS announcement is implemented by several backends, but could be
> considered as part the RPMsg protocol. 
> In this case it should be managed as a reserved rpmsg service and so
> implemented on top of the rpmsg protocol.
> 
> This series introduces the rpmsg_ns driver that handles the name service
> announcement. The virtio backend is updated in consequence to use this
> service.

I have started to review this set, comments will be spread over a few days. 

Thanks,
Mathieu

> 
> Applies cleanly on Bjorn rpmsg-next branch (ddd1930d6e3e)
> 
> Arnaud Pouliquen (9):
>   rpmsg: virtio: rename rpmsg_create_channel
>   rpmsg: core: add channel creation internal API
>   rpmsg: virtio: add rpmsg channel device ops
>   rpmsg: define the name service announcement as reserved address
>   rpmsg: introduce reserved rpmsg driver for ns announcement
>   rpmsg: virtio: use rpmsg ns device for the ns announcement
>   rpmsg: ns: add name service announcement service
>   rpmsg: virtio: use rpmsg_ns driver to manage ns announcement
>   rpmsg: ns: name service announcement endianness
> 
>  drivers/rpmsg/Kconfig            |   9 ++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_core.c       |  37 ++++++
>  drivers/rpmsg/rpmsg_internal.h   |  32 +++++
>  drivers/rpmsg/rpmsg_ns.c         | 175 +++++++++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 213 +++++++++----------------------
>  include/linux/rpmsg.h            |   9 ++
>  7 files changed, 325 insertions(+), 151 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
