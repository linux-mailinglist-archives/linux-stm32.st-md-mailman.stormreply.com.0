Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIZyDBET12kSKwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 04:46:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A23C5A9C
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 04:46:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B9EBC87EC1;
	Thu,  9 Apr 2026 02:46:40 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2131.outbound.protection.partner.outlook.cn
 [139.219.146.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2325CC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 02:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtcRs2dcZQEQnXXS05K+oQj0xwi60CfF0y0xoNg05WHugG2BazpGfmcXg7ilveKl9eToMK27csog3j0+WzUQ7T1gIgzc1MHzlRdWNTzwzUJ/hmLMtWRtPMhunMPwBpxwT/fJNjI6e/u1fOQ9PEYvrAu3/whgynYa4+IzDJPfG2vb/uFzKmH9Y50X68wq/Ld3LB7KRNKoO7Jhhj2s3kz2Aeu3IuawRRs8L7M1SaRIF7gYjzB32njZB/MVR35JwttLYqvZmX7Ab94ikuxJvmFuH74V9TiYtm+jtG7PoxRfZ60mtuj3p++VnXEDfSs6e57EiybT1CtHhhYRKK59iaM02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y2VA5veFYk0Y1H15C67jAwp76YSSXQKqeAwW8Ta59I=;
 b=gWEPxJbvwmd0t6lzSWjac3YCeB47HKBoa2nZJiedoofvB06alzb4N6fPpDkufAQDfmhhsC5AmQwwAnBFYOUVhqS3PMIQk0ZzL4sqNrh7J+f+6mDJl4n6bx9uk+XqHr98NhjsuU2gOlpxLK1fSTUXnODfVHEAZgojcmJ4DSTEGdRxkq8ri8QJRpVlwV9AtUT9+kCdqErSzk8V0oExjvYW/ktKSgR5U6uXRCxvHyb6VnI5yPtkGZoJPGVuMltY/56NGRd87xqhSwHNG48iawRnhFop6lsJvyi0v45KjbR8K9uTblo1DuW+m6jm0vdbLQL9SBG538H2Vx5KT6Mm10Do+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0734.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:24::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 02:46:34 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Thu, 9 Apr 2026 02:46:34 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v1 v1 3/5] dt-bindings: net: starfive,jh7110-dwmac:
 Add JHB100 sgmii rx clk
Thread-Index: AQHcxzPpSzxCtzZL3kCcOZS4bZuZ9bXVS7sAgAC7kjA=
Date: Thu, 9 Apr 2026 02:46:34 +0000
Message-ID: <SHXPR01MB086324F54E75BB7225E156F6E6582@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260408084416.29753-1-minda.chen@starfivetech.com>
 <20260408084416.29753-4-minda.chen@starfivetech.com>
 <c69cf692-87be-43b5-93ee-38040d5cb1bf@lunn.ch>
