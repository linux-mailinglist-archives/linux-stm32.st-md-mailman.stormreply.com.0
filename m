Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01969AC8A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Feb 2023 14:30:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BA50C6A5FA;
	Fri, 17 Feb 2023 13:30:49 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00D8FC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Feb 2023 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mn2YdWkFcL6Ae+Ff818yS4ufU/Ud2IoVDGKh7MUqoRQ=; b=EViK8fRXQtkgM55djQ/72gds7/
 lkJP8WWagq1/cxmOvPjfhv54besDmSyxTgOLcUM0/BzKJHtCYG3IpMy35R3XwQwasnWJNDtE4juXB
 H8YHTZ/v3XMH6OYNLTO5jNtJ0fAnpWvhDrzwGzg1FW3OfVGPhFqSr+u8lfQJH4Uo4pJA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pT0oX-005Hjw-FD; Fri, 17 Feb 2023 14:30:13 +0100
Date: Fri, 17 Feb 2023 14:30:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y++BZWhJm1LpdrA9@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
 <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
 <Y+5t4Jlb0ytw40pu@lunn.ch>
 <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

> > I would actually say it shows we don't understand what is going on
> > with delays. "rgmii" is not every often the correct value. The fact it
> > works suggests the MAC is adding delays.
> > 
> > What value are you using for starfive,gtxclk-dlychain ?
> 
> This is set to '4' in patch 12/12.
> 
> > Try 0 and then "rgmii-id"
> 
> I made some more tests and it seems the only stable configuration is "rgmii"
> with "starfive,gtxclk-dlychain" set to 4:
> 
> phy-mode | dlychain | status
> ---------+----------+--------------------------------------------
> rgmii    |        4 | OK (no issues observed)
> rgmii-id |        4 | BROKEN (errors reported [1])
> rgmii    |        0 | UNRELIABLE (no errors, but frequent stalls)
> rgmii-id |        0 | BROKEN (errors reported)
> 
> [1] Reported errors in case of BROKEN status:
> $ grep '' /sys/class/net/eth0/statistics/* | grep -v ':0$'

Thanks for the testing.

So it seems like something is adding delays when it probably should
not. Ideally we want to know what.

There is a danger here, something which has happened in the past. A
PHY which ignored "rgmii" and actually did power on defaults which was
"rgmii-id". As a result, lots of boards put "rmgii" in there DT blob,
which 'worked'. Until a board came along which really did need
"rgmii". The developer bringing that board up debugged the PHY, found
the problem and made it respect "rgmii" so their board worked. And the
fix broke a number of 'working' boards which had the wrong "rgmii"
instead of "rgmii-id".

So you have a choice. Go with 4 and "rgmii", but put in a big fat
warning, "Works somehow but is technically wrong and will probably
break sometime in the future". Or try to understand what is really
going on here, were are the delays coming from, and fix the issue.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
