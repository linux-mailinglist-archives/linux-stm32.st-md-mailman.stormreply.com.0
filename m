Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E0B8E212
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Sep 2025 19:33:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 308C4C349C3;
	Sun, 21 Sep 2025 17:33:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3529BC349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Sep 2025 17:33:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BD9B601A3;
 Sun, 21 Sep 2025 17:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C40C113D0;
 Sun, 21 Sep 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758476012;
 bh=ffJbmNoMdn7kDBTm1E/CHINJQhEqcbYTDeeSi9wci2Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SXm8WaH7EWzPNzDqjISh5EFEZHSrGHVTpAT7LTO1FNxPKe9N4QyRlvnd70odZqCFw
 IyN7rIoruLgjunml+0UHmvWiJ44eKhrBrhhO9v0Lln6yPOEOljbZ6ihcQKkcLxPZVy
 gwDcYRoSLbOtBUCsWMBW84NI0ELl9w+OxwCypQ3bXw4yHf96HE9iPombWNWufmO1vc
 7vP4ea2it3ZBzbeCypzfEnQjW2svS8pNW+bqnDKuV5vbWfZt5tkAPK+1ow7gDu/t3d
 xMdtG9LU/hrNO7CQaVbxHl5yUHvbDsFB1ENMeIfz03sxNq3PDMGRWA1/Pzx3A4YC4K
 JMVdA/jlVfoXQ==
MIME-Version: 1.0
In-Reply-To: <20250625-upstream_rcc_mp21-v4-2-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
 <20250625-upstream_rcc_mp21-v4-2-9368a86c8515@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:33:31 -0700
Message-ID: <175847601134.4354.18300374897376083425@lazor>
User-Agent: alot/0.11
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v4 2/3] clk: stm32: introduce
	clocks for STM32MP21 platform
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

Quoting Gabriel Fernandez (2025-06-25 02:07:25)
> This driver is intended for the STM32MP21 clock family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
