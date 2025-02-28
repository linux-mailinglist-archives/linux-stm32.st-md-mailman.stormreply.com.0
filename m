Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6888A4935E
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 09:23:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C62CC6DD9A;
	Fri, 28 Feb 2025 08:23:58 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2095.outbound.protection.outlook.com [40.107.105.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D5CFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 08:23:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8EkNgODbSh8cjvoEhDCZCvgsDaDU5gz3rcqbNd/KOanYktNUKLKYDUU0Yy2C4k4nU5j3wpsDh4dZ/53+/F0Uj8eR5DpihdAHzBz6/N4uUK/sgCoglzHZsv8KkaochgN9+Tm/oqK/wUgVEKGiqj7LuAxjo4gvVymO/CvI+FHoTs/kYl4ENtWQV8f6vWL/jMuQonoqDvSFIemXslmZ7xp6CxIsAS94iGkKwaIpAa0gvDh0QmBDymymss209Ev++IMy3sebr/RHpfNZpI8OQiqGL0vVV/PoC5ywolIB9E0gT+wOpYaVcYQxSFAm4DEaJslb9hKbVqwhUiyXZuOuUewdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24swfUWhgdJvSbPv+eVVOK/dKODLy269o5LQD6dUzIU=;
 b=cZqlS+92+jHt1tydeTolaOk1x3QPOc2PEUZ1XshKjQQlPy87/H2U7M0Ix1sFKM14W7Hg/siYB3fqNxPPCGIaO2aLUvZ2Bj53HLH5gBLdffbhoZd6wDWJ1NV7vITqANfXcbMf9HNidBeonAdsYCm50STy4kAjt42wuiu2nZoBRpQPAvzrJUH8oRisYza3fihDeoqdUJO15NgMhxwgPL9OweiRe11YNqXtcQqKRohwWsDNky0ASTvrHWV8BD2+M6zw0w6qS7OjXFl2LgvcG9zOahL327JumEJR8MdPTKsvns4q3lt9V79mXcqiNI4S6GBMbcl025D8Nuiqq1WPLjqOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.fr; dmarc=pass action=none header.from=phytec.fr;
 dkim=pass header.d=phytec.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24swfUWhgdJvSbPv+eVVOK/dKODLy269o5LQD6dUzIU=;
 b=JKmDNvWpFGbWO8wtsX+ErQOUXB91y7KVfUjD+pnGlVuw5r76QCVdbPRiqDScUIXVjTbFshNDlzEUnrboGVysiO/RBXbIXQjRNxVFC7EC0KP3Fiwufew8DlwYEdD+izroLHzwil6T29CdZs6GmXupwe1hy7n26/0NpCYCQqUeDF4=
Received: from AS2P195MB2194.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5f3::21)
 by VI0P195MB2648.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:250::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 08:23:52 +0000
