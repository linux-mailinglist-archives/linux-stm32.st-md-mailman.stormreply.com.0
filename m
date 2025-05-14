Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F97AB6B59
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 14:22:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7E0C7A842;
	Wed, 14 May 2025 12:22:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77303C78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 12:22:50 +0000 (UTC)
X-CSE-ConnectionGUID: U+obhzTNTzGqEOL5sZuAjA==
X-CSE-MsgGUID: 3I62g+07TNqzgY+y7h/grw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66526235"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="66526235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:22:48 -0700
X-CSE-ConnectionGUID: jVh6CU3DTDishg36Z2t4Xg==
X-CSE-MsgGUID: ywqvxL3qQsahLY7v8B01SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138946955"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:22:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andy@kernel.org>) id 1uFB8D-00000001Y1g-3TVL;
 Wed, 14 May 2025 15:22:41 +0300
Date: Wed, 14 May 2025 15:22:41 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Message-ID: <aCSLEZoeafOporMf@smile.fi.intel.com>
References: <20250514085138.3221059-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514085138.3221059-1-nichen@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: robh@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 nuno.sa@analog.com, u.kleine-koenig@baylibre.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, dlechner@baylibre.com, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Fix race in
 installing chained IRQ handler
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

On Wed, May 14, 2025 at 04:51:38PM +0800, Chen Ni wrote:
> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().

Sounds like it needs a Fixes tag.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
