Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F25E76BB21
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 19:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44758C6A5F2;
	Tue,  1 Aug 2023 17:24:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CE6C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690910641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xn3eAMGq07q5lKeOtXwb0xhFpvRYswY7sySLx8S8uc=;
 b=RidncO2OLTFh3IKS56L2/+bJ3r1G7lJXs/yy8dbtg8LLnoZv8vnscZ+9fZhs5TLXKRWG+D
 CzSADByqgF/D3Jkct3JhQHz8PuG9N8LYGgFHWfnLm7hhXv0+pwaAWf46SNIQlZKEpRvIje
 msSBs6GPyximzVvUddMM2uz0zVjE1yk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-uRgnP5ubMpuX0xwEG8th9Q-1; Tue, 01 Aug 2023 13:24:00 -0400
X-MC-Unique: uRgnP5ubMpuX0xwEG8th9Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-63d10be64c8so56921036d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Aug 2023 10:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690910640; x=1691515440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xn3eAMGq07q5lKeOtXwb0xhFpvRYswY7sySLx8S8uc=;
 b=Awo+pTNemd9iUCL3gKgU3CXb/JXKgxqM4RxYl64vUNhD2CRKEbOQvZ3wQ7N+p4ZgkY
 oo3BLwMYQdUn6Gf3cSqSrFi7br8E4MLvERZLZqthyidtnCStwpJa11gASDv63BN60Bso
 4Q4Err61TyPNfxgbYZI0+C8UxN1NsfX4UuMLhyoqilM/mdaHRMzh9gCBIE2XRTwJSOFT
 qUhJEYaqte9e0FPsUACHQm0TBO27oLLeoPeW9gL6bR0cqFapZMJSKVrFsp+ZlkBSsYRh
 qTFaB9xoSSFZIiBUUkMhvbL/sEe3As1xRuD0VFsZJq3h7Bqw3kdl5hnXTnG2lec+Okb9
 RMFQ==
X-Gm-Message-State: ABy/qLZi9538AvTNrS1AWp0pvjG2LsXqpe7BpW8NmhqwFMo3BmzXVOu1
 D2OAXxYkuMAn0/dfXKRMj1jmUtNxeUclEzg2Kr53c4N8g8+ORn5duP4YviPjVOIXzlZN7jVw1hq
 Bx15X30DJwfDeFeHW2UqAUGWZhqyRsknfnZuHFprD
X-Received: by 2002:ac8:7f82:0:b0:40d:4c6:bcd8 with SMTP id
 z2-20020ac87f82000000b0040d04c6bcd8mr9326422qtj.58.1690910639756; 
 Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSypiuFIG8fuhXUpkOosWEI1DPcjZqq+VDqRQ2Q4IGwgSH7r27Hjm6MOKpRcjM5bj1X8CnKA==
X-Received: by 2002:ac8:7f82:0:b0:40d:4c6:bcd8 with SMTP id
 z2-20020ac87f82000000b0040d04c6bcd8mr9326391qtj.58.1690910639458; 
 Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a37e318000000b0076cb3ea651fsm1602448qki.134.2023.08.01.10.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
Date: Tue, 1 Aug 2023 12:23:56 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <u5u7cdgfjpvyiu4usegrg3ukrmniq7z7eyzgajlldwqd7r55nr@lal546vvmfdy>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
 <ZMkBCGJrX/COB5+f@shell.armlinux.org.uk>
 <PAXPR04MB9185207744645A9064D2ACF5890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PAXPR04MB9185207744645A9064D2ACF5890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Simon Horman <simon.horman@corigine.com>, Frank Li <frank.li@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Johannes Zink <j.zink@pengutronix.de>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wong Vee Khee <veekhee@apple.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Aug 01, 2023 at 05:06:46PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Tuesday, August 1, 2023 7:57 AM
