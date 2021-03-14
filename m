Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322E33A497
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Mar 2021 12:52:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14451C57192;
	Sun, 14 Mar 2021 11:52:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A67DC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Mar 2021 11:52:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79D0F64E21;
 Sun, 14 Mar 2021 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615722763;
 bh=zz0j1vSP+mihmyWSjFGBpWwyLWTagQ1U8k3YP/B+t50=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=S5QRD6XZIPv87arcP1TrVHk8Q1o4GY5GzRH1CaAa4f5vf0gZc18rfVYZ6eCrVn/Ic
 9bVR/0oriW1L/JPIfFW5Ir9aYUkQtxKVXeFPD3Y5HIGso77iy2HXIDcxT4WcumhiOw
 rJgEQbr8n7uxu+FsRYy3RH0BFRVoyCE8lHiHdgVVhYKiS8QJtjJwwx1nawBk6yZ5Nn
 hDTcUTWjhoAM9aiqnPqPs9P1iZ0BXUzv3xb4FxGKxSmIFxFj9odphZTVPkmRiHAKOf
 rpdghBhgafT1BYWFkM9YPfvyv1Iny5ONg7V5vj7dNdIxd3afUVzAE7tJKDvhl3jNQA
 nmgzDrVk8jsdw==
Date: Sun, 14 Mar 2021 17:22:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YE35Bw/DHRz63RBT@vkoul-mobl>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Tom Rix <trix@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 11/15] dmaengine: socfpga: use
 ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
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

On 11-03-21, 16:27, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
