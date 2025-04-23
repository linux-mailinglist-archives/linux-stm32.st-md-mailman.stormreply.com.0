Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7789A9902B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 17:17:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75556C71287;
	Wed, 23 Apr 2025 15:17:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40208CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 15:17:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFB01063;
 Wed, 23 Apr 2025 08:17:38 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EDA83F66E;
 Wed, 23 Apr 2025 08:17:41 -0700 (PDT)
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
Date: Wed, 23 Apr 2025 16:17:17 +0100
Message-Id: <20250423151726.372561-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Leo Yan <leo.yan@arm.com>
Subject: [Linux-stm32] [PATCH v2 0/9] coresight: Fix and improve clock usage
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
some CoreSight modules, but support is absent.  In most cases, the issue
is hidden because the atclk clock is shared by multiple CoreSight
modules and the clock is enabled anyway by other drivers.  The first
three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, the drivers needs to manually disable
and release clocks for errors and for normal module exit.  However, the
drivers miss to disable clocks during module exit.  The atclk may also
not be disabled in CoreSight drivers during module exit.  By using devm
APIs, patches 04 and 05 fix clock disabling issues.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers.
This is fixed in patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 consolidats
the clock initialization into a central place.  Patch 08 makes the
clock enabling sequence consistent.  Patch 09 removes redundant
condition checks and adds error handling in runtime PM.

This series is verified on Arm64 Hikey960 platform.

Changes from v1:
- Moved the coresight_get_enable_clocks() function into CoreSight core
  layer (James).
- Added comments for clock naming "apb_pclk" and "apb" (James).
- Re-ordered patches for easier understanding (Anshuman).
- Minor improvement for commit log in patch 01 (Anshuman).


Leo Yan (9):
  coresight: tmc: Support atclk
  coresight: catu: Support atclk
  coresight: etm4x: Support atclk
  coresight: Disable programming clock properly
  coresight: Disable trace bus clock properly
  coresight: Avoid enable programming clock duplicately
  coresight: Consolidate clock enabling
  coresight: Make clock sequence consistent
  coresight: Refactor runtime PM

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++++++++++-----------------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-core.c       | 45 ++++++++++++++++++++++++++++
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
 include/linux/coresight.h                          | 30 ++-----------------
 16 files changed, 225 insertions(+), 289 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
