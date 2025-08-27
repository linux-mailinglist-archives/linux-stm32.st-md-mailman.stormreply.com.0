Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D044AB383B7
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 15:31:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91493C32E8D;
	Wed, 27 Aug 2025 13:31:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A7D2C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 13:30:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EF46F434D6;
 Wed, 27 Aug 2025 13:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04AAC113D0;
 Wed, 27 Aug 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756301457;
 bh=D+f7sGcwgv+7yWZQKZNxbE+Fo7kTjohDpe0jO+6Mvf8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SDGuqgFzwsVWUQYALgiMql1WtTwrAAGmN+lcU06/ydR38GFlkdnJk4MjY13lN091O
 nbSm/HmrEp2DGulV6STXZx7lRlLpOWXIgFzxJgDqpcT2QcXynUSiD3/5b6VNwjVVE+
 s98n7JEiFTK0lzA+HvznK/KgOY/5iQCq1Ozd6SOrArJLcVekwVJhXAKYh3xtcnc3cu
 Ezv6P9xJbF+gt6r4iUEzXo+7xOeihSfkggBJby2Ivx23zB8EmDJ0WVJT/VxbvPWWtd
 OK0GO4VpntQwI5PxLs2oAXy80GcquzbdO3ksrlKan/QOf/7xUhGn02GvDRccerFUJY
 ehB/Kr2FWvGmg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linus.walleij@linaro.org, corbet@lwn.net, p.zabel@pengutronix.de, 
 shradha.t@samsung.com, mayank.rana@oss.qualcomm.com, namcao@linutronix.de, 
 qiang.yu@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
 inochiama@gmail.com, quic_schintav@quicinc.com, 
 Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250820075411.1178729-1-christian.bruel@foss.st.com>
References: <20250820075411.1178729-1-christian.bruel@foss.st.com>
Message-Id: <175630145053.10268.16196388698773824322.b4-ty@kernel.org>
Date: Wed, 27 Aug 2025 19:00:50 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, johan+linaro@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v13 00/11] Add STM32MP25 PCIe
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


On Wed, 20 Aug 2025 09:54:00 +0200, Christian Bruel wrote:
> Changes in v13:
>    - Rebase on pci/next
>    - Replace access to dev->pins->init_state by new
>      pinctrl_pm_select_init_state().
>    - Document pinctrl PM state API.
>    - Group GPIO PERST# de-assertion with PVPERL delay. (Bjorn)
> 
> [...]

Applied, thanks!

[01/11] Documentation: pinctrl: Describe PM helper functions for standard states.
        commit: 272dad3f84004079328e8f36b2292e7297460ffd
[02/11] pinctrl: Add pinctrl_pm_select_init_state helper function
        commit: 08383cd479f8212fafee2f557b58cfd48818bee0
[03/11] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
        commit: 5ffa3d2f43a487f60e9f6f692aa8e22251446755
[04/11] PCI: stm32: Add PCIe host support for STM32MP25
        commit: bb90c3dd42adba65fc2f26ecb16c1d27d74fa68b
[05/11] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
        commit: 89f6842156333cca9abb8e641e28100b708bed00
[06/11] PCI: stm32: Add PCIe Endpoint support for STM32MP25
        commit: 679ebde120900c246925a374ea1ad39392d6e84b
[07/11] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
        commit: 3cf6b1bf4d250c15ebe537d55b5e09a902c41971

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
