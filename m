Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011AA220CB
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 16:44:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33936C78034;
	Wed, 29 Jan 2025 15:44:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EDE1C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 15:44:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52EB85C5DE2;
 Wed, 29 Jan 2025 15:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986BEC4CED1;
 Wed, 29 Jan 2025 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738165477;
 bh=1VUif8Q56cdMe1cHovQowDVeYxK9USFWvRbdMuxlrJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAoSCGWx1Xjlffqp3lezZGmNfTX8wU8bPQbfRsMb+1OL0l+DUeANYFwtaMBZbBeHk
 NjMLIomxBAPH19nYTYoeJFQvXUwwV8J8QOmKsXXNfk8KnEQVQ+k7U+2ITUoe5GZdGt
 XEvPFSMIzG1uKZeaL2Lga3vpSGcejUwrzcTQQA7OwXe2vzDL+H/HMGgzRgtqyMJRDf
 Vgk3gS/jijLBxPGL3XDQkqxfh6jwtjv14sdAUOlkSxjvCfMuRPJqMNOK+ew6HrV694
 IpL+wpDMhCqR6Zj/2ofBS+AtAvHN+f8r2TZZuFIbX+mP1Yap3ptZ80y5qwROVC/Abt
 ZcAc+4+FGDiOg==
Date: Wed, 29 Jan 2025 09:44:35 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250129154435.GA2145727-robh@kernel.org>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128120745.334377-2-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, cassel@kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 01/10] dt-bindings: PCI: Add STM32MP25
 PCIe Root Complex bindings
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

On Tue, Jan 28, 2025 at 01:07:36PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode with one root port.
> 
> Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports WAKE# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  33 +++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 116 ++++++++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
