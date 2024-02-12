Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381F851236
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 12:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2646EC6C83C;
	Mon, 12 Feb 2024 11:28:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7438AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 11:27:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE29FEC;
 Mon, 12 Feb 2024 03:28:40 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C9E73F762;
 Mon, 12 Feb 2024 03:27:57 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>
Date: Mon, 12 Feb 2024 11:27:51 +0000
Message-Id: <170773625002.2157180.12698644436434425979.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/12] coresight: Separate sysfs and
	Perf usage and some other cleanups
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

On Mon, 29 Jan 2024 15:40:31 +0000, James Clark wrote:
> Changes since V1:
> 
>   * Clarify further "the selected sink" in _coresight_build_path()
>   * Move etm4x's mode to coresight device which was missing from V1
>   * Use explicit initialisers in coresight_dev_type
>   * Create functions for handling mode changes
> 
> [...]

Applied, thanks!

[01/12] coresight: Fix issue where a source device's helpers aren't disabled
        https://git.kernel.org/coresight/c/f68bbe4dcfa3
[02/12] coresight: Make language around "activated" sinks consistent
        https://git.kernel.org/coresight/c/a0fef3f05cf3
[03/12] coresight: Remove ops callback checks
        https://git.kernel.org/coresight/c/a11ebe138b8d
[04/12] coresight: Move mode to struct coresight_device
        https://git.kernel.org/coresight/c/9cae77cf23e3
[05/12] coresight: Remove the 'enable' field.
        https://git.kernel.org/coresight/c/d5e83f97eb56
[06/12] coresight: Move all sysfs code to sysfs file
        https://git.kernel.org/coresight/c/1f5149c7751c
[07/12] coresight: Remove atomic type from refcnt
        https://git.kernel.org/coresight/c/4545b38ef004
[08/12] coresight: Remove unused stubs
        https://git.kernel.org/coresight/c/053ad9ad1d13
[09/12] coresight: Add explicit member initializers to coresight_dev_type
        https://git.kernel.org/coresight/c/812265e26ed3
[10/12] coresight: Add helper for atomically taking the device
        https://git.kernel.org/coresight/c/d724f65218b9
[11/12] coresight: Add a helper for getting csdev->mode
        https://git.kernel.org/coresight/c/c95c2733e5fe
[12/12] coresight: Add helper for setting csdev->mode
        https://git.kernel.org/coresight/c/bcaabb95f0c9

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
