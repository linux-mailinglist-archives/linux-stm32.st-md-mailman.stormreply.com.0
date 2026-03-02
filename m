Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFm6EDIIpmmRJAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 22:59:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F61E471F
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 22:59:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90B08C35E3C;
	Mon,  2 Mar 2026 21:59:12 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C5B1C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 21:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tffpCOoWbkKoYVHQ/j+JMj8CTEOHn58jSi2MuKDSDN5ZCRNnPCkH1AhElncuLh8QUib8p5jTYhQugIiyKnwZk+A63DN+GGF6OUeHBok4fucfUAE1BWukuqtaQstk2RHYfqpnfRW1OxhKzk9uBxTyU4MH/ezAeAlGjr8M+BpPkoTBoYg6KPEDWPyHo0C8151TRAjvp7spI2iv5z9575iDik8+DcOBceABYFR6iFRjHtk0BxvUOyVp6KcOeJFuJ8lhelDlcOVpvfVAYugPBa1y7W4tg5OOlczX2z1T0oxMIkYsTnfusx9NlzM2bJnkRr8bd6hxTHa//hM7geimc5Mevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2MpJ9X0TD6UOWDu95AMdnD0jIMPiu+cexPzkeJudSI=;
 b=EVu74Q2B1gQtOm+jTQACv/bGLWrUdzRm4jx6KDhQ1lLPe4UZhbMos3GrYIZz9y+Ps9ZMI/XHZkwJOPtbvqMc7/AVLtATzSCx9YIDjSe+HAegYesjDDWkGkpOHU3JKisIGMGAjzSl9BtvEAGZbXOX80CQNN7nR6bUfsBku0QK4dY11ww1zq/spFIqvfpballPhHiR2FT6G3aHPdhRXRS5lJcUnpbKQT9HWtbEY4D65jBR+Pd2fF/qtSc6yMo6e/XQL+jt1wxC40Hx0N33ZVaENpKqnnTNxsYY9iIGvXbGuRAw/aq3vgFkX91NTXZ8KmlBNycC4Go+UCIP4sR75MBYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2MpJ9X0TD6UOWDu95AMdnD0jIMPiu+cexPzkeJudSI=;
 b=XEhKH84HAX8ZYLK2kE1RRKdxdnH3vsyDYVf/+jCZrNDndYRj/R9iUwE1SF17F/HQdZ7pw5S7INF9yzhAo1zU7NT4c/hNA77zTEVPYq4fKczF/oEPy+staQ+7rkEgTA0vB4hOmWukdi1xGnrcwM7NhU4sJK89hLgvt5S8YdmD38w=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by OS3P301MB0167.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.16; Mon, 2 Mar
 2026 21:59:03 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9678.010; Mon, 2 Mar 2026
 21:59:00 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
Thread-Topic: [PATCH net-next v2 4/5] net: stmmac: Add write_hw parameter to
 VLAN filter operations
Thread-Index: AQHcqOUI1D+c/5fBOE+24xeaA44rTLWbwoaQ
Date: Mon, 2 Mar 2026 21:59:00 +0000
Message-ID: <TY7P301MB1984067560FD51D7E2424CA2D37EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
 <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
 <20260228110408.384420e1@kernel.org>
