Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNABOOdKuWnG/QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 13:36:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDF2A9FA6
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 13:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E26C87ED8;
	Tue, 17 Mar 2026 12:36:54 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC4EFC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 12:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg2/Q56uTbWQ0xXWdtNWppYbDZ/Pfa/NrbSgrxFh9PZxtUoZFeqUVfD7wyLqBEx73LEug9FJ4YK+KQSt2JKwsFVkpeCo0nUC60a1GdPgQY8YxKSdlX3pI+gix6yxK5+qgiYa46Yb2CZapRXbSCQTQj47MddT1svPTTAQWn4pBl0wAe7aZeu8nF6qcBOuKGN38MN4liYQsgh5aj9SzvaPVndhE/Pj7vYrSxc+XzaaXDcrJp5jZ4DPb7TwO6YKjU8G+XHvpOWdPXE4prcEgfvUrMqxFoq9IZHpt5HaraoubI4jNDFo4ncRL0IClN9fjEumQwi95nfSdf5qEiXlHH0MFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY4TuMMPYsUwlA0Y3IU/0c7OxQbHPqlnN2WQTDn+l0g=;
 b=VmYlikL6Uy39DFGFZkr+W5mBnCOIz+c/U3Zl3XRxhOmR7fN0VEcF/2scQSsdBssgDJgc7YYtIHAHKiACEWHcnT+Tp+MsHyjBYtUl6N1X2eXpfpKgD2RBJf/NvDGSbeddx092C6qKSw8c9k6qbD+PWO6hbruf74k0nTw6kis5vesGdR/xP4690yCkepMVPEqyu2jKZUlyzMY8b+9VX6OL3RslERdJOwgdxq+nKNMnGqSKvIsPyYom0vIG8BfFbpEj8giLrYwgrcCYcL0xDRLDyW80BgtaV7fSyf/+94jNVFdsmv1ns0HeFK6Rw1Qb4nfP5+UQSIUbUyM5p5xBzFuqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY4TuMMPYsUwlA0Y3IU/0c7OxQbHPqlnN2WQTDn+l0g=;
 b=KRAjD2hd7zIqFdSL6BWsnpbXSoAkkijpwRoxy3qgQvdHk1ch3SSLCrRnzIaybDeHTF7cLYBBLrEXtQmdeXBCdC+y4ZZhgzKAN+gEQUY16Lxx7Q0wxwMjlE85+VzhUhQqnBAa+9LZm/WzjyL2oZkAKfbREygGMdXtLqqo+qz7/so=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY4P301MB1592.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 12:36:46 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 12:36:42 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Thread-Index: AQHcs8dAGKpeXN4mC0mptZ+btcTY7rWyp1dg
