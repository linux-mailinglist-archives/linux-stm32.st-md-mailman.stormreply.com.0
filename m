Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C18888B3C29
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 18:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E05EC7128D;
	Fri, 26 Apr 2024 16:00:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 078F0C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 16:00:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D36B588221;
 Fri, 26 Apr 2024 18:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714147246;
 bh=MbBx9Y1hMfZdkFnfEVCvE/hOTF3f77wjPkbrDnF6OaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uGlfKuSLMpDsGs/aW46lZfoPSnPPN9ijCRIEy+VBNcNpuD7hsVmf+/gAHVuRx3iRK
 9xnLuq/ijpWbrlfmnokZ8WGNLBB9GSs5yt2QeFwfgW9Dl7OV7+LKZBTWc6XVETiif9
 tHm5L1onuijzcxUvykagrn6i4WI03Kt/IH/2w29fYy7GzTkk5QW2vgHhxjEJ2XMiAq
 rZsv9lFU58dqkgXFBrkfOSpT2cpoz8JY6am80tgsXcjrXWF6z5VSNGR2BevR2eTZON
 Ub45GvVtpGoia+tmRatERcxGYTs2SOeRMy5K+npgubrMfStbabmZ4159bRWekKpyBO
 zE4EYNejYy7+Q==
Message-ID: <2ffaad98-8b43-444e-a4a0-985bee5e6a04@denx.de>
Date: Fri, 26 Apr 2024 16:46:55 +0200
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
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240426125707.585269-2-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/11] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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

On 4/26/24 2:56 PM, Christophe Roullier wrote:
> New STM32 SOC

Which New STM32 SoC is that ? Please add type/model/...

> have 2 GMACs instances.
> GMAC IP version is SNPS 4.20.

The commit message should describe what does this patch do, and why does 
it do so, something like:

"
Document support for STM32MP13xx. This SoC contains two instances of 
DWMAC 4.20 IP. Because this is <somehow special>, document <some 
difference>.
"

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
