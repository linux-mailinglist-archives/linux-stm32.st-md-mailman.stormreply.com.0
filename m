Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BKAFYCu/WmlhgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 11:36:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EBE4F4516
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 11:35:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CD48C03FCA;
	Fri,  8 May 2026 09:35:59 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn
 [139.219.146.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54369C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 09:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqTifxNsWHUXNCJ1IAgLAuOBCyndAGr26ucOwWeqdFygPDhdniT1DLhRa2tS8qnwmknXqRQyTDio7JAWQA+Yl4m26t6pusy/20yy1o0xp7xr8PrUHoZP7M1jLkaBoOhu5tUNhvvHe6jsGirYsYFQNY6jQFc1doij0E2Cj8VU522HixFzfxU3w+q8H9S3QbsXe7cLDQSUz4VHxHeeR1yRyFcOQO2vpyxnhlFsb4OrO3VR+QYmv1Y0QX9gVWpO97vPakP2IisxlxwxbargbzpLkAXyLw/2BjaaRxJdp1r3PSk3QmvRBY+GJLuOfqvf8skEBY0JykOLGqRFUQp/vtumjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdcggGXgqX82T4dEsn9KBakHmtDSEx6ZEOs7Q8sU9es=;
 b=EmL5z02RLgbPyYjg+UKoyHXvKWxD6xyowRDla8ueduk89yI4dI+C9kivpsNz8+1W43EZTzrHjp9Rjzh4L0PXBGfsFPJWbcJ3GNKmtvEvnjEnKsnWVfqntAZ9KpqxJS9eUxU3vTInBhOsgoJtclDONCFKUEHCzc+ox3eCYh+ApA2wK5SWQZWaYjCboez8jSZZ6WJebF2Uuqz1/K5k+O10eO/fb3yLhHbL+nFbLQmYpB6ocndxsLnrZvsENdGCX9Yti2FYBgq3NDYiUiE+e+7t2FE/rpiRlD7521tIMhjkOReLU8he5RyK4NZsRW5Z6vwI/VTdTnpjWbDAqg1lRxeB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0598.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 09:35:53 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Fri, 8 May 2026 09:35:53 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v3 4/5] net: stmmac: starfive: Add jhb100 SGMII
 interface
Thread-Index: AQHc3gWu27xAIUUW2EqhzN2fefZh5rYCga8AgAFeZbA=
Date: Fri, 8 May 2026 09:35:53 +0000
Message-ID: <BJXPR01MB0855A212B808321E3AD2B76EE63D2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
 <20260507094115.8355-5-minda.chen@starfivetech.com>
 <98266e3a-a23b-4283-a493-65deb8c2a1e7@lunn.ch>
