Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9CA5F887
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 14:49:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69E45CBB4BA
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 12:49:47 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82CA6CBB4B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 12:49:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so5635515wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pJR9Nbd+EOvZUGtVQfqXOkJPh6MJRl4K59V5gxu19nc=;
 b=pW28AYFsfz6lnQajSXfkgm0Hxur+z4zyo2+Mn98yniclwqQG8ecE+mzYQficvwPFQX
 CwaUtZA2yFftv6MUGI+P39gNRBhdcckVT6Z0SvAtY1DX2pnwSaoHEly7RoIVzrucF8G6
 QkNbFnvmuH8BK7WWkIuBgCbD3BytI6VZUw6ERP+uTPion1cNRcbhgGFAWdYp0RPt4EtJ
 M6uwQDJR9jYJanmQM8MXRDn0xqlApbLdnoCFWaJYCctFnhciK/AIsqBU+gRA1PhQpR1C
 M+emjXF3OofspwDRs4fsa/6DEY898+4AgcxTrYHV6MOPqtDDritljBieEejXK1CY6+2f
 kIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pJR9Nbd+EOvZUGtVQfqXOkJPh6MJRl4K59V5gxu19nc=;
 b=X6/yoIn218vBpi29w3V9kh+Z2317gKMYV5i5toI61IrzJTfu0i9GKoJbSwiG6zjDJq
 kcWb131OCVtXru0RMFSwZVQbODJaiIsPD5SfXalwQ+GPdnpLA78MsVEaO+m3fpideuAC
 Lp7E7EqGT5eq9YW+/XB/GQ95EE28B7hYH6Ro69AH3zQqzibSlla47NjjDLsKi3JJOwa8
 4iVAJT78z8ZiKo+qA6AFVDp/eMBouXN1HbObOa+BsI7/vcBkVUrbpWXQ9HBdqw8z7PRx
 o2KM32UtA78T5cBemEq6m9Kgc2jJNLU+0ocEB+J34qKC8pBIv6bmFjEAu+AYsUTjsoX8
 WtFA==
X-Gm-Message-State: APjAAAVKxIKrXpRqytkmTowo3bmsKmRjdrpWfsiItA2XhteC3EzhFEuY
 6tXoT7ms4BzZSe0kNXiExguL4w==
X-Google-Smtp-Source: APXvYqxkaYPEcpkgDFk9Q6mfIv5r2R6ZColj0lHQ9LOI2sMRzVJDlcVu4dSz0xDEM7lLB6xOpEFGdQ==
X-Received: by 2002:a1c:18d:: with SMTP id 135mr12614483wmb.171.1562244584926; 
 Thu, 04 Jul 2019 05:49:44 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id s11sm2387689wrr.59.2019.07.04.05.49.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 05:49:44 -0700 (PDT)
Date: Thu, 4 Jul 2019 15:49:41 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190704124941.GA9617@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon> <20190704103057.GA29734@apalos>
 <CAK8P3a3GC6f-xHG7MqZRLhY66Ui4HQVi=4WXR703wqfMNY6A5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3GC6f-xHG7MqZRLhY66Ui4HQVi=4WXR703wqfMNY6A5A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Thu, Jul 04, 2019 at 02:14:28PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 4, 2019 at 12:31 PM Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> > > On Wed,  3 Jul 2019 12:37:50 +0200
> > > Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> 
> > 1. page pool allocs packet. The API doesn't sync but i *think* you don't have to
> > explicitly since the CPU won't touch that buffer until the NAPI handler kicks
> > in. On the napi handler you need to dma_sync_single_for_cpu() and process the
> > packet.
> 
> > So bvottom line i *think* we can skip the dma_sync_single_for_device() on the
> > initial allocation *only*. If am terribly wrong please let me know :)
> 
> I think you have to do a sync_single_for_device /somewhere/ before the
> buffer is given to the device. On a non-cache-coherent machine with
> a write-back cache, there may be dirty cache lines that get written back
> after the device DMA's data into it (e.g. from a previous memset
> from before the buffer got freed), so you absolutely need to flush any
> dirty cache lines on it first.
Ok my bad here i forgot to add "when coherency is there", since the driver
i had in mind runs on such a device (i think this is configurable though so i'll
add the sync explicitly to make sure we won't break any configurations).

In general you are right, thanks for the explanation!
> You may also need to invalidate the cache lines in the following
> sync_single_for_cpu() to eliminate clean cache lines with stale data
> that got there when speculatively reading between the cache-invalidate
> and the DMA.
> 
>        Arnd


Thanks!
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
