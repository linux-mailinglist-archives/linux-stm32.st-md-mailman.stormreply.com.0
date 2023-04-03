Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6346D4C57
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:47:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D10EAC6A610;
	Mon,  3 Apr 2023 15:47:04 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2101.outbound.protection.outlook.com [40.107.96.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D24EBC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q12+MEEj1I1rfXUS2OWuGZLbEFrdgPZs1d3cnRXna4gppE5Mh8z2PI8YskypNu5hPbdOEzB7cWNC1p96wlNtcZ4rd0K2dhH/bPmWfpLQd0PsKTinlPz0u1ZM1uBAFYD33mX/H1EseyaHBGu7voOYJpftt6rbRuXEw2IXCJtpCsy/STO4V/e1YoQC/sPGbj4MSuklk1QOx6NU+VEKkmvgjb4K04/5OJBvisO3mgB4E9PJulnjCkV1vrNoOMemDVKfgGDHnpGCUbWfyds4Uz512z7xFmuNZj8bjVxXwj+djOa+SnZ3YkXswuQQnRkieqYrTNlgafDBMMswXY9PcHtUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO37BrA7xLUMa8QQIKi6DSSXlIs/MelYiX162x2TsU4=;
 b=SM+c+Yew44AfP1dwLi49xsu4/kkaCetDA1d9XZ5SfNM1DzpjZBlq2B4gJ2DK/t99mEO+MsLhh8gjQ/A8VLR/000zsoOF0BbOHQr1M3lxdKlfow+lrvOOmF6vnwsBgLEplAGfXt6p3repU0Pc+pRVZPQZxn5fqVS2Rxa1HiAKc8haaRTnBRzc/5oYm6jyOQhHSuvf8HwGy3u2C2oiZ5Pl/5WxntlX65C5e1uiFM0F+hzpYLrYigMo+uh9iaNkN9ugwOe/CESflNiYcda5ko3R1MAsbsnRNJpObVdL1HMKBWes+SbQODOn/jYCL9Kq3C2bw8sdOreXRMmeoyAcoiN+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO37BrA7xLUMa8QQIKi6DSSXlIs/MelYiX162x2TsU4=;
 b=clPz5F2YeDzpWoiLYxkPAHwU6Kgc06tfU2pjRaN8oQVwtZ/6Djag25FNfN6eTx/4v3TKzEvi59ecZBqEPwOkcNsRFWV7cYSyypZNRNe94iNO6KVIsdj5BplJm4gByY4PvPHDmBWRMskxdsy9Bgba4OUVoFhEowfqWtyDoAuKMis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by MW3PR13MB3993.namprd13.prod.outlook.com (2603:10b6:303:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:47:00 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:47:00 +0000
Date: Mon, 3 Apr 2023 17:46:52 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCr07OJI3xIhFgWO@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-5-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230402143025.2524443-5-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM3PR03CA0071.eurprd03.prod.outlook.com
 (2603:10a6:207:5::29) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|MW3PR13MB3993:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d364ae0-b272-43d9-a1f4-08db345aa96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBaZoMa9m3i5sRf1s9Qw2J3hhSEYqe8DjIiyBIYtzrWBsj6JmpZhDiDt1tfuAokDDTJhEGC7pEACQxf6i1kv3YBkMg22BBeWJRwsPqe1iFha2xSAiiucm5dVtja6E7ZExtLQrY/IhLubXUrdmws0WBU4MmtROIDuj6j08/QXqqWFoNXKG+nj0ENst4kIhOD5mZzY/kv3sahMuXknmtWxk2VjyzolL1pQF8YOAdvqNRDlY5peFDma2RkH1E7nEkcAKvgpfWg2cy8GxI3PKWgTdeKkV6c+A8AbZDKYp5C3PqUql2M6+hZlLUkBTLk6VWf0cGq20dFBvBicbjxon1PqOPRvfBPtbYZEtSXK7JqZnoTuX40NC3OMoDqmFf9kbsl8dtg+IgLvqc/zGUxRVodK8Z0X82qiRGyGGMwi3XvmyX0WA0YzDN/1tATcrWmiXt49d2mUXTBoIA1NZvum8cGwP+Gl/T5JhOmVMkTmEiHSg2t0d+Dibp0L/KkmU45LS+2mhWTIR2C11/Z9GEXIK9BRV5WIYESSzWywv3SBaMU9D3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39840400004)(376002)(136003)(366004)(451199021)(38100700002)(5660300002)(7416002)(44832011)(2616005)(83380400001)(54906003)(316002)(6486002)(966005)(478600001)(186003)(86362001)(6666004)(6512007)(6506007)(41300700001)(36756003)(4326008)(6916009)(8676002)(66946007)(66556008)(66476007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBNbGdKUVFWbC9lNVFEY1R4Zll3S1A0cDNNZnZPWHZqOWFuYVVuc1l6U29h?=
 =?utf-8?B?a2Q3eFlUQk95K3RoS3VhMWh6VTFrMlFxeEF4TzVlOXd3cFUzMWNOL2loOFhW?=
 =?utf-8?B?dGpydDZwS1ZyYWNGYmlncS9Qamgvd2dwY0RkNTJaZlVmQlVkdVZHdDdQUm1V?=
 =?utf-8?B?Z2RaSVNhWHBGK3Ficktya1AzMnVtN2pNRE5wOVg0dUlpSHFJUzYxbHFWTE1Z?=
 =?utf-8?B?VXlzem80U2x3bm1qRWl5T1p5TUx6MjdXZ3cvYSt3dEI1N3U4QnlITitaSERG?=
 =?utf-8?B?Qmg4NXkvbFlRK0hsL2ozYnJTVmhza3dyenN3bEorN2ErbnlaOFg5bjJwQzM0?=
 =?utf-8?B?dW9MNnBRelhoblpnYzdYNDVZcVkxUHdpRFp3Yzh5SHNPY052R1hOV25XVk9O?=
 =?utf-8?B?L3ZkQ3RNVzlCckpKOHA5ZGNiVHRDZGYyMDkxay9GOG5kWUxHdVlsZEJNNExo?=
 =?utf-8?B?aU53Yll5U01vOVptcXB2N1c2NXAxWTRKc00vYmZRcVhiTFNwT0RvSnpEWHdL?=
 =?utf-8?B?OExVdGVYV3gwSGh0NmZYdC8xaFQweUx2cGdxTHcrMDlUTkhMekNvSTBEYnFF?=
 =?utf-8?B?enBGZFhqRUZHcUlweWVXT3ZocGpuWnk5TzNvYWhBcW4ySlFEVW9UNVJnYnlr?=
 =?utf-8?B?RzJUZFJ1bm9FZkl5c2pSSS9mMGVQTDZqaWdnNkdTV0NGMmJkMTUxUUh1ck54?=
 =?utf-8?B?S1FTekJNU2ZCS3F1OEpXNWlScnE4VnNCUmVDTm8xK05Ldzh2VFk0YldDai84?=
 =?utf-8?B?WTdZaWlhWVkyWnptQlpvdVNuZG9sUExad0VZYU80djhhOWdOVTVZNmtpaTRC?=
 =?utf-8?B?TW9sZjlRcEtha2h3YThXdWdWQmxOdTRKa2Z2RGg1VkE2ZEFjb1dORG9xYUFi?=
 =?utf-8?B?ZitZQWpad21vMndXNHhiMjJINk16MWFDdGJNVGk5MEdrUGN1REluZXk4UTdk?=
 =?utf-8?B?TUsySVhkTnhqYXpYbGZCS0xSc1lEdjAvUjZJQTJnamlPQS9hdThyRFE1MHM1?=
 =?utf-8?B?cGwzeGkxTHF1VUhjdDlxblYyK05yUmJ6LzVzNWlscEh0eTNpb2NKUlBvNms1?=
 =?utf-8?B?TGVNUnFSZmQrdEtDZnVvWHhVRDBvTlVwMDBoaGgwNlZVcUtrMFl0bTJDZTNY?=
 =?utf-8?B?czdvcHd1d1B3dkFIYWduVnVNSSt6cHl2aWQzS05nUDJEbEwzekhRUkYzZGhw?=
 =?utf-8?B?aVV3SUx4cENvTjQrM3gwOGx1NU1aMzFXOGpkUU9uMWx0MldzODdxRW9ORmtV?=
 =?utf-8?B?dGlzcWRPUzNpbE0wRHJBNXNKeWpkdXlTQ0xjSkhYNm1yQlRSVFEvUlk0bk5E?=
 =?utf-8?B?RWhKRTB5akJCRDhzRGI3RTA4dGE3MnJtdktGaFc0MGE3NHJYM1RQOCtRU1Yy?=
 =?utf-8?B?TlZUWGpKUzJJWUlScEFYdVN4NC94RVlOTFB1UFY3NkllOURUenFEbDd5Szhy?=
 =?utf-8?B?YXJlN1lNYnN3aVRHRHBBUW1iajVuYkY3N0IxVHV0VVozTzI3dExFRTVMMnhM?=
 =?utf-8?B?Um1wZXBTdGRveFFrSUtTdjJBbzFSSFNWSFhDZXgxa2daNzJKRElrMWh5Vy92?=
 =?utf-8?B?aXNpNDJPdWh4b0JrczZkeUMwZSs3Y0JXOTdGczJ3RmNaMWRObDI4R3U2dldo?=
 =?utf-8?B?MEFyZEhMckE0eG1hZ1J2a3NSWmtQWXlQSWJVakl2RVZ1d2tuMHR6TEpkVjFU?=
 =?utf-8?B?cDdjMTlPU05yV2J5OERscXdMeHZhNUsxZU8veUxLOGtrNnJTQkc4eDVzdDVw?=
 =?utf-8?B?bFNhR2lnRUR5OTZmTzdyQlZNeTJ1aTlHUHJPWUVCbm9UNTFtY2lvVGVTczB0?=
 =?utf-8?B?bHF5akxqWkF4REIwWEUwTUwwalFhMUdzcGNpL1IxZEpYODdvUzE1c0ZKOVVp?=
 =?utf-8?B?WElEdWdlWWtZUUtJMWJPYmlRdWxrSlBJNUVuZEdVOXN4YkQ3c1FjZE9DRWNV?=
 =?utf-8?B?Z2pWelJvY0VtWU5nK0FrRjRIblJkemh6ZnEzb012TzE4bll1YzRZNDh6QVBO?=
 =?utf-8?B?SDlESW9zVUZjQTNtSFljYVl3YUtqcDcvQm0zT0JabkNESlk3em0vSk5HZWdC?=
 =?utf-8?B?RnVkbHc2cWVEYkJZaGRjKytSbThybzcyV3FXLzBwWjhtZHlUNnlrdUdhWHFC?=
 =?utf-8?B?dVlXNlNvU3l4dnpXYXZrQzNXNVVmLy9XcExpZlJIWFQvSGt3TllYMnhadnJG?=
 =?utf-8?B?dVlqbEVxM0hHcWROZTZXYSt1akRESEZ1V1dZRnpGVGVvdVQvQWxEVlZIZkt2?=
 =?utf-8?B?UHRXWlcyblNJeUc0NUhoemN5ejVnPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d364ae0-b272-43d9-a1f4-08db345aa96a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:47:00.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIOXJ4jfs5ZEg/+BQDSg0pF+0yHrKyKmPI5PqGC3W5z3mHKzNJHjNOgtaHJuJzn9gHu6ntZeeeN8pM/2OOYtDt5jE9zt6wnXXGqsoES9OK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR13MB3993
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 04/11] net: stmmac:
 dwmac-visconti: Convert to platform remove callback returning void
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

T24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDQ6MzA6MThQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
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
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCj4gaW5kZXgg
NzUzMWZjZDRmZmUyLi5hY2JiMjg0YmUxNzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMKPiBAQCAtMjU3LDE5ICsy
NTcsMTYgQEAgc3RhdGljIGludCB2aXNjb250aV9ldGhfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQg
dmlzY29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICtzdGF0aWMgdm9pZCB2aXNjb250aV9ldGhfZHdtYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7Cj4gIAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZf
cHJpdihuZGV2KTsKPiAtCWludCBlcnI7CgpBcyBub3RlZCBlbHNld2hlcmUsIGVyciBpcyByZXR1
cm5lZCB1bmluaXRpYWxpc2VkIHNpbmNlIHBhdGNoIDAyLzExLgpXaGljaCB3aWxsIGJlIGZpeGVk
IGluIHYyIDopCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDAzMDU1MjIx
Lnh1Z2w0MnZ1Yjd1Z28zdHpAcGVuZ3V0cm9uaXguZGUvCgpUaGF0IG5vdHdpdGhzdGFuZGluZywK
ClJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+Cgo+
ICAJc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKPiAgCj4gIAl2aXNjb250aV9ldGhfY2xvY2tf
cmVtb3ZlKHBkZXYpOwo+ICAKPiAgCXN0bW1hY19yZW1vdmVfY29uZmlnX2R0KHBkZXYsIHByaXYt
PnBsYXQpOwo+IC0KPiAtCXJldHVybiBlcnI7Cj4gIH0KPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIHZpc2NvbnRpX2V0aF9kd21hY19tYXRjaFtdID0gewo+IEBAIC0yODAs
NyArMjc3LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgdmlzY29udGlfZXRoX2R3bWFjX21h
dGNoKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZpc2NvbnRpX2V0aF9k
d21hY19kcml2ZXIgPSB7Cj4gIAkucHJvYmUgID0gdmlzY29udGlfZXRoX2R3bWFjX3Byb2JlLAo+
IC0JLnJlbW92ZSA9IHZpc2NvbnRpX2V0aF9kd21hY19yZW1vdmUsCj4gKwkucmVtb3ZlX25ldyA9
IHZpc2NvbnRpX2V0aF9kd21hY19yZW1vdmUsCj4gIAkuZHJpdmVyID0gewo+ICAJCS5uYW1lICAg
ICAgICAgICA9ICJ2aXNjb250aS1ldGgtZHdtYWMiLAo+ICAJCS5vZl9tYXRjaF90YWJsZSA9IHZp
c2NvbnRpX2V0aF9kd21hY19tYXRjaCwKPiAtLSAKPiAyLjM5LjIKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
