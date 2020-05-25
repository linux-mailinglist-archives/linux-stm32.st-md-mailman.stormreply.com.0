Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BF1E1269
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 18:13:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3176C36B24;
	Mon, 25 May 2020 16:13:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C5C0C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 16:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm5qSPNt8D01LpSnHtPFHOg/jxLEpjydM8W6tFFwCAK+s6hXeW4lU09FZsib/PO4xr+B+eUP78uLkjHp7+hBbTW7JGuH7wPrdghdGpsU/eMR+tpbjSth+O25JESxYW/QAwdx5w/LD585NnKXKPyjQz/A8p7+7dIJnQtNx/l83NU6VPAqWd4WF1sCSEC+tlFvNSN9G2tOa81/WlBdiY2RqNCvpoeXGnvd8MeQO1SqNpUDDDOW5m8Nw6qd7e6U/ulXLGiwxq+HmVFVjl67h7389r0PyJIYlgi8cEb5DP8difeAXKsa+N0O0U+9sZGeUUgR7bF5rJ2cX8lvsGdVqoZlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZIhw/rOB1P5QdRdfVrVqiaN9AySX5x26/eh7+/vuo8=;
 b=S1b9XDxULf3RVs1B+K8f1liqi6GrDVJzuHqxuHjhhED37sBGB42aCCwFyXS2Ogz9hHPtxt5OlnzOhXuXglA+J21qILLRWmCkFr1pxdm+8CFkmADrQ/1qoTRPh/rECynswb50IvCnytCVaFblBwtrKclGE62/+/KkF0Qr/Tva2ox8VLDEORwlpzIpiGgC0FxOTdwMRlAg1dHzncJnaxP5SbC9eCj3rc8hUTsuh2dq6xb7XQfPKxjPU5Pbyya6ws/cJONVXMT2KdKmbA1CuqFDiericeeM+EU4TA7j9sFxDVeuLLlOYpUDHfuUbqFxmkhnULPf/1aAtp7BUGG5tqxEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZIhw/rOB1P5QdRdfVrVqiaN9AySX5x26/eh7+/vuo8=;
 b=cOHo9kSG7wSRpRf1DLDBdj/IwY2BBnb2w3rWFyuvl37x33/cpXv2wBN8/IugwAAQ9wzvBjIweABoNDU7YWEKiHeXPbK5pQFDZFNXAKu3GgwQzaQak961+/vTGlMfiiFK4edErbJDEfIicVh289AxFD57tgFlk7PPcr9Gezr+cDc=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3926.eurprd04.prod.outlook.com
 (2603:10a6:209:23::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 16:13:24 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 16:13:24 +0000
From: Andy Duan <fugang.duan@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [EXT] Re: [PATCH] stmmac: platform: add "snps,dwmac-5.10a" IP
 compatible string
Thread-Index: AQHWMm5I28u/w5jSek2LIR4rTdAvVqi417cAgAAZW7CAAAa5gIAAAW4w
Date: Mon, 25 May 2020 16:13:24 +0000
Message-ID: <AM6PR0402MB36074BCD914E0C1828779D91FFB30@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <1590394945-5571-1-git-send-email-fugang.duan@nxp.com>
 <20200525141048.GF752669@lunn.ch>
 <AM6PR0402MB3607312E97B14B09C398B586FFB30@AM6PR0402MB3607.eurprd04.prod.outlook.com>
 <20200525160537.GD762220@lunn.ch>
In-Reply-To: <20200525160537.GD762220@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e3141e4-15c4-446a-5fe5-08d800c68d4a
x-ms-traffictypediagnostic: AM6PR0402MB3926:
x-microsoft-antispam-prvs: <AM6PR0402MB392658E59841487ED098FBDBFFB30@AM6PR0402MB3926.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEyLny9Zo9ASOjTfm0i1QsQBX4l78Je7btMACGbjyESEhW2q7bK10+b1vWqRF7hn3/DlQTap4U9wlrk9ppaC1Z8C8hOnMIS6+pdbdHrZ9FM8qgZGvIReOikMhlKTl3ZJyD1+wcLRueGjUvee1NsrjwoQCY5MNy4lHkQRl+eZbLfLDcQtbP4cAE26YLc3cvLXGJYCRj0h+hAVPaeE6C6K6P0mou6LgupVlfXh98QcYhQ1NShHRh/1USoWdN5uVW91eaq56WuncQJU239LkRbrXc7GQLqExe4s2+VEgc1epUK9a4Jnl6+RWEPyOffYtSGOD+6Im7QXHbDR31bRLppdc2DizSLDLPlaAuJ1hGPxsHMQ1aQVEiUGvnU3E71gaUCf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(6916009)(71200400001)(4326008)(186003)(7416002)(52536014)(86362001)(9686003)(26005)(8676002)(8936002)(55016002)(66476007)(478600001)(64756008)(316002)(33656002)(7696005)(66556008)(6506007)(54906003)(5660300002)(66446008)(2906002)(66946007)(76116006)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YR8swNNk5wylxIpoxo+J9cl8NfVx6vYOxXmjr1TC/L3i7leOJS6WqOicW675TyGw36O4Syqcyvakn/4wV397eNqGOWjusaBEE11zAkH6FC9VIH2sDbnSG3pMxf87kLTACk8+bzFeQyPAMrEnNvTU0MHpw1B5+2+eYphoD+t1xppjXbBCXd75RBALOeovXHFfn+O6Y+LxrZz6WJmyQUBrPcCq+aUu7F/6Ef1Z93D5HMk0izyhxS/M0sYkuG6IQW/56IhdzeHXcaaXXmsmMiKno5Zf96PHmZBXjt4TFd8y9XPZHTk3Io0Wm7a7EiheJQ/t7pgIiTzJDS/UqHJ/5xWESUQxkQEmJUCMwG0CFFlDm0jYBX1RbHxvkFwIQ4wLXhWKoEX/PMz1yYegRN4b9HTaECPxROguUmcSLCR6Wx0aif6EnwQifCiwdV0eq1F+pEmEiCX+Wntut+aGWGswdguIiXUjuvnubckSwTTkZyarg5QSHI/ap+8Rhna4tAVGKvpt
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3141e4-15c4-446a-5fe5-08d800c68d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 16:13:24.5692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SN1oUBzk+jnTgibTzgUH3ATVDAKhi0jv+2Zvp/lsaLbhivq6XRz6KEhRoJIWDcV91PiHhHuD4NNKpLXZ1T/Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3926
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH] stmmac: platform: add "snps,
 dwmac-5.10a" IP compatible string
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

