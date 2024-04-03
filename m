Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A42896B6B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 12:03:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8616CC69063;
	Wed,  3 Apr 2024 10:03:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 898C8C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712138626; x=1743674626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fXRjjaGZV7ZIRS20aHDdphwu1uV0+rRzTuIeMRTW/fM=;
 b=OpjVm7li6v/6wyYNmxYLJh5qd+be/6grHPbssp9USiHpGq+muWTAEBL3
 em2tnpK7s/qJfHWs7JySnEwSkmIZO7H1ah3qCTbUnJzcEKxJcoTKwjFl2
 WK8t9DquG70ObDEQe5M9iZlPPAy927+1/8Z5W8Nu2g0ur05H731qCnHTR
 68tL1K4aHdD64mumtTegmqqacM2ludC8xJ4Juihx9XBxZJBystZtZP++k
 zYCGC1Q0NHuEbbUVe5Bj/RydzlBjDHEJ1bhstka7xroxrCoU2t81meDxz
 TpRCrgz1GChn/9Mg/0nJGfmMaO720PXrJ2BevBl0tQMHp/Jqb7PKymmpz g==;
X-CSE-ConnectionGUID: RSdln5DKRhKmSN7z3sKlqQ==
X-CSE-MsgGUID: OLlDbpLpRBiCkQYa4XJYsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7485426"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7485426"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915177185"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="915177185"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:03:41 -0700
Received: from andy by smile with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1rrxT1-000000015GN-0Djh; Wed, 03 Apr 2024 13:03:39 +0300
Date: Wed, 3 Apr 2024 13:03:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Zg0pei7ut5lC9yVC@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-8-arnd@kernel.org>
 <Zg0kC6uYFOi-UGXl@smile.fi.intel.com>
 <614fc80a-5d2a-43a1-b8d4-48bdb2cc7dc7@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <614fc80a-5d2a-43a1-b8d4-48bdb2cc7dc7@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/34] Input: stmpe-ts - mark OF related
 data as maybe unused
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

On Wed, Apr 03, 2024 at 11:52:12AM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2024 11:40, Andy Shevchenko wrote:
> > On Wed, Apr 03, 2024 at 10:06:25AM +0200, Arnd Bergmann wrote:

...

> >> -static const struct of_device_id stmpe_ts_ids[] = {
> >> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
> > 
> > __maybe_unused? 
> > 
> > Why not adding it into .driver as you have done in another patch in this series?
> 
> Because there is no benefit in this. This is instantiated by MFD, so the
> only thing you need is entry for module loading.

Hmm... Seems to me rather a good candidate for MODULE_ALIAS in this case. No?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
