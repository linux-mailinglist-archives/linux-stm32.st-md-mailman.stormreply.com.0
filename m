Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29C69A2F2
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Feb 2023 01:32:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49397C6A5FB;
	Fri, 17 Feb 2023 00:32:51 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67761C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Feb 2023 00:32:50 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2189766020BD;
 Fri, 17 Feb 2023 00:32:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676593969;
 bh=Pijk7J1JiCVDIPHd1Fu56Q59b7X2BTHU0d+zzfSw4ok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R2YHuHryIxI4sX2DHvXuf3KkHJD0wdjhm5wp/kDeuQ1BcrJNTcNmeQunFVnY4zdAs
 uTQOGAl5b/d/h7z6f6tfbukkf5pEC+9omQGycaFq8ETbHgv9NFKIQaxQcDv3QEotNs
 2U5oXYEiCqKvOl9eqGHT+AeXqkuKIJZHwEjpIvOB2Sa9HhzhgvFfPXT4RtlKegzlah
 ZpcJWmvUYMyQxYyzZfdcZOUodk/yfGp5SwUOtDRVS3GQBvcxq01CQgBDOgWHPKhSkN
 OAGvg9p1k+jg6j0+p6EWD1tkh3ghxG3KHv5Aq31mk5CpBrQ2PPIIyohNjZoTTEp114
 2EKZugb5oSkmA==
Message-ID: <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
Date: Fri, 17 Feb 2023 02:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
 <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
 <Y+5t4Jlb0ytw40pu@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+5t4Jlb0ytw40pu@lunn.ch>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/12] dt-bindings: net: Add StarFive
	JH7100 SoC
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

On 2/16/23 19:54, Andrew Lunn wrote:
>> I gave "rgmii-id" a try and it's not usable, I get too many errors. So
>> "rgmii" should be the right choice here.
> 
> I would actually say it shows we don't understand what is going on
> with delays. "rgmii" is not every often the correct value. The fact it
> works suggests the MAC is adding delays.
> 
> What value are you using for starfive,gtxclk-dlychain ? 

This is set to '4' in patch 12/12.

> Try 0 and then "rgmii-id"

I made some more tests and it seems the only stable configuration is 
"rgmii" with "starfive,gtxclk-dlychain" set to 4:

phy-mode | dlychain | status
---------+----------+--------------------------------------------
rgmii    |        4 | OK (no issues observed)
rgmii-id |        4 | BROKEN (errors reported [1])
rgmii    |        0 | UNRELIABLE (no errors, but frequent stalls)
rgmii-id |        0 | BROKEN (errors reported)

[1] Reported errors in case of BROKEN status:
$ grep '' /sys/class/net/eth0/statistics/* | grep -v ':0$'

/sys/class/net/eth0/statistics/rx_crc_errors:6
/sys/class/net/eth0/statistics/rx_errors:6
/sys/class/net/eth0/statistics/tx_bytes:10836
/sys/class/net/eth0/statistics/tx_packets:46

> 	Andrew			
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