In-Reply-To: <20260228110408.384420e1@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|OS3P301MB0167:EE_
x-ms-office365-filtering-correlation-id: 97da639f-3809-434e-9192-08de78a6e902
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: kBCnrrB8nMX00cD5zBktQs4GCYMnsWBuAfmjK84aqNZZ2vKkR9O2hRRFohsYyWmj8nQR8TKYg1kqKwPCINLQ0h9iZtgD/Ek4aDK+ll/sXTnDKhAO04ME4P4si0NIK4wTaI43JXPEmDOVGqv0iVMF0mk2oXzUouX1ev7HSymaCf3bwyUVfWYVkQII6IgYrARruoccepSzHYC0U+NuwWzyLXij47+iIq9ej3cl+FWi8teVNRZpG/3zFEBTutpU4X129++hOi39JAvZjp/m/z7D7eiXnq8fEEEknizWoz+BNeYqzdvhT/dxni3ZRfrEtfVDqt7h2c0LNVfU0Ps6Jm4RiIWdr9vKvU45J0hzcKo51n1vkc1b//afVy5ciNfEsQ2ZHDvBdnxNqsJbSnfeOp0zTakLPcwCERGJjNuoIUh9prykNZ2Nveroqzz848gJYWXGsBCvP2irGMaX5STiaoPT3CCESlDI8d4ICo6szbkSX//jBGvWUDdACoKvcv6GvLBdN423LCxysROubD7kqI1EJHiIKBco/4zAPxboNrHdw2gwJiCGBIrt/RHEZ3bUzochvWDp4H+oUUAE7zw8aXAM4VjbBRIGvMHpafdkwJhQUj+9lukJ6DmOcR64GjthdT68/ZuRxy8t6Ul7Y5OxNOuU+GFeIs6svk+YwlZ2+x1/lnNUsnm6OhQRHzN7S17CTOO3uEpMuy82us2tGklmbXcENOyrGrSXIIy/e2F73PGv3yzbMtBjojbDeXSQbpnoY0asbCCZrwYJ/wjx2OWa4OuP/BjKE4eXJXB6lpobEInx7tE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OP04jCQmskOYRYimvZOdpB+xx6UI+9r8h42/v9jq13UYzDifbpDSozIXCYlu?=
 =?us-ascii?Q?LYDbfluHCKZMppO1TNKT03IuHmwTqwyD8tQAuJebvX21gC7WQAd/E6+CFSMQ?=
 =?us-ascii?Q?c9kuhVsU6uAVZgFBpyJZ/mHGSzGdqNXWr29jO5jcOqeKJLyLibBtHejENh3U?=
 =?us-ascii?Q?pBbPVIh1EeY0UahE8L79EmgHqjaIXv80LQg605apKg5nEyVkTcOAdTWzL0tB?=
 =?us-ascii?Q?nHevo+E4rX+WWYuAxiTQT0tCSGOmjMZ4niqLjCXVd3e+KWjDsICzkQRb7ryn?=
 =?us-ascii?Q?oefZiwq/Lb0hRuBS3nSfn7tj77GRdnbbHFZM5+F2otVc/WwH4Cbp/5ZKjgCR?=
 =?us-ascii?Q?CuE8YkPfbu2P8e/CrcpLhb4Bhf5BoU1KFkPpowfilC04l8wRd4ULwB6AOQ2c?=
 =?us-ascii?Q?iZXWdZtyKmpwbyWQbR6O62b96b/qqf+ceziUhK2JBqP8p4WBZTkfBg7PiKkl?=
 =?us-ascii?Q?Vj1azFLUJ3hspD/6t0Q/CWlBhJKprVS2w6yeFD/OJ6nkgaJGzxb56xpQr0WV?=
 =?us-ascii?Q?JYhf3lJoLIt1hRW8DIZNXddMzfMpziBVP/p14lkQV66DzScDxi+fp4R7jo3M?=
 =?us-ascii?Q?oDPhnxmRHHIQ62Q6Umm4BVjGBVjN+Z9q2N3rRT32EFL6T+7EFs+5ywVe3GzZ?=
 =?us-ascii?Q?Uf/Etr9LrnKxn6cQtDcDBk01DsfreKy50+tpFxvWowH8Bi+DNadoICs6oOlC?=
 =?us-ascii?Q?OAAtsOyx1T/upV+DQdogrCzOACJWdUhqONRTUiFhBK5mZ05276/BI4JEAiJO?=
 =?us-ascii?Q?lvFUvc23qoT7LjxIQfaJXuKC5iLKOyY+0XB6HXk1vSRgy5DHXQgxM6zYzhgk?=
 =?us-ascii?Q?vRgi4dl8XxlJ1rBEeyltCLRwzRVtqKQVXEyFmFHpctrPbM+kUK54Fk9sGP1y?=
 =?us-ascii?Q?ycsrNwfPK/FH6M2VgZa3UQZ9PiRLtIFd8vpyoIZbe1ZELX11sXhkt8uWRr4w?=
 =?us-ascii?Q?dsbkMotK5Oz0Odoty48ce0i9lnYMFbSBqk4Be1vFxRJL6tN8fjPNLWX9Uqob?=
 =?us-ascii?Q?KseTzT0FqZt1vJDlEwha2Y3d5U6OKOAXcp7kUjhXHU9mdDSVulAZjpS04sUd?=
 =?us-ascii?Q?GlZIiAza3/SZQCQoqYPrN2SX/QjULCkp3m8d8lkql3W58tURzqXAhlmCmN+9?=
 =?us-ascii?Q?IdBvJe2zY/X15+WojAC/NepRxg6Z+p+1e2cIXOkHzfkjHjG5rMrQ97YrWzK6?=
 =?us-ascii?Q?wymFx87auD3GnSuwyjlqe7+7V7K2BrEpZuWeyWbQ/fwkthunYXkz2/zDSmD7?=
 =?us-ascii?Q?pj0B4Cf2PfPvh/3yVOZRqT2RiuHqWxuJ2/j4kwv1OiVAELmpGn+YlO3Rf6gG?=
 =?us-ascii?Q?itCzKKY+RnRqRJ8xQS8QSwHNIfWKNePCrfCscz+OYkm4iF+GLWd3SdJlJIgD?=
 =?us-ascii?Q?a5kpEpwfBnTkhRnpVuNQR1V2aW254T0SSSFiMivh256tkqpdG3+9tqePDyJn?=
 =?us-ascii?Q?hfJNlUcalb7xz8iNbH0u/LuD4UK9B3c1Zi91EFLTR1VssGzHLDmDcvKa9ro+?=
 =?us-ascii?Q?X0Asp4jRSAt3FovYf1rDjAamMJaFmcxKix4EnMzZw9WWk91s0I/tss9uNozA?=
 =?us-ascii?Q?rBnZO4y62Du4NUd0vY6hJiEcOW2TI3MEmqX7z/bUho4yze8YfYHwsV32GwOe?=
 =?us-ascii?Q?6hBKxh5n5lrmBYby3+rE4ota3mgiGZyxvbSb6ia8KgHINlYY5xi1kVoen4jT?=
 =?us-ascii?Q?QiVovQf4TI59n7XsgBZZjCBXrcZmVw0FGOrvAdwTIjSGUJaz7pmFmpMw9WGA?=
 =?us-ascii?Q?2J4CxYoUrz0G6SaU5k5GsvnOq84/Hmw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97da639f-3809-434e-9192-08de78a6e902
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 21:59:00.1856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fnf8DTemb9cvX/ZWKsmtevOnF3/2U2FyRiryrEg3dEl3S4bLNs2XMvg1r9Qxa+aiJ0RU/iXVUuqvy2tPkA5Ne6Y64gsmtWV5SG4G54bNeWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P301MB0167
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kim.tatt.chuah@intel.com" <kim.tatt.chuah@intel.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "rohan.g.thomas@altera.com" <rohan.g.thomas@altera.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "edumazet@google.com" <edumazet@google.com>,
 "boon.khai.ng@altera.com" <boon.khai.ng@altera.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: Add write_hw
 parameter to VLAN filter operations
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
X-Rspamd-Queue-Id: EB7F61E471F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[renesas.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:kim.tatt.chuah@intel.com,m:hayashi.kunihiko@socionext.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:rohan.g.thomas@altera.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,socionext.com,nxp.com,st-md-mailman.stormreply.com,altera.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.785];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hi Jakub,

> 
>> On Wed, 25 Feb 2026 14:24:13 +0000 Ovidiu Panait wrote:
> > Add a write_hw parameter to the VLAN add/delete HW filter functions and
> > to stmmac_vlan_update(). This flag controls whether the actual hardware
> > register accesses are performed. When set to false, only the software
> > state is updated.
> >
> > The next commit will use this to defer hardware writes when the
> > interface is down.
> 
> I wonder if instead of passing attributes like this around the driver
> shouldn't simply maintain a flag (or have other way to test) whether
> the clock to block X is currently enabled? It feels more like a global
> state / property than trickiness directly related to VLAN config.
> 

I'll drop the write_hw logic and instead just check netif_running()
directly, to avoid passing attributes around.

In this case, the PHY RX clock needs to be on for the VLAN accesses to
succeed. When stmmac supports VLAN, the PHY RX clock is always kept on
via phylink when the interface is up, so I think there is no need for a
new flag, just checking if the interface is up should be enough.

> Also any strong reason to post this for net-next? We take fixes via
> the net tree, so when you repost please use "PATCH net". And an
> appropriate Fixes tag on the last patch would be great to have
> (presumably just ed64639bc1e0 again?)

Will do.

Thanks,
Ovidiu

> --
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
