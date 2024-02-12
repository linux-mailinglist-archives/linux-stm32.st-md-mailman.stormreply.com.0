Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E7851234
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 12:27:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 047AFC6C83C;
	Mon, 12 Feb 2024 11:27:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91D91C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 11:27:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6320FDA7;
 Mon, 12 Feb 2024 03:27:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C2663F762;
 Mon, 12 Feb 2024 03:27:16 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>
Date: Mon, 12 Feb 2024 11:27:11 +0000
Message-Id: <170773625002.2157180.1032311578975893182.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
References: <20231123120459.287578-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/4] coresight: Make current W=1
	warnings default
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

On Thu, 23 Nov 2023 12:04:55 +0000, James Clark wrote:
> Changes since v2:
> 
>   * Split code and Makefile changes
>   * Add a fix for a comment warning in etm3x
>   * Add some sparse checker fixes in coresight-cfg-afdo.c
>   * Fix the 0 instead of NULL warnings reported by kernel test robot
> 
> [...]

Now moved to coresight next branch, thanks!

[1/4] coresight: Fix uninitialized struct warnings
      https://git.kernel.org/coresight/c/8a519235c3c3
[2/4] coresight: etm3x: Fix build warning
      https://git.kernel.org/coresight/c/54daf07e6332
[3/4] coresight: Fix undeclared variable warnings from sparse checker
      https://git.kernel.org/coresight/c/a7195f3f9383
[4/4] coresight: Make current W=1 warnings default
      https://git.kernel.org/coresight/c/d999c7dd5279

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
