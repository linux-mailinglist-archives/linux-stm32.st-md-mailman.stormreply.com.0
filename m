Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F31B61E9
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 19:26:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68381C36B0B;
	Thu, 23 Apr 2020 17:26:34 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E123C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 17:26:32 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f8so2623707plt.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DpK1MTO7mSVlwfsYeufnIzC273XYT16h4tVPLSulEzc=;
 b=PSPRcaL1HUiOr023rE5B+XwN77h8gbIjK8X6Mh74KkTryaei+Vot45w0LONd32yLVu
 zlCj1BeWiuKyoSI2yHH/9jcc4rwIXhvs1DeIOYOwKMnfyG+qL4vBswh3XVvyFV6YZn8F
 SSKvIxsHeSq+xYlGIVrup6/beM54i8LXBv7O3i2OXOAqgDp5wYEnhWdDsz8TBZ+r8ZdC
 DGTPleUuXt0NpSl1Gnd56AatVnGrcRxdLn1luU35ni4mScbHsJZlds5t4BOy143Up/Sr
 iILYdeAN0U+adJ/51NYjQHOVzw0LzBUUl0t3Yc6YF0ZLn+T/0dRr+MA/3WNEp1WEJlQu
 jbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DpK1MTO7mSVlwfsYeufnIzC273XYT16h4tVPLSulEzc=;
 b=QHnZvZUPdavIeyq/WlEQQKcM7qDe9G2+HBiqHMjSQfy/VVzBt58+z8WhaGc6cDn4/B
 zdXiHswq9LnGV8t9Zw6CKQHVOfM1mmiHJsxCMAT4SoTV5350/VU7ZJZBZDA1T+HiOaL5
 uS0ezxzCoNpelsryNj8Tc7p2UXtYe7BLru1YGWt/ell4lqCML3niVc22TWj10jyERX0W
 RUe7zMb1E3jW4mO6ALI5XUbM50NTl98WLGpLXf9CLwW2XfdgnXVGD7vUvC3NGHRqpZuM
 M4o2/XaIJvoMcgnWofU21zLVzwdjlxHQH0sk5bZh9AiYnokT+71xPN/hAB9vs/e/J3+z
 I09g==
X-Gm-Message-State: AGi0PubRuaOMPpjfxZcpmaONx8MDJQQDn4FPjRbU585VgZxaSefNrMw/
 wve3ihCvqvpL5I4VqeXaj1MHmQ==
X-Google-Smtp-Source: APiQypLp3Z+/Yk+XGaZEB6yuRINzC6WDm70jllBSgPHmDuMXP7oj5imDwelymWaTBn9GSKEN4ay0HA==
X-Received: by 2002:a17:902:a418:: with SMTP id
 p24mr4970644plq.55.1587662789172; 
 Thu, 23 Apr 2020 10:26:29 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id f2sm2786447pju.32.2020.04.23.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 10:26:28 -0700 (PDT)
Date: Thu, 23 Apr 2020 11:26:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200423172626.GA5781@xps15>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC 00/18] remoteproc: Decorelate virtio from
	core
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

On Thu, Apr 16, 2020 at 06:13:13PM +0200, Arnaud Pouliquen wrote:
> This series proposes to introduce the notion of platform device for the
> rproc virtio management. One obective is to allow virtio to declare is
> own memory resources without the usage of dma_declare_coherent_memory
> that seems deprecated since the introduction of the device tree.

Just to follow up with the rest of the community...

During the openAMP remoteproc sub-group conference call [1] Arnaud and I have agreed
the best way forward for this patchset is to split it up and make a few
adjustment that will make it easier for people to review the work.

Thanks,
Mathieu

[1]. These conference call are open to anyone who wishes to participate.

> 
> Proposal:
> - the rproc virtio is processed in a separate platform and could be handled
>   as a generic platform device.
> - Several vdev devices can be declared in DT:
>     - which allows to declare their own memory regions and answer to [1].
>     - as next steps it would be also possible to:
>        - declare their own mailboxes, rpmsg drivers, ...
>        - use dma-range to handle the pa<->da translation at virtio level
> 
> Several notions are introduced here:
> - Virtio platform registration which allows to decorelate virtio from the
>   remote proc core device. 
> - Synchronization of the child devices relying on component bind/unbind.
>   This mechanism ensures the synchronization of the child devices before
>   the boot of the remote processor and before the release of the resources
>   on the remote processor shutdown.
> - Ability to populate child devices declared in rproc device tree node.
> - Possibility to declare the memory regions reserved to a virtio devices in
>   the devicetree.
> 
> Known limitations:
> - the patchset has been tested on a st32mP1 plaform only
> - it is based on the v5.6 (need to evoluate depending on V5.7 and on going
>   patchsets).
> - The virtio memory allocation does not take into account memory
>   controllers such as IOMMU and MPU.
> 
> Arnaud Pouliquen (18):
>   remoteproc: Store resource table address in rvdev
>   remoteproc: Introduce virtio device add/remove functions in core.
>   remoteproc: Move rvdev management in rproc_virtio
>   remoteproc: Add rproc_get_by_node helper
>   remoteproc: Create platform device for vdev
>   remoteproc: Add component in core for child devices synchronization
>   remoteproc: Add component bind/unbind for virtio platform
>   remoteproc: Externalize carveout functions
>   remoteproc: Move vring management from core to virtio
>   remoteproc: Add capability to populate rproc subnode devices
>   remoteproc: Add child node component in rproc match list
>   remoteproc: Support of pre-registered virtio device
>   remoteproc: Add memory default allocator helper
>   remoteproc: Add pa to da translation API
>   remoteproc: associate memory entry to a device
>   remoteproc: Parse virtio node for memory region
>   remoteproc: stm32: add the pa to da ops.
>   ARM: dts: stm32: Declare a virtio device
> 
>  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   |  10 +
>  drivers/remoteproc/remoteproc_core.c     | 469 ++++++++++++-----------
>  drivers/remoteproc/remoteproc_internal.h |  23 +-
>  drivers/remoteproc/remoteproc_virtio.c   | 415 ++++++++++++++++++--
>  drivers/remoteproc/stm32_rproc.c         |   1 +
>  include/linux/remoteproc.h               |  27 +-
>  6 files changed, 673 insertions(+), 272 deletions(-)
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
