Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF599E5CFB
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 18:23:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C89C7802B;
	Thu,  5 Dec 2024 17:23:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A9EBC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 17:23:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA65A5C6BD2;
 Thu,  5 Dec 2024 17:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C484C4CED1;
 Thu,  5 Dec 2024 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733419392;
 bh=fi2WY3gBh65WYtY2fRxW1m7CZSc00650cfNmqqUnA18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=N0ziBbO/Al108sgzgpgfqlBHui/9lVvto/OgeBeezQS2smZibRfyFkaN8yazfWTy/
 cEkEQTw3Fbupk5EJG3IejmoW5HBwAJJFUSc6fW/p9AHQ53kkSDp9wTlZpmD0xdNY1p
 3cSnOtR/P4D70ZVo9Tu+C72eD4uGGr5co+aG+GpFvXB/vKreQntGU0zE6EOKjQLiX6
 Y1aWDK8wXTHZsrxqEqFmKZBeWgaoJov5ut0ZtF4cXXgoaCic2mgR3d6Lx6TshMec/f
 vXNqjKMtAxBa7DyyeNupzOqD8qd8jIeQfjkDhamsBTx8eDzwcPMITuA/7pxI3RrYku
 zHHlNpSFiy7rA==
Date: Thu, 5 Dec 2024 11:23:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241205172310.GA3055111@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-2-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
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
> ...

> +        power-domains = <&CLUSTER_PD>;
> +    };
> +

Nit:

  Applying: dt-bindings: PCI: Add STM32MP25 PCIe root complex bindings
  .git/rebase-apply/patch:163: new blank line at EOF.
  +
  warning: 1 line adds whitespace errors.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
