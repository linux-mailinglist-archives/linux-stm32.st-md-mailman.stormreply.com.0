Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B29E5CF2
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 18:20:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1DB4C7802B;
	Thu,  5 Dec 2024 17:20:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E642C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 17:20:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A37D5C67D6;
 Thu,  5 Dec 2024 17:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FD3C4CED1;
 Thu,  5 Dec 2024 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733419223;
 bh=J4RkZ5QcEl8BbbxZ0oiUNZ6PyUOhfVv0KK0hpYX0QHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rftU0Zqtc9rZbHZ3b72ZLSyJ+U1EXcTYa5W6E7+3oB48oYixbQ6rPv41EdATIKyPA
 eceinoMbrJOg2T+pWNemssUo+s2q2FALIGGfuMiyZNOHhkdFw42D/2FcopxvVKJXC4
 8lL5dr+LSh7aWZZMYTtFB1nvFOS2f0GurLvUb8wNkB3SgOa9p9Oon25AEz+X5Ne/6/
 xM5wD4MOqGx00Q37pa0Htl/wWXrID9mZszE8JWqVlDzqZi6uG1Iq2vjVQkZ+o9AQgp
 rjypv9377pYhtbLIceudyFqTvMInGom0gyAtzceg/vyPdXLTTEgFh7GD03QzOZK6yd
 e0wjh2DmCu4BQ==
Date: Thu, 5 Dec 2024 11:20:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <20241205172022.GA3053765@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <569904ad-2b70-4a58-98fe-4f24e1089e17@foss.st.com>
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

[cc->to: Rob for RC/RP separation conversation]

On Thu, Dec 05, 2024 at 02:41:26PM +0100, Christian Bruel wrote:
> On 12/3/24 23:25, Bjorn Helgaas wrote:
> > On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> > > Document the bindings for STM32MP25 PCIe Controller configured in
> > > root complex mode.
> > > 
> > > Supports 4 legacy interrupts and MSI interrupts from the ARM
> > > GICv2m controller.

> > > +  wake-gpios:
> > > +    description: GPIO controlled connection to WAKE# input signal
> > 
> > I'm not a hardware guy, but this sounds like a GPIO that *reads*
> > WAKE#, not controls it.
> 
> Rephrasing as
> "GPIO used as WAKE# input signal" (output for the endpoint bindings)

Perfect, that makes a lot of sense.

> > > +    pcie@48400000 {
> > > +        compatible = "st,stm32mp25-pcie-rc";
> > > +        device_type = "pci";
> > > +        num-lanes = <1>;
> > 
> > num-lanes applies to a Root Port, not to a Root Complex.  I know most
> > bindings conflate Root Ports with the Root Complex, maybe because many
> > of these controllers only support a single Root Port?
> > 
> > But are we ever going to separate these out?  I assume someday
> > controllers will support multiple Root Ports and/or additional devices
> > on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
> > max-link-speed, num-lanes, reset-gpios, etc.
> > 
> > Seems like it would be to our benefit to split out the Root Ports when
> > we can, even if the current hardware only supports one, so we can
> > start untangling the code and data structures.
> 
> OK. and we support only 1 lane anyway, so drop it.

Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
would be a per-Root Port thing, and some resets and wakeup signals
also.

For new drivers, I think we should start adding Root Port stanzas to
specifically associate those things with the Root Port, e.g.,
something like this?

  pcie@48400000 {
    compatible = "st,stm32mp25-pcie-rc";

    pcie@0,0 {
      reg = <0x0000 0 0 0 0>;
      phys = <&combophy PHY_TYPE_PCIE>;
      phy-names = "pcie-phy";
    };
  };

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
is one binding that does this, others include apple,pcie.yaml,
brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.

Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
