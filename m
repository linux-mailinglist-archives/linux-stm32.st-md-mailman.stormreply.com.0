Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B778A5E4
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 08:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B41C6B444;
	Mon, 28 Aug 2023 06:43:16 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93DA8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:43:14 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZ1B22c9GzhZGk;
 Mon, 28 Aug 2023 14:39:22 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:10 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 28 Aug 2023 14:38:33 +0800
Message-ID: <20230828063845.3142561-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
Cc: bagasdotme@gmail.com, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/12] ubi: fastmap: Fix a series of wear
	leveling problems
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

This series of patches fix three problems:
1. Inconsistent erase counter from wl entry and disk, for patches 1~4.
2. Same PEB is always resued for fastmap data, for patches 5~9.
3. First 64 PEBs have large erase counter than others, for patches 10~12.

Besides, patches 4/5 bring an improvement of the UBI service life.

Regression tests are in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787.

v1->v2:
  Patch 6: Change wait condition in wait_free_pebs_for_pool(), there are
	   two situations that cause waiting infinately:
	   1. __erase_worker schedules itself if -EBUSY returned when
	      shutting down system.
	   2. The 'min_expect_free' cannot be satisfied when bad block
	      occurs and ubi becomes ro(The erased PEB should be the
              last one of 'min_expect_free', but it becomes bad in
	      __erase_worker).
 PS: After re-testing, the testing results in [Link] is not affected.


Zhihao Cheng (12):
  ubi: fastmap: Fix missed ec updating after erasing old fastmap data
    block
  ubi: fastmap: erase_block: Get erase counter from wl_entry rather than
    flash
  ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
  ubi: Replace erase_block() with sync_erase()
  ubi: fastmap: Use free pebs reserved for bad block handling
  ubi: fastmap: Wait until there are enough free PEBs before filling
    pools
  ubi: fastmap: Remove unneeded break condition while filling pools
  ubi: fastmap: may_reserve_for_fm: Don't reserve PEB if fm_anchor
    exists
  ubi: fastmap: Get wl PEB even ec beyonds the 'max' if free PEBs are
    run out
  ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
  ubi: fastmap: Add module parameter to control reserving filling pool
    PEBs
  ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for
    filling pools

 drivers/mtd/ubi/build.c      |  25 +++++++-
 drivers/mtd/ubi/cdev.c       |   3 +-
 drivers/mtd/ubi/eba.c        |   3 -
 drivers/mtd/ubi/fastmap-wl.c | 112 +++++++++++++++++++++++++++--------
 drivers/mtd/ubi/fastmap.c    |  66 +++------------------
 drivers/mtd/ubi/ubi.h        |  10 +++-
 drivers/mtd/ubi/wl.c         |  48 +++++++++------
 drivers/mtd/ubi/wl.h         |   6 +-
 include/uapi/mtd/ubi-user.h  |   4 +-
 9 files changed, 164 insertions(+), 113 deletions(-)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
