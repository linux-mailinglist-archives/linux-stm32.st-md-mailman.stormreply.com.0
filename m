Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6888B9C8
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 06:25:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A7D5C6B45B;
	Tue, 26 Mar 2024 05:25:03 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F140FC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 05:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUFtCZmCcG78OUJJ2x1NMN8f6JNN8aby2Kp+breH2ExSBc8Qx+cU4ISNXYkv6zyUzz6XfVkU0bP2VsKhagUpMEFttax83Alddbhq1CEhpW/MHkRPb8YEW96fZjM9G/lZ4MYr8dC8l6+lnSbqCOAx4XQds55fr4zXA8kYucdpfwnurfYp5trJQh8tSrQk3fvOriPfmZqSUQPcYsHtZvvswLwWfbKX78iUtVuNW+bvt1PRn2vr7/Cr/gsXbGAiv7px4rwO4f+wk074bzcFkxQjgq3vKxhPo5lNdV3lkIulR212toZMQ+8X10Obe0dt4G0YLkWCfkOieQM/A9EiyR14+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VKYOlHx111UP4iIg1zRQqo68TXjfFD47BnZK8wwOSI=;
 b=IN3S5nsddZiz98SsKPz/gKH5EuOTtYPhWEWhEJB5slmVZS5HDLqDiSBibqW1XZB4OQugvNnKDwRcrn9r5GXoslHJUszzN8mFkNDA0lmH82SCoIVmdN/51MrPI6s53xJwLXF4tn4BGowrMzmJBZEZxuL49/VP0A5gVkVWZlu1zEBfWHCsI2g1J/l+cIVfxpEhoCtyTKgWtyl04cYNHdpb4ipEkT3jCX0k4CetTx3r6CZMp4KY/LZZn8p+r4LCtH5TFpQaiG+EtlHLeIQ66SXLeXb66fpcSLxFhpc16RRMqzGG2pmV3wq9K8wg+9P5l6LqoqQ6hlouQkDsA2SJ+9pOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::20) by BJSPR01MB0883.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 05:24:55 +0000
Received: from BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
 ([fe80::d0cf:5e2e:fd40:4aef]) by
 BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn ([fe80::d0cf:5e2e:fd40:4aef%4])
 with mapi id 15.20.7409.031; Tue, 26 Mar 2024 05:24:54 +0000
From: ChunHau Tan <chunhau.tan@starfivetech.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v3 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Thread-Index: AQHafpGsjamK/7T4cUWKv8+vn3wKDLFIpDKAgADW9XA=
Date: Tue, 26 Mar 2024 05:24:54 +0000
Message-ID: <BJSPR01MB0595A42481D25AD7875157199E35A@BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn>
References: <20240325085131.182657-1-chunhau.tan@starfivetech.com>
 <20240325085131.182657-2-chunhau.tan@starfivetech.com>
 <20240325162245.GA4167001-robh@kernel.org>
