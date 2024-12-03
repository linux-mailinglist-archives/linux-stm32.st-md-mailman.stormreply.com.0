Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87F9E2F05
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 23:25:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4083FC6DD72;
	Tue,  3 Dec 2024 22:25:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C3A7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 22:25:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CBE75A40C4F;
 Tue,  3 Dec 2024 22:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81806C4CEDC;
 Tue,  3 Dec 2024 22:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733264716;
 bh=Z15C0mt3XM7YpivR1T5/W0M5swvKfGcdZ7nyxNwhLoQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=qhLj8p8eyWJXXP2R4fcik2XxZ1g4PpArVVeC4x2S0kXCH2O24HAt7vH4EuYcRZa9U
 agS0BM2aYhGkfRoh8AXjL7O1WEuoUtSxGq8aIPSUqUqT7p5kfpOKmj6WTOkNfWb6ae
 gesaNcOwa2CvKG0o081fcGYQyV1Aiw4aQQ57Md9Ffuda70Vw/Z/TP0AI/31q1JMnlr
 R4TnoXjduLP3en1w119e6ZYjMoLmpmNHSCdjvW4PMO4Sika9XCgkDNvThTj90uvqnI
 HFrNGoNAfsgTkVZtdnf4kK7COX0g/5hcp3ydpoWWf+O0KZ2vGTem5n36fzY7c/FExp
 rrf6y623PwJTQ==
Date: Tue, 3 Dec 2024 16:25:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <20241203222515.GA2967814@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-2-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25
 PCIe root complex bindings
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

On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> 
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.

s/legacy/INTx/

> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports wake# from wake-gpios

s/wake#/WAKE#/

> +  wake-gpios:
> +    description: GPIO controlled connection to WAKE# input signal

I'm not a hardware guy, but this sounds like a GPIO that *reads*
WAKE#, not controls it.

> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
> +        num-lanes = <1>;

num-lanes applies to a Root Port, not to a Root Complex.  I know most
bindings conflate Root Ports with the Root Complex, maybe because many
of these controllers only support a single Root Port?

But are we ever going to separate these out?  I assume someday
controllers will support multiple Root Ports and/or additional devices
on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
max-link-speed, num-lanes, reset-gpios, etc.

Seems like it would be to our benefit to split out the Root Ports when
we can, even if the current hardware only supports one, so we can
start untangling the code and data structures.

Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
