Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7CAE3F58
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 14:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD836C32E8D;
	Mon, 23 Jun 2025 12:13:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D54CC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:13:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0251060EDF;
 Mon, 23 Jun 2025 12:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7C3C4CEEA;
 Mon, 23 Jun 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750680788;
 bh=2PC+knTY5x5lOCBbzbS0Ubx+8aVrsaLIP9Mh9VLPrJo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VA4AwAHWOkFYBn7OH625vRsz3hViv53X4iPL6X6ZiITzC8cKgpkQK/0N75a4eIYz7
 rGoK9Bm+IUHpFrSnnlZrKXR9n91QeliX2c5WbEp5ZMHMMcSeRAPyWVePkC0VZF/agE
 4mqlNTtRYJbBV9uNyasd0fE+Qg+HV4lgnhS5Ag1x4yTNtgamHyRUARGgbcpw0hJrtx
 YkHKHu0gISdZgToGUUXUCp4UCDdzzL9BwSCnaoTqPeKEbOp+/cwxOeOzYjdJuELU+u
 yZzeLm3SHx7igvbAPpW9J38/Q0i9T4ksvwZuFtNZ7O4xUkdEmxwUiqzAWwKYdy+W3Y
 Ewfiui5D3qUCQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 p.zabel@pengutronix.de, johan+linaro@kernel.org, cassel@kernel.org, 
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, 
 quic_schintav@quicinc.com, Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250610090714.3321129-1-christian.bruel@foss.st.com>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
Message-Id: <175068078778.15794.15418191733712827693.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 06:13:07 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v12 0/9] Add STM32MP25 PCIe
	drivers
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


On Tue, 10 Jun 2025 11:07:05 +0200, Christian Bruel wrote:
> Changes in v12;
>    Fix warning reported by kernel test robot <lkp@intel.com>
> 
> Changes in v11;
>    Address comments from Manivanna:
>    - RC driver: Do not call pm_runtime_get_noresume in probe
>                 More uses of dev_err_probe
>    - EP driver: Use level triggered PERST# irq
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
      commit: 41d5cfbdda7a61c5d646a54035b697205cff1cf0
[2/9] PCI: stm32: Add PCIe host support for STM32MP25
      commit: f6111bc2d8fe6ffc741661126a2174523124dc11
[3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
      commit: 203cfc4a23506ffb9c48d1300348c290dbf9368e
[4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
      commit: 8869fb36a107a9ff18dab8c224de6afff1e81dec
[5/9] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
      commit: 003902ed7778d62083120253cd282a9112674986

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
