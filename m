Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC698FBA4D
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 19:27:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE22C6B444;
	Tue,  4 Jun 2024 17:27:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86D9DC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 17:27:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2A5D08850D;
 Tue,  4 Jun 2024 19:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522031;
 bh=ouE0lc8aXlYqAz3nRcHf2sJn1wgl70Q+6wn+UFtez/8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Aw6AXUXwxg4tf93WX2Tk0atTQIrXjd5wUS690PXNsSeHCmkTeyJpdaErauWUwJAXX
 cIkvi7nHeCL+fjArJnUlp6o+OZGqfgl8CapH2WBAdtBjQCbn/IKAm15FMVR1e9D6or
 SlonWQ/+SE9k9nuLKq3Wkf+XJ0tksjg4ZVfhRj6ZhJ3bueXb7hgCb4cGJo0/ZGfs3R
 XINcCN0dJMCAWzxW7QVQV4JCUQ4IH2jTd0P5RdiNjG0lUrqtt9aaoNMftsud0HwU/R
 9mp6ugcqSPOATYIGb/qxMx7WBtZKY5TzgkD/yIlh/pJQp+ZUgPWiNTF9Z08jpdmc23
 9H7Tv7y2WQoeQ==
Message-ID: <20b33e48-4cf9-485d-815b-95ef4db8f04d@denx.de>
Date: Tue, 4 Jun 2024 18:55:00 +0200
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
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-12-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240604143502.154463-12-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 11/11] ARM: multi_v7_defconfig: Add
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

On 6/4/24 4:35 PM, Christophe Roullier wrote:
> Need to enable MCP23S08 I/O expanders to manage Ethernet PHY
> reset in STM32MP135F-DK board.
> Put this config in built-in like STMMAC to avoid huge of Ethernet
> messages during boot (deferred)

You're not avoiding any error/defer/messages here, you simply need to 
enable the MCP23S08 GPIO controller driver, so the kernel can use the 
GPIO provided by that driver instance to release the ethernet PHY from 
reset on STM32MP135F-DK, that's all.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
