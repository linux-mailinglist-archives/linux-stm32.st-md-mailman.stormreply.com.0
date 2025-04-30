Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0EAA50B2
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 17:48:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93387C78032;
	Wed, 30 Apr 2025 15:48:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E993C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 15:48:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38DB01063;
 Wed, 30 Apr 2025 08:48:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C61703F5A1;
 Wed, 30 Apr 2025 08:48:22 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com,
 leo.yan@arm.com, James Clark <james.clark@linaro.org>
Date: Wed, 30 Apr 2025 16:48:14 +0100
Message-ID: <174602806438.102450.17012321873232714214.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/7] coresight: Clear self hosted claim
	tag on probe
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


On Tue, 25 Mar 2025 11:58:45 +0000, James Clark wrote:
> I've gotten stuck a few times with unusable Coresight after a warm boot
> due to lingering claim tags, especially when testing the Coresight
> panic patchsets.
> 
> This change does some tidy ups, adds some debug messages and clears the
> self hosted claim tag on probe. The last two commits are unrelated
> tidyups but they touch some of the same functions so to avoid extra
> conflicts I'm including them here.
> 
> [...]

Applied, thanks!

[1/7] coresight: Convert tag clear function to take a struct csdev_access
      https://git.kernel.org/coresight/c/fc7fed6f
[2/7] coresight: Only check bottom two claim bits
      https://git.kernel.org/coresight/c/a4e65842
[3/7] coresight: Add claim tag warnings and debug messages
      https://git.kernel.org/coresight/c/a244a18c
[4/7] coresight: etm3x: Convert raw base pointer to struct coresight access
      https://git.kernel.org/coresight/c/a1b0e77c
[5/7] coresight: Clear self hosted claim tag on probe
      https://git.kernel.org/coresight/c/7cd63686
[6/7] coresight: Remove inlines from static function definitions
      https://git.kernel.org/coresight/c/48a5126b
[7/7] coresight: Remove extern from function declarations
      https://git.kernel.org/coresight/c/e6e6b692

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
