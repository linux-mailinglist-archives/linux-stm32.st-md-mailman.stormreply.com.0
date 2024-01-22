Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906A83691C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 16:54:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F6C9C6DD6B;
	Mon, 22 Jan 2024 15:54:11 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01olkn2076.outbound.protection.outlook.com [40.92.107.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49A19C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 15:54:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4CIp9B5JNAzpS2Lhqt/kxpI8k0361vI7E/1LzlmcYjoJVYTLxYAlrCrIMfkUEGAHF74d47d5OW8eyf87J5N6a/VnW7QEiiC0tYupdrKN59QNQLnB2XgQ2rJrrZ4Ztfwvwhr61LUIzUGFn2ShcMC3PSncAxbRbbiKopOlA36nO8DMq4tESK9YwHnpMaSCIyz0wbtNYN6cuuM2VlrrWffJ0jofn/of9MbtonuMTD/WnG+YHfiRv2g4YdWg+pGEMJj4JF1OaqXr4oClRjuR/AMiJ4D3s6cdKS3v690NTINnfTNeDMLOFOvgpNHaHd9Z2nOt4G/2cvRUQpFwAwmOBykSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPzUTbGdbZdEa+yndiem70Yc62WoO9w17DSNn3NBz1U=;
 b=ft5iMDBlHQxYwEm9HmZxWZBHC+ABTSqeAvcZFJkcyI4sBxLWfVUyOEljeAaAcCa24kgB6Ya00zfsShENdVIZJs28v58VxxZiW98/AmnTOOJw8m6LRGwT5qK+FPsKMRaHQLuAMqU3rZx5PAsvMHtJj3G3Isq7BYWYRuxRmbNQdJ851wia9BxLbklki9ezxElHDXtsjLK0RidFMGZ24RlDr897zLxWq9oy2R211pmTt5DFcYQOSL4f8yFAsWVypHOPRKCEO3sVimiq6R/xovEhXPtonEqnLpC6Cqx4JUGJiZzZSEm0vAPfxCiXvL+/FUE9zVvSFTW6OuvHmWgSAa5NOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPzUTbGdbZdEa+yndiem70Yc62WoO9w17DSNn3NBz1U=;
 b=masoKo8AJlLyLH8gytenaRKdxnS5/bZuTL15bHBtGw1QJPBRMCY70t1pxQLHastcLiGamzbzSEl1ZnVC4YwIUMG2ZN7LZIwc6sNH9hej2m7O0R27f2Uj8tUFolfKlzIJgMSmIgNFcsVPBMGyAhoDcEl3FNxCZf6X7qToOvEUuiHjXM/HpggPJSv0q/RYJvsVN+hC0PSHlHCkuv84AxG/E71y+iFlgmLK3vhSHob1VihrDo1//SrJx1LEg0uCOZ477nXvpxVODBPnbf6s1renL3wEvWZ3Z17TTaM/z+jfadRj0P2D3E48F+GQMFGMGhBlVm0qUoW79GDvee2+nQ5K9w==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by KL1PR01MB5759.apcprd01.prod.exchangelabs.com
 (2603:1096:820:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 15:54:02 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 15:54:02 +0000
Message-ID: <TYZPR01MB5556B83309ED7658ACDF8C69C9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Mon, 22 Jan 2024 23:52:51 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568177805D79143E8CF4E2C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <9ac4b153-2318-4d69-9771-1b3365104904@lunn.ch>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <9ac4b153-2318-4d69-9771-1b3365104904@lunn.ch>
X-TMN: [v5Qu+lwLDBDONMLt7XKlBUdGq2ajMOKh]
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <edcdd21c-b153-495d-a96c-11565a450c1e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|KL1PR01MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c44a5ee-b665-4330-1043-08dc1b625acd
X-MS-Exchange-SLBlob-MailProps: quCBMN2EvO8oAEms7e0UmHGgIKCjoC5BkE5LEa1nziowmGpZiV+QBeKWOa8UbnRtzl5bPlpUvksKt+b8ZRd5vaoQXP5p82XWxW4P9NIRF7l4VudxkQ+aWT5zOR10IPiIxBlIq7djr7gc8ohDsA/rzxx/yPuUORuf9sTow+wJFJzEvzIuIWkZohbPh9ov/zZbIdmtVxxMkwQ1WDZRWCrKdB400BvA/SYe0hphLwM14+xHYyznoqascKlGQiQbZIjmqMGRQiHw9bYAbmRx5w6qZVFK1fHAdEW7GfGnQeMS+D+L3cjYeWT1icGGec7pTZ00zHVvTEn2zcHh3lH4EFS3YV9W9i+/J6IRUNws9Y7nm7nCm0rp81ZVmm30gvWXRXhiuk0ie0dFNacLImIQ7iSHgiQlo0REzVZY2ewU5J8JMBQ7F9PhPqFBuw1KBCU0Q2YeRfFq1imv6yj5/pqXBVMigUktFd+M3fRZg6NA+RunZh4ETM5GVVrUWl5zgt+sG6cXJvoDbhYWwdGDuS+e48TMYhDWd1vibeh31ql9gBZrlX69HUWGchM9JjKVcBUdPgsK//Qz4ISL6oO0/EjAU4uAeilGvM9D/2bOrkff28v4x9RrJf9jRWYIbeP31QXGVs+nln52Js/izmqpxicHrak+AEGOvAr0IF3bcaXgRaLcvKgFqnYAeWyp8aUOAWA+1ufOBzzRvvkCubP/h0nRXna/ww==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nmpGIsJxg/yXcPM6La4ZapdJeX7EtMhXP1Pd5LP8BNFWsefDhlnmT/+gnR9/wrv/1KtOPkpgzZBN0ST0Yx0/aVPO4syXm+qHIx3kAX9WD/HS9SHm4mTvh6aLQZIGHDwU+K+2+KTbNjBTmCNudzne7Pp3wMlP+DNXv24tvagn79kjxPWjQzQiDFO/oAzIabD8E3dLXH/e+kr+uAmJKCunRAWgAF+AuFqOXzu3eTB0i6f/hAOZVeqIa7g/xnPatBnX9KM5UjN9zMqbKB2D3aie4exx/Ja7dYsM5Ow3mda5UNp35gzEEQez0OtzskvNbeaOoDU8ukbYDC3ECKem+B/DcGSRQK9BsTnkXzXKjXSryqutUIj41PyAFqsTLwvEN1o/XVGijnfkvR/2BKB+fOCH6k9kO0WneB9xRdfDBOVE5TEbmmyVlna1JYYKMd6lIOhSHFf5KyytV5WYO3UcBef0bvaLr8/laljthNXEXHwnshH4FwCAUGUFu6GmA2+nk1tzgKdBI4W5huEsFa4lRNsrHmVUpDHJnz5Vudii6k4dJfsAsNyKIY447NZnIGq6T1e
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9iUnpEc1pONUVtTysyNWUyelA0ckhDSHhxZ1VBMytjcnhQZWFGQjNHeHNu?=
 =?utf-8?B?R2poWjFJazdDa2NSNVJyVEwwUUxQYUUxYTRwM1JFU2pEZWVTWmI0OTZBeHJP?=
 =?utf-8?B?SWtqb1l6WUh3NEw5eFZqeG0wNkI0b25XcVJ4UkhYVXlXMGx0UWdCQ3JHL0lj?=
 =?utf-8?B?K0s4RGlKajUxVzFRdXJJM2g4aWRzaEdnOEtZSmorMWJNSmFpbzlTNE5XLytp?=
 =?utf-8?B?MHp5OWNCaHN5Z1R1elFHT1VaUkx6UjhhVjE0ZEpHelpIQWNRVjRXY09yQzJu?=
 =?utf-8?B?YzBPeGNrMkRuZE1BNGZiUksza0tpa2RlR0JhNHlZSzlwYysvd3hTd3Q5SGNH?=
 =?utf-8?B?MHZoUEllQU9XbFkrcU0wbXlZSmxsL0M4REw3RFd5ektiWWtuWXNDemdXQ3Q1?=
 =?utf-8?B?RUJ6YXdCVU52czBLYmJyaGdNYXh6V3pJWmVGdHFJb1hVVE9HWVVFcFVqeU11?=
 =?utf-8?B?Z1NKWFY5THZuNHVTSWtCSHRhOXVjTFVLRnVCdFhyRVFPbWpGUWNEMFRacHVR?=
 =?utf-8?B?SnVxWGhyemo2dmkrdnh3aG5oUm1BOTM2b2hpdW13b3FndTc4dHVKdVRJNU1E?=
 =?utf-8?B?M05xT1MxdGxwSDZ1SzlYdU0zT0N4K3ozZW8wUGlobFNHTm9zODZCVVhlRTJv?=
 =?utf-8?B?WXJLb2ZYZzF5cHN6Sk5DLzhSK1NWUDB3ZmFVUElXNzU1L1Y5bGo1SnNNa2Zl?=
 =?utf-8?B?dUZ1dkV5azd2NTg0aDRXUi9Zd0J2WVE0QXcwOEI0dkJjL2VOWjQyS3hZTjRh?=
 =?utf-8?B?L0FpM3l0TXNxN0hzRGZWT0VGVnZIdkJTU1pDK1lzWk5mTjZXWVN1cm1IOWhO?=
 =?utf-8?B?b2gyV25uRzA2UE92endSY1JEeXd5dWxVMUlWS2hTaE4zVnE0YnBVald1ZDl5?=
 =?utf-8?B?ZnJEelpObkJkRm5PSzdWckhWV21TT3M3aVpVOWxVSmtnVE5CT29kU01zOHpq?=
 =?utf-8?B?bHJPUVlwOUNxSFhEU1BWTlcrZ0tMeFhQREJEQkxqL1ErWVpZZUFuSHFnYTlo?=
 =?utf-8?B?RlhBUndyRHVKalVFRlE4TDMyaWNQZ05XL2xQVVcwTm9SV01xZjZBU0pEWWsy?=
 =?utf-8?B?d1dRbFQ0TlFnN1ZmcXhDclBleVF3Z0ZmandWUU14OGtBYzYralpiT2M5N3U3?=
 =?utf-8?B?S29jc0duWmg1YjhSMUhpbFdsTmhmaThzaWE1NnlKVFZXOGxZUGxkd25Ba1ZG?=
 =?utf-8?B?ckRlMzdoemRKemF2dGR3Qm1pd0lwb1IwR1RrMGJWak13NnVHcnY0M2pXWnJl?=
 =?utf-8?B?WXNHQ3IyZlBKbk5FazA4YTg4UlEyT2ZySlliY3RXcGM4cTdFSXMwWU1QbytP?=
 =?utf-8?B?bGFlYjQ5Ri9OWEI4TWxYSlU5alUzQUU1TDl6eWpnUWlKYUpDS0hIMjJlZnFj?=
 =?utf-8?B?NlBhQlJCNVRkalBYaWJpem02MWp1OWI1M0w2K2N1TXVpWExpTGx0SXNoNkww?=
 =?utf-8?B?aG00MUtjempEU2EzbUg0Q3JpNnphbmh1RVJyVFZrYWt2ZTlXWlRVcGU0Z3Zi?=
 =?utf-8?B?RCswVlhKUDhjVzRzZEdSM21Jem8vU2ZNVTYzcWZ1QUk1cXA1N2pkSjZZcmhM?=
 =?utf-8?B?TStKdktvb09EYmIybHZuelFVVUkwWmFUZUZyb0ZWeERpK0dVYmRjSVVUTDV6?=
 =?utf-8?B?UWVkQ1M2dFZYcUY4aXJranczSHZ6R2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c44a5ee-b665-4330-1043-08dc1b625acd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:54:02.5070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5759
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 6/8] net: mdio: ipq4019: support reset
	control
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

5ZyoIDIwMjQvMS8yMiAwOjM1LCBBbmRyZXcgTHVubiDlhpnpgZM6Cj4gT24gU3VuLCBKYW4gMjEs
IDIwMjQgYXQgMDg6NDI6MzVQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+IAo+IEluIHRo
aXMgY2FzZSwgeW91IG5lZWQgdG8gZG9jdW1lbnQgd2h5IHRoZSBNRElPIGNvcmUgcmVzZXQgY29u
dHJvbGxlcgo+IGNvZGUgZG9lcyBub3Qgd29yayBmb3IgeW91Lgo+IAo+IFlvdSBhcmUgYWxzbyBt
aXNzaW5nIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGFnYWluLgoKU29ycnkuIFdpbGwgd3JpdGUg
aXQuCgo+IAo+PiBAQCAtMjQ4LDYgKzI1NCwxMCBAQCBzdGF0aWMgaW50IGlwcTQwMTlfbWRpb19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgIAlpZiAoSVNfRVJSKHByaXYt
Pm1lbWJhc2UpKQo+PiAgIAkJcmV0dXJuIFBUUl9FUlIocHJpdi0+bWVtYmFzZSk7Cj4+ICAgCj4+
ICsJcHJpdi0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9vcHRpb25hbF9leGNs
dXNpdmUoJnBkZXYtPmRldik7Cj4+ICsJaWYgKElTX0VSUihwcml2LT5yc3QpKQo+PiArCQlyZXR1
cm4gUFRSX0VSUihwcml2LT5yc3QpOwo+IAo+IEhvdyBtYW55IHJlc2V0cyBkb2VzIHRoaXMgTURJ
TyBjb250cm9sbGVyIGhhdmU/IFdvdWxkCj4gZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25h
bF9leGNsdXNpdmUoKSBiZSBzdWZmaWNpZW50Lgo+IAoKV2lsbCBleHBsYWluIGluIHRoZSBmb2xs
b3dpbmcgZW1haWwuCgo+IAo+ICAgICAgQW5kcmV3Cj4gCj4gLS0tCj4gcHctYm90OiBjcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
