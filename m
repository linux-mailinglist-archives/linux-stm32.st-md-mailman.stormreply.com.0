Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD662B33A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Nov 2022 07:25:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A8CC65072;
	Wed, 16 Nov 2022 06:25:14 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 483D2C6506F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Nov 2022 06:25:13 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221116062510epoutp04561421705dca30f632ad7319e90ed80b~n-JZ65LCI1801718017epoutp04I
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Nov 2022 06:25:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221116062510epoutp04561421705dca30f632ad7319e90ed80b~n-JZ65LCI1801718017epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668579910;
 bh=zf66idLn0GPjGtmgOtoFxT+lBmEiKwgjMd3fFNtoODw=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Yh2FJNUSa/WS0SIDrnLQycUaYGTwg8hep3Nimct67gIu4i8Yrezl9ru+kXbWYAjdn
 GtBY1ctDkGwoaXB2Nw0OCHzkSgbYTDLnqdE7GkA8Y9st77TM4f1l00MI3DAQF4OHGr
 HB2T4v8Yh04/17CM4Q/npPQIragbj3SMls5Bv3GE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20221116062509epcas5p46ac6c455373f8603ffe0deb8a1548ca0~n-JZa9I0m1137011370epcas5p4H;
 Wed, 16 Nov 2022 06:25:09 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NBtM807Kvz4x9Q6; Wed, 16 Nov
 2022 06:25:08 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 66.27.01710.34284736; Wed, 16 Nov 2022 15:25:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20221116062303epcas5p4bfe30b12fd2dd8d1f72a696b3adf09ec~n-HjzO1GV1582115821epcas5p47;
 Wed, 16 Nov 2022 06:23:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221116062303epsmtrp2e30a21cd04628f816b9f9f0408312e42~n-HjyRL0B2801628016epsmtrp2F;
 Wed, 16 Nov 2022 06:23:03 +0000 (GMT)
