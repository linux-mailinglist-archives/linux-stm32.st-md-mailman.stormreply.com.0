Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016D5A77E8
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 09:46:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A09ECC04001;
	Wed, 31 Aug 2022 07:46:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3015AC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 17:26:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 897E41063;
 Tue, 30 Aug 2022 10:26:38 -0700 (PDT)
Received: from e121896.arm.com (unknown [10.57.15.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E8C3F7B4;
 Tue, 30 Aug 2022 10:26:30 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: suzuki.poulose@arm.com, coresight@lists.linaro.org,
 mathieu.poirier@linaro.org
Date: Tue, 30 Aug 2022 18:26:08 +0100
Message-Id: <20220830172614.340962-1-james.clark@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Aug 2022 07:46:20 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH v2 0/5] coresight: Reduce duplicated sysfs
	accessors
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

Changes since v1:

  * Keep existing signed offset value types until the very last commit
    and then remove them all at once

  * Also split out usages of read_pair() and read32() into separate
    functions in the last commit 

  * Whitespace fixes

  * Replaced any touched scnprintf() with sysfs_emit()

======

The intent of this change is to reduce the large number identical of
functions created by macros for sysfs accessors. It's possible to re-use
the same function but pass in the register to access as an argument.
This reduces the size of the coresight modules folder by 244KB.

The first two patches are refactors to simplify and remove some dead
code, and the second two are the changes to use a shared function.

Testing
=======

No changes in any of the outputs:

  cat /sys/bus/coresight/devices/*/mgmt/* > before.txt
  cat /sys/bus/coresight/devices/*/mgmt/* > after.txt
  diff before.txt after.txt

With the following modules loaded:

  ls /sys/bus/coresight/devices/
  etm0  etm2  funnel0  funnel2  replicator0  tmc_etf0  tmc_etf2  tpiu0
  etm1  etm3  funnel1  funnel3  stm0         tmc_etf1  tmc_etr0


James Clark (5):
  coresight: Remove unused function parameter
  coresight: Simplify sysfs accessors by using csdev_access abstraction
  coresight: Re-use same function for similar sysfs register accessors
  coresight: cti-sysfs: Re-use same functions for similar sysfs register
    accessors
  coresight: Make new csdev_access offsets unsigned

 drivers/hwtracing/coresight/coresight-catu.c  |  27 +--
 drivers/hwtracing/coresight/coresight-catu.h  |   8 +-
 drivers/hwtracing/coresight/coresight-core.c  |  28 +++
 .../hwtracing/coresight/coresight-cti-sysfs.c | 213 +++++++-----------
 drivers/hwtracing/coresight/coresight-etb10.c |  28 +--
 .../coresight/coresight-etm3x-sysfs.c         |  34 +--
 drivers/hwtracing/coresight/coresight-priv.h  |  74 +++---
 .../coresight/coresight-replicator.c          |  10 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  40 +---
 .../hwtracing/coresight/coresight-tmc-core.c  |  48 ++--
 drivers/hwtracing/coresight/coresight-tmc.h   |   4 +-
 include/linux/coresight.h                     |  23 ++
 12 files changed, 227 insertions(+), 310 deletions(-)

-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
