Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 656657F5EB7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:06:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24428C6B479;
	Thu, 23 Nov 2023 12:06:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88C5FC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:06:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 434A91042;
 Thu, 23 Nov 2023 04:07:10 -0800 (PST)
Received: from e127643.arm.com (unknown [10.57.3.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37A673F7A6;
 Thu, 23 Nov 2023 04:06:22 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Thu, 23 Nov 2023 12:04:55 +0000
Message-Id: <20231123120459.287578-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v3 0/4] coresight: Make current W=1 warnings
	default
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

  * Split code and Makefile changes
  * Add a fix for a comment warning in etm3x
  * Add some sparse checker fixes in coresight-cfg-afdo.c
  * Fix the 0 instead of NULL warnings reported by kernel test robot

James Clark (4):
  coresight: Fix uninitialized struct warnings
  coresight: etm3x: Fix build warning
  coresight: Fix undeclared variable warnings from sparse checker
  coresight: Make current W=1 warnings default

 drivers/hwtracing/coresight/Makefile          | 20 +++++++++++++++++++
 .../hwtracing/coresight/coresight-cfg-afdo.c  |  1 +
 .../hwtracing/coresight/coresight-cti-core.c  |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c |  2 +-
 .../coresight/coresight-etm3x-core.c          |  4 ++--
 .../coresight/coresight-etm4x-core.c          |  2 +-
 .../hwtracing/coresight/coresight-funnel.c    |  4 ++--
 .../coresight/coresight-replicator.c          |  2 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |  2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |  2 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  2 +-
 14 files changed, 35 insertions(+), 14 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