> > To: Johannes Zink <j.zink@pengutronix.de>
> > Cc: Shenwei Wang <shenwei.wang@nxp.com>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Kevin Hilman <khilman@baylibre.com>; Vinod
> > Koul <vkoul@kernel.org>; Chen-Yu Tsai <wens@csie.org>; Jernej Skrabec
> > <jernej.skrabec@gmail.com>; Samuel Holland <samuel@sholland.org>;
> > Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Jerome Brunet
> > <jbrunet@baylibre.com>; Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com>; Bhupesh Sharma
> > <bhupesh.sharma@linaro.org>; Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Simon Horman
> > <simon.horman@corigine.com>; Andrew Halaney <ahalaney@redhat.com>;
> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Wong Vee Khee
> > <veekhee@apple.com>; Revanth Kumar Uppala <ruppala@nvidia.com>; Jochen
> > Henneberg <jh@henneberg-systemdesign.com>; netdev@vger.kernel.org; linux-
> > stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-amlogic@lists.infradead.org;
> > imx@lists.linux.dev; Frank Li <frank.li@nxp.com>
> > Subject: [EXT] Re: [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause the TXC
> > clock in fixed-link
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Tue, Aug 01, 2023 at 02:47:46PM +0200, Johannes Zink wrote:
> > > Hi Shenwei,
> > >
> > > thanks for your patch.
> > >
> > > On 7/31/23 18:19, Shenwei Wang wrote:
> > > > When using a fixed-link setup, certain devices like the SJA1105
> > > > require a small pause in the TXC clock line to enable their internal
> > > > tunable delay line (TDL).
> > >
> > > If this is only required for some devices, is it safe to enforce this
> > > behaviour unconditionally for any kind of fixed link devices connected
> > > to the MX93 EQOS or could this possibly break for other devices?
> >
> > This same point has been raised by Andrew Halaney in message-id
> > <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
> > and Fabio Estevam in message-id
> >
> > <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.
> > com>
> > but we don't seem to have any answer for it.
> >
> Hi Russell,
> 
> I hope you have thoroughly read all of my earlier responses, as I believe I already addressed this question.
> I'm happy to clarify further, but kindly avoid unsubstantiated comments.
> 
> https://lore.kernel.org/imx/20230727152503.2199550-1-shenwei.wang@nxp.com/T/#m08da3797a056d4d8ea4c1d8956b445ae967e7cfa
> " Yes, that's the purpose because it won't hurt even the other side is not SJA1105."
> 
> > Also, the patch still uses wmb() between the write and the delay, and as Will
> > Deacon pointed out in his message, message-id
> > <20230728153611.GH21718@willie-the-truck>
> > this is not safe, yet still a new version was sent.
> >
> 
> Can we conclude that even without the wmb() here, the desired delay time between
> operations can still be ensured?

Will's talk[0] he linked has the sequence you've done here (writel's
followed by wmb() followed by a udelay), and he states it is wrong if
the goal is for the device to see the writes prior to the udelay. That's
discussed at around 28:00 and followed up by (thankfully, cuz I too
didn't understand it) a question at 34:10 to discuss why mb() isn't
sufficient (it completes the write, but the device *may not* see it
yet, the read forces that).

He mentioned that over at [1] in the review here, and suggested reading
from the device again prior to the udelay() instead to force the writes
to take affect on the device prior to the udelay.

I found a quick example in the ufs-qcom.c driver that I'll copy paste
here too from upstream that follows this advice:

		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);

		/*
		 * Make sure the write to ref_clk reaches the destination and
		 * not stored in a Write Buffer (WB).
		 */
		readl(host->dev_ref_clk_ctrl_mmio);

		/*
		 * If we call hibern8 exit after this, we need to make sure that
		 * device ref_clk is stable for at least 1us before the hibern8
		 * exit command.
		 */
		if (enable)
			udelay(1);


[0] https://www.youtube.com/watch?v=i6DayghhA8Q
[1] https://lore.kernel.org/netdev/20230728153611.GH21718@willie-the-truck/

I hope that helps,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
