Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D44A7A75
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 06:56:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27BABC35E01;
	Wed,  4 Sep 2019 04:56:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564CDC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 04:56:29 +0000 (UTC)
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4AB12077B;
 Wed,  4 Sep 2019 04:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567572987;
 bh=xkQZikYEyY3c7L/C+i3x3dyZJTWQdFUTYOzei9xlyQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qru4PME1plSqZSD3Y0yICIVW9mG8C6MIOggnFtQeOImhWC+FBN6IDZmu3YNXSXfsp
 /CtM4d+VWQw/4xbdRL1f5E/kqn+X8vqamBF55CBzDkJAaWkH6pNZU4tRZd+X+E6DqX
 V7Xgvu0JOuirnwEN3Hsu9poD7z85dNhWmTT4l4mg=
Date: Wed, 4 Sep 2019 10:25:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20190904045519.GZ2672@vkoul-mobl>
References: <20190830161423.GA3483@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830161423.GA3483@embeddedor>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: Use struct_size()
	helper
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

On 30-08-19, 11:14, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct stm32_dma_desc {
> 	...
>         struct stm32_dma_sg_req sg_req[];
> };
> 
> 
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> So, replace the following function:
> 
> static struct stm32_dma_desc *stm32_dma_alloc_desc(u32 num_sgs)
> {
>        return kzalloc(sizeof(struct stm32_dma_desc) +
>                       sizeof(struct stm32_dma_sg_req) * num_sgs, GFP_NOWAIT);
> }
> 
> with:
> 
> kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT)
> 
> This code was detected with the help of Coccinelle.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