In-Reply-To: <20240325162245.GA4167001-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJSPR01MB0595:EE_|BJSPR01MB0883:EE_
x-ms-office365-filtering-correlation-id: 17594b98-94fd-445c-86e0-08dc4d5511eb
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YMSHP0IDPcIQ3qqV3xmkKk4wZ3Eaz2gHFCs78gv/dhQJZRBXSqlBtkhAScr39+D2wlfufWyVtTfjCySZFIctMivx6i8PcbcLPip/SC68J4lT/KXiDIfdNxmJlEt/3+WgkwK7ivochMoCyXbd1NL6E73B9u7VwG4p/6k9wPX79sVETD1Hh0xUTKjdq8mEgmkV8T2IOG5gwT+PQhshKljis18eJ+VJW2RnbgY3+fOL1kCd4rajDIWfdRELybDqBUZNs/6vTu/g4cGSWV1dI6/NLRXXM2YCY6ZB18xQD+KlCfDLg/6t4VWvz4YWJCW2o5SMxqzW5u6qNTy4p6+NPIXWN+ocwl5+O5BTV04/iJfXpqx9pT6v+cMZyov1V/M/K8Q8LYWNUjvUgS+6ILPzjLFq10GfwEWaM5dk+FRdCyziuk0Zc4jmSGwkG5tuY296jfF52/zsq3Bw5htlW9jBBJiONZ1BvkMvannZ+/Ngpc1XlM1YrsR1zLCd+UUOEN6bw6DwC/dkEH28er+tiISjVv3aEJZjO7Ze7X7FHBkYlLYRf4iltASDU0WldTT8Xo4oUbzIiYpo/3j63QYqy4F/rAyoIPqRXTKJpPkwMkr1f7ynYjzZkj7dk5tomflzzICBSZW+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(7416005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+Vge8046VWoyqU9s4i5XR4MsH7R/NQATm+ddg9eyjLW1vtoqTZJzWpFc2E?=
 =?iso-8859-1?Q?r2dI4rFZ72JkMUTpdlVtlk1AxwPHkdh2M/5ZQhkmfaz1uF66UjRkmyTBYE?=
 =?iso-8859-1?Q?yEHZLVdAAPeUHT0QND1p3TjQOK0YwCgKxsQi2RuT99ndGxs9+zOxMQuYS3?=
 =?iso-8859-1?Q?sRQbsBMJcv3VMIPWqjishMJb8O5cqG9q5HYv0+1aqZE9FzO02VhWmQgked?=
 =?iso-8859-1?Q?vG83uFiDbZtsPnbBDFOanqHmIsoR528fysZnow4o5p5NLtMm+ePfiR1snz?=
 =?iso-8859-1?Q?wlOUI90vx48zuVKYoxQ3SYVia6VlHjM3aSipPloiJW9ZmjUNLnyn5JEjvc?=
 =?iso-8859-1?Q?mXbRAcYMzc8OieNezqupzcRUA3ogTwhf9SktZA9tEyQx3kvcMGJlomWYhE?=
 =?iso-8859-1?Q?opfLcVUwjm7/6/q6yzVgHe/eBogYyg1tlITaKFkk9dSj9bICg5rxKXTW+T?=
 =?iso-8859-1?Q?zxLHLWMHpwwEY+SgrEaMXupcNfGVOOMpsNFn7PjtmpclU7iD9aqEOKdAc7?=
 =?iso-8859-1?Q?QdICipI7WoK6hGetLkwHNl7+rXHaTRK97vvg0yRPrSVq5OkxyBlQY++/+H?=
 =?iso-8859-1?Q?XG3F/oyrvH/Mlr5TBJgeifBDpDZLnlVprNyQfUG7NoUMGhPUGxuoFdFyJ/?=
 =?iso-8859-1?Q?w4giWrFBFTff1GZwVV+8jqkHUAtgLgIO71RsQpKpC3hR722+KDitpHa4iY?=
 =?iso-8859-1?Q?jWJeuCIIFLm/u99BGWBCO0zWDlurA9oWdouVm4WejN3lQx66WNWe96HY26?=
 =?iso-8859-1?Q?3/5ysfx5y2GzXpcEgIlF7ycGnJnNOq5zQ7FECj/h9wL0b1ziXioEfZdE/d?=
 =?iso-8859-1?Q?foKdrKOmyr6JlnMWVqI8qd5ZgWcqnNMq+QEqcHTqvzgwgPKgpF+5LQXghE?=
 =?iso-8859-1?Q?kYrU2JVl1nApjl+1tkR9+R/t4Md05G8TB6mb51wGRtv0oQr3AkK5h4ZxOo?=
 =?iso-8859-1?Q?+nH+G+8o+HTjEvpb2vJVOrO1bdap29noJYycfwqsgwaCSSWnFi9CxD+OeO?=
 =?iso-8859-1?Q?nDltj37B81h3wJamPScRaLGrGkYmhl9MgXJZk+9vNNs/vxR4te+e6ppbCT?=
 =?iso-8859-1?Q?GC2bs2hkCfUzAWou7LdUHhb2DUCmq7C9CvL46P8cphV9tp/ha5WqHcdX19?=
 =?iso-8859-1?Q?RpY2ZwaQd82hdJNgy35vc9VvltRHuaLxUZse1cnIWy5eCpUILzivAQoXv8?=
 =?iso-8859-1?Q?++Jx1EgSHbEmRG7DOkR5tEpI4qwKU9Gm9dOhGDmq4a5/439yvw1aoKdmOo?=
 =?iso-8859-1?Q?aM1zhcI+Rf9WCPdRSqMBF8kFP/WOjfQP5dhkl2FSm54YvO+19eBBh4HRYk?=
 =?iso-8859-1?Q?KkKRpKD7mRm+tfVOqEN4H6qOV8IuZ7CYwFP2jYB9V219qxuGIY1cnZD4kM?=
 =?iso-8859-1?Q?Ce3k/lHUef/zJaAVC277YumU7UiFeSM/9rhKwDWZEwIiLgNCNq88LnXZ38?=
 =?iso-8859-1?Q?8YzvmykaOIT+MS1rDBNsvCGU5tGelzmyEBWrFzKuyHIrkTNi10B/7v+mtc?=
 =?iso-8859-1?Q?CjsZtEMG3o7mSlKqhOfhHoCSwqqAMr9p8dyWJQMhJNpGnf3BrNgfvU1BTd?=
 =?iso-8859-1?Q?8lqUwMhgG7+ngW2RBcmV4xiD4bG6zGwwjQsbW3UC5IbgnfYTWtxHI1viOx?=
 =?iso-8859-1?Q?TsjU6cKSqVr1h4nBk11X6avAaT5LqSO47MeNCg8C4utritONtEM8Gjkw?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 17594b98-94fd-445c-86e0-08dc4d5511eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 05:24:54.7414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5McUuDFDLNLycKtPBZGlEqTvXW2P+gh3YzRKqf9aifkPixx6xW96Tu3jLxj1zuVQxyRbtSn/gRDN8RVO67aAMNMgPzsF65evVDFLmTjw9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0883
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 JeeHeng Sia <jeeheng.sia@starfivetech.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, 26 March, 2024 12:23 AM
> To: ChunHau Tan <chunhau.tan@starfivetech.com>
> Cc: David S . Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Emil Renner Berthing <kernel@esmil.dk>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
> Alexandre Torgue <alexandre.torgue@foss.st.com>; Simon Horman
> <horms@kernel.org>; Bartosz Golaszewski <bartosz.golaszewski@linaro.org>;
> Andrew Halaney <ahalaney@redhat.com>; Jisheng Zhang <jszhang@kernel.org>;
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; Russell King
> <rmk+kernel@armlinux.org.uk>; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> JeeHeng Sia <jeeheng.sia@starfivetech.com>; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v3 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
> StarFive JH8100 support
> =

> On Mon, Mar 25, 2024 at 01:51:31AM -0700, Tan Chun Hau wrote:
> > Add StarFive JH8100 dwmac support.
> > The JH8100 dwmac shares the same driver code as the JH7110 dwmac and
> > has only one reset signal.
> >
> > Please refer to below:
> >
> >   JH8100: reset-names =3D "stmmaceth";
> >   JH7110: reset-names =3D "stmmaceth", "ahb";
> =

> It's debatable whether JH8100 is compatible with JH7110 if the 2nd reset =
was
> not optional. I guess if the Linux driver treated it that way, we can get=
 away with
> it. It would simplify the conditionals in the schema if the t also treate=
d the
> 2nd entry as optional on JH7110 as well.

Yes, Linux driver and snps,dwmac.yaml treated it that way. =

please refer to
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/net/snps%2Cdwmac.yaml#L143

> =

> >   JH7100: reset-names =3D "ahb";
> >
> > Example usage of JH8100 in the device tree:
> >
> > gmac0: ethernet@16030000 {
> >         compatible =3D "starfive,jh8100-dwmac",
> >                      "starfive,jh7110-dwmac",
> >                      "snps,dwmac-5.20";
> >         ...
> > };
> >
> > Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> >  .../bindings/net/starfive,jh7110-dwmac.yaml   | 82 +++++++++++++------
> >  2 files changed, 58 insertions(+), 25 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 6b0341a8e0ea..a6d596b7dcf4 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -97,6 +97,7 @@ properties:
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - starfive,jh8100-dwmac
> >
> >    reg:
> >      minItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > index 0d1962980f57..da3cc984fec9 100644
> > --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > @@ -18,6 +18,7 @@ select:
> >          enum:
> >            - starfive,jh7100-dwmac
> >            - starfive,jh7110-dwmac
> > +          - starfive,jh8100-dwmac
> >    required:
> >      - compatible
> >
> > @@ -30,6 +31,10 @@ properties:
> >        - items:
> >            - const: starfive,jh7110-dwmac
> >            - const: snps,dwmac-5.20
> > +      - items:
> > +          - const: starfive,jh8100-dwmac
> > +          - const: starfive,jh7110-dwmac
> > +          - const: snps,dwmac-5.20
> >
> >    reg:
> >      maxItems: 1
> > @@ -83,29 +88,13 @@ allOf:
> >    - if:
> >        properties:
> >          compatible:
> > -          contains:
> > -            const: starfive,jh7100-dwmac
> > -    then:
> > -      properties:
> > -        interrupts:
> > -          minItems: 2
> > -          maxItems: 2
> > -
> > -        interrupt-names:
> > -          minItems: 2
> > -          maxItems: 2
> > -
> > -        resets:
> > -          maxItems: 1
> > -
> > -        reset-names:
> > -          const: ahb
> > -
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            const: starfive,jh7110-dwmac
> > +          allOf:
> > +            - contains:
> > +                enum:
> > +                  - starfive,jh8100-dwmac
> > +            - contains:
> > +                enum:
> > +                  - starfive,jh7110-dwmac
> =

> There's no need for the 2nd entry. You just need to check
> =

> I would something like this structure:
> =

>   - if:
>       properties:
>         compatible:
>           contains:
>             const: starfive,jh7100-dwmac
> =

>     then:
> =

>       if:
>         properties:
>           compatible:
>             contains:
>               const: starfive,jh8100-dwmac
>       then:
>         ...
>       else:
>         ...
> =


Okay, thank you for the feedback.

> >      then:
> >        properties:
> >          interrupts:
> > @@ -117,10 +106,53 @@ allOf:
> >            maxItems: 3
> >
> >          resets:
> > -          minItems: 2
> > +          maxItems: 1
> >
> >          reset-names:
> > -          minItems: 2
> > +          const: stmmaceth
> > +
> > +    else:
> =

> I don't think you need the else. Just do another 'if' entry.
> =

> > +      if:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              const: starfive,jh7100-dwmac
> > +      then:
> > +        properties:
> > +          interrupts:
> > +            minItems: 2
> > +            maxItems: 2
> > +
> > +          interrupt-names:
> > +            minItems: 2
> > +            maxItems: 2
> > +
> > +          resets:
> > +            maxItems: 1
> > +
> > +          reset-names:
> > +            const: ahb
> > +
> > +        if:
> > +          properties:
> > +            compatible:
> > +              contains:
> > +                const: starfive,jh7110-dwmac
> > +        then:
> > +          properties:
> > +            interrupts:
> > +              minItems: 3
> > +              maxItems: 3
> > +
> > +            interrupt-names:
> > +              minItems: 3
> > +              maxItems: 3
> > +
> > +            resets:
> > +              minItems: 2
> > +
> > +            reset-names:
> > +              minItems: 2
> >
> >  unevaluatedProperties: false
> >
> > --
> > 2.25.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
