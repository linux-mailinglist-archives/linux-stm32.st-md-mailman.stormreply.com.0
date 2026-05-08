Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EX+CV6u/WmlhgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 11:35:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A84F44E1
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 11:35:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 357B9C03FCA;
	Fri,  8 May 2026 09:35:25 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn
 [139.219.146.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27E82C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 09:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXmE/ocD4xKgqhmco6aybPe46BUSwQuPVgIdSI3QUx4wMnJioNr+3yBxexeqytAj0MW5+fmYfZjdTAt5xHDBUKMwxk9lmueZsAihuvkP8jWqsTPG/3ia+20ViwlO4Py6a1TUzQtYozYY8Q72v7wp9U9SwBnXR1svwmeEOkU9gQtb0hqM/drVHmV6IGC+lfRvlC17/fYxnb200Azpg4hwnGFqWpZpJy060iZxUhQAUvMeFH+7XS5H/1Vz4viHQ7fXs17jgADLjjWnSkXQDDGO1Kd0sdHN8wSHxtMHurDs3xC8uy9zbGNptHogcCnCWVd2kn+VVNiQSJNifv41qwaQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onzty2FD9HT4lFib4oqc8TooonV+p3zn1i+W43psc6E=;
 b=N1PV+PojYlClP2vU0JJdxU7+DandFnxz+tpaUYA/6Wch50jxFfIu+HjEIBCsSOdnXSecmHtUNJKTnN542CLUUjMCHz8rfE0J71olvxLYr/Akgwp9LefGX7JKS6bsuVPyy2cmF1/13oMxmcu2dXEiey+qP/0bEmqFF4/p0MeJPzz1MBh3tt+GEckRaBchimNzYFwKAMGgudr2+nA8F6/2SUSKCp1cYOXNCmI7PGfny6rMIskr10WK74u5I1yNDFVgtFmECjZubIqgrYK3vXTW72f6FzJfRrq+4Bwm6u2hugqnID7WZ7Uj11yPVRn1yXkKKRnppkMy6g9BdIToISblQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0598.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 09:35:18 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Fri, 8 May 2026 09:35:17 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
Thread-Topic: [net-next v3 4/5] net: stmmac: starfive: Add jhb100 SGMII
 interface
Thread-Index: AQHc3gWu27xAIUUW2EqhzN2fefZh5rYC1kcAgAEJomA=
Date: Fri, 8 May 2026 09:35:17 +0000
Message-ID: <BJXPR01MB085559F6A258DC137A2F696DE63D2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
 <20260507094115.8355-5-minda.chen@starfivetech.com>
 <20260507-reoccur-underfoot-bac75e8e454d@spud>
In-Reply-To: <20260507-reoccur-underfoot-bac75e8e454d@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0598:EE_
x-ms-office365-filtering-correlation-id: e01b4662-58c4-4791-6681-08deace51da7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: aUidpFbIYR8q1KiaWPl6BKZxhsC/aQLMBeZBoAMR44ZKKb2IrZ0KEMJPwNzPk0l5OxIsBRnGSw52C/dCUfPZWNPJ5b8ZVyWDq1lzMGCBEmP0e/CPdsw4kseA/Hlm5PvOqT9XhfF+8vQb9WhhiP7/3+WhWUmTQNE5q1NrjoIoH1KqQSbKypohmzuZliOtQHnyjqUClRkwTkS75d9qX8Ns2LpyeugucWDxD4cBaFeCdWy+ayYfsiC9Rq75sJMx6lv/jqpZqyjY5YH4ts0cCTi+oytC9C1Xpb/7pU9nL+F+Em51C/IBypTo6SIqQ5mteiaWa8PPZC28sOjaWdojwKllWS+Pmv33acWoHt2GPhAbtNvnbmjn9ccuy05FCDJgMQo9E/uDle5tQ/sYEcM5D57iGGr7J/kqCtfgoVYrQojNsJlbA+XWzECqiW3C1qiN5YScuQ5H3JAMAp03y4CDaoBmiIvg8ioaTcr+yaXdHqCO6ulLRjHrK3IIFzAAEq6/uONdHQJOkE2kty8Up+zmqBE3IZrq+MBnN/OSS++6biH3y2R+pPDGpKWVtTBvFgAxPAY9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?taVdGasxyqFSZyq+GM35ZNJ7phuf3kMHXSbPmar0QPHrSeKPmBw6UvXsiQvy?=
 =?us-ascii?Q?vhCiL9bfglI7vXNDJ5eeIGizYHBIeny8Yw3ZsMGWWJxX9tjZ2XGH78cZ/xC5?=
 =?us-ascii?Q?U/JwsTbTwus3+Ko7FiFwPoDrQXAit2WDAXzvsvoHAmTPTtQvfZvequTOPjOd?=
 =?us-ascii?Q?eUOmyU1ykA2phh7skO5eOd7bhiDtVNSjIX2ZebamGh4kWFZGoG3RfvvygKcF?=
 =?us-ascii?Q?Nokd3a2LJJKpmiIWZnpKDbA57gd8gZoRtIq2QaPEl+rsu2OMXHQz7GFPQvpp?=
 =?us-ascii?Q?LCo2iEFVYrEAv79/ofriN1wVlExZPNFwOr14+vkPQGPqjFhw2x317QlABbUy?=
 =?us-ascii?Q?1qk0Ay1FhE2oaQckD108O9Cgj/IjgeLOcLLROL6gzTqEP4nvUiFGveArNLSg?=
 =?us-ascii?Q?51e2+wOUILVB8sqTNdX/lmI5JKWEMPmJWoYj+Ge3kDV/6tsmmPm+JoRgf2EH?=
 =?us-ascii?Q?rn8hwfrnvlzd6siV2pxrksCDDgWFPHih0eEzK/CpLoZwgzHCwIDO4XoG/Mae?=
 =?us-ascii?Q?KfwUQ0Kzn8SJECFT5TpKqJUboAgbeqpZGgmHapBzVFQUKPs4j0bkBvhhwKNV?=
 =?us-ascii?Q?SuBsJ0n6Qd36mJ21YcxiLUqHjXS3Hcn/e6F7xn3ItFgx1kL/3RwoCUUJtuAv?=
 =?us-ascii?Q?BRcbo3nb6tzcQhQpfPAb8a71JAlmpR6+CWWliiGQ8VWNt0VWVdy/TCqfUn2v?=
 =?us-ascii?Q?P3xL6vsRpJ+Zl1hKpKeCCkp2+o6LwIXJbP42CC7AF/s/IT27tBxEqk9xwkoD?=
 =?us-ascii?Q?Z76Ngf5IujU0qq43CJjYT0AITvsZfU/mMkxpqmRQHt8b2YVwi38RMHiWLPO1?=
 =?us-ascii?Q?15pDXf+nCceKLs0zLrtaGZDey6azKur8BsX6C5WyRJ0LpFX6H5HiScDmlY1e?=
 =?us-ascii?Q?Bp33He475Uy1LQhAn4nlNKj8BbbpQJBzGukKEL91Luw3kPRkT2PtR+nelYyH?=
 =?us-ascii?Q?KuLghUYFdoe80Ywk2p4/1r+2d7cWyrQg4lonfebK3NspERlTZfm8U0mfJVJa?=
 =?us-ascii?Q?GZlACOGPEuC9AeOCwTXna6Q3ODEToAeeSg+6Zx6F7c4rW6BSRo/UVgD9ql4n?=
 =?us-ascii?Q?oqIfBzJl7txQ0B2mKZYrKwMLB5NVKEtJ81DjAjAk5OrBul8xZbv+GeaObC/g?=
 =?us-ascii?Q?RDOgKs/4INeCikxbe1bleKWvC2qSBgaTY9eLeyrP2OMf0a3IUwByoBu6yZDr?=
 =?us-ascii?Q?/tT2K+DilvI0a7ZPrujXQ41yFCd1wD2fSHSEFvg399NwdIDp5xtbn6Gw4LsN?=
 =?us-ascii?Q?Ph4rXRiZv7t16QiIJNXTok0t7oPgUGNrAhv62YHNSbJHBjVjeGhvNUKFQHFw?=
 =?us-ascii?Q?X8g3gcnbhSmhHTrHOqVzzBra0mHtziIldWdlNXvaXftv2BXzE54x+RgSAMHB?=
 =?us-ascii?Q?UPnjLPqYMPAfk+XL/h5ZLey+7ZQhYAaMRoIQxKTp9/Z1y9or2oXeOjMCl9zQ?=
 =?us-ascii?Q?HDeZICixJFX1H+Jlhet0MuWtxNHWgomTITD1tJMfLaYEBxBiDgvnvzFKp/Yn?=
 =?us-ascii?Q?imwfKueDQ3O4jiN/jwOh9BCx3gskwZGA/OsBodYowgD7keQ0WapGOVclUjSL?=
 =?us-ascii?Q?77vsJKXEMSVj443jgTz7xob8ln9hbVTa3CuDn0OsaBOBIiEktmTS/tXlu+8d?=
 =?us-ascii?Q?IQ2Xp9YKFbPLIcrTXYFgs/bRY1ADnuaGnIzz4+k9+lreLS0KyWGDPNT3DUdG?=
 =?us-ascii?Q?nLQoc+LpwEkF+QTzCObCNl1HBuHHl95+wjfRH/q5yZYqX9MyXBa8kB8aWeDq?=
 =?us-ascii?Q?Lbbtrgg9SA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e01b4662-58c4-4791-6681-08deace51da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 09:35:17.7998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0ZNasT218b9Yga7vhguh4/cDeNQhrUbLMqfxjncJ0f0s+2x1/TicbxE/MMDNLxSvCd8gTlCocl2pdCgI2IaU+/IzC17W8wvj3ADvym+TAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0598
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v3 4/5] net: stmmac: starfive: Add
 jhb100 SGMII interface
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
X-Rspamd-Queue-Id: 986A84F44E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.089];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marvell.com:email,starfivetech.com:email,BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


> 
> On Thu, May 07, 2026 at 05:41:14PM +0800, Minda Chen wrote:
> > Add jhb100 compatible and SGMII support. jhb100 soc contains
> > 2 SGMII interfaces and integrated with serdes PHY. SGMII with split
> > TX/RX MAC clock and need to set 2.5M/25M/125M TX/RX clock rate in
> > 10M/100M/1000M speed mode.
> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Sai Krishna <saikrishnag@marvell.com> @@ -130,6 +160,7 @@
> > static const struct starfive_dwmac_data jh7100_data = {  static const
> > struct of_device_id starfive_dwmac_match[] = {
> >  	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
> >  	{ .compatible = "starfive,jh7110-dwmac" },
> > +	{ .compatible = "starfive,jhb100-dwmac" },
> 
> You've declared compatibility with the jh7110, why do you also need to add the
> new comaptible?
> 

I am sorry, I forget to remove this. 

> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> > --
> > 2.17.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
