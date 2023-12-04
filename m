Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292D8031EA
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 12:58:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7274C6B46B;
	Mon,  4 Dec 2023 11:58:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0EEFC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 11:58:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3BD152B;
 Mon,  4 Dec 2023 03:58:57 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4533F5A1;
 Mon,  4 Dec 2023 03:58:08 -0800 (PST)
Date: Mon, 4 Dec 2023 11:58:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: James Clark <james.clark@arm.com>
Message-ID: <ZW2-zuTtV5GxaiFH@bogus>
References: <20231201062053.1268492-1-anshuman.khandual@arm.com>
 <20231201062053.1268492-7-anshuman.khandual@arm.com>
 <0adc3a16-0fc4-2a25-cd48-4667881b9490@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0adc3a16-0fc4-2a25-cd48-4667881b9490@arm.com>
Cc: suzuki.poulose@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V2 6/7] coresight: stm: Move ACPI support
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

On Mon, Dec 04, 2023 at 10:23:49AM +0000, James Clark wrote:
> 
> On 01/12/2023 06:20, Anshuman Khandual wrote:
> > Add support for the stm devices in the platform driver, which can then be
> > used on ACPI based platforms. This change would now allow runtime power
> > management for ACPI based systems. The driver would try to enable the APB
> > clock if available.
> > 
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Mike Leach <mike.leach@linaro.org>
> > Cc: James Clark <james.clark@arm.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: linux-acpi@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: coresight@lists.linaro.org
> > Cc: linux-stm32@st-md-mailman.stormreply.com
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> [...]
> >  
> > -module_amba_driver(stm_driver);
> > +static int stm_platform_probe(struct platform_device *pdev)
> > +{
> > +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	int ret = 0;
> > +
> > +	pm_runtime_get_noresume(&pdev->dev);
> > +	pm_runtime_set_active(&pdev->dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	ret = __stm_probe(&pdev->dev, res, NULL);
> 
> Very minor nit, but this used to print this:
> 
>   coresight stm0: STM500 initialized
> 
> And now it prints this:
> 
>   coresight stm0: (null) initialized
> 
> (null) kind of makes it look a little bit like something has gone wrong.
> Maybe we could just put "initialised" if you don't have a string from ACPI?

Ah right, I too noticed this and forgot to mention. Just add a generic
"STM" string for ACPI if we don't have a way to identify exact IP ?

--
Regards,
Sudeep
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