Date: Tue, 17 Mar 2026 12:36:42 +0000
Message-ID: <TY7P301MB1984C5D71A81DFE5E8EC94D4D341A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
In-Reply-To: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY4P301MB1592:EE_
x-ms-office365-filtering-correlation-id: 86f4144d-71fc-4913-af7d-08de8421d827
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: ulV538HaOwr1Y18/0jiA1SQucuPZSA+v4qHHXR4si4h+vdVeYfShntnrKhzKpoR72S+oeAIZ168aYLfb8voWANrNDFoJ6HK+1sGs51u1SgpFH2Ieo3AWNFbcas1YRVDg2DoqXaxjmjqGb3+OizSDtaGhtMoP/PUyITPPj8I6b8X5nCErOE/iy2L0V8xO1eETVaBll0qfLlYbvXB6oL7E50nxYwcv3851mjaJUCgxEQrdOzVYNGj16EqbM3tzVcRy9tGIqMJORy+s/XN5kwG+Ar1ngUBrVNgw37hk0OvaHZZbbdwdD09VPuktIB7SOlz33y+eGYibkuScl1bM2Ttdl/aTkCzeYZDQ0eG0q7GRtX4moitJ7L1hSetx67DiIC6vW2L0/dETp6la4H1S/bhaV0/jvse540c0ee6YzT8G85xGHpUb5QuqUaVT9S/HBWCidZHSgEgNtFx9xcMb23yu8RFq1u9p4uXMli4GNtksCKdtCLvSPRd4uJ/7/sYwMANZ3lkzz5d5eAEGKnPreKxko2JAiDz1QrL8Z9E/kNckbz2wTihMgDvyMyZLh3HqeYu53UCPKwF9X7+8wxclTKnEZECdM5cddBN5WgZdYBf9z5cgiIVFtaV58QH7y9Pg/dW6Dgel584BdV0wiMbqIh3scKCEcQMulbQTV5gQ2/6aNp4ps/ed7zlTfPr1xV4CV6A3NFyC5eT9JuRlEe2MkxNNVYjFm3AQrxOO7OqFU1C2vUns/3gEbvOZ8vq6lYKazYj5AsbWJ9d5X8bgJn/J3oQDXu95jX/XrBJQyJ6tcu3oQkU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1JZbjhvRGk0VlBkVmVXanY5a1dmMkkyMnArdkR6NmlBbnRlWnZjdFlPQzlW?=
 =?utf-8?B?bkttK1loZDNhcjlKUFRYZHRScXJmdnVweXZvb0szYWkrTlViNUNBOU9lMDZz?=
 =?utf-8?B?Q1VCa1IvMzd1N1Zieit6Yk1udTFwQWJOeUh6amt5eEpocFluNStvZnVpT2tZ?=
 =?utf-8?B?N21xSVFLS0tzVUVXL0N1R3JpWmloSUt5c1RqMHMrc2dLeGIxTnZSeS9mOG1O?=
 =?utf-8?B?SkZ1Rnl1MkdPdDdNWG44QlFsbExHYTdpZVQyWVZSa1ViV2tsNGVoVDJBZG4v?=
 =?utf-8?B?N3N0QTBjQWFhNGxzUSsycjB6UUFSWWhWcmVTNXNDLzdsdEZGcVU0Z2I3SHZ5?=
 =?utf-8?B?OUVqTFo5c3oyMzh5YmVFQW1VOXAyR1NFZTBUM3VmcHRYWEhuUVpmQXQvaHBV?=
 =?utf-8?B?TDQ1RDVtVnZCVDYyZkVoSFBYVmwwSmt6T3RTNFNyOFY3Y0Q4SUxGWThRRDNr?=
 =?utf-8?B?aXdRa3NTZmVHWmpSYWdVR3ZNNFJBSFFYSzJqa3h5c2gzZEMrTjZxeldBOGpG?=
 =?utf-8?B?aGpwQ1ExcUJxSUhnR2pWMHlSSWU0ZTl6aWovRGxoVWl4SENsc3dVN1FmbFF6?=
 =?utf-8?B?U1Bmckc2Zjd0STNaOFhTSEhOMTNnNys4c3dJbXJWY3lFT3I5bGkyM3l6Wk53?=
 =?utf-8?B?OVlyMDFXY05TUk5rUUJWNXVIaUNibEUvaHI5RWJ2a3J0WnljYTQveEpiMHF4?=
 =?utf-8?B?aXQ3SmdUc2cxcEtxVEpveUgzSGZHUmg1SkQ5bnlUUTlld1ZTdVhwSk9tcUlU?=
 =?utf-8?B?TndHU2FIY3IyZTNRMm1vbzlESGFVV1U5UW1zV2ROZmZmZXQybjdFb2pCYks3?=
 =?utf-8?B?SEFtaDEvYkxtUGFnaENiNWE3dGlXNkpWWkhTaHFacmUxVTJMZ0ZiMm1jczZP?=
 =?utf-8?B?QllXaWUyUXMwL2lMUzZOSCtEK0w2NUI4L2pYUlloMnRadlpaTmV2Sm5SQWN1?=
 =?utf-8?B?SStZeEZEdWo2Q1dmTjRLa0Q2OUF1ZWl6VlFhdDlQUS9wdXF0czBmc2ZTZ0F5?=
 =?utf-8?B?OHF5d3hqTllEdVMxangwbG5US05peUduYzBBYWRBTVB2SWQveFVTSnBGWHFr?=
 =?utf-8?B?aS9pUFF6NlpxaFZSc0xKVmJTQlJSTEM3MVI3elpLNzY0RkNtdXNVNVhubVNi?=
 =?utf-8?B?Tm56bjc5QnRsdlRQRHA2bWZGQ3VMQnErYkRZdkVQeWZWRHhNQzNMRm1vQVpM?=
 =?utf-8?B?MlZUOGpXUExwOUx1d1dXd214UUJ5YUlTZXpxbEtEMnNMcDFHQ2l5UzlkQnAx?=
 =?utf-8?B?dGhXbHlKTk5CRGhLOEx2R2M2NlZmQ1JhM2JJRVdrOFVFd2hUVXpBOWNUMTk5?=
 =?utf-8?B?KzBpbUlSSEI5YUNHR1VoaHBwU0ZOUktPblBOSVVya3NOeEUvZVVIa2lBTFJs?=
 =?utf-8?B?QjhRWTdvT2RKQ2Fqb1kzRUVEaFRjWHhzZzNuZmNQM0VBdXIzZFpuY1JFQzhV?=
 =?utf-8?B?RW5aUCt2SXUrMWlLeVZxK0o5OE1aT1lQeVQ1d2szaTJmVEs2UFczVVBUVUhG?=
 =?utf-8?B?ZFc0STdJb0NVOHRHNzNHc3I0b01xYkIvZjkyVkNWREphd3NFb1NxK0dQajJi?=
 =?utf-8?B?by9VZUlwbnA1Wk9aeHB4eGFzbWJOVUJIRm8yQ1A2WnZudERiNHRCSS92V0Rr?=
 =?utf-8?B?bU15K3M3ZXhMZnRxSUtBUXpzM2Q1MkhPazN6Rkc3dEkvY0pCeGxkWENQZE5t?=
 =?utf-8?B?ZTh3eEV6Wmh0ZWh2dDBPTmd3YVY1WjFYRUVoWlUyQXA4aTJZTVExTndzMUJy?=
 =?utf-8?B?b0lIV3hONXV0ckllRVVMY1lGYlY1ZGNiMnh2WEVQTS9QWUYyVDMzNlMvRVBs?=
 =?utf-8?B?UVNzc0hTQW1uMUtveFZXdkRoZmlpUnA1MmxidDhwR0ZHZ3cvR3JCZ2lsanZZ?=
 =?utf-8?B?ckMwTXRsS1drRDNyK01CRWgwbkhTYnNZSkJoSHFMaVBzaERwbVJQOFQxdURQ?=
 =?utf-8?B?NFp0SEdtaHlJVlVFTTRkdXM0Q3NSVStlNzlRdlVwSk5iWStTQXFqUnN2S2J3?=
 =?utf-8?B?cWxSZEFIZG5xdWJob0d5V0ZXZFZGOUU3VmNJcjNBLzUvYnVYN29MaVlIN2F2?=
 =?utf-8?B?dUdua2pGRFZCKzVnZTJrL2hrbTlGbXhqcWF6enUyejJJM3BHbFdVbkVSNTJO?=
 =?utf-8?B?WEc5LzR0RndUeVlMMmpjSnlxVmh2cGRKWjlSS1lRU2ZnVjhra3pacFd5Z0dT?=
 =?utf-8?B?bnF5bTZNMjhCN3dmamNQOGxRbmNRNnZiV0IrWjlyZWlHZWJPanFwcFFNMFpN?=
 =?utf-8?B?ejVrSHBjVGdnWnljMDBuV1hEWVJhWWFKTlZsYTZLYlI1OHhrYlJjVnkvK3lh?=
 =?utf-8?B?RGRPOHE1ZzlTSzBrd0Q3dFRiSkVtbnJDc1BIUDJVU3h5MTFRZ3NRYjVRUHF1?=
 =?utf-8?Q?MWrw/YYl6FwRx5oI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f4144d-71fc-4913-af7d-08de8421d827
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 12:36:42.8358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETnjXpCh6rFcv6kR9YSQS4Y2T/HFrz+bE+VZPgyp0ZSbJoI0YVvn9Qk5VlKKLgc8tEwwS4ZtgwjoeYBmVHlUxndtjb9C6hFwFI64xs3PbFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1592
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: skip VLAN restore when VLAN
 hash ops are missing
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
	R_DKIM_REJECT(1.00)[renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:michal.piekos@mmpsystems.pl,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[mmpsystems.pl,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.672];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A6FDF2A9FA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Check presence of VLAN hash ops before stmmac_vlan_update().
> 
> Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This patch fixes a noisy "Failed to restore VLANs" message on platforms
> where stmmac VLAN hash ops are not implemented.
> stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> VLAN hash ops presence which results in -EINVAL.
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c..bc09439ec00b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6869,6 +6869,9 @@ static int stmmac_vlan_restore(struct stmmac_priv
> *priv)
>         if (priv->hw->num_vlan)
>                 stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
> 
> +       if (!priv->hw->vlan || !priv->hw->vlan->update_vlan_hash)
> +               return 0;
> +

The stmmac_restore_hw_vlan_rx_fltr() call above also goes through the
priv->hw->vlan pointer, so maybe for consistency, the check for empty
VLAN ops should be made at the top of the function.

Another alternative would be to replace the NETIF_F_VLAN_FEATURES check
at the top of stmmac_vlan_update() function to check if VLAN HW filtering
is supported instead (NETIF_F_HW_VLAN_CTAG_FILTER and
NETIF_F_HW_VLAN_STAG_FILTER).

The restore only deals with the HW filters anyway and the vlan ops are
always defined in that case (stmmac_vlan_rx_add_vid() and
stmmac_vlan_rx_kill_vid() rely on this being true as well, as they also
call stmmac_vlan_update() unconditionally).

Ovidiu

>         ret = stmmac_vlan_update(priv, priv->num_double_vlans);
>         if (ret)
>                 netdev_err(priv->dev, "Failed to restore VLANs\n");
> 
> ---
> base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
> change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> 
> Best regards,
> --
> Michal Piekos <michal.piekos@mmpsystems.pl>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
