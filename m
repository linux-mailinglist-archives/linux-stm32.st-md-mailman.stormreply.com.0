Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42BC8ACA0C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 11:59:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 527DEC6DD67;
	Mon, 22 Apr 2024 09:59:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAE8C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 09:59:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CC392F;
 Mon, 22 Apr 2024 02:59:55 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FF353F64C;
 Mon, 22 Apr 2024 02:59:25 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Date: Mon, 22 Apr 2024 10:59:18 +0100
Message-Id: <171377975977.3331951.13760450309364725525.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314055843.2625883-1-anshuman.khandual@arm.com>
References: <20240314055843.2625883-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux@armlinux.org.uk,
 linux-acpi@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V7 00/11] coresight: Move remaining AMBA
	ACPI devices into platform driver
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

On Thu, 14 Mar 2024 11:28:32 +0530, Anshuman Khandual wrote:
> This moves remaining AMBA ACPI devices into respective platform drivers for
> enabling ACPI based power management support. This series applies on latest
> coresight next. This series has been built, and boot tested on a DT based
> (RB5) and ACPI supported coresight platform (N1SDP).
> 
> https://git.gitlab.arm.com/linux-arm/linux-anshuman.git (amba_other_acpi_migration_v7)
> 
> [...]

Applied, thanks!

[01/11] coresight: etm4x: Fix unbalanced pm_runtime_enable()
        https://git.kernel.org/coresight/c/caa41c47dab7e1054f587e592ab21296e3a6781c
[02/11] coresight: stm: Extract device name from AMBA pid based table lookup
        https://git.kernel.org/coresight/c/852e9a32058a73702c016a8be10c60375276e46e
[03/11] coresight: tmc: Extract device properties from AMBA pid based table lookup
        https://git.kernel.org/coresight/c/3ab210297c31b8fef1cfb2aa3d85b227b9ace09b
[04/11] coresight: Add helpers registering/removing both AMBA and platform drivers
        https://git.kernel.org/coresight/c/075b7cd7ad7dec8651a6a6654fa5ebae436ac00f
[05/11] coresight: replicator: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/b448c4c72ca3327232dfb20d0065b693b3fcc2e2
[06/11] coresight: funnel: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/8e3227ddfbd7216f14186ec534f43e9dbcde717c
[07/11] coresight: catu: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/23567323857d2073197953bb158413be1aceca8b
[08/11] coresight: tpiu: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/3d83d4d4904a47626854b6bba44127d21a7dc713
[09/11] coresight: tmc: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/70750e257aab4cd4d755294ae8b9834214a624bb
[10/11] coresight: stm: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/057256aaacc862356417a75ceeb1cfa41408dbf0
[11/11] coresight: debug: Move ACPI support from AMBA driver to platform driver
        https://git.kernel.org/coresight/c/965edae4e6a2bca1f6e56d2c56d992417a53bba4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
