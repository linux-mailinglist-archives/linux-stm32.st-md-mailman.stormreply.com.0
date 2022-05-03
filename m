Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3B51822D
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 12:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E1F3C60462;
	Tue,  3 May 2022 10:20:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B92E1C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651573246; x=1683109246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=phdN5nG74i5taBguDD63jVJlL/xdPUdJNmc8pS9IWYU=;
 b=TStTv5sd63HwIIS+5+BW/yPxJbz3mU9qgDKL8Nems7MNCP1LlfD2NiAG
 6L0Su89MbqQLfTruF1y53qwLWr8eFn8+3QDCFmVvvUqL3Ob95MM61+BGO
 6MDTvOOZYw1wYGzywXSLrx2zSp85x8RCI7hVluUvmPlHXtSZw0VRAZlS1
 /bQC5x9mv0Ubxh0t3mbybMi+lyEsuTkkJT0l9diNW/cPV1l9baEyTHorA
 JKsZhSx9XOfdnHpiA+8f3tYw43Gjv/jY3yTzcjNAA7X0QT9fuv/kHOgpa
 D8E9y4+NqnzJ4nX/LqvtLxwSqwnNV1Bjqrs6g1ZkEibEm0OQOZMecoudy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267321379"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267321379"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 03:20:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="733856740"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 03:20:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nlpe3-00BOzE-OL; Tue, 03 May 2022 13:20:39 +0300
Date: Tue, 3 May 2022 13:20:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YnEB97YfPYpe2aCn@smile.fi.intel.com>
References: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
 <20220428193304.016c46a3@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428193304.016c46a3@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Thu, Apr 28, 2022 at 07:33:04PM +0100, Jonathan Cameron wrote:
> On Wed, 13 Apr 2022 21:56:56 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Convert the module to be property provider agnostic and allow
> > it to be used on non-OF platforms.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> MAINTAINERS entry for this one uses extensive wild cards so may
> escape scripts...
> 
> +CC Fabrice.

Thanks!

Not sure it might break anything, it's quite straightforward conversion.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
