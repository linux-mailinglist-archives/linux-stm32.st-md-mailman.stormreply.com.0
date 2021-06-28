Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCB3B56C2
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:36:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C87DC59784;
	Mon, 28 Jun 2021 01:36:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF341C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:36:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31CE161A1D;
 Mon, 28 Jun 2021 01:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844161;
 bh=sIhBTuSvTzvzpOYA3vNS+ueHf+xQoVCrrpGOqlwJjEg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JTTi/5pfq6aUp2AcTANRH6cKx3BnbpZ7gtczAKnX/muZeR7KJf5cvhe0M/X50rzuf
 mazgY5fowOCH8KgbSTWb94nZQ+UFKQPL3utfggaHrE41ilY42FHp4ftFWyepuktbxo
 W5UjEhMJaFOZH58RdLMcoW1lyUdc8lfOFQDXFseU6X4MoFcEsdvul69latWIKSvGyx
 CWw2SFkNynqGpyOvnmN2BxnjYiEBD4hGYwjlPlNAoK3q42441aQjppxf/ri7x6JkYH
 YUNQfDSHoylY7H7cIgF0q+CDQXeEXDI/jalRz63M4SOINz2ClAxeoUS7l3EJpYYZfm
 XrFRQrpPS4ZCQ==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-9-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-9-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:36:00 -0700
Message-ID: <162484416011.3259633.1627850825241102954@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v3 08/11] dt-bindings: reset: add
	IDs for SCMI reset domains on stm32mp15
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:11)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> stm32mp15 TZ secure firmware provides SCMI reset domains for
> secure resources. This change defines the SCMI reset domain
> identifiers used by SCMI agents and servers.
> 
> Stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
> PLL output and few secure aware interfaces. This change defines the
> SCMI clock identifiers used by SCMI agents and servers.
> 
> Server SCMI0 exposes reset controllers for resources under RCC[TZEN]
> configuration control.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
