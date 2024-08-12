Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53994F188
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 17:21:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A29CC6DD72;
	Mon, 12 Aug 2024 15:21:00 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B0D7C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 15:20:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC42DCE0F1C;
 Mon, 12 Aug 2024 15:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E8AC32782;
 Mon, 12 Aug 2024 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723476049;
 bh=VnLGDmiaS2Z5tkjkWIn8CfimR/QHZ7JqU5+27LaswZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PGSJCj+xyE8GhlEPNNPT6Z8/M2R+2J0KBUK78fhmm0QDMf+McYucSTLqbxkeOs43i
 LzDaM79Eh6+GBcdURLwNB05moUu9GvoHYg7ahOFshYExHJIou/761s7K8Ues8sYFVS
 S9GvRps8jicURswrHPm3YB7bLZTnVhvMl7vl0LmYnx7BOSsXe4caUAmakorg+hEtwc
 QLKB12/zdCNxmKC27fMQcBKqLTdFCSg3OToHxBSuTLlHgHlYwY6swLRKkDRfLgc+dQ
 ohqSCphktXWOuO+CTUbEjU0kE8BffKSDXYwUqbEDgfrdVdMsW9CluNaMjGew/si9by
 YmJQ8/A19HrIA==
Date: Mon, 12 Aug 2024 09:20:48 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20240812152048.GA593866-robh@kernel.org>
References: <20240812120529.3564390-1-christian.bruel@foss.st.com>
 <20240812120529.3564390-3-christian.bruel@foss.st.com>
 <172346965242.493337.13574697496053856.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172346965242.493337.13574697496053856.robh@kernel.org>
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 p.zabel@pengutronix.de, linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: phy: Add STM32MP25
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

On Mon, Aug 12, 2024 at 07:34:12AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 12 Aug 2024 14:05:26 +0200, Christian Bruel wrote:
> > Document the bindings for STM32 COMBOPHY interface, used to support
> > the PCIe and USB3 stm32mp25 drivers.
> > Following entries can be used to tune caracterisation parameters
> >  - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
> > to tune the impedance and voltage swing using discrete simulation results
> >  - st, phy_rx0_eq register to set the internal rx equalizer filter value.
> > 
> > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > ---
> >  .../bindings/phy/st,stm32-combophy.yaml       | 178 ++++++++++++++++++
> >  1 file changed, 178 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml: access-controllers: missing type definition

Ignore this. It's a problem with the build.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
