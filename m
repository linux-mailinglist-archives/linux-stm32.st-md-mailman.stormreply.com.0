Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26296A138
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 16:52:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A6B4C71292;
	Tue,  3 Sep 2024 14:52:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F8DC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 14:52:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D959AA43735;
 Tue,  3 Sep 2024 14:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87521C4CEC4;
 Tue,  3 Sep 2024 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725375168;
 bh=r82WX5U3SVE11HWz1+1arg0msM0j6AfzMYQI/uAjjuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G/hkWJiclG+CQTE+Kqwlpl+0RqKjlpnd7PZi8TZl1T7kz2yVllunOAVk+JdPKA37q
 Y9x7wZ0thIbOKI16qn/8abaHCGEL35SxqNqhqJTeScZNby3s0htEXrqwaawbCRHzlS
 iuy24U9g2Acl11Ep8gAc/rpo3oY1rsi4aiBlu7ApaYZd9A9qxcEb9BIDO3bTaXOESY
 diUKMvy30PMbDSl1UWlhXySjpvDD52flG/RjqubuU1SdEkDMR/rIIRiWkOcKDOfJm8
 /c+BU64CydMau32uh1UREh2O0zvYGCl2j4ipf6BPfxlV2JB8CC1q5iRdiU0TiOZ+rB
 4YARsO8pp2Inw==
Date: Tue, 3 Sep 2024 09:52:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <172537516622.996858.7295101990196127870.robh@kernel.org>
References: <20240903121303.2953150-1-christian.bruel@foss.st.com>
 <20240903121303.2953150-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903121303.2953150-2-christian.bruel@foss.st.com>
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 p.zabel@pengutronix.de, linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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


On Tue, 03 Sep 2024 14:12:59 +0200, Christian Bruel wrote:
> Document the bindings for STM32 COMBOPHY interface, used to support
> the PCIe and USB3 stm32mp25 drivers.
> Following entries can be used to tune caracterisation parameters
>  - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
> to tune the impedance and voltage swing using discrete simulation results
>  - st,rx-equalizer register to set the internal rx equalizer filter value.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/phy/st,stm32mp25-combophy.yaml   | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
