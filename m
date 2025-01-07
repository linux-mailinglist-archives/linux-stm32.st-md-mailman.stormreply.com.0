Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6947A04073
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 14:10:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E36CC78022;
	Tue,  7 Jan 2025 13:10:55 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0593C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 13:10:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA0CFA41194;
 Tue,  7 Jan 2025 13:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C9AC4CEDD;
 Tue,  7 Jan 2025 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736255452;
 bh=fLby7RmtqFgkq0hZnNCEPuxeUfnBSBSrwvZ237HZbOs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WkNBqjpfT7KKhM/f78qZQIFRDy+o42B9Af5XsAHCztHXmckom/t0fkGKdrYbmRfAN
 +7IIRSchHVmfgB2O/dnady+xriNeJ8GnYZmkaMqmMElfKeVn+W99hKsulP28dDYHY1
 rbtkoSk+FHuEiEDaKFGutWYq6dne4rkp19x7avvI7Rol7WV9Fln8Itfh3sOKYDmIO8
 DBzDRxHIdmg2C9dOosm5sz/bp+6Wb0RwbC8H5Strg/UNgVyrK6dZD5Pg1Kf61/xZb/
 YYR5luvVGVQ4iaNdl1BExAlfGcBnZ/9E2upQ1mym/8nMhW7B1in2N/hPz59gxWiL4b
 0yRxnP2vAomFA==
Message-ID: <f4686d25-76d5-41b9-b82e-2787917deb89@kernel.org>
Date: Tue, 7 Jan 2025 15:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kalle Valo <kvalo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dario Binacchi <dariobin@libero.it>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Brian Norris <briannorris@chromium.org>, Frank Li <Frank.Li@nxp.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Correct
 indentation and style in DTS example
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



On 07/01/2025 14:56, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


>  .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 20 ++--
>  .../bindings/net/ti,k3-am654-cpts.yaml        | 36 +++----

Reviewed-by: Roger Quadros <rogerq@kernel.org>	# for ti,k3-am654-*

-- 
cheers,
-roger

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
