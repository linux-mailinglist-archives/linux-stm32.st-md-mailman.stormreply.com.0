Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92F2176C0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 20:30:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A1BC36B2A;
	Tue,  7 Jul 2020 18:30:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0C7C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 18:30:22 +0000 (UTC)
Received: from embeddedor (unknown [200.39.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41180206F6;
 Tue,  7 Jul 2020 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594146621;
 bh=xTRNX+tombqeYkaSwvGumK40pfLh5dWiBc6gh61ysqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0YrtAj7tQ/yq/2V3gsl6Ih2gYIDovZiLEolwSX/XiOdfmF9uZ63hV0ipmstb1K+jt
 WQsXiCGOQbtbEtlYZsEYtG28/Y5T27RMjPb6GRbnDJJIvn8sDGfJsPlUKtriUJbTMF
 XqFUn8bzlgICV3qF40EiAbWfT5TODneOvdBlDJ2A=
Date: Tue, 7 Jul 2020 13:35:48 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20200707183548.GA1280@embeddedor>
References: <20200707180857.GA30600@embeddedor>
 <20200707182654.GF3273837@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707182654.GF3273837@dtor-ws>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] Input: Use fallthrough
	pseudo-keyword
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

On Tue, Jul 07, 2020 at 11:26:54AM -0700, Dmitry Torokhov wrote:
> On Tue, Jul 07, 2020 at 01:08:57PM -0500, Gustavo A. R. Silva wrote:
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > fall-through markings when it is the case.
> > 
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Applied, thank you.
> 

Thanks, Dmitry.

--
Gustavo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
