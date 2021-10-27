Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930943C2A9
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Oct 2021 08:12:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE7D0C57183;
	Wed, 27 Oct 2021 06:12:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E7D0C06B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Oct 2021 06:12:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R4bM68014856; 
 Wed, 27 Oct 2021 08:11:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nT19xZKAS1g6Wr2Uc3j1zTC0eEqLF61U2hb0csAByE8=;
 b=qpkz848/RtyF6rGQB646MxF7l3lRxh06i/JQDEq4QXdNf0bBls4oIzPKu9hJoks6f/Qu
 zZ5EPSZzQPRMBZmURzYyXHIGJHoV4pRjFM5QrtfySALfgLuclLRwFWXOohJuaq9ZdXXU
 1A/tvhP9HqzAkj7qPpIoRWuTrxgBM2xIlkxBQmQxMEry3YegaYhl15hpEr+uFaZRHM09
 G2djmdsXb1j1BFg4VMmDFOY0NS6CiVjZ+SJVVgVnIEPs22BxO+HytLu9jDmcsJjCYtyk
 jzPyozDJ9b4xRK9AsLTKfGq8y+d1KoyRnwgOYG+KGwS3rDJRaK+8FSk1qCrfTltXZ7Qd XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bxm40v5fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 08:11:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B2CC100034;
 Wed, 27 Oct 2021 08:11:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E23C3218104;
 Wed, 27 Oct 2021 08:11:48 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 08:11:45 +0200
To: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Date: Wed, 27 Oct 2021 08:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <878ryoc4dc.wl-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_01,2021-10-26_01,2020-04-07_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose
 Abreu <joabreu@synopsys.com>, Guenter Roeck <linux@roeck-us.net>,
 ohad ben-cohen <ohad@wizery.com>, linux-pm@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, lars-peter
 clausen <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-clk@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 jonathan cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
 michael turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro
 Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 yannick fertre <yannick.fertre@foss.st.com>, vinod koul <vkoul@kernel.org>,
 daniel vetter <daniel@ffwll.ch>, Richard
 Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] dt-bindings: treewide: Update @st.com email
 address to @foss.st.com
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

Hi Marc

On 10/20/21 1:39 PM, Marc Zyngier wrote:
> On Wed, 20 Oct 2021 08:45:02 +0100,
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Not all @st.com email address are concerned, only people who have
>>> a specific @foss.st.com email will see their entry updated.
>>> For some people, who left the company, remove their email.
>>>
>>
>> Please split simple address change from maintainer updates (removal,
>> addition).
>>
>> Also would be nice to see here explained *why* are you doing this.
> 
> And why this can't be done with a single update to .mailmap, like
> anyone else does.

Thanks for the tips, yes, it will be simpler.

Thanks
Patrice

> 
> 	M.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
