Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C78791CF
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 11:23:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B334FC6DD75;
	Tue, 12 Mar 2024 10:23:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 926C0C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 10:23:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4651007;
 Tue, 12 Mar 2024 03:24:11 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.52.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB78B3F73F;
 Tue, 12 Mar 2024 03:23:28 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Tue, 12 Mar 2024 15:53:07 +0530
Message-Id: <20240312102318.2285165-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH V6 00/11] coresight: Move remaining AMBA ACPI
	devices into platform driver
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

This moves remaining AMBA ACPI devices into respective platform drivers for
enabling ACPI based power management support. This series applies on latest
coresight next. This series has been built, and boot tested on a DT based
(RB5) and ACPI supported coresight platform (N1SDP).

https://git.gitlab.arm.com/linux-arm/linux-anshuman.git (amba_other_acpi_migration_v6)

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Cc: linux-stm32@st-md-mailman.stormreply.com

Changes in V6:

- Dropped Jame's RB tag from [PATCH 3/11]
- Added clk_disable_unprepare() for pclk in replicator_probe() error path
- Added clk_disable_unprepare() for pclk in funnel_probe() error path
- Added clk_put() for pclk in catu_platform_probe() error path
- Added clk_put() for pclk in debug_platform_probe() error path
- Added WARN_ON(!drvdata) check in replicator_platform_remove()
- Added WARN_ON(!drvdata) check in funnel_platform_remove()
- Added WARN_ON(!drvdata) check in catu_platform_remove()
- Added WARN_ON(!drvdata) check in tpiu_platform_remove()
- Added WARN_ON(!drvdata) check in tmc_platform_remove()
- Added WARN_ON(!drvdata) check in stm_platform_remove()
- Added WARN_ON(!drvdata) check in debug_platform_remove()
- Added additional elements for all acpi_device_id[] updates

Changes in V5:

https://lore.kernel.org/all/20240222082142.3663983-1-anshuman.khandual@arm.com/

- Used table->mask to filter out bits from pid in coresight_get_uci_data_from_amba()
- Dropped custom masks such as STM_AMBA_MASK and TMC_AMBA_MASK
- Modified tmc_etr_setup_caps() to accept struct csdev_access argument
- Reverted back tmc_etr_setup_caps() call site position in tmc_probe()
- Changed replicator and funnel devices to use the new helpers earlier in series
- Updated the commit messages regarding xxx_probe() refactoring and renaming

Changes in V4:

https://lore.kernel.org/all/20240123054608.1790189-1-anshuman.khandual@arm.com/

- Fixed PM imbalance in etm4_probe() error path with pm_runtime_disable()
- Restored back the pm_runtime_disable() on platform probe error paths
  in replicator, funnel, catu, tpiu, tmc and stm devices
- Dropped dev_caps argument from __tmc_probe()
- Changed xxxx_platform_remove() for platform_driver->remove_new() callback

Changes in V3:

https://lore.kernel.org/all/20231208053939.42901-1-anshuman.khandual@arm.com/

- Split coresight_init_driver/remove_driver() helpers into a separate patch
- Added 'drvdata->pclk' comments in replicator, funnel, tpiu, tmc, and stm devices
- Updated funnel, and replicator drivers to use these new helpers
- Check for drvdata instead of drvdata->pclk in suspend and resume paths in catu,
  tmc and debug devices
- Added patch to extract device name from AMBA pid based table lookup for stm
- Added patch to extract device properties from AMBA pid based table look for tmc
- Dropped pm_runtime_put() from common __probe() functions
- Handled pm_runtime_put() in AMBA driver in success path
- Handled pm_runtime_put() in platform driver in both success and error paths

Changes in V2:

https://lore.kernel.org/all/20231201062053.1268492-1-anshuman.khandual@arm.com/

- Dropped redundant devm_ioremap_resource() hunk from tmc_platform_probe()
- Defined coresight_[init|remove]_driver() for both AMBA/platform drivers
- Changed catu, tmc, tpiu, stm and debug coresight drivers to use the new
  helpers avoiding build issues arising from module_amba_driver(), and
  module_platform_driver() being on the same file

Changes in V1:

https://lore.kernel.org/all/20231027072943.3418997-1-anshuman.khandual@arm.com/

- Replaced all IS_ERR() instances with IS_ERR_OR_NULL() as per Suzuki

Changes in RFC:

https://lore.kernel.org/all/20230921042040.1334641-1-anshuman.khandual@arm.com/

Anshuman Khandual (11):
  coresight: etm4x: Fix unbalanced pm_runtime_enable()
  coresight: stm: Extract device name from AMBA pid based table lookup
  coresight: tmc: Extract device properties from AMBA pid based table lookup
  coresight: Add helpers registering/removing both AMBA and platform drivers
  coresight: replicator: Move ACPI support from AMBA driver to platform driver
  coresight: funnel: Move ACPI support from AMBA driver to platform driver
  coresight: catu: Move ACPI support from AMBA driver to platform driver
  coresight: tpiu: Move ACPI support from AMBA driver to platform driver
  coresight: tmc: Move ACPI support from AMBA driver to platform driver
  coresight: stm: Move ACPI support from AMBA driver to platform driver
  coresight: debug: Move ACPI support from AMBA driver to platform driver

 drivers/acpi/arm64/amba.c                     |   8 -
 drivers/hwtracing/coresight/coresight-catu.c  | 146 ++++++++++++++---
 drivers/hwtracing/coresight/coresight-catu.h  |   1 +
 drivers/hwtracing/coresight/coresight-core.c  |  29 ++++
 .../hwtracing/coresight/coresight-cpu-debug.c | 146 ++++++++++++++---
 .../coresight/coresight-etm4x-core.c          |   3 +
 .../hwtracing/coresight/coresight-funnel.c    |  87 +++++-----
 drivers/hwtracing/coresight/coresight-priv.h  |  10 ++
 .../coresight/coresight-replicator.c          |  82 +++++-----
 drivers/hwtracing/coresight/coresight-stm.c   | 116 +++++++++++--
 .../hwtracing/coresight/coresight-tmc-core.c  | 154 +++++++++++++++---
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 drivers/hwtracing/coresight/coresight-tpiu.c  | 103 ++++++++++--
 include/linux/coresight.h                     |   7 +
 14 files changed, 729 insertions(+), 165 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
