Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DB91AC31
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 18:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9139CC71280;
	Thu, 27 Jun 2024 16:05:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8689AC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 16:05:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7E65787C86;
 Thu, 27 Jun 2024 18:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719504304;
 bh=EI8n9VHKnUHOFo/BpWoTbJ/7R7Q434MwT6kt2i2MjWI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pb9raDmuwwmxlNJtSUAICUuf3fJbmAP0z+tQHDr3OKraPsedWq7XdDkEbzxx2n200
 B/XrxBUkLP2NOp/YQU0+l5Gak5m62prAN2eF+fFy995NVSqxIIJu/uESS/mbZlKdPt
 CXtRMz3+uEiB9jVwq1Q9gNN//nwyIpalrMrQEvGxjFEC+xFaR0Kucfhs9SijPCFVqF
 i+k0FCIsT0e8wH7em8m/mMKOUK4td2FhL+oc40HdLaNSKizpRf4ClaRj3xViYhH9py
 1X5rH8JdLTOwz0VrawR4xwcL3GiGdS/QYvN/UEfPXTqcr4cgJ41Am3/29t9mkMDavH
 O/DRTTljjGbog==
Message-ID: <62322e58-785d-4936-bc80-9858c412621f@denx.de>
Date: Thu, 27 Jun 2024 17:06:16 +0200
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
References: <20240627084917.327592-1-christophe.roullier@foss.st.com>
 <20240627084917.327592-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240627084917.327592-2-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 1/2] net: stmmac: dwmac-stm32: Add test to verify if ETHCK is
 used before checking clk rate
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

On 6/27/24 10:49 AM, Christophe Roullier wrote:
> When we want to use clock from RCC to clock Ethernet PHY (with ETHCK)
> we need to check if value of clock rate is authorized

I think it would be better to add fullstop (.) here , and then continue:

If ETHCK is unused, the ETHCK frequency is 0 Hz and validation fails. It 
makes no sense to validate unused ETHCK, so skip the validation.

> but we must add
> test before to check if ETHCK is used.

With the commit message updated a bit

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
