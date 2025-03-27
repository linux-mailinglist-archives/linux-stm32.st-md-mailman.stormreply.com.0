Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207CA72FD1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Mar 2025 12:38:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CDA8C78F73;
	Thu, 27 Mar 2025 11:38:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB103C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 11:38:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A061063;
 Thu, 27 Mar 2025 04:38:26 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6C5F3F58B;
 Thu, 27 Mar 2025 04:38:19 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 27 Mar 2025 11:37:54 +0000
Message-Id: <20250327113803.1452108-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Leo Yan <leo.yan@arm.com>
Subject: [Linux-stm32] [PATCH v1 0/9] coresight: Fix and improve clock usage
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

This series fixes and improves clock usage in the Arm CoreSight drivers.

Based on the DT binding documents, the trace clock (atclk) is defined in
some CoreSight modules, but the corresponding drivers to support it are
absent.  In most cases, the issue is hidden because atclk is shared by
multiple CoreSight modules and is enabled anyway by other drivers.
The first three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, so the drivers needs to manually
disable and release clocks for errors and for normal module exit.
However, the drivers miss to disable clocks during module exit.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers.

Patches 04 and 05 fix pclk issues.

The atclk may also not be disabled in CoreSight drivers during module
exit.  This is fixed in patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 makes the
clock enabling sequence consistent.  Patch 08 removes redundant
condition checks and adds error handling in runtime PM.  Patch 09
consolidats the clock initialization into a central place.

This series is verified on Arm64 Hikey960 platform.


Leo Yan (9):
  coresight: tmc: Support atclk
  coresight: catu: Support atclk
  coresight: etm4x: Support atclk
  coresight: Disable programming clock properly
  coresight: Avoid enable programming clock duplicately
  coresight: Disable trace bus clock properly
  coresight: Make clock sequence consistent
  coresight: Refactor runtime PM
  coresight: Consolidate clock enabling

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++++++++++-----------------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++++++-----------------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++++----------
 drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++++--------
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++-------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++++++----------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 ++-
 drivers/hwtracing/coresight/coresight-funnel.c     | 66 +++++++++++++++---------------------------
 drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++++++++--------------------------
 drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 +++++++++++++++---------------
 drivers/hwtracing/coresight/coresight-tmc.h        |  2 ++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 36 ++++++++++-------------
 include/linux/coresight.h                          | 47 ++++++++++++++++++------------
 15 files changed, 206 insertions(+), 280 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
