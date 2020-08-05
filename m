Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB623C6A5
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 09:11:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6ADDC36B3D;
	Wed,  5 Aug 2020 07:11:07 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 539AEC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 01:11:57 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200805011154epoutp03a8cb6bebf6d43f68044ee8e6b7fd7635~oOhFWM6Rc2399323993epoutp039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 01:11:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200805011154epoutp03a8cb6bebf6d43f68044ee8e6b7fd7635~oOhFWM6Rc2399323993epoutp039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1596589914;
 bh=hDLYzYfHbnyglVwlnkBmFuPskO6P5tYXJ7M1u0PeIXo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BMraRx/koVyuiOvq6Ya9jMvIjeSs10CDnJJTwvAifGfN3Gza4Qzr8p7QBYPKU53CL
 /mbnXSI8XWGad/aFUu0FRxgPwAnBP/jynOjqeAVPxdxUG+ftJT8GEYAA0gvqOvSuHu
 EUmY5ldoAQEfGFTpGx1vXpmGcGqiomntHKIAVjwA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200805011153epcas1p3c9c9588625f9051da5137e7eb0b34283~oOhEjUNWj1187411874epcas1p3h;
 Wed,  5 Aug 2020 01:11:53 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BLtr66V0yzMqYkg; Wed,  5 Aug
 2020 01:11:50 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 7F.86.29173.6570A2F5; Wed,  5 Aug 2020 10:11:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200805011150epcas1p3c35e7509c0e954e4cf056cb868abc059~oOhCCk31b0916809168epcas1p3x;
 Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200805011150epsmtrp1940caf1b8a475442ba0b51692e7b5167~oOhCBjPwC1575015750epsmtrp1D;
 Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-a7-5f2a07566447
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.C8.08303.6570A2F5; Wed,  5 Aug 2020 10:11:50 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200805011150epsmtip1a3f2f782c70cdbf0719e17880ec76e67~oOhBshqsw0131801318epsmtip1O;
 Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
To: Krzysztof Kozlowski <krzk@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Simtec Linux Team
 <linux@simtec.co.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@st.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa
 <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <47fafd62-15fc-3542-30dd-610738b6c848@samsung.com>
