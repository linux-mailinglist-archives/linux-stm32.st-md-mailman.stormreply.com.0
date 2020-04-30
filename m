Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E61BFF7A
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 17:03:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ACB4C36B0D;
	Thu, 30 Apr 2020 15:03:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E830C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 15:03:00 +0000 (UTC)
IronPort-SDR: j6py+PtDuCot9Zj154OeSoKkgyyhY+fbzeAZYuOcQYMjPt+RnkkSS1Q9f9TLd8lP2wq6UdWKv7
 jadcCmPcvTLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 08:02:58 -0700
IronPort-SDR: r1jUyWHRZkEWChP8YJLGCSIo4l7oiuL4IJe5rhtSZdpzW/8Z2SEVCiIzboGi5FXWKqjL6MJ9eX
 gkLDP14mYUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="276544744"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2020 08:02:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4AD4F11D; Thu, 30 Apr 2020 18:02:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Thu, 30 Apr 2020 18:02:47 +0300
Message-Id: <20200430150254.34565-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH v3 0/7] stmmac: intel: Fixes and cleanups
	after dwmac-intel split
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

Seems the split of dwmac-intel didn't go well and on top of that new
functionality in the driver has not been properly tested.

Patch 1 fixes a nasty kernel crash due to missed error handling.
Patches 2 and 3 fix the incorrect split (clock and PCI bar handling).

Patch 4 converts driver to use new PCI IRQ allocation API.

The rest is a set of clean ups that may have been done in the initial
submission.

Series has been tested on couple of Elkhart Lake platforms with different
behaviour of ethernet hardware.

Changelog v3:
- added the cover letter (David)
- appended separate fix as a first patch
- marked patches 2 and 3 with Fixes tag

Andy Shevchenko (7):
  stmmac: intel: Fix kernel crash due to wrong error path
  stmmac: intel: Fix clock handling on error and remove paths
  stmmac: intel: Remove unnecessary loop for PCI BARs
  stmmac: intel: Convert to use pci_alloc_irq_vectors() API
  stmmac: intel: Eliminate useless conditions and variables
  stmmac: intel: Fix indentation to put on one line affected code
  stmmac: intel: Place object in the Makefile according to the order

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 160 +++++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |   5 -
 4 files changed, 68 insertions(+), 105 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
