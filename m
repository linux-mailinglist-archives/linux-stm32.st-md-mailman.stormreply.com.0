Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD89DAA3D
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 15:59:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3691BC78036;
	Wed, 27 Nov 2024 14:59:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39276C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 14:59:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A087A5C5BC3;
 Wed, 27 Nov 2024 14:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753AEC4CECC;
 Wed, 27 Nov 2024 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732719564;
 bh=SVhXyj/ZbRJBm3pGNYNcl/3ggq+hcnNG3Esckkf/+Yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TGTTDtjwHXPmzkERIfnnt1B08xP9zER2IuaQCb6KIZPwaS6Gja8vheY34Uo/TfQF0
 Uvrmiz1eloyHIZind1vhluijfaF7fPXrqKw6Jj17pD/ONXPyxYyZu85V+gsevxU2Gm
 T8Hnl4x6Yd6Od8VwiJbyY5sObEOqEeBkpXseFFSkYX0UhWw5hadQ2J8SuD2Zo0WLDD
 tNtEoCHAIwNO8nAx9k1yoiUz/RyJvYXG8d2a1u/MhHdibUF+rYHVsOuZ7ZP5nTe/Yc
 8x/H4AmzuryL/HTW9M+bc4VTgALSWNEubNbu4PNmdMWIAMHAyYoOHPfYGtqXAusS6J
 0M6eMhpeTELfg==
Date: Wed, 27 Nov 2024 08:59:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <173271956195.3489911.2255772456897177524.robh@kernel.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-4-christian.bruel@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org, quic_schintav@quicinc.com,
 p.zabel@pengutronix.de, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: PCI: Add STM32MP25
 PCIe endpoint bindings
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


On Tue, 26 Nov 2024 16:51:17 +0100, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
