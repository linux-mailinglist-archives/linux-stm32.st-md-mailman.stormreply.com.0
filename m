Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DrOaG3HlK2opHQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 12:54:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAD678CE3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 12:54:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57D10C9AE35;
	Fri, 12 Jun 2026 10:54:40 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82BD3C9AE34
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 10:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPh8yS5jIWjyJeUulcOcyA0CxH4G9HEN7jH2OlsJcbd6Id2jzwxLg8DqdFzhjsKy81h8IrepNTd2rMIH/Km7eJHM3Jvf7cSVglU4JHq3VphycYZy1hwywQQKtK34VDJRODNnLYJHEcCHcqGXtTugAvSDBvRZW7kJZpqvUx0r6/47XaQMpqFUFn79ovJ5+uCYaKklZptAVObhD5ENYom3FOjfXhBo0Ztpo4mVe8Vu1/fFiQJnDnDI81EphFL1dKVanwLqhMKVz2mFha5zvc4E+JgknBspUcea1UpdZ0bhVyXeIdce6q+0Uhu1XMsAEA0iijlQF0dV2Q2AV0L6ooBymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLLv2nKX37ex11u/TH7G1Wgqs7JHBp7LLdigUAKTFv0=;
 b=Cor3OwvXYWR1Y15cqnZhngIYgqzUZ1nswMWnYWjA054ifyAO7WSMXJ5aY6H80iT2De+S22prPHEy/gDlSm7XX4rORKBV+b9A0WBjKndaA6ZRiQ7OzJ7mgpLPkcg24CTfSOHhHH8FTSm0ZuNlJJoXsuLdvG4zM7ZKwqO5lVx3QTr2NpZzdLQtPaF9Xte9/hLm+uciGekymplxaUABPFLkNFpb95PoH/ggipEcUT9BNMcbPvRba4AEdlKYqw8kN2tZvp4WUlhMFTYlwnY+sArh0DvWHe0cyBwrs0nXjX8/Zb8uLoCtIJXL7kdJvvzEt0l6yxse+lC8z40pgKN/oY4Piw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0768.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:24::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 10:54:33 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.21.0092.017; Fri, 12 Jun 2026 10:54:33 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v1 1/6] dt-bindings: net: dwmac: Add snps,use-ncsi
 property
Thread-Index: AQHc+Kos0bB42CjcQkupyH6AE8NcHLY3ccQAgANQGfA=
Date: Fri, 12 Jun 2026 10:54:33 +0000
Message-ID: <SHXPR01MB0863ADA1F99C2F6A82EA08F9E6182@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260610072420.64699-1-minda.chen@starfivetech.com>
 <20260610072420.64699-2-minda.chen@starfivetech.com>
 <a542aee0-cc4a-4bed-85fa-1ec6fdfe87d9@lunn.ch>