Received: from AS2P195MB2194.EURP195.PROD.OUTLOOK.COM
 ([fe80::73ff:802b:4093:5b51]) by AS2P195MB2194.EURP195.PROD.OUTLOOK.COM
 ([fe80::73ff:802b:4093:5b51%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:23:52 +0000
From: Christophe Parant <C.Parant@phytec.fr>
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Upstream] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
Thread-Index: AQHbY3CrF5yiNgLYnE6MYq3NtTsTSLNcrVEA
Date: Fri, 28 Feb 2025 08:23:52 +0000
Message-ID: <a34d1b40c104234f8fc81731a2f3ef8aac8759f4.camel@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2P195MB2194:EE_|VI0P195MB2648:EE_
x-ms-office365-filtering-correlation-id: 3aaf25c7-5a30-4012-696a-08dd57d13c48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?T1BqM3d6WjRvN0MvZnQzTWpDZnE2M1lUTVpaYVZpRHlacGxnd1NvbDV4Rm1V?=
 =?utf-8?B?NTIwdyt5bmdGWS9zNlJhVllqMmZjODN1Y3VPK3Y3V1JpSG9PaEtML2hhK1F5?=
 =?utf-8?B?UEowWStWQWJRbTN3RlRFL2xTWTFkQUQ1UFJLQWtGRlVjNS9KbFRyQ1I1TThF?=
 =?utf-8?B?MEducTNXYnA1bDNwc0lsVm5nRTZvZXRLQWdTWWh4MDVhTDNtb3FmaXgwNVpz?=
 =?utf-8?B?Q3QyZHJkbjF4OUxQRkNFbUdIUUJQYWFJWDRyVjhpblpVT2d0MzcxeFhVWTEx?=
 =?utf-8?B?aDMwZnMxbFRCWXF2L1VrMFJEckt4VWdyUkNKWkVjVVYycXczWEwvT0ZPemFX?=
 =?utf-8?B?YmI2QUFLTFRjKzRsK2E5TnlwNVhyb2ZxU1JBUm5JTWVCVENtUE9TTVlkT1d0?=
 =?utf-8?B?T0IwK05HbU53dW1hWjVzMk92c3AyQUFuKzJFcm9Hd0RNN1pUeWxCUFdPbGRQ?=
 =?utf-8?B?Q20waDJCc0Y2VEtrUjBUQ3ZUbnVEeXZDYy9Sc1p1SzVhbFBGclIzVXBKZG5y?=
 =?utf-8?B?NXpLcFZFZjcrak5GV1NYSXpUN1dZRXNnMkZZbUZkeUhWRnd4WVJQNGs3U2pU?=
 =?utf-8?B?MUduNzZETm1BQnoxUTJKVUpKNUZyZThyakZnd2hKOTRGejNoSEIvV3RoMnV0?=
 =?utf-8?B?ai9ha1NRN0NWYWRTVnJPMFBFQ0YxaXlVNTlzd3hjK3NjbHBzQURFVFdXQmsr?=
 =?utf-8?B?bzBJT1NwYzN6ejZBTmIwc0tlMk9kamh6YUJSUTJnTW5TM2VlaUJFTCtQVlov?=
 =?utf-8?B?MkdDb3IzME45QmtwaTJpNEJBU0Z1aG90UnVtdm5JbHZheER5dXNjODF1Mkto?=
 =?utf-8?B?N3BUOVUwY3dZQjU5b3JjdGhGUVF2TGZRNG9xMjBzbkdleHhOWkFzSWxCSlMv?=
 =?utf-8?B?US9LSzcxWVc5QW9BOHJHTnFPb0YzZnhIWW02L29BRmRDeWUzZDZNNmhGZTBN?=
 =?utf-8?B?amw5YldNbzVFSjJZWFhKaXl3VTR6N1UvMFluZmpEV1Q2eVNDckRsWWVUNDE5?=
 =?utf-8?B?clQwN2FhRWlHY3J4aElEQ2VzeWsvUFNiZFRJcVM4VjJEOVNNYm4ydVhVdDYz?=
 =?utf-8?B?U3NhdEkvZE1oOHJ6eHQ3ZHFocGZlbVV2Y0FlcTVpT0I4d1pFcEhiU0RQN1Vj?=
 =?utf-8?B?RmNueDNKL0xyV0FOdnBwRDVjSEhWVzVuMVZTNUxDeGozY0lJOUs0Vm5LMlFa?=
 =?utf-8?B?dDVqZnBIeHFBdkV2ZUtCTXU1aEFuY3ZObitjL29HV21laXl6QTZGQ2RUb2ZN?=
 =?utf-8?B?RzNyWmd4aHlaY1Eva1ZxcmJkOEtzZ25hRlFkcVNDSXZ6WEIwb05xcHFiWGk4?=
 =?utf-8?B?ZGFRckRoNGNudkpTbi9JVFROeWh1SlhXY2x4MVRidEN1amc5YmREUzVlZjNq?=
 =?utf-8?B?ZE1aUVFyZ2JYYk5tTnhYOWNBNXRBS3lSeGNVTHJIT2dBMEJmTkpGTjgvUzly?=
 =?utf-8?B?Q3hEL1BhdXBSQjdiMktMRnNlT2R6Q1BPVGxBcG5WVnVtOE1uR3FVa1N6WkJS?=
 =?utf-8?B?VHR6NjRqNm9LbnEzSTVyb1lYdXBtZ3hnL3lIWUdqOW43SU0xK1BqZWw0SFhq?=
 =?utf-8?B?ekxQWnVLWndqbUxCejZuRmhRK1VNSkpFcTB4a2tGRUxKZU9IUUx3Vm16TjM4?=
 =?utf-8?B?Q3ZRZFVxZzVzVjY0YXdWVEZpSFV5REhmdWFvNVpaSkxwNDZDVStSZUNJYmgy?=
 =?utf-8?B?THdFVHRUWDAwMkt5MW1FNC82a2txaEc1Zno5dWRjMmJJa0pobUd1S2E1dVQ1?=
 =?utf-8?B?M2ZZR3JvUHJtNG9ZcFJRRkxTMkVPWUlWRmlyV3drU21lSVdES0tWMVFXd2Nh?=
 =?utf-8?B?Um1GVmFtNE9pb3NlSnppS2xWMU9KdkNoVUlmMWxnWnlOcmNvTWlub0VLU2Ny?=
 =?utf-8?B?VVY1TGNUNmFha3dZTWFacXJUMzdYYlFtdU1mSjhsMVZHek03WHNlRlQzOXhX?=
 =?utf-8?Q?GIrl9/q/CSjacIoC2ri2BxkbGW18v3um?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS2P195MB2194.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFprclFBd3RaQUxyN2lDQ3Y4NVhYc2h5MS9sV3JGTTZWSVNOMitPaW03QlNv?=
 =?utf-8?B?eFBKVm5KdU5JNEZqWTV0OHFkNFA4TjRKNlRmOTY2Zmo2S2dVNVdNR1RUcXZB?=
 =?utf-8?B?a1c3QkQ4TWxFRGNJbDA4Q1VyNUlFOUprTWVkRzJyOUNxaERpTjlmbjViZmZS?=
 =?utf-8?B?dG4rcTBqQkIrWDc5dlZNU3RJUnlyWE95elFIRU9pWTVpOXpmdjdKYmZxNGx1?=
 =?utf-8?B?cE8rUkYySm50em1EMnNPSm1IdjZSZ1RNSUlwNnVwSlpHUXRGZC9DWjBPVkJC?=
 =?utf-8?B?eGRoWGVxWitabHd2SEhvTERXRmQ0Y2twR29tWTBIN04rbGE4NWlySDZuNkZD?=
 =?utf-8?B?T2ZPSkNCODVrejM5RFhsVEV0Yy96ZWdxV1FlQjVwc3NINzYxUnMvS1RVZWZH?=
 =?utf-8?B?TUE5SFQ4blM4VU1CaSt6cU9sbHVnRklRZTZKT2IwR2hRVGhhUU9DZURReXV3?=
 =?utf-8?B?NnJHVFE1V0hxWnRxN1dvSHRhbnUrNnVHa2U3ZzQwVnFpN3g5cEpnejVpZXhh?=
 =?utf-8?B?dCs2dXhuMjJiYkRWbWZnUmdYeENTcElnTTdYZnV1aWpzdnBYemh2Nll5RkRk?=
 =?utf-8?B?djh3V1U2QVFuTlQzWWFlVlIveG1KM2dhSlRvc2FSbk93RUdhdXozazZPTzFO?=
 =?utf-8?B?d09TT0NtZ3B2QmFiUmMyd3MyUEFJLzVVWDlZRStHdEhBOUs3ZEZ0bVFWNkVB?=
 =?utf-8?B?dysrL3B0QzhZUWdCSlZ3TlEzbVQzdTRUMmJvOVJaOENwOUFpb09FUDVXc3E3?=
 =?utf-8?B?Zkt0TnM2MWRyUndUU1FtVUJKUmZoVnExK3E4TFg3OE9iM21lZUZFQXVhU0I0?=
 =?utf-8?B?QU1SeEhrOVdxd0hFMGZWczdhMVBxa2htQ3Zoa2N4aXhNak1qS0xsSTBTaTJk?=
 =?utf-8?B?RzNXZzR3am1xUmkrTmhUb3A1MmQ5MGpkM0ZnOFlXTFRON3JCcTJwdkNycnNO?=
 =?utf-8?B?a2dLcDJmQW9MTE1zN2JzSWRZNE1ocGUyVkRCblRZWEM2R1NvR3B2Q0hVZVlX?=
 =?utf-8?B?ajcwSUswOUlZWlJ0WE9MekxENElvdUNqQ0c2SHhEb2l3Uy9MQVlINDUrcmll?=
 =?utf-8?B?b294cFNPbnlYS1BDOU9XMVJ0OVMvUFMveTRIaVBIQVZGcnBZNEVBVm85ZWlY?=
 =?utf-8?B?U291bG92SVdVS0NhR3VIY3M0N1JpamdDQ0JFeFdPREJmUXBxRHZTTEZmVVVa?=
 =?utf-8?B?cFFzZTBNRnBZTE5KMjNlcE5ZYmlnUm96dGM3dGw5T3BLb1RCbGg0eVora0Zu?=
 =?utf-8?B?djhJRERNU2xaSFM4SGJmYWxGWHE4bTVRbXN1R0wwZGp2ZDhpZUtQVnhWMFNE?=
 =?utf-8?B?OG44U3ZLekhBZWRuc1JWUW82M3ZXZDk4NzFsWkJtVnF6aUEyRVRYa0NtN0hS?=
 =?utf-8?B?NE9EdDA5WXBnbEgzd2kwb2RrZWRzVEtEUEZwK09XdTFPNnc2L00xQ0tSaVNh?=
 =?utf-8?B?bVBzQ0NoUzEzZDVsMkNMOEE0UnY2NnduTlFUcGtuWFdZME5ZQmVZTXFEN3pB?=
 =?utf-8?B?cUY4eVVkelMyR1huZnJhVytVenhJa21OSzkzVnF1MDRCZWV2R2ozK0pPOUlP?=
 =?utf-8?B?NUpGT0ZNc0tYTlU2MTNIb0JjT3pra0NQa0M2NWszN0g0Yk5oOUZXdXB5bDBD?=
 =?utf-8?B?ek5ETHBhWlUvd0tFdlQ0NjFGRENQUTZJaWtvOVFCTUJDZHlLQ0w1TWZVa2Ni?=
 =?utf-8?B?RXVDSWxCMGhCdW1nN1JWK1FIaWJxa0RmTjZON3VRbWgwTDNLdXBtc3B2enpG?=
 =?utf-8?B?a2VxQXgwNy9XMWwyS2g1ZkxqRVcwdUw4UHhETFVHdkNQdDNiZzdNdmwxT3Vy?=
 =?utf-8?B?TkpGY0tlL29Gd3Mvb2Evd2JFSktUVkpsYVAyOUtrUzNRQ2dsM291a2hOaHlT?=
 =?utf-8?B?VnptdzZaVnlCY0pQSmsySk91dWNtb1Jpa2ltZjlWWkxlSjZkc1hSMWtHTjNE?=
 =?utf-8?B?R0JURFlpT282WFh0a3dKUzFNNS9YNGdXOXdoUytoOVdJUVdrcjhZTW1MdmdH?=
 =?utf-8?B?b2k3dnRvNWJRdW1hbDA4akltQXEyb1pXZE5NWHhZNzdOeTJsV0dJZDhKNVdo?=
 =?utf-8?B?WElabzVPTTdMODh6b0hLMWFUSElKZVJ1QTQydy9iZnlwdWtlM0dodGhtRVU5?=
 =?utf-8?B?Tk9ZWTlyYmM4ZmJWcVprZ0pJSDNzQ0wzbDR4ZFJXYTdhM0JoWmJ2c1Y2SEYz?=
 =?utf-8?Q?yO5wUXgpiaXBwIjCpGCY2iDqFDOGH0ineMPzdmd0IJ4n?=
Content-ID: <459931DC2EA23B4C9ABECB9FDC00892E@EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2P195MB2194.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aaf25c7-5a30-4012-696a-08dd57d13c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 08:23:52.7275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQmWayKR2JNg3QS2g/dPTqK9AS5SREzP/UZO+JIfuPUQWeXaGwmqPdRrl7dhYf2fsUrg43eczbSSrVWxq+yxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2648
Cc: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [Upstream] [PATCH 00/11] Rework and fix
	STM32MP15x PHYTEC dts
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksDQoNClBsZWFzZSBub3RlIHRoYXQgdGhpcyBwYXRjaCBzZXJpZXMgaXMgZGlzY29udGludWVk
LCBhcyByZXZpZXdlcnMgYW5kDQptYWlsaW5nIGxpc3RzIHdlcmUgbWlzc2luZy4NCg0KTmV3IGxp
bmsgb2YgdGhlIHNlcmllczoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIyNzE1
NDAxMi4yNTk1NjYtMS1jLnBhcmFudEBwaHl0ZWMuZnIvDQoNClJlZ2FyZHMsDQpDaHJpc3RvcGhl
DQoNCkxlIHZlbmRyZWRpIDEwIGphbnZpZXIgMjAyNSDDoCAxNjowMiArMDEwMCwgQ2hyaXN0b3Bo
ZSBQYXJhbnQgYSDDqWNyaXQgOg0KPiBUaGlzIHBhdGNoIHNlcmllcyByZW5hbWUgYW5kIHJlb3Jn
YW5pemUgdGhlIFNUTTMyTVAxNXggUEhZVEVDDQo+IGJhc2Vib2FyZCAocGh5Qk9BUkQtU2FyZ2Fz
KSBhbmQgU29NIChwaHlDT1JFLVNUTTMyTVAxNXgpIGRldmljZSB0cmVlDQo+IGZpbGVzLg0KPiBJ
bmRlZWQsIHRoZSBjdXJyZW50IGRldmljZSB0cmVlIG5hbWluZyBhbmQgb3JnYW5pemF0aW9uIGlz
IG5vdCByZWFsbHkNCj4gY29uc2lzdGVudCBhcyBpdCBkb2VzIG5vdCBhbGlnbiB3aXRoIG90aGVy
cyBTVE0zMk1QIGJvYXJkcyAodXNlDQo+IGNvbW1vbg0KPiBkdHNpIGZpbGUgYXMgbXVjaCBhcyBw
b3NzaWJsZSwgdXNlIG9uZSBkdHNpIGZvciBTb00gYW5kIG9uZSBkdHNpIGZvcg0KPiBiYXNlYm9h
cmQpLg0KPg0KPiBUaGUgc2VyaWVzIGFsc28gZml4ZXMgc29tZSBpbXBvcnRhbnQgcGluY3RybCBp
c3N1ZXMgYW5kIG1pbm9yIG9uZQ0KPiAoY29kaW5nDQo+IHN0eWxlKS4gQWRkaXRpb25hbCBwaW5j
dHJsIGlzIGFsc28gYWRkZWQgZm9yIHRoZSBvcHRpb25uYWwgaW50ZXJmYWNlcw0KPiB0aGF0IGFy
ZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0IChGTUMsIExUREMsIERDTUksIFBXTSkuDQo+DQo+IENo
cmlzdG9waGUgUGFyYW50ICgxMSk6DQo+ICAgQVJNOiBkdHM6IHN0bTMybXAxNTogcGh5Y29yZTog
UmVuYW1lIGRldmljZSB0cmVlIGZpbGVzDQo+ICAgQVJNOiBkdHM6IHN0bTMybXAxNTogcGh5Ym9h
cmQtc2FyZ2FzOiBJbnRyb2R1Y2UgU29NIGRldmljZSB0cmVlDQo+ICAgZHQtYmluZGluZ3M6IGFy
bTogc3RtMzI6IFJlbmFtZSBTVE0zMk1QMTV4IFBoeXRlYyBib2FyZCBhbmQgU29NDQo+ICAgQVJN
OiBkdHM6IHN0bTMybXAxNTogQWRkIG5ldyBwaW5tdXggZ3JvdXBzIGZvciBwaHljb3JlIGFuZCBw
aHlib2FyZA0KPiAgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWJvYXJkLXNhcmdhczogRml4IHVh
cnQ0IGFuZCBzYWkyIHBpbmN0cmwNCj4gICBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBx
c3BpOiBGaXggbWVtb3J5IG1hcCBhbmQgcGluY3RybA0KPiAgIEFSTTogZHRzOiBzdG0zMm1wMTU6
IHBoeWNvcmU6IEFkZCBkdW1teSBtZW1vcnktbm9kZQ0KPiAgIEFSTTogZHRzOiBzdG0zMm1wMTU6
IHBoeWJvYXJkLXNhcmdhczogTW92ZSBhbGlhc2VzIGZyb20gZHRzIHRvIGR0c2kNCj4gICBBUk06
IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBEaXNhYmxlIG9wdGlvbmFsIFNvTSBwZXJpcGhlcmFs
cw0KPiAgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNvcmUgYW5kIHBoeWJvYXJkOiBGaXggY29k
aW5nIHN0eWxlIGlzc3Vlcw0KPiAgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNvcmUgYW5kIHBo
eWJvYXJkOiBBZGQgb3B0aW9uYWwgaW50ZXJmYWNlcw0KPg0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgIHwgICA3ICstDQo+ICBhcmNoL2FybS9ib290L2R0
cy9zdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNS1waW5jdHJsLmR0c2kgICB8IDE2NCArKysrKysrKysNCj4gIC4uLi9z
dC9zdG0zMm1wMTU3Yy1waHlib2FyZC1zYXJnYXMtcmRrLmR0cyAgICB8ICA0MiArKysNCj4gIC4u
Li9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1wMS0zLmR0cyB8ICA2MCAtLS0NCj4g
IC4uLi9kdHMvc3Qvc3RtMzJtcDE1eHgtcGh5Ym9hcmQtc2FyZ2FzLmR0c2kgICB8IDI4NiArKysr
KysrKysrKysrKysNCj4gIC4uLi1zb20uZHRzaSA9PiBzdG0zMm1wMTV4eC1waHljb3JlLXNvbS5k
dHNpfSB8IDM0NCArKysrLS0tLS0tLS0tLS0tDQo+IC0tDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDU2
NCBpbnNlcnRpb25zKCspLCAzNDEgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Ym9hcmQtc2FyZ2FzLQ0KPiByZGsu
ZHRzDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1
N2MtcGh5Y29yZS0NCj4gc3RtMzJtcDEtMy5kdHMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1waHlib2FyZC0NCj4gc2FyZ2FzLmR0c2kNCj4g
IHJlbmFtZSBhcmNoL2FybS9ib290L2R0cy9zdC97c3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1w
MTUtc29tLmR0c2kNCj4gPT4gc3RtMzJtcDE1eHgtcGh5Y29yZS1zb20uZHRzaX0gKDUzJSkNCj4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
