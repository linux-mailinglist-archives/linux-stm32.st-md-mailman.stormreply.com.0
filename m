Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C822C085EC
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 02:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE54C57B73;
	Sat, 25 Oct 2025 00:07:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97818C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 00:07:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10E0D43723;
 Sat, 25 Oct 2025 00:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0AAC4CEF1;
 Sat, 25 Oct 2025 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761350857;
 bh=YywZU5wTB4nYHlRvn5ywrvSbODiPXFC1hF9SDgRtOvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dn65njhfKU//nSpM/HdwU4tKL08l32hcuHzuixi+aBjD0gC0PTsaeWd89QTMAxRuk
 cYp4Z2YrWrf6mPug22Pw8wBWAtFlLxcLTc5PHjUcAbZrgzYRFdAE4B5kBuLgdRaJ09
 7V6O9idDND4QHFCif7dq/1igfsRQUwHEHRrzgJkkc1yml8VmhneBL/3j4U/ed2rxP+
 z9yZau0MEnF3O8sico76jw2wQ7y1O54w8wvJ0AZmjB+HUtvaMqOS3Tc0MctblnfsL0
 ObUnghY5cwYOW9jj4YRRlw7KmRIPHY+43lXpwvc+S7qRmpJIN6lu/pgmp1eDvdD303
 4RrDLb4fd9xjw==
Date: Fri, 24 Oct 2025 17:07:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <20251024170736.1098eccd@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Cc: Eric Dumazet <edumazet@google.com>, Austin Zhang <austin.zhang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-arm-kernel@lists.infradead.org,
 "Tham, Mun Yew" <mun.yew.tham@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v5 00/10] arm64: dts: socfpga: agilex5:
 enable network and add new board
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

On Fri, 24 Oct 2025 13:49:52 +0200 Steffen Trumtrar wrote:
> Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
> needed patches to support the network on current mainline.
> 
> Currently only QSPI and network are functional as all other hardware
> currently lacks mainline support.

Please split out the drivers/net and bindings/net patches to a separate
series. As is this is unmergable to any single tree.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