From: Andrew Lunn <andrew@lunn.ch> Sent: Tuesday, May 26, 2020 12:06 AM
> On Mon, May 25, 2020 at 04:00:29PM +0000, Andy Duan wrote:
> > From: Andrew Lunn <andrew@lunn.ch> Sent: Monday, May 25, 2020 10:11
> PM
> > > On Mon, May 25, 2020 at 04:22:25PM +0800, Fugang Duan wrote:
> > > > Add "snps,dwmac-5.10a" compatible string for 5.10a version that
> > > > can avoid to define some plat data in glue layer.
> > >
> > > Documentation/devicetree/bindings/net/snps,dwmac.yaml ?
> > >
> > >       Andrew
> >
> > Here, we don't want to use generic driver "dwmac-generic.c" for 5.10a
> > version since it requires platform specific code to be functional,
> > like the we implement glue layer driver "dwmac-imx.c" to support 5.10a on
> i.MX platform.
> >
> > So I think it doesn't require to add the compatible string into dwmac.yaml.
> 
> Hi Andy
> 
> It needs to be documented somewhere. If not
> Documentation/devicetree/bindings/net/snps,dwmac.yaml it needs to be in
> an NXP specific document.
> 
>    Andrew

Yes, it can be added into NXP binding document.

I wait other's comment for dwmac-imx.c driver review, then will add it together
in next version.

Thanks for your comments.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
