Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 207195F7BF
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 14:14:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDB8DC0C9C2
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 12:14:49 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 148F7C0C9B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 12:14:48 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d79so1096516qke.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 05:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9cNGGl+FLilA8PMo/2823HsEW5aV7LEQGtBmo7DnFEc=;
 b=WknfojUmQv64JdArBBuNLfYaXAdF5XXKeQVTqUMAp+iB7n5nArR7mRSwZkMfnvOVv9
 jH1eekUv+aN7YWRdtg/FyDfXFsJtGoZMjMCTVwZV4OP7SdTUwC+AlDrjP+uVA0cgGolz
 cxnRLUJZcsM51rJJUTZc28ikQw8QoyykhQBOBOiJji8C6p7xU3fXrI8JuxEsrgrbU9tV
 mq+8QxjtuaTNlfo3wxHW+284A6DKux6baCYOM1AXkO8P01Xz693Mjb6va0/qO8QiZ2hh
 UinPIUUuij1NUlDE70KkSo/DggBHJ6R/2ATqRDD1IKtuC8SosH8RMI2NCv5thUZbpnM8
 fdtQ==
X-Gm-Message-State: APjAAAXjk7nx4KQ0TMJHJe/UPHU2MyMguo6oLdiXyq2As0Y9Zw85fQnU
 Csu3sqiz92mkkGx0VJ4WWKvbPqhZSo3yvUjiJsM=
X-Google-Smtp-Source: APXvYqzvpIz9J26dzCUH95aoNaSNG7JvaLf06oXPM82JIyYSrVI156uv/dpYNT0OS7IMkbIycWc7OMw2LwtS3sy2tBc=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr34670161qkc.394.1562242486886; 
 Thu, 04 Jul 2019 05:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon> <20190704103057.GA29734@apalos>
In-Reply-To: <20190704103057.GA29734@apalos>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Jul 2019 14:14:28 +0200
Message-ID: <CAK8P3a3GC6f-xHG7MqZRLhY66Ui4HQVi=4WXR703wqfMNY6A5A@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
	support for Page Pool
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

On Thu, Jul 4, 2019 at 12:31 PM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
> > On Wed,  3 Jul 2019 12:37:50 +0200
> > Jose Abreu <Jose.Abreu@synopsys.com> wrote:

> 1. page pool allocs packet. The API doesn't sync but i *think* you don't have to
> explicitly since the CPU won't touch that buffer until the NAPI handler kicks
> in. On the napi handler you need to dma_sync_single_for_cpu() and process the
> packet.

> So bvottom line i *think* we can skip the dma_sync_single_for_device() on the
> initial allocation *only*. If am terribly wrong please let me know :)

I think you have to do a sync_single_for_device /somewhere/ before the
buffer is given to the device. On a non-cache-coherent machine with
a write-back cache, there may be dirty cache lines that get written back
after the device DMA's data into it (e.g. from a previous memset
from before the buffer got freed), so you absolutely need to flush any
dirty cache lines on it first.
You may also need to invalidate the cache lines in the following
sync_single_for_cpu() to eliminate clean cache lines with stale data
that got there when speculatively reading between the cache-invalidate
and the DMA.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
