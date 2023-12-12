Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C180F191
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 16:55:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFF96C6C85B;
	Tue, 12 Dec 2023 15:55:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA5EAC6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 15:55:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E8F143D;
 Tue, 12 Dec 2023 07:55:51 -0800 (PST)
Received: from e127643.broadband (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB1173F738;
 Tue, 12 Dec 2023 07:55:03 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Tue, 12 Dec 2023 15:53:57 +0000
Message-Id: <20231212155407.1429121-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 0/8] coresight: Separate sysfs and Perf usage
	and some other cleanups
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

I've been finding it quite difficult to reason about some of the state
and functions in coresight-core.c because they have generic names when
they are actually only relevant to the sysfs usage of Coresight rather
than usage through Perf. This is probably because sysfs came first and
Perf was added later. This has caused a couple of issues where these
things have been used in the wrong context, for example the first
commit is a fixup.

To fix this I've mainly just moved all of the sysfs stuff to the sysfs
file and removed the 'enable' state, which was just for sysfs. While
doing the refactor it became obvious that refcnt didn't need to be
atomic either, so that can be simplified along with some other comment
clarifications and simplifications.

Hopefully it's also a step towards to removing all of the duplicate
refcnt and mode tracking code from the individual devices. That tracking
pretty much always results in a one-shot enable/disable and fixes the
mode to either sysfs or Perf, and there is no reason that can't exist in
the core layer outside of the devices. I tried to finish that in this
set, but there turned out to be some complexities, so I cut it short at
a point where I can be sure that there are no behavioral changes.

James Clark (8):
  coresight: Fix issue where a source device's helpers aren't disabled
  coresight: Make language around "activated" sinks consistent
  coresight: Remove ops callback checks
  coresight: Move mode to struct coresight_device
  coresight: Remove the 'enable' field.
  coresight: Move all sysfs code to sysfs file
  coresight: Remove atomic type from refcnt
  coresight: Remove unused stubs

 drivers/hwtracing/coresight/coresight-core.c  | 494 +-----------------
 drivers/hwtracing/coresight/coresight-etb10.c |  29 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |   2 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   2 -
 .../coresight/coresight-etm3x-core.c          |  17 +-
 .../coresight/coresight-etm3x-sysfs.c         |   4 +-
 .../coresight/coresight-etm4x-core.c          |   4 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   9 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  24 +-
 drivers/hwtracing/coresight/coresight-sysfs.c | 391 ++++++++++++++
 .../hwtracing/coresight/coresight-tmc-core.c  |   2 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  46 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  33 +-
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 -
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |  14 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  22 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 -
 include/linux/coresight.h                     | 114 +---
 19 files changed, 561 insertions(+), 663 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
