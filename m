Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF6699D42
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Feb 2023 20:59:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15DFFC6A5FB;
	Thu, 16 Feb 2023 19:59:13 +0000 (UTC)
Received: from ms11p00im-qufo17281701.me.com (ms11p00im-qufo17281701.me.com
 [17.58.38.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C2EC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Feb 2023 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1676577550; bh=zdrd5hFqfnMpxxDPi4zR591CnSfBLmMkbGQ0MsTc1So=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=1RZs9rC0XqIcV0LqrgIvnTSum2tff1FRGXc0vg528niD1ATMXJmiAdIkW/uMDO9fP
 3IRBujlF7x0F1tUfeP/V+v85GeJOsK+e9USZSR1U31TEj+a31shBjpIfMA3vQW0GgQ
 m9iGgsB+ksZrhOIgH1s6dZ3kQaIooO/kaPNuehONSh1zeyT4ApXh4EKMCiP5ZpQqZm
 XxVIDGajX2ttN9uBTHCvAu4R4uQfnO/MNuE6X0WSAyzlnNhY217SVX3bVdotB4hZOc
 IM6yjbVDJnXaqDsN6q7kvU47i2DNbboNHYaKp42hkyE5vaFQnpVSsZ268Pvw/kPWCy
 NNH0U68QXj84g==
Received: from imac101 (ms11p00im-dlb-asmtpmailmevip.me.com [17.57.154.19])
 by ms11p00im-qufo17281701.me.com (Postfix) with ESMTPSA id 1750F7435AA;
 Thu, 16 Feb 2023 19:59:04 +0000 (UTC)
Date: Thu, 16 Feb 2023 20:59:01 +0100
From: Alain Volmat <avolmat@me.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Y+6LBeMIxXDw0JF7@imac101>
Mail-Followup-To: Jakub Kicinski <kuba@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230209091659.1409-1-avolmat@me.com>
 <20230210090420.GB175687@linaro.org> <Y+YKeVoq91/mtlo2@imac101>
 <20230210101320.331c1d95@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210101320.331c1d95@kernel.org>
X-Proofpoint-ORIG-GUID: 25eaZDf0VAVPiYGYD3wSD__bVUWeAGEp
X-Proofpoint-GUID: 25eaZDf0VAVPiYGYD3wSD__bVUWeAGEp
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxlogscore=707 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302160172
Cc: linux-doc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/11] ARM: removal of STiH415/STiH416
	remainings bits
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

On Fri, Feb 10, 2023 at 10:13:20AM -0800, Jakub Kicinski wrote:
> On Fri, 10 Feb 2023 10:12:25 +0100 Alain Volmat wrote:
> > Having seen situations like that for some other series I was guessing
> > that each maintainer would apply the relevant patches on his side.
> > Those two platforms being no more used, there is no specific patch
> > ordering to keep.
> > 
> > I've actually been wondering at the beginning how should I post those
> > patches.  If another way is preferrable I can post again differently
> > if that helps.
> 
> You'd have most luck getting the changes accepted for 6.3 if you split
> this up and resend to individual maintainers.

Alright, since those patches do not have real dependencies between each
others, I won't update this serie and send the patches separately to
their related maintainers.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
