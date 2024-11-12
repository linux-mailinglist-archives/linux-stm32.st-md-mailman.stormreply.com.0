Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDBA9C6066
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 19:28:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D97A1C78F84;
	Tue, 12 Nov 2024 18:28:19 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91131C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 18:28:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6774BA422BE;
 Tue, 12 Nov 2024 18:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ED6C4CECD;
 Tue, 12 Nov 2024 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731436091;
 bh=H2jCUzYK5IZCoCe/12Ednn9tkBc4SKBxPTgIjXecd/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EOe0pd7p2tFGaOY09OQHqQtAl685Kj8521XyjL8ay5Qpu+Ruwqyp6IaIFzzD/o78m
 KhHkQhpmzmggVJtXTD5qUUHJdyE/9jKD7MaJunItfnHMoZRC0HDvvc0h1utVopw7Kb
 9XsPEcvllavigmZ1drRaAGjK12HlPvUkGXXiFEecGm3+TseuNhFCWGycRMfOQftGKI
 SRecpQDkcLc1zOw8bUvVpOZDF8ReNwh716GlysliyDd77w7/v+tyQNb/fk/IWlGUPe
 xx2fbzF00ZVaNwHXHN7BNFbSsMNkIII/7kWfywEn9pbxIJd4htSdangQ+lXbfU4vsX
 Nx5lm4/oyDdFw==
Date: Tue, 12 Nov 2024 12:28:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241112182809.GA1853254@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-2-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe
 root complex bindings
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

On Tue, Nov 12, 2024 at 05:19:21PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.
> 
> Allow tuning to change payload (default 128B) thanks to the
> st,max-payload-size entry.
> Can also limit the Maximum Read Request Size on downstream devices to the
> minimum possible value between 128B and 256B.
> 
> STM32 PCIE may be in a power domain which is the case for the STM32MP25
> based boards.
> Supports wake# from wake-gpios

> +  st,limit-mrrs:
> +    description: If present limit downstream MRRS to 256B
> +    type: boolean
> +
> +  st,max-payload-size:
> +    description: Maximum Payload size to use
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [128, 256]
> +    default: 128

MRRS and MPS are not specific to this device.  Not sure why you need
them, but if you do need them, I think they should be generic.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
