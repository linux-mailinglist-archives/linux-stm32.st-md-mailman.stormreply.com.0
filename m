Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F08365F3F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 20:30:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69323C5719E;
	Tue, 20 Apr 2021 18:30:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A06A6C57195
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 18:30:22 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 34FF48021A;
 Tue, 20 Apr 2021 20:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618943422;
 bh=3Jpb3+eZcEQXJ5FDrKgeysID8DsET41SVuxy3dpQ6JQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=viVEBgfjHaJJSdS+nzm1qAvxsXeHuhyezgSB9OZHtguGOFSHS9PJIbyHXaCuycCYg
 uld3Fz4LcWAcGjlHmJbN7WW0dRpuVtkgEXn4i1X4T7M7uTy44iwApBBUz3C75sK+EP
 L2Zham3bhYQftRv70024TOzlH9SJDx8rcKHdk+sfTF1p4pv4DZ77WJ34imt1GWBQJR
 2w3h/s2OYzFy4AkbVHHK7WxzTWf2fqt2aJ2kmrl+M9Qj+DoKeZLF65iF7hyDzJRvXu
 Er9SRXJM+t9ENmt4uyKXgOahkrbwaRVJ/KeuL4BLvv26ob5QOJjBr4NVg6C3yOW8Zl
 wdt32No7Sa4lg==
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne Carriere <etienne.carriere@st.com>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
 <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <36aafe68-d313-692a-a551-4ff4147e584c@denx.de>
Date: Tue, 20 Apr 2021 20:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 10/11] dt-bindings: clock: stm32mp1 new
 compatible for secure rcc
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

On 4/19/21 11:38 AM, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Introduce new compatible string "st,stm32mp1-rcc-secure" for
> stm32mp1 clock driver when the device is configured with RCC
> security support hardened.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>   .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml          | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index 4e385508f516..8b1ecb2ecdd5 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -54,7 +54,9 @@ properties:
>   
>     compatible:
>       items:
> -      - const: st,stm32mp1-rcc
> +      - enum:
> +          - st,stm32mp1-rcc-secure
> +          - st,stm32mp1-rcc

It is still the same IP and same SoC silicon, so shouldn't the 
configuration be discerned via DT property instead of compatible string ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