Date: Wed, 5 Aug 2020 10:23:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200804192654.12783-3-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1CTdRzuu3fbuyHTl/nrG9o5Jtax4secgy8I6iV1rwd23FlcWcdc8AYc
 sO02trTOgJ3ID6fkgGpjEoqU0LD4qZBAAeYR1kJ+CAKeNDQIaA1SCBDaGF789zyfz/Pc5/t8
 vvdhYdwq3JOVKEullDJpMp/pRq9v8/H3jcYFkoDMwQBUNdoJ0FP9TziyfaUDKM86gSGL5Tsc
 /aKdxFG1tY+B7Lr7DPSFpZmGcvtGGaj/ajOOWgubABq9eJuGFuoz6KiyfRhHxU8rGajr59fQ
 jK2Fgdomsxhoqa+Kjmb1XXRUM1TERFkPxzFU0bgI0KkhMbKOL2FoRFfEPLCNNBebAdnd14WR
 C/N6QNr6M3GytPMuIPOuzjDIBuMwTlZX5DDJcrOZQdZcTiM/Ny0DsmZiDCMbZtNx8lxtBSAt
 k4V08sdmYRT3aFJoAiWNo5Q8ShYrj0uUxYfxI45IDkrEgQFCX2EwCuLzZNIUKowfHhnl+3pi
 smM9fJ5Gmqx2lKKkKhXff1+oUq5OpXgJclVqGJ9SxCUrghV+KmmKSi2L94uVp4QIAwJ2ix3C
 Y0kJN0zLuKLY/bj5QTVIBzq3XMBmQWIPbOiZYuQCNxaXuA5g9uQFpotMA3jbYqa5yAyAhtxi
 /JllUG9ZbTQCePNODeYiNgDzTGdoTtVGIhF22CtXGpuIXiY0XDIBJ8GIWwAOF40xnComIYAt
 Y/1MJ95AeMHeOatDxGJxiH3QYIXOMp3who8WO1dGbyaiYUf9KeDEHMIDdhhG6U45mxDDgkxf
 ZxkjtsJ7o1/SXHgHvDZlWnkDJJ6w4eBCE8MVIRy2dNsxF94I/7xVuxrNE47nnV7FH8Pyjnam
 y5wNYG3Lb6tmEWwpy6c5B2OED/y20d9V9oINCxeAa/B6+NdjHcMpgQQHZp/muiQ7YfeDYZoL
 Pw9Ls3KYnwK+cU0a45oIxjURjP8PKwH0CrCFUqhS4imVUCFa+93VYOV2BEHXwWdTf/u1AhoL
 tALIwvibOPaZlyRcTpz0xEeUUi5RqpMpVSsQO/Z7HvPcHCt3HJ8sVSIU7xaJRGiPMFAsFPK3
 ckbu8SRcIl6aSiVRlIJSPvPRWGzPdJo0/KzHo6OLdUvp89Tiq2dIQQib91h5uYBVZgqOKL2x
 tGv7QIR4RHslZK4JvI/FgDrd2O/tO84lHiwpKVQZlO2fePd9715zPixt2etQ9pX4nl1l2pKE
 7JiCt6O/md5/gubx6yD7lekjHmrK01ugdKdF9KcFvvPugM9hZDSX0rekTfTkaO/aNPaR5g/+
 yNC/7BX51jZD5YjY4wWfur2apJgm29ed+T+oTlIW0f43YtvWiTVPdpycuXgoQxN3fCiy6MWl
 53At3vthQdmbMpvbw1m6uvLaeHq+NVRRvt08mcLsMF2y3Vynf+/O4fsHTBs8jbmauaB/1x8b
 kO3VT/wj1O60+83z6aoEqVCAKVXS/wAqdk7WxAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTZxSH8/be23tpbLwrEF5oZNIYNKUwMXa+JAaJi9m7xDiDCVE/0DZ4
 RxEopRVlJg4wM2DTwNKIfwqCKGNYC0K7qJ0I0qqRgtZCxAZBne0AIwwJIbhRyyzNEr49Ob/f
 k3M+HIYQmakEpkBzjNNpVEUSvoC85ZIkpubQUsXW1uo41B0YBOiT6RGN5tqMANX53xPI4+mi
 0ZPTMzSy+UcpNG98RaGLnl4eMowGKOTr7KWRs/4eQIGWIR5avlVFoo4HEzRq+tRBIa97D1qY
 66OQa6aaQqHRbhItmbwkso838FH1X+8IZPkjCNDP43Lkfxci0J/GBn6WGFubrACPjHoJvPyv
 CeA53xkaXxt8AXBd5wKFHeYJGtssZ/n4utVKYXtrBb7QuAKw/f00gR1LlTSu/d0CsGemnsT9
 ven7RYcFO49wRQXHOd1XmUqBuqdxhdY2rSu3vrGBSmAUGEAUA9nt8KXJwzMAASNi7wBY91uI
 jgTx8Lz3IWEAzGeOhi6XPtKZBdD+NATCnWi2AA7MdxDhIIZ9yYfPjF4qHBDsAIBTvvURww7g
 m/Yafjjgs1LYN+1b5fVsEnz+0Q/CG4RsJrzkh+ExyW6Ck8HB1SNi2RzoaPXzwixkv4ADlwJk
 uB7FyuG5M6mRVZthsGmYiHAcHAs08yL8Jbw920j8AqLNa2zzGsW8RjGvUa4A0gLiOa2+OL9Y
 n67dpuFOpOlVxfoyTX5aXkmxDay+j1R6B/RYPqQ5AY8BTgAZQhIjnF/YrBAJj6h+PMnpShS6
 siJO7wRihpTECRfNLbkiNl91jCvkOC2n+z/lMVEJlbx7U/fLhSmp6sBNWf2QRlz9iBKXXi5c
 pxzebZfHJ5JVdzd2jMQ6r556hXctBvPUBkw93rNJLUsSna/KKO1qC2Yppjd86wFCt3apQZ7R
 KW1/siS7PxNVb08/+myveUG7szn79o5YmSl0bmPKSnmFMsvdn5w9fmgs5+jyYr+hG0hqbSrl
 lFh7LTf24NdZPzywPV2R7/Mr2wQ1gUNbS8cOvB5r/uDbb0shbvyqOPUaTyb/3f7im7sOx41m
 93BuWaaod+K7fcHsYHKMe1dee1LPhZySoYdc4j8jFbN9tVe+x30fT2R0/cScrBHkPg4MXswQ
 TxbVvE3YffWgk3EV+hpkWySkXq1KlxI6veo/0h8kMq0DAAA=
X-CMS-MailID: 20200805011150epcas1p3c35e7509c0e954e4cf056cb868abc059
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200804192736epcas1p1d2d70d7481631154e5efa66acf5e7f2f
References: <20200804192654.12783-1-krzk@kernel.org>
 <CGME20200804192736epcas1p1d2d70d7481631154e5efa66acf5e7f2f@epcas1p1.samsung.com>
 <20200804192654.12783-3-krzk@kernel.org>
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:11:06 +0000
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/13] clk: samsung: s3c24xx: declare
 s3c24xx_common_clk_init() in shared header
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

Hi Krzysztof,

On 8/5/20 4:26 AM, Krzysztof Kozlowski wrote:
> The s3c2410_common_clk_init() and others are defined and used by the
> clk-s3c24xx driver and also used in the mach-s3c24xx machine code.  Move
> the declaration to a header to fix W=1 build warnings:
> 
>     drivers/clk/samsung/clk-s3c2410.c:320:13: warning: no previous prototype for 's3c2410_common_clk_init' [-Wmissing-prototypes]
>       320 | void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2412.c:205:13: warning: no previous prototype for 's3c2412_common_clk_init' [-Wmissing-prototypes]
>       205 | void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2443.c:341:13: warning: no previous prototype for 's3c2443_common_clk_init' [-Wmissing-prototypes]
>       341 | void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm/mach-s3c24xx/common.c    |  1 +
>  arch/arm/mach-s3c24xx/common.h    | 15 ---------------
>  drivers/clk/samsung/clk-s3c2410.c |  1 +
>  drivers/clk/samsung/clk-s3c2412.c |  1 +
>  drivers/clk/samsung/clk-s3c2443.c |  1 +
>  include/linux/clk/samsung.h       | 32 +++++++++++++++++++++++++++++++
>  6 files changed, 36 insertions(+), 15 deletions(-)

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
