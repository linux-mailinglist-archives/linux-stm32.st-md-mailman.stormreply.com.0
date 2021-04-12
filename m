Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAC35D086
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 20:44:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68F9AC57B79;
	Mon, 12 Apr 2021 18:44:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D79A3C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 18:44:19 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7CB5B804E7;
 Mon, 12 Apr 2021 20:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618253059;
 bh=xMG6BTUE5ZgzzqLZvUnx6xiOQaciyho/Imrz9gX7Bk8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=r37IU84yI5jkSJ+xCmUJimctQUJzDrTgi5g2Y2qLI42bd+PU8XIvCTaQ6nXr0elCz
 Ii5U8zH9qDZWRyfPGuy3dwWqMDa5jV82lIu0VDY5SiIGWOL/LYnGf3DPFONrOFLBng
 7Vd+8oPmbPlqavDxTDCnsW4MoO8mLHdouTlDl++HNd+dlUMmR/X7hM5xjdi1hKK3VI
 szDzgXfAAa3PJ+4hTOOlCg4oLBoSamaYc5wGRAv0NL7gv5O90eFmUHUwouczU7xuCT
 6y1jO+FdwLgsHIYmdSnYrpU5G61blUJ0fl5D5AryaxkSPzCmzeY/gIswlAHwvjf6sn
 AQNgekXEek82g==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210408185731.135511-1-marex@denx.de>
 <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
Date: Mon, 12 Apr 2021 20:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX
 clock parent from ETHCK_K to MCO2 on DHCOM SoM
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

On 4/12/21 10:09 AM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alex,

[...]

>> All the above still only discusses the clock part of the problem. Even if
>> the clock cyclic dependencies could be solved, it would be necessary to
>> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
>> and avoid DT ABI break.
> 
> Thanks for those clear explanations and for this series. As discussed, 
> this approach looks good to me as it doesn't break our current strategy 
> for dwmac clock integration. I don't know if those cyclic redundancies 
> will be fixed one day but we can have a look on dwmac DT properties (the 
> gain to change them, the effort to keep the backward compatibility, code 
> readability, ...).
> 
> Your DT patches looks good. I'll merge them soon.
+CC Stephen ; the DT patches depend on the clock driver changes. Would 
it make sense to pick the clock patches through the same tree or how 
should that be handled ?

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
