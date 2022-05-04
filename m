Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D79251AF69
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 22:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 593CCC6047D;
	Wed,  4 May 2022 20:37:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55A2CC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 20:37:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1F4AB828CE;
 Wed,  4 May 2022 20:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C5DC385A5;
 Wed,  4 May 2022 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696657;
 bh=x2k8eLmpAI5MhrBnDOm1e2daghSZLAuKoipmd98NfjA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p6PPDNMR45buGLAqUlEo0R6GwTHIYs79XWGXpoLi589fZEP/Qqa/eZUhrK2UAEwQo
 7Z2YFBuTgCDFjuvhy9tdxQA8pccHhv3Pb+3NDAiXN9+xjbMxsLxkBU70uyz6Tbr9aF
 gPSFS1jw9aH8BJFn3zM6V6lEAZtIWlPCp16MMHUNYcGGcNVxLp5ScLRJieQpVVWpu2
 MlqhqkX3qMrM63SRLKORcpd4hSq9/fBk4J9bFBPDAwOlf3qqGoOiVpeohxFn7ipl2A
 roj8Ye6wjzgCiaJUAqTX2AprJXMcOsLgCajQHCwsHuDlqhxcNqIl8XMCww2HQtJITT
 rItsnS9Kk5T0g==
Date: Wed, 4 May 2022 21:45:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20220504214557.6a075da7@jic23-huawei>
In-Reply-To: <28627ccb-21ef-1b86-e5d7-460daf672d6d@foss.st.com>
References: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
 <20220428193304.016c46a3@jic23-huawei>
 <YnEB97YfPYpe2aCn@smile.fi.intel.com>
 <28627ccb-21ef-1b86-e5d7-460daf672d6d@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] iio: trigger:
 stm32-lptimer-trigger: Make use of device properties
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

On Tue, 3 May 2022 14:25:37 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 5/3/22 12:20, Andy Shevchenko wrote:
> > On Thu, Apr 28, 2022 at 07:33:04PM +0100, Jonathan Cameron wrote:  
> >> On Wed, 13 Apr 2022 21:56:56 +0300
> >> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>  
> >>> Convert the module to be property provider agnostic and allow
> >>> it to be used on non-OF platforms.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> >>
> >> MAINTAINERS entry for this one uses extensive wild cards so may
> >> escape scripts...
> >>
> >> +CC Fabrice.  
> > 
> > Thanks!
> > 
> > Not sure it might break anything, it's quite straightforward conversion.  
> 
> Hi Andy, Jonathan,
> 
> You can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to the togreg branch of iio.git and pushed out as testing to
let 0-day see if it can find anything we missed.

Thanks,

Jonathan


> 
> Thanks,
> Best Regards,
> Fabrice
> 
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
