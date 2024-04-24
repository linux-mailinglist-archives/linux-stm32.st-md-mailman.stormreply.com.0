Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB48B0E7A
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 17:35:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3566DC7128C;
	Wed, 24 Apr 2024 15:35:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D6DC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 15:35:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18E171516;
 Wed, 24 Apr 2024 08:35:50 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6C723F73F;
 Wed, 24 Apr 2024 08:35:20 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Date: Wed, 24 Apr 2024 16:35:11 +0100
Message-Id: <171397287372.3469702.475326767939740618.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424023605.90489-1-jiapeng.chong@linux.alibaba.com>
References: <20240424023605.90489-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 james.clark@arm.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH] coresight: stm: Remove duplicate
	linux/acpi.h header
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

On Wed, 24 Apr 2024 10:36:05 +0800, Jiapeng Chong wrote:
> ./drivers/hwtracing/coresight/coresight-stm.c: linux/acpi.h is included more than once.
> 
> 

Applied, thanks!

[1/1] coresight: stm: Remove duplicate linux/acpi.h header
      https://git.kernel.org/coresight/c/002026272ba523d2ae62a13b0a9febb0cdaf576e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
