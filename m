Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606F48658E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 14:52:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27EDFC5F1FA;
	Thu,  6 Jan 2022 13:52:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AC67C5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 13:03:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id e5so1717231wmq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 05:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vcYnekM26AwY1vgrHqt3niX4oXoouwaBi8z/zP8TK7s=;
 b=K5/JYstTGkxbeN0YvKz+Tqdb+3ss/MByUbytP1n7lkqc+BLTfeSIKuNqo+tqQw1CDJ
 sD2Ozv1rAbosYiX0z1FS6+Xm+Fzw5Hg1NS8zskoqSS6wZbPFZ1INM0WFjCfq/h6cGq3l
 XW714Vgez6ONhDdhKKfH+Q1emjt6eRFCX78q07C36swCFvxwAQ+ncOaz7MLhaVSGnbo+
 Hdf9UYVQRUAUOpa/ei5cue9sJl8rckGbDqMdy9uZrzg91JO7D12djUxBv8xYlx1op4r3
 EfKFrr551vNdn/t5df7mvlylLBZ0hOb/wS0QMAsBC4j1x++LgjQtJ+bt1tdO6h5IRN++
 kIWg==
X-Gm-Message-State: AOAM531BPyysMIPuXp9ofpanWkM3rI+BqeWeQO7lre0DinXKyMfItY5W
 aji9Aj6H7tzcA9SNh20t8S8=
X-Google-Smtp-Source: ABdhPJxjG8n0y9ZGjhfUAQ/lARqGtAcsKv1amFfIs3NrZLQDMXO0cFdv3+3SKS6rfToX8YU5cknK9Q==
X-Received: by 2002:a05:600c:acf:: with SMTP id
 c15mr6826950wmr.7.1641474219848; 
 Thu, 06 Jan 2022 05:03:39 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b6sm2089988wri.56.2022.01.06.05.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:03:39 -0800 (PST)
Date: Thu, 6 Jan 2022 13:03:37 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20220106130337.qtvjgffwlyzy7j2y@liuwe-devbox-debian-v2>
References: <20211230012742.770642-1-kuba@kernel.org>
 <20211230012742.770642-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230012742.770642-2-kuba@kernel.org>
X-Mailman-Approved-At: Thu, 06 Jan 2022 13:52:13 +0000
Cc: linux-hyperv@vger.kernel.org, alexandre.torgue@foss.st.com,
 chenhao288@hisilicon.com, akiyano@amazon.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, daniel@iogearbox.net,
 decui@microsoft.com, ndagan@amazon.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, sgoutham@marvell.com,
 grygorii.strashko@ti.com, haiyangz@microsoft.com, ast@kernel.org,
 saeedb@amazon.com, peppe.cavallaro@st.com, shayagr@amazon.com,
 linux-omap@vger.kernel.org, moyufeng@huawei.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 darinzon@amazon.com, sameehj@amazon.com, bpf@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 1/2] net: add includes masked
 by netdevice.h including uapi/bpf.h
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

On Wed, Dec 29, 2021 at 05:27:41PM -0800, Jakub Kicinski wrote:
> Add missing includes unmasked by the subsequent change.
> 
> Mostly network drivers missing an include for XDP_PACKET_HEADROOM.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[...]
>  drivers/net/ethernet/microsoft/mana/mana_en.c      | 2 ++

This seems trivially correct, so in case an ack is needed:

Acked-by: Wei Liu <wei.liu@kernel.org>

> diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
> index c1d5a374b967..2ece9e90dc50 100644
> --- a/drivers/net/ethernet/microsoft/mana/mana_en.c
> +++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>  /* Copyright (c) 2021, Microsoft Corporation. */
>  
> +#include <uapi/linux/bpf.h>
> +
>  #include <linux/inetdevice.h>
>  #include <linux/etherdevice.h>
>  #include <linux/ethtool.h>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
