Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOd+HVHpxGkz5AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 09:07:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E5330DC4
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 09:07:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD94DC8F278;
	Thu, 26 Mar 2026 08:07:43 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE1ACC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 08:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgtqTtWy3fIRKYCFuQselsZnImoFRA7VWvPczPElG39nf9eeOZ+kTUh6AAIOKapAJ4eKYnUV2l2JguQz2lCTtheW3Xya+cOrvxxp1dvJIwnraPriYjn9iOY9aS2mF9JzpcOCnCbhdmUNA/Tjpg5xtTwPflldoBEx0fb0h+RTyuM2u56/1ffuTMLgitYF9vMBKFWBiXlg/dw8I4lDTidCfqgD4aVKNTJodvYBf266S7cKyzBuloQvOwnOIRMscPCyXjjVoigfS8oxaL6kv9dWFKTxRas6Xg5uyQu3o9dGYr6asErc7IpEb4m/OcO5/3uCpZK7xEtA1uHVPDYy+VGckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvqnp3SAdU+6li9uD3Y8m1l2/ghSG8ZKB/pr5v0iCRI=;
 b=lF4mHC6hBCAHBZiQJLVv1AbjBANQhs0S97ndEn40L6qtQlVzaXSw1ZrVY+Il03nU+YWAYJo6gewZKRzte13GC/bHQa5NlnOh/H7Y263XPz2VmPpKzaqowfMkU2svYUnUvCHEME/SD7yRSweEBQy0LkXB0Q7kI2bwl7JMA9C6zKPdyV+5IgQe1GCyHnQfTrmo/+gQgKIEef/rYH2Wy2fjIyNGnjLV+7gBC7qmcnE2l82ED2OKwdKlh3OG4QRLPx4dOly+Zt/wHnaUy0Wjwirzh0VUrK28hhgK4ljXkvL3Ugd4XmVT3VLRikKtAgWqPQoTI0iEPL5QtM3CkKDj3b7L/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvqnp3SAdU+6li9uD3Y8m1l2/ghSG8ZKB/pr5v0iCRI=;
 b=ikQZrabZZSKmxYuUre1WlwTp6v6zLTiyNeb8IJufSOhnJcjX/QR+bqGTze+Rs766bweoRkryY84ZkpA6ekv7xdGyuXpHypP2IRR/QBkrrTrCcmAuyQ+LMNjy81Pm+UnKGcifM0y/4Dvy+EiJ41N+LpMC28o3sj1rJsyDh015tAY=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY4P301MB1954.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:389::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:07:37 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 08:07:33 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Michal Piekos
 <michal.piekos@mmpsystems.pl>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Thread-Index: AQHcuPUBPuJr+fwUwEyxnX/LFVXhRLXAeDEAgAADDtA=
Date: Thu, 26 Mar 2026 08:07:33 +0000
Message-ID: <TY7P301MB198407F8C0280B991334304ED356A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
 <abb1c779-b306-42f8-b2b1-aa56bfcebe1b@bootlin.com>
