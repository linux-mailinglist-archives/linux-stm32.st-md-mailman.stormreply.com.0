Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A776E053
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 08:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 503E1C6A5FA;
	Thu,  3 Aug 2023 06:37:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7725DC6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 06:37:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qRRwt-0004xV-Ry; Thu, 03 Aug 2023 08:36:39 +0200
Message-ID: <22f979e8-7591-3393-f323-114da0131e7a@pengutronix.de>
Date: Thu, 3 Aug 2023 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To: Shenwei Wang <shenwei.wang@nxp.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
 <PAXPR04MB9185D7D3B088E4786A216044890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <e32c89e1-7385-105b-63c9-74f58c2253cb@pengutronix.de>
 <PAXPR04MB91851BB5D1375AF0EF3C51B7890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <49d52a10-20cf-9c5b-ebe3-07292664fe11@pengutronix.de>
 <PAXPR04MB9185C0C3B3E41534F555BC43890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <PAXPR04MB9185C0C3B3E41534F555BC43890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Simon Horman <simon.horman@corigine.com>, Frank Li <frank.li@nxp.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>, Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v3 net 2/2] net: stmmac:
 dwmac-imx: pause the TXC clock in fixed-link
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

Hi Shenwei,

[snip]
>>>
>>>> Also: does this only apply to i.MX93, or would we have to test and
>>>> enable it on e.g. i.MX8MP as well?
>>>>
>>>
>>> Yes, it is required when the EQOS MAC is selected. However, this patch
>>> just enables The feature on i.MX93.
>>
>> If this behaviour is required on all EQOS, I think the name
>> imx_dwmac_fix_speed_mx93() is misleading. It should either be
>> imx_dwmac_fix_speed() if applicable to all imx implementations, or
>> dwmac_fix_speed() (and moved to a non-gluecode file) if applicable for all
>> implementations in general.
>>
> 
> It has the general fix_speed function there named imx_dwmac_fix_speed.
> This one is the special for this mx93 fix.

I think I might have misunderstood your last statement or I failed to express 
my point. If you need to replace the dwmac_fix_speed() on mx93, because this 
SoC implementation requires doing so (the usual reason for doing something like 
this is something like reset quirks because of screwed up IP Core integration), 
then your approach is imho valid.

But if I got your last comment right, your changes should apply to EQOS MAC in 
general (but you want to only enable it for mx93 at the moment). In this case 
this quirk will later be as the fix_mac_speed function for other hardware as 
well, in which case the name ..._mx93 is misleading, and imho rather a 
descriptive name should be used (i.e. have the name describe what it does 
rather than for what hardware it is implemented).

Except if the maintainers have a strong opinion that the ..._mx93 suffix 
version is exactly how you should proceed...

Best regards
Johannes

> 
> Thanks,
> Shenwei
> [snip]


-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
