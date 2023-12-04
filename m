Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E45728031A3
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 12:40:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AFA6C6B46B;
	Mon,  4 Dec 2023 11:40:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80063C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 11:40:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FE49152B;
 Mon,  4 Dec 2023 03:41:35 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DCBA3F6C4;
 Mon,  4 Dec 2023 03:40:46 -0800 (PST)
Date: Mon, 4 Dec 2023 11:40:43 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: James Clark <james.clark@arm.com>
Message-ID: <ZW26u_2pHz9bNoTx@bogus>
References: <20231201062053.1268492-1-anshuman.khandual@arm.com>
 <20231201062053.1268492-6-anshuman.khandual@arm.com>
 <fe5c82d1-8b7d-6701-4e19-9019f23d9c7b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe5c82d1-8b7d-6701-4e19-9019f23d9c7b@arm.com>
Cc: suzuki.poulose@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V2 5/7] coresight: tmc: Move ACPI support
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

On Mon, Dec 04, 2023 at 10:54:15AM +0000, James Clark wrote:
>
>
> On 01/12/2023 06:20, Anshuman Khandual wrote:
> > Add support for the tmc devices in the platform driver, which can then be
> > used on ACPI based platforms. This change would now allow runtime power
> > management for ACPI based systems. The driver would try to enable the APB
> > clock if available.
> >
> [...]
> > -module_amba_driver(tmc_driver);
> > +static int tmc_platform_probe(struct platform_device *pdev)
> > +{
> > +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	struct tmc_drvdata *drvdata;
> > +	int ret = 0;
> > +
> > +	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> > +	if (!drvdata)
> > +		return -ENOMEM;
> > +
> > +	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> > +	if (IS_ERR(drvdata->pclk))
> > +		return -ENODEV;
> > +
> > +	dev_set_drvdata(&pdev->dev, drvdata);
> > +	pm_runtime_get_noresume(&pdev->dev);
> > +	pm_runtime_set_active(&pdev->dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	ret = __tmc_probe(&pdev->dev, res, NULL);
> > +	if (ret) {
> > +		pm_runtime_put_noidle(&pdev->dev);
> > +		pm_runtime_disable(&pdev->dev);
> > +	}
>
> I'm not sure if these pm_runtime()s are right because there is already a
> put inside of __tmc_probe() if it fails. If you unload and then reload
> all the coresight modules with these patches you get these errors which
> are new:
>

Ah good find. I have just tested with ACPI and these modules as built-in
to be more specific.

--
Regards,
Sudeep
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
