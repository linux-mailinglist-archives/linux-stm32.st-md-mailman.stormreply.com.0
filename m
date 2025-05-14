Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F060CAB7642
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 21:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F4EC78F99;
	Wed, 14 May 2025 19:59:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76B0CCFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 19:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8305B5C48B8;
 Wed, 14 May 2025 19:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F253CC4CEED;
 Wed, 14 May 2025 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747252778;
 bh=qW5rFOZIUMIBxccZW3o6GhkmgWY42f309svVpKLhFmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dJ5EplJJPn6Tz9O3+AZuZXh4X+8zgKjmalug+lEd66Vad5lxOacniJp6hmODD01TM
 Osq9ifdXaEYW+x4jYXSK338ObxTf7SQMmlhEySuRcaByx88caBfm02Z7GGHw6pHpPR
 gqfL5mOlMSKJoMuya+QV0YRpEuc3jQxhN6IY9HIRNkvGB2DqM2J7eSTU4SpKu0rUnQ
 FXpNuqO/4i6ZlU/2vhh/bBiKwhYPSz+HSjrXeZSnDETm7cEmqlW9FDsPabO2+K45Rw
 SmZ4+HfqrDDrRT1Np7xc7Z9EMX63iFm4MmJEm+CCTvPHaDaLflRgkqG34Q7SOtRl5h
 P8J5MNzz9FIPw==
Date: Wed, 14 May 2025 14:59:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <174725276905.2927216.8851775897003421959.robh@kernel.org>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
 <20250514144428.3340709-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514144428.3340709-4-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 thippeswamy.havalige@amd.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 p.zabel@pengutronix.de, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
 krzk+dt@kernel.org, shradha.t@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v10 3/9] dt-bindings: PCI: Add STM32MP25
 PCIe Endpoint bindings
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


On Wed, 14 May 2025 16:44:22 +0200, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