In-Reply-To: <abb1c779-b306-42f8-b2b1-aa56bfcebe1b@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY4P301MB1954:EE_
x-ms-office365-filtering-correlation-id: b488d52f-727e-4483-b000-08de8b0ebc19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: OLzN65O/RxOA0DZqYZLoAJyyphFoqvP0GtD587zZKKqrs+rlYa/QPC0QC5C4S7n+/rz425OSmeqb9ZboAYS5onGwxDpOTJZK9zLhUeF3yn+3LGjvrIg112ivG3PUVG8jmCuR1iBGgscWzhbv29MCL0fp6B80yZj4jOYDN0XoaXWG5HGcst4/afldg0tzQGY/SZqPoek8YbmFutJ8cIM+l9mLiZ0C/+xd48YMa6DBxgrT5RpgxRzXH3wtewGZQI2U73lNpSShHQGtOghmzLGp+EohfTnRNwPfXBapCUBRRx2jjfarW+wo0dNJURXPTZsZqz/L/momBYK7fuvEdh8Ux5fFtOoV0yzu9e+f65xDYO8cVeCX4hneFkItTgLjflqE7t/Y4oBESxwv149ZIgxOL/78q9eAon1k1a1xH/1teqofIVmkq9EOPy4ev58oZnuVJPRugm5kJNGRS3hWW5U1MezVKekNpfBvkpMHw03zqzaSa7ytAjUi4P+Jw+AAgmfEQrDwVbZwn1BjzsLQrJQj/cMQ/2wfXfC1nGnQ5Lfzf5B9uNDFiWUhCekinQA8Cm0So4EddR2agYrgdvSchafRML+K7btJ9HrFgP+QmFlRJ0lFZZreeMlsa7AuHvfig6Aq3G3HsQhHRg55nCMT6+SJ1ypj7ZDBt+w9YLCPvaLTesj1bR2QUGF09fgJ5cLtTNa2/Sg8CzpXGSxntTORMrx2dLCex6lSILTbd9uwv7sPbzEj0P8jR0id6Qq712e3aptvbnIyvhJlDh1QmX+RR/HUEzGXWOvI6T9KQZcq77hIx0k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1diM1RVTWlGTEtRcVNYZlpKQTVnSlpMOGZtWjhiNXZrT3NQR2xrdFJsSnB6?=
 =?utf-8?B?MkgrelFmQVlheTBuREdiZnVpVklsQzdtWWordWwxZFJHa3FxQ1NvNWJTY2Vk?=
 =?utf-8?B?eXVhQWxMZlJHQ3dEZnQ5M01kcXhOcW92ME1qR0tlUUpkTWkyVk9Pd0J6VThm?=
 =?utf-8?B?V2JCZUxTeUVIRDRtL3pmdWtaVklFWnpjYzVSY01MR0RScXExcW5Mby9pbVVW?=
 =?utf-8?B?NWhDbXFER3B5ampyVFlJbzZnb0UvN3FuajhHbUp2VzJBUlF0UE5VYnlBbDJD?=
 =?utf-8?B?cGJXQWF0MGdpSUQ3Q0FVMXRwUFNzRVJPdkJ0RVJLdzZxZmtidC90VHpDajM2?=
 =?utf-8?B?aHo5MlM0d0s0R1ArdndWK2NnR0xja2l0RytwQk5sdmlTSktQRzAyZmdLN0hI?=
 =?utf-8?B?ck1HNUh6czVodXNTdm1hZ3RZa2hXZmZqaTVkNXBHL1J3VU9VY1F1OVAwLzh0?=
 =?utf-8?B?VEFYaUlwL3ZjWVhER1E5cCtlbGJrZ0x2L09XakJDMGYxcnA2QitRbUpMZHI4?=
 =?utf-8?B?dEtYMGs2bnRpKzkwMnBROUNST2tXYkVYaCs5N3BxWmlwU2RySXg2RTJaUytz?=
 =?utf-8?B?MnFOT1AxSEhsclpqS1l1VEhsQ1RqemlRd2JWandiYVZCTCtHcDV3V3JpV0xu?=
 =?utf-8?B?VnVOczduTXoxL0lMbFNHYjQ0UVVkTHhFSzVIYmRHTGlkZisrQ2tyUTdNRStL?=
 =?utf-8?B?YnNlVDFPR0JwYk04N3JoSGhqYmRqakVHUnF5QWNYVEJIVXpnbnYrdncvc0JS?=
 =?utf-8?B?anl0ejE1eDN3aDUyZThDRFFzSk92ZlZRUHZreHRod05HSjVROGJ0RXI1Vldj?=
 =?utf-8?B?MTlydFhLWUorUkFqMDk2ZVpCb0lNSWpraXhPSzBGSlpNVWR2M2VMeklJN1Zj?=
 =?utf-8?B?VXNqRFNKczZtYWp6SzcvNUdFazNWalZDYS9NZlk0b29XcWlxSlVuVUdCV1Q3?=
 =?utf-8?B?OWM4eGgxNlJCWkNJcHpXeHNRNmlPcjhqQ0ZBWE5FcnFnSTRTMU00a09TWUtU?=
 =?utf-8?B?QjNGN29YZElaK1lvY0pLWUNEcWNxUDZ5bkYxbkljeW5EWHFYRi9tc3BTcGhk?=
 =?utf-8?B?OGdRNitOVkl6OC8rbnM2Nlg2Z0N0MS9ja0xYdlBGN3orNGNISnptMXZyT3FG?=
 =?utf-8?B?OU03Q0ZwNlZiY2pmTnpvb1hvbmlaZ0lVWW5Sa0F0L3A0Sld0aXlJY3dCUnd4?=
 =?utf-8?B?RUhQT3VscXFQb3VjREU4OWxFRUFUeXhEdENTb1FXOHZVNktKODFtcHE5RlZH?=
 =?utf-8?B?emhrR2V2dm55dld6cHgyWTc2S0xMdm1nNEFhV0ZUaU9TeGFLUGpQYmpBUSti?=
 =?utf-8?B?OUZRYnUzVHpCcjE5ZWJRbS9CRE00UkpTM3FDUnV2UndkRVNtMVJmUWZ2WGRM?=
 =?utf-8?B?ZCtrQ1U4S1hzTzVPdjhWOHNLM0pmUlIzbklFMDlFcDdBWWpTVGFOV3d1NlYr?=
 =?utf-8?B?RWxQTGxIK0xKNWVjcjhsQU9xMjBxR28vZ3ZOb2QzTWhqK01MQVdzdGx3WTYx?=
 =?utf-8?B?UDZOaUZRWHk2ZGtyUHJSNEhGT2hkenI5RkE5N0o0aXY4LzV1WEw1SzEvL0Vr?=
 =?utf-8?B?VzNUbkd4bDZXcUV0SEdKREZPRCsyTGNjNHlpUm1oRlpBblBBVHlwY3pMREFO?=
 =?utf-8?B?cGpWM0MrdUJSbG16UlhrNEowN3YwQ2xRa2tITDRkaWMza2VEbzg5L2tOR094?=
 =?utf-8?B?WGdYLzFmdzBhZGNZYVhHZzhLanVWaXB3VTBocWNrNTJZYnVBS2lSSVlDNkRt?=
 =?utf-8?B?L3BkOGlGMStzUlVUQUJpQWRWa1ZzN0tFSmR2NSszYldyRVVLNm1ZMEpwK2hC?=
 =?utf-8?B?bmpESitQQndzTFg5WnBkbk02MlB4YXdmNHBVY3pKVW5SM21CcDJJUVduS3hM?=
 =?utf-8?B?QndNZkxmRVdMbC9xMzVDLzRNeDJpMjR5d1VPeExsdzA1SXFlOWpqQng5aXpj?=
 =?utf-8?B?N2hHNlNqMmwvMzZzT0Q0SzRjVUZYbTAvQTFHd1hFZkIxUTJCeVJ3bkRMZk15?=
 =?utf-8?B?WGxhblR4eUJsU3FzNEhSVkZaUUkyL25QU29USnQ0M3ZnUnRnanBlRWFMVGpE?=
 =?utf-8?B?RVVlSkpzM0tnbWNjTDllR1M2YmcyUHpJaTJhbmNnVEJscTlwb3BxdFRkb2Y5?=
 =?utf-8?B?d29KYkl1Um1pZFVrdTFma1gwUWNwdjNUME9ndS9NTDlNNERqWTlUR2QvaENp?=
 =?utf-8?B?aFRUbm1yZVpQZEFIeVBVbXhVVDkwSitTK0pKZzZrb2h3eER4dVBTdjB2eEhL?=
 =?utf-8?B?S2RrL3VReE1LWEphOTdCdDlUM3hnNjlkMTBUWUlvRTNNVCs1c0dleVFsSU9m?=
 =?utf-8?B?eVZ3K3BkM0s3dW84ZXREMGhZZXBFZW52L2N3a01TT0pMbCt0cUs4blRVZ1FP?=
 =?utf-8?Q?0P6vJ9Xricfaxjmo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b488d52f-727e-4483-b000-08de8b0ebc19
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 08:07:33.4742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYAxdY51zlIlorSfpU87CPkO7bjXUWcKcLPj+496MOGsnRbnpQtiNkg70B/vJAUJdZzTZ7BJUc65pU/BzlJkqSC0PiAgOvt2kb6/zLtX0CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1954
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: skip VLAN restore when
 VLAN hash ops are missing
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[renesas.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[bootlin.com,mmpsystems.pl,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:michal.piekos@mmpsystems.pl,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.737];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,mmpsystems.pl:email,stormreply.com:email,stormreply.com:url,TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 390E5330DC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> 
> Hi,
> 
> On 21/03/2026 06:38, Michal Piekos wrote:
> > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> >
> > Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> >
> > Tested on Orange Pi Zero 3.
> >
> > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > where stmmac VLAN hash ops are not implemented.
> > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > VLAN hash ops presence which results in -EINVAL.
> 
> I've been seeing the same message on socfpga. My two cents on that is
> that this error messages doesn't bring anything to the table anyways.
> 
> As Russell explains, it's either triggered when the vlan op isn't
> implemented (the stmmac callback macro stuff turns that into a -EINVAL),
> or when some capabilities arent present. All in all, it's always stuff
> that users can't really do anything about, as it's HW limitations, I
> think we can simply discard this message.
> 
> Also, nothing actually checks what stmmac_vlan_restore() returns, so we
> might as well return void ?
> 

I think this is the best solution until the VLAN capabilities handling is
cleaned up.

Michal, please let me know if you will be handling this in v3 or I should
send a fix for it.

Thanks,
Ovidiu

> Maxime
> 
> > ---
> > Changes in v2:
> > - Replace check for hash ops with check for HW FILTER flags
> > - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-
> 1-4fc6c3e2115f@mmpsystems.pl
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6827c99bde8c..cfc0ce9cec9c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv
> *priv)
> >  {
> >  	int ret;
> >
> > -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> > +	if (!(priv->dev->features &
> > +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
> >  		return 0;
> >
> >  	if (priv->hw->num_vlan)
> >
> > ---
> > base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
> > change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> >
> > Best regards,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
