Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7216A729
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 14:18:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9248EC36B0B;
	Mon, 24 Feb 2020 13:18:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09B2EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 13:08:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OD7CsK028839;
 Mon, 24 Feb 2020 07:07:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582549632;
 bh=Tx9NLTynxh7HMA5VHJWXsAof1AdXnE/KAs53Nqq7E70=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=J8OaXTwY6rJidCznLf2G/vSUju+4HU3kRW0QV+CMkL2fpPxI5mFwt5l1u7GY1i0cK
 fhdwF15G4WtYxb0NBQQmKRDL/VCrdAXaZORkAKh4uNPMzhrjf4desB5yiRBKSQYI5e
 lr23otClWqEaN2djtLEvvM3O3oRjPmZTJi+w6edQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OD7CFB102821
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Feb 2020 07:07:12 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 07:07:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 07:07:12 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OD7B3m002482;
 Mon, 24 Feb 2020 07:07:11 -0600
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <e9ae8125-3f8f-5f8c-c19c-34ac1bb5c982@ti.com>
Date: Mon, 24 Feb 2020 07:02:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 24 Feb 2020 13:18:42 +0000
Cc: Stuart Yoder <stuyoder@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 linux-aspeed@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Joel Stanley <joel@jms.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [Linux-stm32] [PATCH 2/7] docs: dt: fix several broken
 references due to renames
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

Mauro

On 2/22/20 3:00 AM, Mauro Carvalho Chehab wrote:
> Several DT references got broken due to txt->yaml conversion.
>
> Those are auto-fixed by running:
>
> 	scripts/documentation-file-ref-check --fix
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/devicetree/bindings/arm/arm,scmi.txt        | 2 +-
>   Documentation/devicetree/bindings/arm/arm,scpi.txt        | 2 +-
>   .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt         | 2 +-
>   .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt  | 2 +-
>   .../devicetree/bindings/arm/msm/qcom,idle-state.txt       | 2 +-
>   Documentation/devicetree/bindings/arm/omap/mpu.txt        | 2 +-
>   Documentation/devicetree/bindings/arm/psci.yaml           | 2 +-
>   .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 2 +-
>   .../devicetree/bindings/display/tilcdc/tilcdc.txt         | 2 +-
>   Documentation/devicetree/bindings/leds/common.yaml        | 2 +-

For LEDs

Reviewed-by: Dan Murphy <dmurphy@ti.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
