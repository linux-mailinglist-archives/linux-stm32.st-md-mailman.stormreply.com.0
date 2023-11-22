Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966C7F4568
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 13:10:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6458C6B476;
	Wed, 22 Nov 2023 12:10:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2615C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 12:10:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D6391595;
 Wed, 22 Nov 2023 04:11:11 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC93E3F7A6;
 Wed, 22 Nov 2023 04:10:22 -0800 (PST)
Date: Wed, 22 Nov 2023 12:10:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ZV3vrE6tCBWupwJM@bogus>
References: <20231027072943.3418997-1-anshuman.khandual@arm.com>
 <20231027072943.3418997-5-anshuman.khandual@arm.com>
 <92d6a66d-3270-3378-2ab9-9214c004d5c7@arm.com>
 <268e1605-fe3f-4aa0-92e3-36ddfc8aacb3@arm.com>
 <ZV3kVhZYBHwSaPr9@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZV3kVhZYBHwSaPr9@bogus>
Cc: suzuki.poulose@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/7] coresight: tpiu: Move ACPI support
 from AMBA driver to platform driver
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

On Wed, Nov 22, 2023 at 11:21:58AM +0000, Sudeep Holla wrote:
> On Wed, Nov 22, 2023 at 12:32:33PM +0530, Anshuman Khandual wrote:
[..]

> > Although, AFAICT, have not seen these before - even on the defconfig.
> > Just to work around this problem, there can be a common module_init()
> > /module_exit() to register/unregister both AMBA and platform drivers,
> > similar to etm4x_init()/etm4x_exit() setup in coresight-etm4x-core.c.
> 
> Could this be the reason why I am seeing the below error why booting with
> ACPI ? I wanted to check the tables before I comment but this discussion
> made me think it could be the reason, hence posting this before I got time
> to analyse it.
> 
>   |  coresight-tmc-platform ARMHC97C:00: can't request region for resource [mem 0x20010000-0x20010fff]
>   |  coresight-tmc-platform: probe of ARMHC97C:00 failed with error -16
>   |  coresight-tmc-platform ARMHC501:00: can't request region for resource [mem 0x20070000-0x20070fff]
>   |  coresight-tmc-platform: probe of ARMHC501:00 failed with error -16
> 

Scratch that, it didn't help. This error I am seeing is not related to
the issue reported here. I tried a hack below, it didn't help.
 
Regards,
Sudeep

-->8
diff --git i/drivers/hwtracing/coresight/coresight-tpiu.c w/drivers/hwtracing/coresight/coresight-tpiu.c
index ea8827d289ca..f6ba350b3777 100644
--- i/drivers/hwtracing/coresight/coresight-tpiu.c
+++ w/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -254,8 +254,6 @@ static struct amba_driver tpiu_driver = {
        .id_table       = tpiu_ids,
 };

-module_amba_driver(tpiu_driver);
-
 static int tpiu_platform_probe(struct platform_device *pdev)
 {
        struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -297,7 +295,21 @@ static struct platform_driver tpiu_platform_driver = {
                .pm                     = &tpiu_dev_pm_ops,
        },
 };
-module_platform_driver(tpiu_platform_driver);
+
+static int __init tpiu_init(void)
+{
+       amba_driver_register(&tpiu_driver);
+       platform_driver_register(&tpiu_platform_driver);
+       return 0;
+}
+
+static void __exit tpiu_exit(void)
+{
+       amba_driver_unregister(&tpiu_driver);
+       platform_driver_unregister(&tpiu_platform_driver);
+}
+module_init(tpiu_init);
+module_exit(tpiu_exit);

 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
