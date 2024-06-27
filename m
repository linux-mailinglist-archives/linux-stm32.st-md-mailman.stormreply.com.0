Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A391AC32
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 18:05:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD251C71287;
	Thu, 27 Jun 2024 16:05:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A246C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 16:05:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 33301884D1;
 Thu, 27 Jun 2024 18:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719504306;
 bh=sGVGfQPHCdLVaLQwQoA6M9uYJaRXYHydouJN1pcCY5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L/fQAnQyvrD0jLeqP3Ql3EwHVPPtllqV02J7awwVRJm4elqtYBnRfS7XMyq+E7y6m
 Aqocnq0h199W/L4ejGrYF2RwUoP8oZ21S87XjtOv2pFTUds8zsWwsNT0HRk4Xaaiil
 uwmC4XmSQKBP7munJCzp15mk7njQ+UbPMj/VnKLwXvPXHaVjfkXV9EgJXwevW8fcXy
 UQo/xVKqB0eITKaakzrQUan1ofjZTmhA67o2AQEumjIJ/9oR216CeEO0YLYmE2pw+3
 2hkQhsE2jx0zWk0ZiS3tE1Roof/XT559Ku3eYeEC6vzEuKIqoW5FUcCW0a7h8dP3UY
 K/5zHVacFMIkg==
Message-ID: <cadb3878-d744-42e0-8e89-1a3892029ef3@denx.de>
Date: Thu, 27 Jun 2024 17:08:34 +0200
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
 <20240627084917.327592-3-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240627084917.327592-3-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: update err status in case
 different of stm32mp13
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
> Second parameter of syscfg property (mask) is mandatory for MP13 but
> optional for all other cases so need to re init err to 0 for this case
> to avoid parse issue.

What parse issue ? Please expand this part of the commit message.

Basically if this is not MP13, and the dev_dbg() is hit, the function 
should not return error code because for non-MP13 the missing syscfg 
phandle in DT is not considered an error. So reset err to 0 in that case 
to support existing DTs without syscfg phandle.

With the commit message updated:

Reviewed-by: Marek Vasut <marex@denx.de>

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
