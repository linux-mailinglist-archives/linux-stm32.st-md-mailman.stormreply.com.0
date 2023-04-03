Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED66D4C71
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:49:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCA0C6A610;
	Mon,  3 Apr 2023 15:49:23 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2129.outbound.protection.outlook.com [40.107.212.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8D25C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHscscljmc/Zr5E1DpqUz/08l0hydmdgDdkwkDXowz0f0k3Nvx3K+rX8UdYZsdIE5Xy6B8/Pw90hNacf/+hs3kzp/4T4+tTqJIKyv0rRUZb+TWYYXMV3GDulJfbIdU6EP28ojTiKhQvtd7iyhKiEoRuCpSg/hDWVM4PtY786s+9hyIrMpCuC/2aicItyARtTpbihBh64SnaXfffzfInnbQ2JUks0JGQVu25LvrwNwEOg3SLUG959OAi+WMI7UQU01iyAizKtR2f6c+qQ/7ZT/V0DEAro+ue54XXmHE76AaAZ9ic35KlXNI0O58A+WKisBSl1KfNlFaDFsZWCi4zXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5e69aiLuwGrvqYjdvSoD9nazFfpicpHgH1tuRbbG08=;
 b=EyIk3vgaRkpZRGEHi9U2o7jYbgkA//hZVKWOVtdu7pLeDhWGUmuQvJbk/kkIyjNoXqG8ELfMKvkp6lu9paMzy1rwkacbr4DlHJpiGOGmaSQBQTRLGXTFUelWCZtX9rjZRsB3reAz8k3rv/S/wawCt8Zcqcs8uhmxlMoy+23BZgBvQsPhWWJ/e60ADYhTVFawpWJdI1J9XCsu62Q75IqwJY4R57yae/td8+BUn5FIdh7exFV511ihDNWn2V2PDqJtSJSTUnY7gFT4RMAkpgU08gLwAB9kH1kZP6XBFQ0l0071k/nuGJg6q9YAqMERoWXb45jrZLMBrbwBJhkQOpylgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5e69aiLuwGrvqYjdvSoD9nazFfpicpHgH1tuRbbG08=;
 b=IRHlL6lzWhHnQ8lUv8ERwFt3DAp9E5hBH3IVkmODLcFZQ/F+Il5H0LPsvAynMwHUEf6NI4mqIoxttfEh54+hIGgMXo4krmeN/7FzOMe1n4LurdvfSWs4y2V3b0Vh7IeOqCpaO6/YRUmWZVR4RENByUMjVXkQBmEPgdvBtee8Qck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH0PR13MB5171.namprd13.prod.outlook.com (2603:10b6:610:f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:49:18 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:49:18 +0000
Date: Mon, 3 Apr 2023 17:49:11 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCr1d2e9rJkXv/2M@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-6-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230402143025.2524443-6-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:208:1::32) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH0PR13MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 426bd88d-308e-4037-4a01-08db345afbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fuSD7W3dliCfquyZOp/y8CA7vd5FbJLC/DuYH+kqZBx8Fay1cTPrDJ064MyDdHFHMs0DzuDeRtE/raEswBbAqpPGVXw068Bzdt1HEFQZ7Ui0PB1Pk8cRkRWYF+p2aNP6Mxsj01GEh0UQrkzHB+Zj17n7XAiC35nO4M25IKrKnFWGziB6rzrHRBETe0cgUDo9W4mYKZWu48ywZqnHTCEb0yozDE0M3hNpzdE+VI3JEMu9rDyNubFt6HuJ8qD3do9usvwKvg1Jza5ngsDAbyNsxsROnRG4rG73EO44/297OYNMcxi+hUadJkthbxSUzbGS8V4RkEWmZpGtUcJvd+1+6uPPip09df9Y/tROexeN7TkKjOXNVTNqrEZ6siFfjhnS2OLadW4K5kzr/3exAuIyYpD7xP+aGwqEyv5+AS6h0y1vmB6/+uLRafI08fOkTo8Iznon/dg+z+7XOY/vBLKd1pSQJ862XPUq593DDXXT2c+Xg9RtJm6eqY3mFL7m1Z/J0KCsNoBv1YeBb2ddLoc5lmoqd1gN87JDk6mcOpedeAvJPFC5wtoG47Z2tbP2sbm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39840400004)(136003)(396003)(366004)(346002)(451199021)(6666004)(6916009)(6486002)(4326008)(54906003)(316002)(66556008)(66946007)(66476007)(41300700001)(36756003)(86362001)(2616005)(6506007)(4744005)(2906002)(8936002)(478600001)(7416002)(8676002)(5660300002)(44832011)(6512007)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDF1ejgvK2VBSnlqb2RuSHgweHd6b3N6UmpQcS9EWm9OSXhwcmlyK1hBRFly?=
 =?utf-8?B?UG13bVpncnNyazZidFpXakdmM0tMWnhVSDlvWGl4aUdEQk0rL2c2R3BtR2NG?=
 =?utf-8?B?eGEzTWpCTGhBWVZZK3VrRjJwaHcwQlp3TGtsaVlnNExoS29JOU9PSjVlUjB0?=
 =?utf-8?B?SFhPcSszRU5XOFNJVGRzbUpoUHZHcC92bVFQM016aGlpR2hELzBnYzdzM3N6?=
 =?utf-8?B?QldiOEZ6QmdjS1A4b0kwYm9xMTdtNGFzcFpSUW1HZUVMRGcxTm5SQm9kT0VP?=
 =?utf-8?B?dHlQSEpvdDVsb2R2T2xrdFJqUWhKako1dXRpaVFyc1ZialR0WWxpeWVPalRr?=
 =?utf-8?B?VlVoWnJ0Vm1iMmQ4bzJRTVpPQUNnb05mYzdlVEpJWFBoY1BRUUFiT0ZnaVFM?=
 =?utf-8?B?QzNXVFoyT0gwTVhGbXRJQ2hwbW9NT0tWeFgxZ1ZrTTc3eTdmVkZqem9xYy9P?=
 =?utf-8?B?KzlZRlBPZitBYy8zMjN6Z1hxZE1YeHZTdnd2ZkRaTmllNWVINVg1dnErQVBP?=
 =?utf-8?B?Y1lpblNoQ1VNQU16bXAzUm5wNGRTQjFucXRmUkNCVWRldWdKTm9BQ2o2aElL?=
 =?utf-8?B?TXhBUjRPaVlFRlgzMGJZNTJwQStUbVpyMGk3M0ZSK1ljblo0eUtYZUliNnA4?=
 =?utf-8?B?aUN0dWJWb3VxR0VkQmp3Zys0QkhQUTczdkovVnYvZE5Mb2NuU3hzcFcvdnA0?=
 =?utf-8?B?eHVjYk9lc1FNMk04LzIwUitwK1ZSNXFrcDZVWjBlY21TR2VNYWVLelFHRktV?=
 =?utf-8?B?WkEzbVJkaVk4TWVSSkFpb09JanltMjkvWVZRMXNrdmw1MU5GN09teFRKenhD?=
 =?utf-8?B?NGdSSDR5eHlpT1dxV29sc29XMmREZzVxSTY0QmJKamlXMEd0UmZyQkZ0RUk3?=
 =?utf-8?B?ck1mSWpHOG94R3I2WC84RUQ0T0MrUkZwdEozYnpPWGh3aXF1bkMzcXZMcEI1?=
 =?utf-8?B?UEFrRzRPdXh5VUFlb3lQcFRpZVJxc2FIK0NTNVJuaUhNbXpBVldjQzNyV3N5?=
 =?utf-8?B?TlN0L2hFT09oeXZpVzV2SDN6T0g1OTBVNWQ5ZFlWUWpRT01mcjdBSm5QUVE1?=
 =?utf-8?B?VmlYT2pMUFdMYnRuUjE5Y1hzNEh2QW1aUWhJTTBvVG5LZ2o2UHBsM3dueE82?=
 =?utf-8?B?ek1WbzVYbmVnQURzbnhKei9sK1FoSDJaMFFWaXFEaE5CMFpSK1lqbnlaUW5X?=
 =?utf-8?B?dmV6di9NWitPZ05ucDliQTIrUitjV2lEZEpKdWhyT1Q0L0pnRHRONStwNWhw?=
 =?utf-8?B?KzkrVTZNNDl4ckdCeWRzVU1iVmZTOVpwcDVDcytTVEdZdnhMRlArQTF3UVc3?=
 =?utf-8?B?UXJaNVc5SlZtcmhkanR1VDRtVXlhSlI1NjRPQjVQQmYyUVVob1pFSnhnN2c3?=
 =?utf-8?B?YVB5UnlGQzdiT0dpSFlCT3FGY3NJQjkyVE53aVp4eEFLUTZKaUtML1FRUXdj?=
 =?utf-8?B?NFVsTUJmMGkzZ1YrSGlPRHVaV3gvditFMTVkYlBaQmZmbEJOQWNQR1o2YjhB?=
 =?utf-8?B?UUFwL25kZUZLckZCaC9FNnV4SDJuT2tBSUtMVWNnRVdNblZHZ2JDbkZlRTN3?=
 =?utf-8?B?d1FHM2IrN2NHMVN0YXByRzdJUFcxR2NsSVdHNUxHVTZUNUgvcHBvNUFESTJW?=
 =?utf-8?B?WmJEdEhBdS9FSkFrWThJc2MrTmJvZkxWOFhYRlB2RC8wak5qRmxaVDBJSjRW?=
 =?utf-8?B?N282NkhPVXFnMG5jdThFeVdwRXNjeW0yaWtySGNKU2hySFJpMEtsdTRIYjdB?=
 =?utf-8?B?M2J4Wm4zUVY4d2pYZmdHTEJWV1NxdkFLYW9CUVVkL1lORlRBZUJaQzJSeGRo?=
 =?utf-8?B?V3JiTkxOZXo0VUVEVWF1M0t3ZU5VL05TaTlqbUl6cExlQWZXclIvbUhmTmln?=
 =?utf-8?B?dmZMMXJ3Y3gzZVpzcFdSWlhTQlloOVBHaTlVWEgzeFhmb1lqS3ZFdWMyaWU3?=
 =?utf-8?B?dktxb2ttV25JVFdQdjVrY1FUa1JReUFHWUFNcm4xUk5tNVVGZHFYenJKOXpJ?=
 =?utf-8?B?dXlSNDRta0M4aEZabnhFQ09FOHdYSFNGWXoxTi8rVmw5czhhRnF3WlU5T0VH?=
 =?utf-8?B?WlRhdC83QnRGMVViVUJNcW8xMVUzK2lKRCtlMzE5UCtkRlRzRTZ5RmlLR2tB?=
 =?utf-8?B?Ky8weXZ6ZjN5czVvN1BkVmVibjBaMXNQMkR3a1NENktiYnlKUnFWUHVlQWc2?=
 =?utf-8?B?dXJiU2hHdlRDa1pCeithbk0rNHEwZmRaQ3gyNmtvOGFKVkFIckZEejhsTU54?=
 =?utf-8?B?diswRmlyWW0vNTdUMGV6T1pvSGlBPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426bd88d-308e-4037-4a01-08db345afbd8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:49:18.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoHqNZvy+jYboDvg8iH/H6N2YRCPCGIThafatL3lmVoZ04dSSrOfhVVEZHdz6PvYeJ2pT7TkRVduJcSb3EuuDVla89mmPpPLmwDD/uOJySM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB5171
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 05/11] net: stmmac:
 dwmac-dwc-qos-eth: Convert to platform remove callback returning void
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

T24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDQ6MzA6MTlQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIg
cmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkg
YXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcg
YW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdu
b3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBp
bXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2
ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMK
PiB2b2lkLgo+IAo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3YXlzIHJl
dHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5p
bmcgdmFyaWFudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8c2lt
b24uaG9ybWFuQGNvcmlnaW5lLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
