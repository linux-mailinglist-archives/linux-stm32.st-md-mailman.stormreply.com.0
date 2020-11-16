Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB42B402D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 10:50:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59073C3FADD;
	Mon, 16 Nov 2020 09:50:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D90AC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 09:50:19 +0000 (UTC)
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7331D22314;
 Mon, 16 Nov 2020 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605520218;
 bh=PsOD6R91/tCtBguEd/kBbgBKJThdZGEnWUNGNjijS/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=go5PpPvekUihR/DmV7K7dEF+HPPSX5Fkz66KcBgwgI1Xl5chn0ctX7KzhyTjJN6uS
 aMGJMn6wIuVXiYjU+CbGt82XUgI4MrC/3tuuEneHSkc36x0LqVc0u9Z0L//cKtZa+h
 cD0m0dLZYpmw7JHiQus/9z3eEPoNNJCTu+BLIrRI=
Date: Mon, 16 Nov 2020 15:20:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20201116095014.GU7499@vkoul-mobl>
References: <20201110102305.27205-1-amelie.delaunay@st.com>
 <20201116073756.GL7499@vkoul-mobl>
 <1b91bea5-ffbf-37fb-98ac-6abc5f373375@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b91bea5-ffbf-37fb-98ac-6abc5f373375@st.com>
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] phy: stm32: don't print an error on
	probe deferral
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

On 16-11-20, 09:02, Amelie DELAUNAY wrote:
> Hi Vinod,
> 
> On 11/16/20 8:37 AM, Vinod Koul wrote:
> > On 10-11-20, 11:23, Amelie Delaunay wrote:
> > > Change stm32-usbphyc driver to not print an error message when the device
> > > probe operation is deferred.
> > 
> > Applied all, thanks
> > 
> 
> I'm sorry for the mess, I sent a v2 for the patch 1/2:
> https://lore.kernel.org/patchwork/patch/1336206/
> Indeed, I forgot the "return" before dev_err_probe.

No worries, I have dropped this and picked v2.
Do check if the patches are fine.

Thanks for letting me know

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
