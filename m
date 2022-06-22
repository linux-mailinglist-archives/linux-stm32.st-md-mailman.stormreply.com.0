Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A755572F1
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 08:17:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AAB0C57B6C;
	Thu, 23 Jun 2022 06:17:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E546C03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655923982; x=1687459982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/jbAjt44pNdw2EPdmHuXf3wGiQ3od3Q+gNDKXfIaZ3c=;
 b=I+FoGSSP7pLe8VRsIXRfNP6/aUBLrKbkbByv7sfIigA+Hs6IxaUpzagr
 iZwAHQlGHkvQPVCa6x444HV0IwVfpUtCKhFGYH78Lhc8k/duVTa0lu1e5
 PP43ffpcCWQqEsZ5mLIA3vVlSiohhLpwK6J8kvU93FxYK8DClostk+w2h
 TT6T/tEtBcUzPnJuXcGtyPGnZYQI9KTR+0w2XSwpmIZDx4gERNUOpR0Qw
 pp0sG+Dz1raFA2R8vhiJgVbheMx3KrWgK7KvSLZZi1Ovas7HpVRtezMB9
 nnpXWIiE38b3p8gqiuDBRx6k+B8OZmdSaM2LYQrRlDA1gYZKLwibrMQno g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260334229"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260334229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="715528336"
Received: from bwalker-desk.ch.intel.com ([143.182.136.162])
 by orsmga004.jf.intel.com with ESMTP; 22 Jun 2022 11:52:59 -0700
From: Ben Walker <benjamin.walker@intel.com>
To: vkoul@kernel.org
Date: Wed, 22 Jun 2022 11:52:48 -0700
Message-Id: <20220622185248.3043534-1-benjamin.walker@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jun 2022 06:17:38 +0000
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, mporter@kernel.crashing.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 00/15] dmaengine: Support polling for out
	of order completions
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

This series adds support for polling async transactions for completion
even if interrupts are disabled and transactions can complete out of
order.

To do this, all DMA client assumptions about the behavior of
dma_cookie_t have to be removed. Prior to this series, dma_cookie_t was
a monotonically increasing integer and cookies could be compared to one
another to determine if earlier operations had completed (up until the
cookie wraps around, then it would break).

Fortunately, only one out of the many, many DMA clients had any
dependency on dma_cookie_t being anything more than an opaque handle.
This is the pxa_camera driver and it is dealt with in patch 7 of this
series.

The series also does some API clean up and documents how dma_cookie_t
should behave (i.e. there are no rules, it's just a handle).

This closes out by adding support for .device_tx_status() to the idxd
driver and then reverting the DMA_OUT_OF_ORDER patch that previously
allowed idxd to opt-out of support for polling, which I think is a nice
overall simplification to the dmaengine API.

Changes since version 2:
 - None. Rebased as requested without conflict.

Changes since version 1:
 - Broke up the change to remove dma_async_is_tx_complete into a single
   patch for each driver
 - Renamed dma_async_is_tx_complete to dmaengine_async_is_tx_complete.

Ben Walker (15):
  dmaengine: Remove dma_async_is_complete from client API
  dmaengine: Move dma_set_tx_state to the provider API header
  dmaengine: Add dmaengine_async_is_tx_complete
  crypto: stm32/hash: Use dmaengine_async_is_tx_complete
  media: omap_vout: Use dmaengine_async_is_tx_complete
  rapidio: Use dmaengine_async_is_tx_complete
  media: pxa_camera: Use dmaengine_async_is_tx_complete
  dmaengine: Remove dma_async_is_tx_complete
  dmaengine: Remove last, used from dma_tx_state
  dmaengine: Providers should prefer dma_set_residue over
    dma_set_tx_state
  dmaengine: Remove dma_set_tx_state
  dmaengine: Add provider documentation on cookie assignment
  dmaengine: idxd: idxd_desc.id is now a u16
  dmaengine: idxd: Support device_tx_status
  dmaengine: Revert "cookie bypass for out of order completion"

 Documentation/driver-api/dmaengine/client.rst | 24 ++----
 .../driver-api/dmaengine/provider.rst         | 64 ++++++++------
 drivers/crypto/stm32/stm32-hash.c             |  3 +-
 drivers/dma/amba-pl08x.c                      |  1 -
 drivers/dma/at_hdmac.c                        |  3 +-
 drivers/dma/dmaengine.c                       |  2 +-
 drivers/dma/dmaengine.h                       | 12 ++-
 drivers/dma/dmatest.c                         | 14 +--
 drivers/dma/idxd/device.c                     |  1 +
 drivers/dma/idxd/dma.c                        | 86 ++++++++++++++++++-
 drivers/dma/idxd/idxd.h                       |  3 +-
 drivers/dma/imx-sdma.c                        |  3 +-
 drivers/dma/mmp_tdma.c                        |  3 +-
 drivers/dma/mxs-dma.c                         |  3 +-
 drivers/media/platform/intel/pxa_camera.c     | 15 +++-
 .../media/platform/ti/omap/omap_vout_vrfb.c   |  2 +-
 drivers/rapidio/devices/rio_mport_cdev.c      |  3 +-
 include/linux/dmaengine.h                     | 58 +------------
 18 files changed, 164 insertions(+), 136 deletions(-)

-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
