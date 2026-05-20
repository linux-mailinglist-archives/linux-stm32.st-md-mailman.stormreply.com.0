Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDqmL0ZgDWquwgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 09:18:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F8588CDF
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 09:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CCD3C87ED1;
	Wed, 20 May 2026 07:18:30 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn
 [139.219.146.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AF8C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adfXoRakl4+ua9TEhRAnGBlbCxa8llx9ycRxyfIqTqFHIV7xMCJewPFqYKjgS07NLdA0GWjwRpM3rsQ/qVz1XkZCDU+NS6gLk2vgkewcgM8UmedNVrp9OXXM3xoScMfwcLNw8AtR65rVpR28xRK0Ao69OC9568AvY98uiiBHMkLS0ajk1ZLDpxHQSdF2H6alpsX0sfSXVG2og0zfTKwi13218u2wZzuBY23VfQ417ewoxp/XIXf9oAE0PyBEmk4OVr6QUS/Kb3oNlM9fbVc/1nDwEshzHjMvo6+0wugmEJW+tHye9BBFhcNoQzdTxOBB1OuW+6W0tdTDE5bu1Uk99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBYwTIkg7Rl5r0EYU1wwfTNBwZ8E/1c9Rrr0lpOOcJw=;
 b=m+6G54rpofBJUPSs/EBQBR7sc/eGtvT28yjcrNMCp86CiydgCKkyB8s7Zr97/NiZJI5QucsQvEJnI5b2wiChRUG/LQSBoRg8pUTfFb9EOhRKoCOXWrHDkgnfWZ+R7opcFgR3f9jiLv1YysDSOvgg9YHnCGGNP47jjtDiXa/mVAVFrXBZwVjz/7UOKd0sTedspou9ZIUO/qtoc3eORKodOiiArTsuZcUbFKyyvba52hAWxJplcqZ/DptiRmCDAReq5hDCUKsfL9+/Dl0cRAcpC19HkhYZK3YZrJcyasEQlH5DDUPDCwj4DZhGlQGDw/nDrkVrwHU/ZvRUzNaRFWQ+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 07:18:22 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.20.9891.021; Wed, 20 May 2026 07:18:22 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Thread-Topic: [net-next v4 3/5] dt-bindings: net: starfive,jh7110-dwmac: Add
 jhb100 sgmii rx clk
Thread-Index: AQHc53hT59M+uKUzr0qKiLTpANMLHLYWff6AgAAEvlA=
Date: Wed, 20 May 2026 07:18:22 +0000
Message-ID: <SHXPR01MB086346EAB66ACAFAE228E290E6012@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260519101436.111476-1-minda.chen@starfivetech.com>
 <20260519101436.111476-4-minda.chen@starfivetech.com>
 <20260520-acrid-kickass-kittiwake-6d4247@quoll>
In-Reply-To: <20260520-acrid-kickass-kittiwake-6d4247@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
x-ms-office365-filtering-correlation-id: 77a6f82c-33af-4eb8-cdcb-08deb63ff9dc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|56012099003|18002099003|3023799007|4143699003;
x-microsoft-antispam-message-info: hoGusLfIeh7bK3rl/T6DqKOQcNuAGIPHOUaIPZ0yK8ywTnaxG/xONYJwXP94Md78KDUadKZ8uc36LZiDlB33esvsgB0x3HNtmyox7bEUKa7fH7ep3UfoQYyph2a/JPyAnS5xr1ghJnEuhShTGUnmcjuvJ1yaA7McehTQqPkH0XEVxm/uboYh+R+KNq7wgLcYJmRZsPhRMrdrhcl0n0Er06OJTCUwYPz5Rq1R6EmLeg39KN+VToLhrQ1YErqiTzhz332iJ7r4miS3j5TBHvwH7Gi/ypo8Ek59UhrinrcXOmIW7UBz5UTak428jXchc3UT/DFy51Io3IVbbSZi1sTbWdudeYL26GomiRkYYL+8sWGRebTIWdjiwhsnZw8xw5/Oi5l00t+Ehx+tfqJojlNqd8nfMvUt4GsP5ObIolkq0L2ZGV6jX/TffDujfavJj6/ooab12tVnBD78/7HxnNS/kRQ2ZTQOxPr5o+l6q5IBHkSVD6vtnKau/0/EJz+G9ZcSGFiaVQzc06KRySZl+ZkwFSEwVKe/B/ifUiI9XjMxegsIGikoDNRfJ2SZp85o0ToG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHh3ZkpxamlKL3I1eDZtWkZ3S05hNWQxNkE1RFE4WjdqRWtrb1hVeDlBUjM4?=
 =?utf-8?B?ai9SNG1JWklnbnVhNGtIY1NVdVNnaTRPZHZjRzB6VEUza1Z2dExFZkk1d0FC?=
 =?utf-8?B?aEZUSFhtRkd3dzlKUWNTemlXMXozRGlZQktlTDJ2SHlqbWZzT1M4azNhSXNQ?=
 =?utf-8?B?N0ZXZVdUMlBQamNXYXNiUXVBRDc0K3dxaVl1c21GYkxGdDR3cGV2bFpPY25x?=
 =?utf-8?B?bDJ3TmFnUm4zc29JWk1wbXg0YjgzU0FBWmMzMzJ3RjhsTm5MNndIdllRUFJZ?=
 =?utf-8?B?cFZpQ3Y1bnh5L1VZN2U1WVR3cVhDb2VmK1NiSG1jOGc4MWZpUWltQzNkbUxH?=
 =?utf-8?B?VUlqbjZtRTROdmNSZkxmbEVFT050cDdWTkt4a3lreEpFejNVb0o4UTdiZHRY?=
 =?utf-8?B?RGZ3RG1FL3ZRbGREREdEd1k4a2RWbHpnaVR1eFBHcWxuVnNmd0JhZS9GSUpF?=
 =?utf-8?B?RGk0M2Y5ZzQxUjNNR25qT2lNa0dEODdIUmZmNUVRU1FDOEFoOHdtZWRrMWpj?=
 =?utf-8?B?eEpIUUdQZ25WWldKeVdrRno5aWwvRlFOdExybExxeW82UVJaNm1nblJ2M1lp?=
 =?utf-8?B?ZXY4RVAzcGxKN3JuNlZMK2xSRUwweXJBYXdPRHRRclVDdnVKR3hpNzcyWk5O?=
 =?utf-8?B?MWNvVjBqWEpCZDFFN0tLOEZZcnIrZUFocCtnYzJjL2ROKzRTZGhPeDlTSEJU?=
 =?utf-8?B?NjFWVHlSaFRWVGRsVnpZeVhVNzN0RndmWDg1TjJiNEFqTytpWWVYSjJyTVdM?=
 =?utf-8?B?Q1BxT25lek9senZzSDlBcjVqN2Q1NzBBQnVHMlI5RVpNZTI4aUNpc3VsQzZC?=
 =?utf-8?B?QUJTTkZQMnZLbVpsVEJhVWp1VjRBc3BFdzlXcEZyK1F3UyszM3RFUS9VZ0Nz?=
 =?utf-8?B?RDlBZ3lzcVZzWFN3RWxNUmFUQTVpV09ZOWEyWlhhMXNWOUJrNmVtREJKNlVT?=
 =?utf-8?B?QUluWnNQZWdnc01yMklYa0NPZFVPNTNMYm9OazhCTS9yTENaVW9VdlAvelht?=
 =?utf-8?B?YW56MHhjbXJrQW43Z2lsV3ArRTJ3L2Q0WWwxL3cvay9EdElsV2QrOHJWOGo4?=
 =?utf-8?B?NW9iZFBmenVrc2tySWM3NERGWmZoN3VxbGU5eWpHNHhLSDgwQkNqc0k4S3Bt?=
 =?utf-8?B?VGZBT1lScDN1cEovYXNXQUtTQmlXODBvajY3VEJKNTRZeEJtMkFidTlYV3A1?=
 =?utf-8?B?OWk5NXlpMjhSa0tFcHJOOVVSV0x6YW1CaWVnOUVibng0NFpOOUFiZThTVUFQ?=
 =?utf-8?B?SGNyWU0zM09rekpocjhaNkZzc3ZMbVZENDRlWWthcERjN2UyMFhlUDErQ2wx?=
 =?utf-8?B?MFE1M3phRHNzZEl2VzlNeUtZVVRISkNxWDk1YjhtMTdqc2wvYmEyVGpDVGZ3?=
 =?utf-8?B?R1NDWGc5ZlJ5TytIMVFJWTdKaThOcHJ1OVUvRGwxa3plTUNwTmZLVFMxemE2?=
 =?utf-8?B?M080RklZNDF4UFpCSW1jYjJmWm5lRkhSb0NpL3Y5cGhpbndhb2lUc01VR3Fx?=
 =?utf-8?B?S1kyRXRCYlErMzZaanA2ZCtXbS9VZno2NENVY0JaRGszTEQrUTMwYnErTjdm?=
 =?utf-8?B?anAxUlBiaHFVYld4MWl5ZmVqdERBOXg5ZG1aYnlxMFl3S1NxTHBHSjR0bUVF?=
 =?utf-8?B?TE9KNEx0bjArNHRaZU9CbEhmVUNURGxSb3ZTWFo3V0NwUmR0RHlZZ1dMNGV4?=
 =?utf-8?B?OGRiSnpFMHlleGVsMFVvQ1h6QnFmKzhlZGNEbWJVWUxJNmc0cnZBZ29jcXNw?=
 =?utf-8?B?Q0YxUGRCbmJiYmNRanQwUG02U3hmUURIQkwzdFZtbEd3d0pUdWpvdDRWZGlM?=
 =?utf-8?B?bHkyaVBsTkdYbCsrSkg4SElDVVJjQ3hiWG5tQ3M0SmtGckpXK0tPUEtQaGZ5?=
 =?utf-8?B?ZGJ5NDhYRHEzVWFJWDVuZjJUdDFjRWErV3hDVFNYWVIwVWJCb3RmUzNpK3Bx?=
 =?utf-8?B?MUtvOS94TDdqdlF2WFF6cmg4aVE1cFFUUTJhRWRBQ0puK1diWkg3ZUI1UE1p?=
 =?utf-8?B?ajlzcDJGanlNdGd0VVh0RUpvdE4rN1pJTGcwZ0NnbHZuM1lzNTNOZ3dZWEs3?=
 =?utf-8?B?NVVVVFN2SDRxQ0w3UGFLT0ZxUUJzaFE5bDZlQlFoUmRNNDNiQXR5djIxdGEz?=
 =?utf-8?B?UU04cGdCVTBoUWV1RS9Qa3Z6YTE1RldReWRUN3FnLzd2QlAwNHNjOXowZkRY?=
 =?utf-8?B?TGhLVm9PL0dmdkJKbE5qWVM0WDdGQzFVQVJ5NXRUQkpGSmVzeW9kclg4MTVj?=
 =?utf-8?B?RDBRM1JpQ0tPUndZNjFmcTRYNUszWUo3U3ArUlVCdmJqWEhwaU5WVG9MUXQx?=
 =?utf-8?B?YTFvcU9YbUJ5a1pvYis0UGNMclhlRnVPM1hEZjJaNnJ6L1p1cyt2UT09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a6f82c-33af-4eb8-cdcb-08deb63ff9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 07:18:22.3909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFbaBn3+/kBRV+RTYgiwzxnmJV+2Sl+4jPHK/EgxYE2r+BEb8716LW3BEvqvUAh10/jtZSyfQI5AGnLsNp2C69zf5MltnEkp0w4eC9G9Skg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893
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
Subject: Re: [Linux-stm32] [net-next v4 3/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add jhb100 sgmii rx clk
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
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 684F8588CDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> 
> On Tue, May 19, 2026 at 06:14:34PM +0800, Minda Chen wrote:
> > jhb100 SGMII interface tx/rx mac clock is split and require to set
> > clock rate in 10M/100M/1000M speed. So dts need to add a new rx clock
> > in code, dts and dt binding doc.
> > So in jhb100 SGMII interface contain 6 clocks, RMII/RGMII interface
> > still contail 5 clocks.
> 
> If this is for jhb100, why isn't this part of previous patch?
> 
> Does this need constraints per variant of the device?
> 
> Best regards,
> Krzysztof

Okay. I will merge this to patch2. 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