X-AuditID: b6c32a49-c9ffa700000006ae-92-6374824320d9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.FD.18644.7C184736; Wed, 16 Nov 2022 15:23:03 +0900 (KST)
Received: from FDSFTE302 (unknown [107.122.81.78]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20221116062300epsmtip2b8056a60950e6c0e858bdf0a38c3f56f~n-HhNE6UN2731527315epsmtip2f;
 Wed, 16 Nov 2022 06:23:00 +0000 (GMT)
From: "Sriranjani P" <sriranjani.p@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <peppe.cavallaro@st.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
 <richardcochran@gmail.com>
In-Reply-To: <9fca87df-c879-828c-84c3-a870bbd87038@linaro.org>
Date: Wed, 16 Nov 2022 11:52:57 +0530
Message-ID: <04af01d8f983$e1d08200$a5718600$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHa0oM14/tprCIIIJ9eaP02I486nwLBJP4AAR97iHwCzoEZZ64H6WWQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzO6b29LcSaK3R6RgCbO3CA41Et7ELATTB4HW7pxhImaMpduQNG
 e9v1McSYyZDhIAMUo0BhynipMF1SHiKvjeciA6aCTLKyjJc4EORhcOiIK72w8d/3/c73+32/
 75wcIeKQJnASJrIGRsfSKgKzR+s7PD28w9IMSr/0h/7kyl8XAVn8azpKXu7s55OT3WMCsrOn
 nEf+UTrHJ3MejSJky0ydgLxTn8MnzeNDfHKgsRgjs4Ym+OSl1et8srtkO7n8y2NAltY9FZAv
 Z+oAOTrfbB3S+wghv2rpFLwtpmqvDfOoydw6AXXLNCKgSsxGylyViVGWoWaMqik/RT1pvY9R
 ObVVgGprlVKTf7cgVO2PS4BaMrvKRdFJwQkMHcfoJAyr1MQlsvEhRESkIkzhH+An9ZYGkm8S
 EpZWMyHEgcNy7/BElTUrIfmcVhmtJTmt1xO++4J1GqOBkSRo9IYQgtHGqbQyrY+eVuuNbLwP
 yxiCpH5+e/ytwtikhH8ahlDt3NbjzzuKQCro2ZIF7IQQl0HLlBnLAvZCB7wJwIWz84AjiwB2
 XLmLcGQJwKJ7g8hGy8v09PWDRgD7+vNRjkwBeD9vEF1TYbgvnLl62TZYjFfwYHXOdzaC4NkI
 /O1KHlhT2eH7YMH0l7a5jngMLG7O5WUBoRDF3WFrW8xaWYQHwqfDqwIOb4O3CydsBgi+E96c
 LV5fSQJXJiv5a1iMh8P20up1zQ7YtfKNbVWIV9vBxtVllGs4AJ839AAOO8Lpn2sFHHaCS3Mt
 GIfjYU1nDZ/DKvh12ul1s7fgT4PF6NqeCO4Jf2j05cou8ELPDR7nuxVmv5jgcXURbLi0gXfB
 srHMdewMr48t8s8CwrQpmmlTNNOmCKb/3UoAWgVeZbR6dTyj99dKWSb5vydXatRmYPsMXoca
 wMif8z7tgCcE7QAKEUIsqkg1KB1EcXTKCUanUeiMKkbfDvyt130OcXpFqbH+JtagkMoC/WQB
 AQGywL0BUmKHqKzAS+mAx9MGJolhtIxuo48ntHNK5ZUBj+XZD4KMTx5QtfY+bpUN4zsLXjwz
 n0lufyCi0eyUPK2o2RSGph2s+F5Zvavv9MEjEblt4SMei929A6N5XX0xTm5le2U1WJR49sy3
 A3TEp3cVv0/fPmo5dDEudk916BfRHi2FVezDz1y2H19QRD/rn7oBHYddxcGf3DwH6z8ctpQ7
 Frju9i2M1L72+nkq+eQ4bFrFPspgG09apMH33suMvaZO8z6cv+KcknpUmih3D9FlHpMrXd7w
 0iV37+drI3mW9FOeUbG9+8e3XI1638t9tutYUzadoL6zO+gdNyyDTAot0ugkRZnyjHdZ78fn
 t4Uu5B+55eYcdEJkQUYdKgs/JlB9Ai31QnR6+l/wiv5mlQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfO2TnOVsfN8m2J1aQoy5lm9RZmN5DTBUnID1pkQ09e2o1d
 ukFkoFQzVqJJzZWyNHUR1nKmpkabrlwro0gRspuuvJcpolZWUwO//Z7L/8fz4aEwQS8uotIV
 WlatkMrEXB5e7RAvDX16Tpu8zpwlQBO9BQCZWrNwVNT0kkAe52cSNblKOOi9eYhAhp5PGGro
 t5HoVbWBQNauNgK9qTNxkb6tm0A3f98lkLN4ERp7PgCQ2TZKoj/9NoA+fa//J3H3YCi7oYnc
 7s9UVXRwGM9lG8nUGjtJptiqY6yWi1zmXVs9l3lQcpb51viWyxiqLIB50hjOeMYbMKbq8Qhg
 RqxB+/mJvKgUVpZ+nFWHRR/hpf2qacNVQ/NPTjoKQSZwzdMDHwrSkfBPVhamBzxKQNcAaL9h
 wGYGgbDlY8ksC2HF1FfSywLaA2DO+FEvc+kw2F9exPWG/elKDvxyKZ/wFhh9FYPuF3pyRjsC
 oOFnznTch46G1/rOTWuFdAJ0lA5w9ICicHoFbHxy0Nvm05vhaMdvcob9YMv1btzLGL0Gejo8
 s7wUPhw0zV63DE54bhNe9qdjoN18Z3YnADZPXMKuAKFxjso4R2WcozLOiRQD3AIWsyqNPFWu
 CVdFKNgTEo1UrtEpUiXJSrkVTH9DSEgNqLd8l9gBhwJ2AClM7M8vzdQmC/gp0lOnWbUySa2T
 sRo7WELh4gD+K31LkoBOlWrZYyyrYtX/pxzKR5TJEakszi3Jz3J/YEGWvneigrUbenxTjjk3
 Bh9wFN7bZOwsHDdtzTcMJZZHnTmo17rJ47Wt+z8sH3Pv1jrvb5Tvzdi5vbIkqawr0WfVEBze
 u7LodZNCtER3vrbdsV55RzL+ZsHuXS5d563SQ/aEBRd78LhHheaCF4tvHGGV89dHdJr9eHvy
 Lo+GKbEL5bGyVeFM6Y7gOHdCa8ZUUG6icFDS+3Obb7b9V+jrgIjhebviM967zhB1gbEKGT3Z
 XN4+1T2o9ysbS392OKKyfqo5pth1Ly2qa5KqtAXGty7clOcbPSn9XKdMehi6+u7tATLbJaxA
 1UyZ6ZZxuH1ffvzynDh3pBjXpEnDQzC1RvoXlow423wDAAA=
X-CMS-MailID: 20221116062303epcas5p4bfe30b12fd2dd8d1f72a696b3adf09ec
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221104115902epcas5p209442971ba9f4cb001a933bda3c50b25
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115902epcas5p209442971ba9f4cb001a933bda3c50b25@epcas5p2.samsung.com>
 <20221104120517.77980-4-sriranjani.p@samsung.com>
 <9fca87df-c879-828c-84c3-a870bbd87038@linaro.org>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com,
 'Jayati Sahu' <jayati.sahu@samsung.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 'Rob	Herring' <robh+dt@kernel.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>, 'Pankaj
 Dubey' <pankaj.dubey@samsung.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: fsd: Add Ethernet support
 for FSYS0 Block of FSD SoC
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



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: 04 November 2022 18:17
> To: Sriranjani P <sriranjani.p@samsung.com>; peppe.cavallaro@st.com;
> alexandre.torgue@foss.st.com; joabreu@synopsys.com;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; mcoquelin.stm32@gmail.com;
> richardcochran@gmail.com
> Cc: netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; devicetree@vger.kernel.org; Pankaj
> Dubey <pankaj.dubey@samsung.com>; Jayati Sahu
> <jayati.sahu@samsung.com>
> Subject: Re: [PATCH 3/4] arm64: dts: fsd: Add Ethernet support for FSYS0
> Block of FSD SoC
> 
> On 04/11/2022 08:05, Sriranjani P wrote:
> > The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP,
> > one in FSYS0 block and other in PERIC block.
> >
> > Adds device tree node for Ethernet in FSYS0 Block and enables the same
> > for FSD platform.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Richard Cochran <richardcochran@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> > Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> > ---
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people and
> lists to CC.  It might happen, that command when run on an older kernel,
> gives you outdated entries.  Therefore please be sure you base your patches
> on recent Linux kernel.
[Sriranjani P] Sure. Will update CC list in the next version.
> 
> Best regards,
> Krzysztof
[Sriranjani P] Thank you.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
