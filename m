Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F59454A8A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Nov 2021 17:07:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6449CC5EC6B;
	Wed, 17 Nov 2021 16:07:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1BBDC5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 16:00:05 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n29so5602410wra.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pT4qZN+otEOp9NMbVkyGI+t8qf+gp/bjSr+EEcpc+qY=;
 b=a1HnUlYAMQ53OdlHDqoKq15Xxmd2IMeYI7OblQGavX1XLR7ALsre4TIaNbHpxrmewy
 TrlDwzuka8xIwNbUxjXkTwsRJKLIFZhGoxE1HsfvGXtZHIceOc9o07cadzt9t6xAIpCl
 q9uXp3KXH94nEwtpPeX+VOdNVaMSxedSN/jPMa2wEExsn4NDJZUnVtN6KYL4aAz77KHJ
 YQ1lYG3Ic0feOv/osj5o8rHRP6mbixtE6yWo/i/8YMg07JCsigSGAgEpVjM0jqSseT3Y
 8YIruI6vXfinNpiCc8VhiQpKd33FueGXgDiA5ElggX0k4YhLKcySLrnl/3PXkqba7FJ3
 RHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pT4qZN+otEOp9NMbVkyGI+t8qf+gp/bjSr+EEcpc+qY=;
 b=Ivqrd9mZDDZBQRtZgqWfAbcRx5kUuzFh8OSPXQVt1tuoY04QNCc35Nb9//uex2KWFM
 rCHV2uhMpQk8jhw+aQbL2TCyBgX4AYMOp8hYwt5MmziII2fQ5xFdOja70DTkCqXoRGqi
 g9Qx4JsYU2GneajCw2Oc4r8GhH5BqamPPGdon6bCQKXHQzu7k4Wh8IWKSW5MAQOppiYZ
 Wlo6EciZhziYkJNfcoT5kHzKW887fW3mTdhU/NI4f8bNexTaQBc+6eive6no2UFrMpa/
 ysYVvW9896WtREHFS3hlUFsKSI6Ky7uhKN8Np7s70a55lGUY2A9yGaXgvAgkLS2G+0ZP
 8Y/Q==
X-Gm-Message-State: AOAM533QJzEAL9izULZPUdXnu6/Ml7m+w/8JLa+dgri+MxlLa7tugUIX
 OOO5qEupX3HZzW+0xDV6dJUXEtayfHsUxEnoMYhHsw==
X-Google-Smtp-Source: ABdhPJzPHMvLDdvlzwIuUsfIgZhSFqd3lWj6Bl2uefwiTnm3ZI4o66LnjNX5/C/BKLJHusY8qtE6WUMu7AigEgQYIEk=
X-Received: by 2002:adf:e387:: with SMTP id e7mr21743098wrm.412.1637164805103; 
 Wed, 17 Nov 2021 08:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20211117152917.3739-1-alexandr.lobakin@intel.com>
In-Reply-To: <20211117152917.3739-1-alexandr.lobakin@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 17 Nov 2021 07:59:53 -0800
Message-ID: <CANn89iJFjAOw=5fvC1jrgDrV=0c6bCt16NqgySgd4DxR6Yz+PA@mail.gmail.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
X-Mailman-Approved-At: Wed, 17 Nov 2021 16:07:38 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: fix build due to brainos
	in trans_start changes
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

On Wed, Nov 17, 2021 at 7:29 AM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> txq_trans_cond_update() takes netdev_tx_queue *nq,
> not nq->trans_start.
>
> Fixes: 5337824f4dc4 ("net: annotate accesses to queue->trans_start")
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---

Thanks !

Reviewed-by: Eric Dumazet <edumazet@google.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