In-Reply-To: <98266e3a-a23b-4283-a493-65deb8c2a1e7@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0598:EE_
x-ms-office365-filtering-correlation-id: fe92b3cb-4cf9-4f42-c82a-08deace53310
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: CkGeLYsLb14qPNGtwr7vsZCOYz2dHYkyV7p41tNhMwhxCJJ7DndxfD+twhonR+kuZVlRVotAn4NOBPgFnmuoKC8YMau4062GWdwWBgzZcea3YH9JtFe4tDXA9rSDUpffU7r41SQRDEE7fcbHpXZAyszVMYYzQexvef9KUrDOm5hI0lT2Kp9LA3Q3dJE99VX3EG+JrpEMaGZbNCmQ1Cc97HWdtiXr/IYpKb5CCL+rfx2kMbzeLOlefEpL+AbctBDgiowBbJqGVOb035oCinpqHMbXRHfoGYgdr+5mjmvrBYbnfE2Np3gKsJMUxLtUE/buj5MhmRzM9YDRK+RthSVGJUaiUmyqyI6sJ2IRyCUvWIakyxBU/jn2m86ypOrLn2i8ff9N89kZiSELGzajgiei8QrhmfeLJ0wHzn70hADIsWu+ke1McnURJh9VZ902CpH6Llr2hHQb+qRklTu/nmmG0JiCGBYI/nL5p+Ofx6oezO4tx9Ao52BSbLVXsV8UsL4df/TeAHiVX+iWhwVJeNs4ZPr6wFFSpBjXxdfUjGjDtpv4cbh/S1k8NfmfHIMB7ji4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mXb2anoXzVRFpuxUES4+FodRKPFCgrldgDUHCAyTJg6c4+hfzg26QJ9ZfFnv?=
 =?us-ascii?Q?68X05RsqTyfqAQG/ftuSvDS/opo1U8GWLokJwAXeT9N8l4EULWOHRQqnVUvc?=
 =?us-ascii?Q?OwPYmXvDmDRRytd8TdNETzypytfqgTSA6oVM7GwDeIjxMNw6VvFkfkuKCU5B?=
 =?us-ascii?Q?XMB0MWvXCOCq90KD0bprpyRPNa+7HTeZ0lDEkpmRsWwDjhyhnFfKyAtWCo5Y?=
 =?us-ascii?Q?2my9VP9C5DggusGFXaFFFxd5ZBjsk6njohVmvE8zpR/yEArJka2nX/ZCEpOE?=
 =?us-ascii?Q?irq2L9R1WkJBJzPMu7+PCLWj07FTwA2yyihyav+xC1DKMo3Gylof80MJ2evB?=
 =?us-ascii?Q?yeGfzZBK4ni13a7UP7QtDDS8Jx9Nv/yDqP63wxuUKEIMbunI+8YSGMytuxPx?=
 =?us-ascii?Q?0CHC6E2M0BkpRzUCARpt+/kIJagn0cxISZHD2PdId1+ZFiaphVKmjfbZONpt?=
 =?us-ascii?Q?NBO+i2t5PAHHFsAEYmsezd63JXpkhP4Y4Qb0qBLjgTXos3k52bWs0Q14xvTw?=
 =?us-ascii?Q?GJosriSCHibsAEIU71mXyVN+bXcsOO2LHvF/hIbFYT9B2kADWBwcNtNktbBs?=
 =?us-ascii?Q?P3Ef9pFvvLGBi+EtcpaNSEUtcfJma+bqhTveU1oM+5A2qXI+Xwt9O/yQKSFN?=
 =?us-ascii?Q?VSFEhU8c0bgvtfzWmyg4mm2PJwULNoXU7ndztJug3aUtbZrjSVoA0GpAoxbY?=
 =?us-ascii?Q?fej3GSzmdVQcJc1uwSDHOsUGUlW16kSn5gzHcM9IJfs4UL7pG73v/BawsQ79?=
 =?us-ascii?Q?eCnuFsvh+hZ7nN/ED9iA4P7DbAMVOZAUJdh0a49aRTjhbLMbAW7kWWNPynlK?=
 =?us-ascii?Q?fTfc04FDPQpoG5jiBx1Hc06hJF/gFPeoziFe/BnoLRzzZdFtt0zAccAu16Nk?=
 =?us-ascii?Q?Z80WOPbYBtoqADTFqMvetw7IVQ+PJvCso/etQCr8acu1eyfiGEqW9aJE3tKh?=
 =?us-ascii?Q?unzMjkWyE4rL3zVtrb/QyoWBqGWjHRU5FcG6mvT/+JqqEDqFud7PWF1363Nu?=
 =?us-ascii?Q?oLXPEyvOMflsMA8MEHNQ0gYskgG+p1mLGw1k+Eiy+Yq14QDIh1Z235vu1np4?=
 =?us-ascii?Q?RHOQKxKNnWD8p/qTMXzGYKqsdMQMU1m3nX5baRpQUCrXJ4eQsNYAVAmlFSUL?=
 =?us-ascii?Q?gqmbMA1OkMxXMkzVBVwh3ms1bq3tA3IsnCmNe+Yne5vYCOsSRKyWCPLbumjc?=
 =?us-ascii?Q?rCIluPHSRBc4Y/poipPkeXAtI6ylvE1PbjHuBSzn1TZUor0MPnLHcRnNaATJ?=
 =?us-ascii?Q?gmJXJR+rshuTeXVSJ4dXgILmctr2jyFY4irRVjaixQPmK5ezZN0YIykYlndH?=
 =?us-ascii?Q?sNdrgG08O7omwSx8IIRjnzG9hRqkBEGQ7MLTarbcgZXQLuDODEk6ckYQtl3t?=
 =?us-ascii?Q?c/z+vE7y/UHbV42mPdwdgcFgA+GElx2vVNEsXY9zT7MzwkpEhz4dyLYXMPdG?=
 =?us-ascii?Q?hoQm42m8kjdoXrdkdIUM2U3K//QewRPsQKIsQ/cUyYFwHKVbQ0OEjZfXFyAK?=
 =?us-ascii?Q?LwjogDUXi/6oTNQBcpcTm/gW/qp9K7GxOBbk+cBIS9uvBlgzDbuEscQfe9/8?=
 =?us-ascii?Q?RHXrbzroykcuPsd2gisPK1VJo8gntClQWWgQHPfVbCSxJbBlQtdEASq1jZsm?=
 =?us-ascii?Q?6/izr7OjbQiVPsOPKm+fGTGJyS8FR4R8lKYAYUseTK6ZCxJ+y5rvFWRDqJcy?=
 =?us-ascii?Q?fZ4Aq26z44s28eePudqbFlJnnve3mCPgRy4DRKUpJ+8eVmJbc3IMsjVlVehf?=
 =?us-ascii?Q?kka36B8zyg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92b3cb-4cf9-4f42-c82a-08deace53310
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 09:35:53.6470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPhtqMwWmuZELTvYQZVLMv1MVPh6G4ZnYVO673BwqOO9KJyH0RsbF1HbE4NThIUJvr30eJFhp/8BseFqfC7Um/32ds8huaPJ1MBoHTzfT2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0598
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
X-Rspamd-Queue-Id: 04EBE4F4516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.09 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[139.219.146.138:received];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.197];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: add header
X-Spam: Yes



> 
> > +static int stmmac_starfive_sgmii_set_clk_rate(void *bsp_priv, struct clk
> *clk_tx_i,
> > +					      phy_interface_t __maybe_unused interface,
> > +					      int speed)
> > +{
> > +	struct starfive_dwmac *dwmac = (void *)bsp_priv;
> 
> Why (void *) when it is already a void *?
> 
>     Andrew
> 
Okay, Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
