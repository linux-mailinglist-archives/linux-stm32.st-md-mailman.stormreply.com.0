Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F365A968509
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 12:42:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5E73C6DD6B;
	Mon,  2 Sep 2024 10:42:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F197C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725273775; x=1756809775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xEEr5YhQ7ynEnYVBuIxwVvHOV4IpVINET57YBn2yaMY=;
 b=bmPG0TIpP4rLlmdmfd+sgnSYNqzoDG1OdNMYvxNe8iYqw2HFoPxusw42
 7PJ6wXnk50alggF8KczJ9N4okuwNo4DqxMSd3n2nEvP+pi1WU+L+KMH2c
 AAl0wDiMjhLuiVceiQYdE/F7O36xJgEeWpTHk6+o7ZgQ6JuUBJyX9YFg8
 tvy8av/Am2i0qO3ZvR/Zr5Yoc+k4rd8fA6s8zTvjnhYA17dxeVFX72t/E
 Xy96sJ9KRPFzTMLtEyUNX59DWNfoNFX/JS3sjFga5CYiZWN5BaZ3wKi3b
 thMUJ991IiqLBEPhPcwWN/AbGw0frkUuDFTrVgqZfPJeQOR9ucNgJFMvQ w==;
X-CSE-ConnectionGUID: 4jaYPygPR8WMS1KPwKmIgw==
X-CSE-MsgGUID: bdQDu7hiQFSEkZfO7vJgJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23802776"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23802776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 03:42:48 -0700
X-CSE-ConnectionGUID: HFGOjsiyR12c8rQn7iGr0A==
X-CSE-MsgGUID: o3T9W1tRRu+On6BWXH+Z/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64576948"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 03:42:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1sl4WA-00000004KMH-0Pzl; Mon, 02 Sep 2024 13:42:42 +0300
Date: Mon, 2 Sep 2024 13:42:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZtWWoT75zCSB4g1x@smile.fi.intel.com>
References: <20240829131051.43200-1-shenlichuan@vivo.com>
 <172527039219.21144.385699965145763717.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172527039219.21144.385699965145763717.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: opensource.kernel@vivo.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linus.walleij@linaro.org,
 Shen Lichuan <shenlichuan@vivo.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] gpio: stmpe: Simplify with
	dev_err_probe()
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

On Mon, Sep 02, 2024 at 11:46:34AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> On Thu, 29 Aug 2024 21:10:51 +0800, Shen Lichuan wrote:

[...]

> Applied, thanks!

Be careful with patches from @vivo.com [1]!

This one in particular missed '\n' (and yes, I know that it's not an issue
for the ev_*() cases).

[1]: https://lore.kernel.org/linux-spi/20240829033511.1917015-1-11162571@vivo.com/
(read full discussion)

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
