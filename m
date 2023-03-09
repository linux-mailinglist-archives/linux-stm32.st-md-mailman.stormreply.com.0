Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336A6B2ADF
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 17:35:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF10C6A60D;
	Thu,  9 Mar 2023 16:35:08 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2126.outbound.protection.outlook.com [40.107.94.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B460C6A609
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 16:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lM1mxxfdVBJbbqq0mGtHGHwumZsFFTNnJcwJWbC+jXIrQeoJeK2qlGjJAlkUzzsb5Uh5A6978JxJ5XB8EWrjr1nuMju9t9A9FKH9tocEbbyPMyXuPa+PkcNsKIzJg7Y6ZIsGhvaobE44HPg0I+e2ccY6Q+tgf6NDBVl6rpzVwgmL9RMAYjJn4QT6VCbgctYEpywOuPFOdbD9gzmXg5w8K1szkyvdl8ShvLwhT9yNkV3yMQWw5SR0lbHELRXcoxzhta33nXIh62ZSvk5HwVyCm3SOPhLSYugo+vmz9tRSRfWAiOcULPbSDA9g7XKFMyPiMa9NRwG2LepqN9Eo8Ou76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBE2SC8BbEutyeOkWwK3IbXF3sYlG+i8jWWjHFi1/Kw=;
 b=Pd0+qyRqQk6m2aOeALRJvEuvr0Y7Mxne3q32fS8HAUnWHj8I/bC7kENC6UTYaOuNkbYLg71pDqWJ+rC7MkFujUP0I3RNxVJp44bIhq1W6R4bOmCoTWLCfu7kF/rXnuUU1OQAXPHZQPlI13NAIPs09Ofe7FJBEWKKi7xW1j6v9kEcLqOgNzPNJ6Ijmxpq5wgZdBIosepWubBys/92taWztLIo8rmM4Fiugmn7fiibcszxFVmvuIsv0Zv/yZ08t9KXWUMbDiAaY/NEcOml8g8025QUThT64Uxhj3tElqWHifpvjJ8uI+w7Gx2jvCSBKd6K3NwA6PFlv1f4+F13DHxz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBE2SC8BbEutyeOkWwK3IbXF3sYlG+i8jWWjHFi1/Kw=;
 b=b4L+ZNQpJRrTNyUBpiSsKileOVfo4HGIXYpxTTZmLlbM2kC1bDvtSjKFjTndWIsZtoBzGNz2VS7TrquJ2MditoE6aXJAqPtJ9rLIcygHCLSkXXYaMmfSvpmpjD+A/t3a/rNzqDvSn+YQIn25kam2PU+QdQNCWvq740wFokB8aBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH0PR13MB5188.namprd13.prod.outlook.com (2603:10b6:610:fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 16:35:04 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 16:35:03 +0000
Date: Thu, 9 Mar 2023 17:34:55 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Leesoo Ahn <lsahn@ooseel.net>
Message-ID: <ZAoKr+EtakUhrUVI@corigine.com>
References: <20230308162619.329372-1-lsahn@ooseel.net>
 <ZAnh0TGtDkVUl/1m@corigine.com>
 <e75d2a42-4154-e469-bbd7-9409471ab724@ooseel.net>
Content-Disposition: inline
In-Reply-To: <e75d2a42-4154-e469-bbd7-9409471ab724@ooseel.net>
X-ClientProxiedBy: AM0PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:122::38) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH0PR13MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 1282c72e-38d8-402f-38f5-08db20bc3bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwILUztRzhpshCY1rAlSF8mXZeDbpEqOUWDmMP02BaTKvh1FXMK8S09vTv9n+y+qjorn+uVoiiExj1YCION13jIxTWWZ9IdNl2yYqRdSextKsMM//W6q8fUAcN6w4yP2Ls5w+uw1VuVdHnBSXc9WCq4nVcZI40IiBtXUHsrmEFk75580DPiWfyLuQfyCA5Swp5N4x9C3+QBdudvLTMkLtKAV4Tr8YLL+htZ5kA0sM0ag10iRJmM6CPEaC0ugnAjOYHTxPn/N7A1yE8vumtWUGlaPxnTq4i014985uTuseLaAy1vPDMlzyvgdMwHeZix2L3RDEUpazVUOPpplaxHqGVUztql9JNCER8cN2CWj6nYqTYGt6FDHWnZltkX3zgZmmRG0+bTkny/LzpajMQOPHwsELEA8fOx09xnc5xnRaP58iGwBZwV2obdFtvBNf3l47FBfgxsNeyUSxFqvHZNzxTG0sNAP6MwAya1jNdJy6ND1390D37bRCanIGhx46m2YBHfD7vDrtdqOxis04+ESkcb82ZHMwNKBWwQ2+7vPyjzyPgWcePbLS4h/T4hgojTjDw4vgh16POY2VkAHYUArH7G6GkmnNuu97x7RRAFeoTp/xiCDJAopxoKd8ngcRkPg54Z4WCyLmEo+DtIBIz4nFIYIwxYAfh9ifpvZoHIIkDbNiSLYxmvMRQvkys/qJYt6gGNa7ZzmAviQFzUGQvm4SLFm8LV/IANoQtclzBXfVO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39840400004)(346002)(366004)(376002)(136003)(396003)(451199018)(83380400001)(36756003)(38100700002)(316002)(54906003)(478600001)(966005)(2616005)(186003)(6506007)(6512007)(6666004)(6486002)(8676002)(7416002)(44832011)(5660300002)(41300700001)(8936002)(66476007)(4326008)(86362001)(66946007)(2906002)(6916009)(66556008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anIwZkRkQWhHTGE2bkppUmhDSjA5cVFCYmU4T0VVNnZURk90VDVwb2laTTB4?=
 =?utf-8?B?OVZtOWQxbU5lQWw3b2hKa1A1T1lINEZFTTg3NGN0YnVmc0E3ZXM4RlJYbWRu?=
 =?utf-8?B?STVnS1RkTFdNWFVadmk1WnhWdHp4UndzenRFUTIzaGI0d2RlWHUxVTYrdloy?=
 =?utf-8?B?ZVJFNGpVcGE5c3N5MGlWdC9hbjFlZGFoa3dUN2kvL3QzZEloOXJoRnBWc2Fs?=
 =?utf-8?B?aWhBNlEvNlYrSERYVjc3V1QvQ1dlZDVLM1RhbnV4dUs3OGY0VkZsdG0xQTU3?=
 =?utf-8?B?T1UyUmd0QTExM0lqNFVoTkxNdzlwUmRWdFZ1bmtOVWt5Y05KNG1JUHVpd3ZL?=
 =?utf-8?B?aHhQTnlYdGV6enJqdXJzaFZsUDZoRG4xRVNqcEIxeHAxNVZ2NVJpeHRWVHRl?=
 =?utf-8?B?aiszbkhoVXo0c3MzeXY3T2dlaVRqeHIwNktGbmd1bzZUc0ZLMTZaS01RdEY0?=
 =?utf-8?B?Mkg3MEE2dFJtQ0tVM2ZjS3cvZFhyNllYeFd6OGk5SnFVUlhGQ3pVSHkwQWxJ?=
 =?utf-8?B?dENJamhxbjNUMVlvQjdlQmtnWUR1R3ZvVm5CbFRnR1BoVEJ6SXlrY1QvNjMw?=
 =?utf-8?B?dG9pSUlBR204c1dmeEM5SVRtVm1QNkE5RHA2QVNMNy9BWTBteFNNb2tVTWsx?=
 =?utf-8?B?TWNYM3JCM2haVGM3Vml6bzR3czd4OHNWd3M3QWU5ZXlISGxqU0RvdnJKckpC?=
 =?utf-8?B?OUpRSDhmUUZYd3A4WTZMR2ZjVFJUWTRBVkRuRnVJaksrd2h2R3J0NVVqZ3pi?=
 =?utf-8?B?UXFDMHVvZ0tnUzhJL1JaRkpFNWt6ZUoxQmp4RldmVUpMNFRXM3dUTjZ0QWYw?=
 =?utf-8?B?RFlpcFgrblhHN1c0WHZYRlZWb0lQRDc2Qm90RjNwVG1OYnNXSHBBNS9VakFy?=
 =?utf-8?B?dkwrV1lGRVMyWE9mcCtYeDV6bTRwZURsR1BLWVhrb3hEV3YvZm50czl2OFQz?=
 =?utf-8?B?REFvbG1UZDN1ckFJaUhiNThZOHpvM3ZOK3pLNjN1MnEza3NmcXZ5WHpTcS8x?=
 =?utf-8?B?bXRINlAvVm9OUEt6RnlwZU1hSDFBRUZUQ3ljdmJscnZ2Yng0ZzRBT2c1R2Rs?=
 =?utf-8?B?MUZZa2t5YmJKM3p2VjJ2QnlCenRxMWtROVNZQmlXd1cveVI2VGxUZWVST3kx?=
 =?utf-8?B?bUJFM3pNNXoyTUUyVTBjci9IeEUwSHhHYm1tc21IL2FlR050YkxFNWJmaGF1?=
 =?utf-8?B?S0lPeGNLbS9rNSt4cW4vcG4zMzdrRFRwQktmR3JvU240YjBwbjBYUmFxNGFF?=
 =?utf-8?B?SGIwSi81ZjUwQVpub0tXa0dYOHJ1L3VoOWpRNEVtQUpFZjA0Q0VyMU4yWDVS?=
 =?utf-8?B?VjE1UDJrRVVVSmFDclVqN0xGdks3aFUwUlEvajBmT2VLSEt0NXVMRFlKM0FJ?=
 =?utf-8?B?bkJYVGxmS2FNVFgrU0M5a1o1VWhoS0VydU85dlNwamo5RGx1ZXNTYW53Mk5k?=
 =?utf-8?B?bUZWZUZISXlFczNLQlRnY09OKzNLUjBWbm96dENYMUxoZlAxNXBLRXlDSTZ1?=
 =?utf-8?B?K3dxb2IzNkppUkJxQisyNmxhTjBQdXFoL1JBcjZYelJGb29QbFFkTXpjaVNS?=
 =?utf-8?B?S3FBTjFYL202Zjl2Ni9WOGpqM1V1NjhCdzV3VEIrYkIyWHFTeThoNFYvRzNN?=
 =?utf-8?B?VmUyaDFPUktrWk1IbFkxVTBRV05DU0k0YjM1b2tMZVdOaU0rcVZtOHFzMTZF?=
 =?utf-8?B?cXdSRTRqNTY1Q3BYSUdNN0tDTjVNRVhIbVQrOUF0MzhMOS9zWXZWZGMrMnJM?=
 =?utf-8?B?di9kRHJHOUVIZGVtSnBzQnoxQ3pXZC9QNHF2cXVlSnI5elhYYUFBRXRzdTd5?=
 =?utf-8?B?RzI0YjgwNUcvMzEzMExxVnZFVWxVNThnS05IK2ZoU1MwWVFMY0JDNDNDVDky?=
 =?utf-8?B?bFBkN0RqRU51eTFxajRuOWprdU1WbTVvQVBjNHZRRjRSbkdkMFRaRlFMTFcv?=
 =?utf-8?B?dzh6ZFNwT2NRbmwwejIwWTdwTG5rUGxES1hDakUrVm1WbzRCWG9adXRWVmVC?=
 =?utf-8?B?L1pGcWRqN3FZcFR0ZkZqd09NOUU3NmhzMXkzcHhDZVR4TjdkaDViTHoxcWsw?=
 =?utf-8?B?SEZYSENYOWtiaVdIWVVGb1pVRkxjbThyYjMwYnpBV1IzQXFrMXY2RndKQXI3?=
 =?utf-8?B?QXNDeUFNMmhQejBqenJPbytCdVkwbUY5azlzdEF4d25UcDFvV01GcldOS0F5?=
 =?utf-8?B?R0lGZ2w0ZURjdFdCNnRoT2V2NjJYelcwWnpZNWFsTUF4VnFYUDEreHpLWXpP?=
 =?utf-8?B?YVM3RUwxS040ZmMvM3Z4WVUvV3FRPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1282c72e-38d8-402f-38f5-08db20bc3bdd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:35:03.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CE7S7e2/VSky1izBGGWe1ducfa5bUcRhBRTOJzyqf0d8i5Bzj2jpyXCNkw6cgbi4m62GxrfGj+N6gHpYR8FRJxTSXk6OSMFW3vaOv2zOcjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB5188
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: call
 stmmac_finalize_xdp_rx() on a condition
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMTI6MDg6MjlBTSArMDkwMCwgTGVlc29vIEFobiB3cm90
ZToKPiAKPiAKPiBPbiAyMy4gMy4gOS4gMjI6NDAsIFNpbW9uIEhvcm1hbiB3cm90ZToKPiA+IE9u
IFRodSwgTWFyIDA5LCAyMDIzIGF0IDAxOjI2OjE4QU0gKzA5MDAsIExlZXNvbyBBaG4gd3JvdGU6
Cj4gPiA+IFRoZSBjdXJyZW50IGNvZGViYXNlIGNhbGxzIHRoZSBmdW5jdGlvbiBubyBtYXR0ZXIg
bmV0IGRldmljZSBoYXMgWERQCj4gPiA+IHByb2dyYW1zIG9yIG5vdC4gU28gdGhlIGZpbmFsaXpl
IGZ1bmN0aW9uIGlzIGJlaW5nIGNhbGxlZCBldmVyeXRpbWUgd2hlbiBSWAo+ID4gPiBib3R0b20t
aGFsZiBpbiBwcm9ncmVzcy4gSXQgbmVlZHMgYSBmZXcgbWFjaGluZSBpbnN0cnVjdGlvbnMgZm9y
IG5vdGhpbmcKPiA+ID4gaW4gdGhlIGNhc2UgdGhhdCBYRFAgcHJvZ3JhbXMgYXJlIG5vdCBhdHRh
Y2hlZCBhdCBhbGwuCj4gPiA+IAo+ID4gPiBMZXRzIGl0IGNhbGwgdGhlIGZ1bmN0aW9uIG9uIGEg
Y29uZGl0aW9uIHRoYXQgaWYgeGRwX3N0YXR1cyB2YXJpYWJsZSBoYXMKPiA+ID4gbm90IHplcm8g
dmFsdWUuIFRoYXQgbWVhbnMgWERQIHByb2dyYW1zIGFyZSBhdHRhY2hlZCB0byB0aGUgbmV0IGRl
dmljZQo+ID4gPiBhbmQgaXQgc2hvdWxkIGJlIGZpbmFsaXplZCBiYXNlZCBvbiB0aGUgdmFyaWFi
bGUuCj4gPiA+IAo+ID4gPiBUaGUgZm9sbG93aW5nIGluc3RydWN0aW9ucyBzaG93IHRoYXQgaXQn
cyBiZXR0ZXIgdGhhbiBjYWxsaW5nIHRoZSBmdW5jdGlvbgo+ID4gPiB1bmNvbmRpdGlvbmFsbHku
Cj4gPiA+IAo+ID4gPiAgICAwLjMxIOKUgjZiODogICBsZHIgICAgIHcwLCBbc3AsICMxOTZdCj4g
PiA+ICAgICAgICAg4pSCICAgIOKUjOKUgOKUgGNieiAgICAgdzAsIDZjYwo+ID4gPiAgICAgICAg
IOKUgiAgICDilIIgIG1vdiAgICAgeDEsIHgwCj4gPiA+ICAgICAgICAg4pSCICAgIOKUgiAgbW92
ICAgICB4MCwgeDI3Cj4gPiA+ICAgICAgICAg4pSCICAgIOKUguKGkiBibCAgICAgc3RtbWFjX2Zp
bmFsaXplX3hkcF9yeAo+ID4gPiAgICAgICAgIOKUgjZjYzrilJTilIDihpJsZHIgICAgeDEsIFtz
cCwgIzE3Nl0KPiA+ID4gCj4gPiA+IHdpdGggJ2lmICh4ZHBfc3RhdHVzKScgc3RhdGVtZW50LCBq
dW1wIHRvICc2Y2MnIGxhYmVsIGlmIHhkcF9zdGF0dXMgaGFzCj4gPiA+IHplcm8gdmFsdWUuCj4g
PiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWVzb28gQWhuIDxsc2FobkBvb3NlZWwubmV0Pgo+
ID4gSGkgTGVlc29vLAo+ID4gCj4gPiBJIGFtIGN1cmlvdXMgdG8ga25vdyBpZiB5b3UgY29uc2lk
ZXJlZCBnb2luZyBhIHN0ZXAgZnVydGhlciBhbmQgdXNpbmcKPiA+IGEgc3RhdGljIGtleS4KPiA+
IAo+ID4gTGluazogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3Qvc3RhZ2lu
Zy9zdGF0aWMta2V5cy5odG1sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+IAo+IFRo
ZSBmdW5jdGlvbiBtdXN0IGJlIGNhbGxlZCBmb3Igb25seSBYRFBfVFggb3IgWERQX1JFRElSRUNU
IGNhc2VzLgo+IFNvIHVzaW5nIGEgc3RhdGljIGtleSBkb2Vzbid0IGxvb2sgZ29vZCBhbmQgdGhl
IGNvbW1pdCBtZXNzYWdlIGlzIG5vdCBjbGVhcgo+IGZvciAnd2h5JyBhcyB3ZWxsLgo+IEkgdGhp
bmsgdGhhdCdzIHdoeSB5b3Ugc3VnZ2VzdGVkIGZvciB1c2luZyAnc3RhdGljIGtleScgYnkgdGhl
IGxhdHRlcgo+IHJlYXNvbi4KClllcywgbXkgc3VnZ2VzdGlvbiB3YXMgYmFzZWQgb24gdGhlIHBl
cmZvcm1hbmNlIG9wdGltaXNhdGlvbgphc3BlY3Qgb2YgeW91ciBwYXRjaC4KCj4gSSB3aWxsIGVk
aXQgdGhlIG1lc3NhZ2UgYW5kIHBvc3QgdjIgc29vbi4KClRoYW5rcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
