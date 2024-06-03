Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 565908D84FD
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD31CC71288;
	Mon,  3 Jun 2024 14:30:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94CD1C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:30:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 02E8E88297;
 Mon,  3 Jun 2024 16:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717425012;
 bh=tzwKWRYiq4hn9T72ICEyR6cTqBmlVIAQNA4M5kMLnKw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DswH2Hl4e4qu+NnV3vVaNwmvbrLFMnaoy4MtJ7XyQT0Jevcn1FxJDp198TJHuiWtf
 SRpsUjirB9iTqa2NLNNJL6mM/eHgeb7MwftO0vvTga7MNzgpDR4ocUvAC1DCWSaF66
 IhITTRRjiIIdmn2+pOsLQibUr8xJl1nG+Wu+lW3xQWI/c9Zp0MNe28puVzgJ7oXzyz
 VpyygSkmecDroHLAcd6nmaEeUaSnof8xNCUz0vnXpatowaO4fFC6aFv05C6g8sKSJW
 EdFCuBuinronpATl6Wr8mCEdDt1DhomPEsq80gGZBqpatm4mqFTQdSr0v9Z6m++XD+
 IpAShCtSL3VYg==
Message-ID: <eaa69915-e356-47ac-859e-933fe430a750@denx.de>
Date: Mon, 3 Jun 2024 15:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-12-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240603092757.71902-12-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 11/11] ARM: multi_v7_defconfig: Add
 MCP23S08 pinctrl support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/3/24 11:27 AM, Christophe Roullier wrote:
> Need to enable MCP23S08 I/O expanders to manage Ethernet phy

PHY in capitals.

> reset in STM32MP135F-DK board
> STMMAC driver defer is not silent, need to put this config in
> built-in to avoid huge of Ethernet messages

This second sentence is not correct, you are not enabling this GPIO 
controller driver to silence a warning, you are enabling this driver to 
let the PHY driver release the PHY from reset.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