In-Reply-To: <a542aee0-cc4a-4bed-85fa-1ec6fdfe87d9@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0768:EE_
x-ms-office365-filtering-correlation-id: 977dcd9b-7b61-4a48-7a5b-08dec870fcdf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|23010399003|38070700021|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info: YXsgWOt/oxoDxxAAk0JLwF0+t2+HH2WU0rDb+QrLFOjjon18z+PrRnr8VywhvIR9CliB2mQ8I83I0PA86b+FDrRcfJ/M/2lFSZoLU+DPAZQtbqV6lVNYURmpHKdkxbzhhvtUoY/J0ySJU5QP42H2U7XIuHLTfXtap0w5hF8KKF0Wm1n19PWIYqDtW5JBs+0QganP84evh8vkkzLvRPz03+cpUnwHtrzZlB+UiRNDPfeu8spFM9bmqS15mfsuvrItXXdHjojTf7cOTugY6C+nHnxlji5jANbYVqEQ4oBZkvbZMQSMTAvRM/aDfaVegtR8tJHjOW6B2pFK8GyP3a29Jk2NMFMRYgPAnJ35ORv82vyucC/+qHf3P38zxhpNasSC/hP4jeiG6OFBIXrWW/2GYupwt8zAu9pm537ebkDR2RH+XjZSwWRO1jig9R/WNR/LcjQ7OP9jaYB8Ohvrn97WhPWP5Ug9iFUMM8QmlrPnIGJLaEh1p+f/ngMY/LJIUBmxR2j/OVIUTbM9yiFJZqPbjpIx82VqKdBY1RmI6JcSehlKv9A1y8Eo8RWoCDQ5lNBA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VFhkYS9NUEdEOFE2WjRacEt1cElpcWVzYnBnMlZ4S05QYkhkZW5tU1JzTDhu?=
 =?gb2312?B?eTA0YVUwZ1VKeWZaZFhUZkhjV05GdW8wQk15QS9JaVdyb0EwSmpzUE1malZP?=
 =?gb2312?B?NCt1NXdzMkI0ZkVQZzF0TVFYUkdDcytLOWxjNjl1emZaYUtFaVBITHQ4dnhC?=
 =?gb2312?B?b2lxbDlBaHg2dUdmYjU1b2JtV09ncXJhaGlOUS9MOVBwL1ZkTlFHSWsrdk9l?=
 =?gb2312?B?VGZRSjhEbmVSY20zamswdFhvS1M3RUIyeEt1dkVrQWxEKzJKcWNUY0hwS2Vy?=
 =?gb2312?B?VVpzUEo4Q1pXTUxxdVhpSFpNUWpwckdFN2MzSExlZWtDaXBYSzRYN2toZS9t?=
 =?gb2312?B?SUU1V0JITzIvK1lNQ3lPUlZGbkpOaWRJeFZ3MVFTRXY5V3ZsWVF4TldqbGNI?=
 =?gb2312?B?eW1DdVgrazkvNlVpd0hna0NZbXhuVFpXOEZ1b2JLclhkTjd4K3h0elNxcjE4?=
 =?gb2312?B?cU0xTlJJQkg1VXFZWkRGS3dUSm1Lc2JXTXBMSmppZW5acThGMWdHU1VXeDh4?=
 =?gb2312?B?TFo0YWZQaWxrSzZrQXJtc0dTRUpqVGEzSXZlMFFpdmtncVpkRVQ5NmRha1pL?=
 =?gb2312?B?eWZNa1M2dzBneG96RUh4eHgxYlRPeVJkVlVlN2ZQdmR6NFZYOUJZMTJTWXZz?=
 =?gb2312?B?K0MySTZkLy9SSGtLSEppaXJnU2R2dit5VnhUeTFVYTgwMjhiS2sxQ0FxMUhq?=
 =?gb2312?B?aUVUSW15UDhjT1RJeGtMMDFmSC9PRmxRaloxMGR4cU9LWWdLcEJQNlJFakJs?=
 =?gb2312?B?eGlIL1Y4VjBoSkcwQVpNbm9lRVNhb2NjQkIvQ1lnTDlKWlhndkVGRE5ZWDhG?=
 =?gb2312?B?SUdkbFN4ZHdXU29pWVFVV0syTVEyUllFSmNHZjRoYytZT0dNdkhOczZVYXhw?=
 =?gb2312?B?RFFSUkVGWmFObFRwMHhiSGNTYlhFTTJnMTh4a0VOd01md1A2OHhXZWpnYVFN?=
 =?gb2312?B?eFIrR2NPT3MyMXNIMlpDOU1FYjNMN0tLdlVsQ3gzTm4xalVKZ25zeFFHMUti?=
 =?gb2312?B?K3B4Ni83WVdMTUtRSFlvVXlpMm5EQXBheEtoWFZxMHpKQlpvTzR5Y2JCMXds?=
 =?gb2312?B?VFBhaEVnZjhnSGYxQ2Qwd0NRZ2JIU0xsTityNG0rWFRhb0VHZWxwKzlvcEp5?=
 =?gb2312?B?WlNjazFmNFNjYTYyczhwSmtZd1NVeS8rUXZXckRHOHNKWEIxSU41Y25yZ3Jt?=
 =?gb2312?B?aERSa2kwTUUydzFsNWkvNnVHeGc2bzFJT2ZtaTZYSVdyNlBlK1pjQ21XcWtI?=
 =?gb2312?B?STRaSXl5WTVMd2lEZ2U1MnBvNEVDTFB3b2ZSV2pwNGVYOWdlWkpBczEyOXBS?=
 =?gb2312?B?VTBMSi9Kd3dQWDk0WmhQUHpLZ3hiOVNEWGxZa3IwYWhnR3plYWtFbjJEU09W?=
 =?gb2312?B?Q2VpeWQ2K2FOVS8xaG5ONlM1V1Z1dFJjbk1wUGFiQzZPSGJsVFhvNFR2dVM1?=
 =?gb2312?B?NmtscHJpRUNoRU8zbnVXbkhibjY1NW13c1JVYk1uTk13RWNCWUQzcFU1cnQ5?=
 =?gb2312?B?TkpRdnVJdGJvWnNJblp4bTc0UGpkaUhHNnFrbzFRbUJSZTdlazRXSGltbURh?=
 =?gb2312?B?blg1bS9PTVEzdit4UGRlRzlBZ2I0c0I5TXVOR1lFMlY1cWVmMDdmSHJkR09V?=
 =?gb2312?B?RVFQZHVqMUVHNnhOL1JSUytaL0F2K1pMdTJuRHhYaHpHU2g5Y01xQXptRU0r?=
 =?gb2312?B?czRaNnpRcHVjWVFBaHgxaUhKZjVsbUZmanp1RytDa3lYcCtRYnEyTU1DaHJU?=
 =?gb2312?B?ekFMb1RIK2RETEpQbUhXRnhydGxuNzFacHVPUHlHajRTdmczNnl5bkVzMHl4?=
 =?gb2312?B?MVNZMUJnYmY3cGhFcTAvc1ljOFhZMHBjS1ZXQUp1Q3paUnJJTzZHNkxsWldL?=
 =?gb2312?B?MVVUOFhDSHg0cTBxYTJLeExLU1NoUTRtdk1EWEpyUjErTzJidm5hMmxneFJt?=
 =?gb2312?B?MEZHQUFwYXlhZU9Mcnl4NlJKdzJBRUpRdkJ4OE8rYnBHU0I5bktKSktEZFZD?=
 =?gb2312?B?MW8vekRuYldDMW9GbXV6dE00M2RPTVdvV0s4QUVadDV3Q3FLM010N0hjRG44?=
 =?gb2312?B?N29DMXl5Z2JPWGRNUUpRcGlkcWpheUk4UzMzY0NSZVBSV0VrZ1Z1UlZUNW4y?=
 =?gb2312?B?T1lETmhHeElZK3NZZzdhb3lnUFR0SEpTN0hEc3JOVElOOEZGYklRRFl6MWpn?=
 =?gb2312?B?Y2dTOHF0MFd3ZHhxVlZVS3FMS1ovNEtzK2dramIzSjhwdVVZSFBmR00yRFdy?=
 =?gb2312?B?MHpTd0VNbENTdWg2MWZGdFFHdjFWMFgvMlh4bUNTb2FPS0dNZXhyZFpsSHVO?=
 =?gb2312?B?bGtzeGg3RnlBV0REa1U1K2tLUHlISEYwV3F4SXNCMG9obEdpcFovUT09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 977dcd9b-7b61-4a48-7a5b-08dec870fcdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 10:54:33.7432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILSTqZP9EwVTxQUvHL3mAZuBA74XGZdKeF+LiWDt9w2YLE/sEY4pXY3VLfoOtg1yQnvpgPuq1Zps7Eu0kWwothYS2BGjLT1hv4QUxaFcD6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0768
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [Linux-stm32] =?gb2312?b?u9i4tDogW25ldC1uZXh0IHYxIDEvNl0gZHQtYmlu?=
 =?gb2312?b?ZGluZ3M6IG5ldDogZHdtYWM6IEFkZCBzbnBzLHVzZS1uY3NpIHByb3BlcnR5?=
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
X-Rspamd-Action: no action
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
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:robh+dt@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:joabreu@synopsys.com,m:conor@kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,kernel.org,lunn.ch,google.com,synopsys.com,gmail.com,st.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6CAD678CE3



> 
> On Wed, Jun 10, 2026 at 03:24:15PM +0800, Minda Chen wrote:
> > Add snps,use-ncsi dts bindings property for Synopsys designware
> 
> Is there anything SNPS specific in how NCSI is implemented? Should this be a
> generic option which any Ethernet interface can use?
> 
>      Andrew

I will remove this. NCSI actually not generic function. Now just faraday ftgmac100 support this.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
