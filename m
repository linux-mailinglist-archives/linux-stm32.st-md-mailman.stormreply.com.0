Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABED83D4D3
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 09:43:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C957DC6B476;
	Fri, 26 Jan 2024 08:43:49 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7735CC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PUfxJlZFVfmPhNLMt5rpstbfpKShoNxijw+jhoG4IIQ=; b=qhQ+aznBBExDH5jZPmD78Y4aEl
 8AGLUycpgv2X48qKwFSdTpu0TvBGX9DeIgtBi5WsujLd4bS2Zhk4nuIPMCzzn6BV6Rq/1n/gIHCm9
 nKxz8qwTLQqzd7B/VcTl/eteW1uBuGjqqU86wiZHpJmgO0casflUaxMcIU4jm2gSgiQ9k/F9z0d3d
 Vt3wBK2LJbhhJQMrLaTejZOB+mnXokTB0YMlfid+Gur3Yke93LIfiRTEYkVfO3nvd7PPOKVtIpRUo
 5kpwVCPRUpwGSjB6tJoQv7rr4mBywoyWdNKNRQyqDzmlOqPzNONvwV8T24J3sjRxSEY1OvewUg1KY
 476+OxDA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rTHoA-000CBk-GH; Fri, 26 Jan 2024 09:43:30 +0100
Received: from [87.49.42.9] (helo=localhost)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rTHo9-000Kqi-0v; Fri, 26 Jan 2024 09:43:29 +0100
From: Esben Haabendal <esben@geanix.com>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <92892988-bb77-4075-812e-19f6112f436e@quicinc.com> (Abhishek
 Chauhan's message of "Wed, 10 Jan 2024 12:19:29 -0800")
References: <20230927130919.25683-1-rohan.g.thomas@intel.com>
 <20230927130919.25683-3-rohan.g.thomas@intel.com>
 <92892988-bb77-4075-812e-19f6112f436e@quicinc.com>
Date: Fri, 26 Jan 2024 09:43:28 +0100
Message-ID: <87r0i44h8v.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 elder@linaro.org, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, quic_bhaviks@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, kernel.upstream@quicinc.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: TBS support for
	platform driver
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

"Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com> writes:

> Qualcomm had similar discussions with respect to enabling of TBS for a
> particular queue. We had similar discussion on these terms yesterday
> with Redhat. Adding Andrew from Redhat here
>
> What we discovered as part of the discussions is listed below.
>
> 1. Today upstream stmmac code is designed in such a way that TBS flag
> is put as part of queue configurations(see below snippet) and as well
> know that stmmac queue configuration comes from the dtsi file.
>
> //ndo_open => stmmac_open
> int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;(comes from tx_queues_cfg)
>
> /* Setup per-TXQ tbs flag before TX descriptor alloc */
> tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
>
> 2. There is a no way to do this dynamically from user space because we don't have any 
> API exposed which can do it from user space

Not now. But why not extend ethtool API to allow enabling TBS for
supported controllers?

> and also TBS rely on special descriptors aka enhanced desc this cannot
> be done run time and stmmac has to be aware of it before we do
> DMA/MAC/MTL start.

Isn't this somewhat similar to changing the RX/TX ring parameters, which
I believe also is quite difficult to do at run time, and ethtool
therefore requires the interface to be down in oroer to change them?

> To do this dynamically would only mean stopping DMA/MAC/MTL realloc
> resources for enhanced desc and the starting MAC/DMA/MTL. This means
> we are disrupting other traffic(By stopping MAC block).

Yes. But you would be disrupting traffic less than by requiring a
complete reboot of the target which is needed if the devicetree must be
changed.

> 3. I dont think there is a way we can enable this dynamically today. I
> would like upstream community to share your thoughts as well.

Hereby done. Could we investigate the possibility of using ethtool to
change TBS enable/disable "run-time"?

> 4. I agree with Rohan's patch here and want upstream community to
> accept it. This will allow use to configure the queues where TBS needs
> to be enabled as hardcoding in the code unless upstream has better way
> to this using userspace.
>
> Please let us know if you think otherwise. 

/Esben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
