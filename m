Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 486709688DB
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 15:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D081DC7801C;
	Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5EE7C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725283926; x=1756819926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LxOn5Qgvj4iY2bhqvCqxAbQHIwgeapr368nzzFYJ1fQ=;
 b=PwshAHVQaeGEkEReGzYnudO7A8kbTFbhT+muvSWtgri6mfDPOtTgrxFM
 Zb7BJeGmKph0dfeGvYQpE0Y8+4eNcfQvVjbeotmOL3krce+ZdVLvwcWg1
 0zQAby2/3A0A1KpQC5cdMmJS2FvXPtnjXf7QyL2D8k85R3bSQJ1FYYBck
 0JOZuMt8+XkjbjBVcYSXqKsM2sIsXOKlcECLqFlb3T1W1IWRYK889SiJM
 j235KE/6Yyb0c4h44wkXsPKTfnvlUvhxa01GA0CkV92bPJ01AIy5bbksZ
 4cyZx5pogEqWU+AUyAjRXD9DOG4PeOVN28bcfnMgNbJTn07f4cL0T904w w==;
X-CSE-ConnectionGUID: FmQh6DYxTC2NKYB/yylSSg==
X-CSE-MsgGUID: yukGQFHGSi6gvEYuObhUAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23821221"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23821221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:31:57 -0700
X-CSE-ConnectionGUID: xhzCTv3iQ0eczgcJ5keH5g==
X-CSE-MsgGUID: CmotSmxuSHWRfBv0v9kyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69244869"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2024 06:31:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B218F233; Mon, 02 Sep 2024 16:31:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Sep 2024 16:30:39 +0300
Message-ID: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 0/5] gpio: stmpe: A few cleanups
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

A few ad-hoc cleanups inducted by the recent patch that made
an (insignificant) typo in one message.

Andy Shevchenko (5):
  gpio: stmpe: Fix IRQ related error messages
  gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
  gpio: stmpe: Utilise temporary variable for struct device
  gpio: stmpe: Make use of device properties
  gpio: stmpe: Sort headers

 drivers/gpio/gpio-stmpe.c | 52 ++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