In-Reply-To: <c69cf692-87be-43b5-93ee-38040d5cb1bf@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0734:EE_
x-ms-office365-filtering-correlation-id: cf132a0d-011b-4c80-dfeb-08de95e236b5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: G6LS4A1zg6CUTjfGv86zeHWgPPdKPhnFNBxJ9X7qkZ0Q9J/D8mdWMgfSQWMqA7LkSPqqzu8hNTjfbwHvpUKZXKEMI5T/v2YwPUgDkmHb07jMUKPbj+FsUzWwHXUrDp+xBOEFDri+uYppTmnXx0kjfqWCswg0y4odaVqcUJre+nr9ErqbTCW/wlJG1fKCF3i8zPgmiLtns+8IS9af5ubnbhRA/CI/aW5jy3+OMdRNUmyG1k6RFgjsHQtDL59iWgopDw4wrqD6FHFGMkluCI101DLPycQ7DC/5dTKpf7jiCuRgYCZIHl/m+nfY+8x0fPkaliV8B7emncG7BGrhpBDlJnEcU19/G5DbZhdiFVL134bB/sP9WCvmGn7l6iyuwKr+WLgoLlN+cYs5Xp/LnWJf2/lqZ7LBcwCkp4hCElJ4TemyCPgXmPxDj3KSrXkENAzuTc7qbLj44qPTM1vCnQ1qb1nNFCZUXVr81TN6E42NdYXrA/q5LtbfvL0rUip1kvN6mY35aO2uPbAyP3Gguw83oYTgWO7+wYlxGNwYMOnEfR97eI3x6LLqW+tChwmb0rBENVuWl568KhSxhHVsD6+ZlpfIdgMsbJBQj89VG3B54rI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bTU2cG45bHZ0RXpYU1lWZHFTc1ZKOVhNeWlGTWpYMUVCUDIzN1FKQWZDMTc5?=
 =?gb2312?B?Z1cyMXNydFdSbllmRE1oeEdvVEJ6dFcrSEVJNUVZdjZLeG1FQnlBUzhNMFFM?=
 =?gb2312?B?YWxqbjhrdTJ1UHBUM1RVMWVVWjhvbFJxcitKeTdCQnc1VkdkbklXUTFqa3N4?=
 =?gb2312?B?Q2dacWxod09VNVVSZEpwaThsUFdXTHZ6V3ZXdlZqMk9CbHpiUDRmcDdhckJa?=
 =?gb2312?B?ZEZVY09VemFnaTlpVllkMnpNNTVwcDFNNFhjdWZsK2hLdVBXVlJDVkF2Tk5x?=
 =?gb2312?B?cVFJd3lPY3BtOGlJWjRyRjRqQ3R2UzJmVlNWVWJtczg4a3cxSVYwR0wxU2s2?=
 =?gb2312?B?YXB0QU5NL1JBRDRXdGU0SW44eExta3hHTFZWNmoyU2VrOTVjYm5jQmVza2FO?=
 =?gb2312?B?VmRLRVVMQW1JYUJzb012MEpJMGxtbUJNYzZ5N2h4VWxmRVUyMFJRVitzVzNU?=
 =?gb2312?B?V3F2NkxyM2prWlJRakx6aFNnT0Z5Q29XMFBZNGtrby84UkQrcDE3akswU2VW?=
 =?gb2312?B?UjNEYjM5OGpZK083WlFNenlBbk9NQmp4VmE0cXdyNlZUWXloNW5tcGZIdHgw?=
 =?gb2312?B?eWJSVVdtSDc0ZzdSSUlla2VHSDJwTUdkNzZvcjJTeFBTT3g4T0ZmTHVjME1s?=
 =?gb2312?B?TGtWVnRCbE03RW1QMFFnY3ArNjNMamwvS245bVFSaHNYRytrWlFBRnNZSU5a?=
 =?gb2312?B?NGZrSnYzL3BoWFhnNkVvT1FZNFJLS0YvbzgwOXdoOUVCYTZEUG1ZUEMxRUVx?=
 =?gb2312?B?b3pGdGRlMUhGYU5zaml0blhwNERMVmtFdTYxYWhjUHIwWUh1TUdjdm1vNnJ3?=
 =?gb2312?B?T1FZRzdaNTZndDJXT3pRU0I5cWJIZ3dvdG5WLzRBUkl3eWl5SGhCS3hPbDha?=
 =?gb2312?B?cVdJU0E0ZVRRdlFVMnJaUno4dHVXMis2U3RlcUhvblVadGo5SVBHL21LNk82?=
 =?gb2312?B?OVBRaEVwaW5tOHJyMFNrUFNHMmJvZG9IYUxrRlRKSXhDRnJMT3B2MFBlNWhq?=
 =?gb2312?B?Q0J5U21lVC9mdkdtaW11RlVsdnlFR3ZKdmtCd2h5S0t0WWhMclpMbTVNTVVa?=
 =?gb2312?B?UnVkNzViWTFJUGd5dEdmTUhjczUrd3o4cWhWcDlXK0U3L0NCRm9Da1B5RFdX?=
 =?gb2312?B?N1IzSlVrdzNRMUphOFR3MzN4MTBia2t2K0VqS081T3granNMRGdQdU96dTBY?=
 =?gb2312?B?bEZpdWtVRTVYSDMzd2kxaWJGcHhIUEJrMzJBa2ZwbXNkcW04UmVLMGFMUFVC?=
 =?gb2312?B?MjJNbXZlUDlHdmVLU0RwZGRDRFNMR285eW5KNy9NRk5PNmN6VXFNZXpLaUN3?=
 =?gb2312?B?azFuekkxMUdhV0ZCaUw0Qjh0MVhXRW9yZ1F6dXF5eStYbzA5bEZpUGxicFZ5?=
 =?gb2312?B?L3R0NkxIWlBwT1lNbFA5bjRXNllpekdwc0F1QS9paGZac0p0QUlUME9WcmZk?=
 =?gb2312?B?M3B0UEYrbHByM2Rjb0VURlQxU040NEtYcjJjYUVGN1RRUXZiSEc2SkdPcjBr?=
 =?gb2312?B?OHpQbjhldWpxRHBXVU1veVNteHdtajNLK1RtUmNXM0VsalJhOURSYWgxVGti?=
 =?gb2312?B?ckZPMlAxNjkzMzVrdGpxaWE3dlJLZWFxVlRreTEyM2F3ejlSWHAxL0RZYlY3?=
 =?gb2312?B?d045VDkyUmtBdWpEZUdUbzJvUEIvSm90dm02T3NJR2NiQVdZTUNRUW5yZ3ow?=
 =?gb2312?B?V1RTMkd2R2JUV2xRWkJXaTRPNENCZGJxY2RhQ0hzNURXdHFCQzZ5czd0WmJC?=
 =?gb2312?B?a3c5TFRWY0Jaa1ZpbDJldjF5UnU0RGlyUjQ2ZXk0VVZZYmhlU3dKaW5OTzFY?=
 =?gb2312?B?UytmSFVkM2JURGF4V1IySmw1SUdBMTZjendSV3hYbzJzakJNKy9mWE0xaFZ5?=
 =?gb2312?B?VmJWTGhHcFFIZXhMZis5S0pZUjJwYzRHVXpZamM0blJOalM1bDNqb2lNQXBT?=
 =?gb2312?B?c29ZeFU3WGpwK082Y1Q2cUE0VGQ1OGNoeVU1VFY3ZFcvSUdmSWZYN3FwamJ2?=
 =?gb2312?B?YXF1enJrQ0dLeTM4Vlg0V3dpYjVmWGlSYS9DMThEZW4xS09ZYWZKMFNoaVJS?=
 =?gb2312?B?VitVd3ZBS25ablRzanFoSDVNMTIvcmUxWFlFWHJQZU55Q2xoQmFQSXpPR2d5?=
 =?gb2312?B?NWt0VGR6Q0E1cDI1R21NMm1FZ0VyRWg2QU1FNlJJaHFnRWNiL1pvNGUvZkJG?=
 =?gb2312?B?QlBWU0dBdGN5OWp1dmxTTmdEbGppZDJWYXI4eStYcTdISnoyeUc3K1JKQ2Ri?=
 =?gb2312?B?aitKT0dRODVWVlVtdE96d1pvOUVtVEZsbjkvMC82UnJpZDJ3bjN2eVlXbW9O?=
 =?gb2312?B?dlJ6ekZXekNEL2FmTG5zaDU0WGgwc1h4UWNsTy9WT1dydkNxbVJlYnBkdWtY?=
 =?gb2312?Q?MDW1wx/IrwssSlLE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cf132a0d-011b-4c80-dfeb-08de95e236b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 02:46:34.5851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iC6weaNqb2aUtJGRtn/nUIK1cWrN3eX0BJ2WQ9HzcrDit8Bh7RMDUB2Vf20c4+oNS2dH7GFrYzDdxY643rxRiNEZsYt8OeTlvH8QXKPLUp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0734
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley <conor@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: [Linux-stm32] =?gb2312?b?u9i4tDogW25ldC1uZXh0IHYxIHYxIDMvNV0gZHQt?=
 =?gb2312?b?YmluZGluZ3M6IG5ldDogc3RhcmZpdmUsamg3MTEwLWR3bWFjOiBBZGQgSkhC?=
 =?gb2312?b?MTAwIHNnbWlpIHJ4IGNsaw==?=
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.465];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn:mid]
X-Rspamd-Queue-Id: C75A23C5A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> 
> > +      - description: SGMII RX clock
> >
> >    clock-names:
> > -    items:
> > -      - const: stmmaceth
> > -      - const: pclk
> > -      - const: ptp_ref
> > -      - const: tx
> > -      - const: gtx
> > +    minItems: 5
> > +    maxItems: 6
> > +    contains:
> > +      enum:
> > +       - stmmaceth
> > +       - pclk
> > +       - ptp_ref
> > +       - tx
> > +       - gtx
> > +       - rx
> 
> If this is only used for sgmii, maybe it should have sgmii in the name?
> 
> 	Andrew

Okay. I will change to "sgmii_rx". Thanks 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
