Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5C6CDCA6
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 16:35:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F3BDC69069;
	Wed, 29 Mar 2023 14:35:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 495EAC65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 11:53:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDDD1FB;
 Wed, 29 Mar 2023 04:54:32 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4CA63F6C4;
 Wed, 29 Mar 2023 04:53:46 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, quic_jinlmao@quicinc.com,
 mike.leach@linaro.org, suzuki.poulose@arm.com
Date: Wed, 29 Mar 2023 12:53:13 +0100
Message-Id: <20230329115329.2747724-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Mar 2023 14:35:35 +0000
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 00/13] coresight: Fix CTI module refcount
	leak by making it a helper device
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

Changes since v2:

 * Make out_conns array contiguous instead of sparse which simplifies
   filling and using it. New connections are always added to the end
 * Store pointers to individual connection objects so that they can be
   shared between inputs and outputs
 * Fix an existing bug where connection info was lost when unloading a
   device
 * Simplify connection fixup functions. Now the orphan mechanism is used
   for inputs in the same way as outputs to guarantee that all
   connections have both an input and an output set
 * Use input connections to disconnect devices on unload instead of
   iterating through them all
 * Make refcount a property of the connection rather than use it's own
   array based on the number of inputs and outputs
 * Fix a bug in v2 where helpers attached to the source device weren't
   disabled because coresight-etm-perf.c was making a raw call to
   disable rather than using a helper.
 * Change names of connection members to make direction explicit now
   that the connection is shared between input and outputs
   
------------------

Changes since v1:

 * Don't dereference handle in tmc_etr_get_buffer() when not in perf mode.
 * Fix some W=1 warnings
 * Add a commit to rename child/output in terms of local/remote

-------------------

Currently there is a refcount leak in CTI when using system wide mode
or tracing multithreaded applications. See the last commit for a
reproducer. This prevents the module from being unloaded.

Historically there have been a few issues and fixes attempted around
here which have resulted in some extra logic and a member to keep
track of CTI being enabled 'struct coresight_device->ect_enabled'.
The fix in commit 665c157e0204 ("coresight: cti: Fix hang in
cti_disable_hw()") was also related to CTI having its own
enable/disable path which came later than other devices.

If we make CTI a helper device and enable helper devices adjacent to
the path we get very similar enable/disable behavior to now, but with
more reuse of the existing reference counting logic in the coresight
core code. This also affects CATU which can have a little bit of
its hard coded enable/disable code removed.

Enabling CATU on the generic path does require that input connections
are tracked so that it can get its associated ETR buffer.

Applies to coresight/next (197b6b60ae7b) but also requires the
realloc_array patch here [1].

Also available in full here [2].

[1]: https://lore.kernel.org/linux-arm-kernel/20230306152723.3090195-1-james.clark@arm.com/
[2]: https://gitlab.arm.com/linux-arm/linux-jc/-/tree/james-cs-cti-module-refcount-fix-v3

James Clark (13):
  coresight: Use enum type for cs_mode wherever possible
  coresight: Change name of pdata->conns
  coresight: Rename nr_outports to nr_outconns
  coresight: Rename connection members to make the direction explicit
  coresight: Dynamically add connections
  coresight: Fix loss of connection info when a module is unloaded
  coresight: Store pointers to connections rather than an array of them
  coresight: Simplify connection fixup mechanism
  coresight: Store in-connections as well as out-connections
  coresight: Make refcount a property of the connection
  coresight: Refactor out buffer allocation function for ETR
  coresight: Enable and disable helper devices adjacent to the path
  coresight: Fix CTI module refcount leak by making it a helper device

 drivers/hwtracing/coresight/coresight-catu.c  |  21 +-
 drivers/hwtracing/coresight/coresight-core.c  | 557 +++++++++---------
 .../hwtracing/coresight/coresight-cti-core.c  |  52 +-
 .../hwtracing/coresight/coresight-cti-sysfs.c |   4 +-
 drivers/hwtracing/coresight/coresight-cti.h   |   4 +-
 drivers/hwtracing/coresight/coresight-etb10.c |  13 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
 .../coresight/coresight-etm3x-core.c          |   6 +-
 .../coresight/coresight-etm4x-core.c          |   6 +-
 .../hwtracing/coresight/coresight-funnel.c    |  26 +-
 .../hwtracing/coresight/coresight-platform.c  | 250 +++-----
 drivers/hwtracing/coresight/coresight-priv.h  |  17 +-
 .../coresight/coresight-replicator.c          |  23 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   6 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  26 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 drivers/hwtracing/coresight/coresight-tpda.c  |  23 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   7 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |   3 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  11 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
 include/linux/coresight.h                     | 124 ++--
 25 files changed, 669 insertions(+), 649 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
