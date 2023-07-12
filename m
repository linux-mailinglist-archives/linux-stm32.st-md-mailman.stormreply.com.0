Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E47500F7
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 10:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E84C6B459;
	Wed, 12 Jul 2023 08:14:38 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2112.outbound.protection.outlook.com [40.107.215.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AB8EC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 08:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlWwXf/8dT5EtOA683eEblNmUo1ZtlEuz+lE04ZHKWl+XWHV7FG3MLFivs9LI21rbYWiN9I7pzm2QqGn27yOOcHnjDFAHyHRG5wZ0EpNrSC1bu0xvmydS1WojoqZ1ESwbQgWkX15234ksCnro1egZ2HZX6h/YHsoeKyerDXE4ktBSb4YPbylgnoUxcpvSiw/V1BzoYYkd3FZpNbwXRAsY70KORfMHBwh42uDyTWLoVBS04dXIkN3merEHsfg89D8AuPNZX8XpNPW/apuCNvzWPCfWt+8s+zIav0aUYfIx7re0NUykJNJxsqmLA8Mnf4RdHnhaZEw09gFxID4pypG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNvjmd9xpoD3cwxwNpAAcC7ffsnPu39nlxJUxUcHiFw=;
 b=B9cYnCtw8QIkNvTpBJPEiAcbNubYrxuvao/xWv72mhMOutknj7iil9cAETv5l/C1U971BfpIZrxfal2J2gEhr4cig3XBevDN0cUmGZY3n2IRmzhgZHUh54FpxYaWskJ9cDYsT4tBZ3EjKq+slhwDGYpn1/qG/aksnLli6BDvFSat1WYv7/8nU5H3PJFy5/PO/DGR8pgmDw96OoI0ucnmf7i775WORPSTPwTeCCGlRU9aQSgUxqnu4kjAUsKoFgTLox+d5jqKn0FBp7skwjPhbEZQlL7cqfVMSAJQVeCsDafBTzWgWws6GbC/ZrPPiyDj+T/G0H9ptrziPf9hxDi5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNvjmd9xpoD3cwxwNpAAcC7ffsnPu39nlxJUxUcHiFw=;
 b=nizB2NtW0n8Gdq9M9GwvYz3veDjnFOQG/ZRHKBYUP8l8+xW+Qat8AfTOrTigKYDwskb/lvnu5fb0ItSwrArHOXYfUhTv7WCFD5B5n0LFYC/2cSvXa8I2C33w+Qm+miu0Mt2537qdOfwfIagJTYNeHrWf+biqaFU/DmeWmp/VBdVcxVNve8+lQTtS+TavLQSk4TmPIgVcU2vZpJtDuW3jkxkn9JoLVTuQ6LqOoD3bTDPp2T0DmN8lpQs5z7xK0P9Q2l39cB5Pqab56+MEfasTedXb5C4U+absnEetan1Z3lAe6WiQndWX3Z8YqKBL3IXnQx4PNsbn0AYsWhvTY2HEkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6524.apcprd06.prod.outlook.com (2603:1096:101:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 08:14:33 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 08:14:33 +0000
From: Yangtao Li <frank.li@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 16:12:54 +0800
Message-Id: <20230712081258.29254-23-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230712081258.29254-1-frank.li@vivo.com>
References: <20230712081258.29254-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b486b0-7e43-4a13-054e-08db82b0066f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8DS4tOMH8XHisE0YYw3lrNVFmQaLbMvdP1761dYBUi5Luo0t8OTsjPfB89yFEZx3mt2RZOgMwnMhy8FbSozK7yBOFvB6WFZ38rdsQuHAMO5DqaZaAZRaO2vQ75i3Pv8EcpUWPn1DpSqnjHrl6rw3yCjQWfbTo3Qdr53WCFk4rUi9Om/h9QIz4Ich+A7h25Yd8z7jVIDahgmSU+1oO2KP8a9KNS6tMR4f1FqdrQq+AbUez6CrIupp70c7aVSnp0ZNEWx0DYWFuzrdEpqhKFdEgEhxOucPeFc/hiOkx9GgxZmCV+qBBqoGS8LZQ5qv8DUD2NCs+YFdna7Ydyxf1D1odgpRWv/r4ai0dCjWGW3s7omMn4v0lzp5lZ8DhWklgchagbl9jUpaPRSO1fCSd9AVholzmmVpi8w5bBFcpZCS/316Waeh/rDnYTJRKNbhhGR9HII4bEkjvSSi9aEaT7DUk7l2XqU7imICwOh5Q8W8/Xw+UzP+C2lmVqkqUbuY4NWgtquyNc27+hcp1AANFx8UzrD3UtuJqyOtbl4V3w5GtOr0LEJP8mY4pt5s7HzObcT6gunhW4r6BjcffeJcrmpHqRftsufEy16JezNb8jtpzFf2Jv+tLShrntCSohqckav
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(8676002)(8936002)(5660300002)(186003)(2616005)(83380400001)(7416002)(6506007)(26005)(86362001)(41300700001)(1076003)(6666004)(6486002)(52116002)(316002)(6512007)(66476007)(36756003)(2906002)(66946007)(66556008)(54906003)(478600001)(110136005)(4326008)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dxTlNVaVVOU1dCbE5yWlNRcjRRM0dZeUFKN1MvUGt3eFZhNlZWdUtlTVpN?=
 =?utf-8?B?aUdITE83N2hMdFVGaTJGdTI4NFJJU0YyMWtjUTVhb05TNEs3d1hmR2U4L2Qy?=
 =?utf-8?B?VjVGOEQ5NEF6QzRBVWdObDZyemhqNXZtZzRzM3pHRFQwRDNESGEwTVkzcFNy?=
 =?utf-8?B?SHBHQkxleElxdlJhaThJV1pxdDlqNFBPZjRLTyt6dlZZdmRUbng5WFdXWGc0?=
 =?utf-8?B?SzF5NVhYZnFWS2tmTXpVd2YxOTBOb3llRWpSVG5xc05ObnRxT0h3Q0phMDUv?=
 =?utf-8?B?S050TWlBZ2ZkY3F5TmRWQlJJZ1c4MEZBUC8ybWxkQjhUMVorMkN5S2JsYlJD?=
 =?utf-8?B?WTYyM2dkWTlPYlJKRUU1Ny9qV2NHUHhVcERORlFHT0JsY2x5SlZpNGlsV2Zu?=
 =?utf-8?B?V09aM1NuZ1J4cWFYNUxSZkhkQWJ1b1RqbXhFclJFZWY4WFR4UWNlUE5zQXNk?=
 =?utf-8?B?UU82SkhPWGk5eHp6dE1XTmlTc3E2RmxlczIxT3N0K0lXUlR0a05JME1TT2p5?=
 =?utf-8?B?TWFTNzFBNnpoSDdxUFdoN2NydXVjUFU2VFBBMjEvaXRJcEFwcGpzR01McU5W?=
 =?utf-8?B?c2Q5blU5UUxrSjk4OXhiRmJzekZlT0kxQ1ZaYlUzaUpWZ3dTczQ2Z1kxTjcr?=
 =?utf-8?B?ZVJ5WFRUTEVpdVZJWG1JNnJSdUM0NTdsaUE1YUlSdXFid01aQk5sTzRFOCt3?=
 =?utf-8?B?endCSGlLWlgzRDAzZ09BSmMxNEkxWkxVcUxLOXZORDBaWFZSZDJSYXJsMHFJ?=
 =?utf-8?B?VDI1dEdRUDFvT3lrcm5WdFRlbklxbkR0cG1rNHBmd1c1bnVtMnJTcmZBQzE0?=
 =?utf-8?B?UnlYUTl4UXhZKzhLUWY4THhIU1U0RVRPZ1F0RWMwdW16QTkwbkY0SUF5Z2Nn?=
 =?utf-8?B?RkFtUGl5Zjg3eGpDUDd4MUMrUktFTDVadWhCU3ArWnhtRFVTR3BZbVZNbmw2?=
 =?utf-8?B?UWpSSXpJczJxaTVVbmErZnk3L1ljQTJPUWFtckVzOTNEZUFFUEF5WndJd3lT?=
 =?utf-8?B?NjBQWkUzWEtFQU5sR05VajgxeUd5SWRKekJPMy96TVh4T2VFZFVKWkc5WXZS?=
 =?utf-8?B?ZW9mRDZIbno0ZWF5TDlqRnhkeU9JWUVTNFh1TmtLdTZnTUFxcXlVVkZCQmF2?=
 =?utf-8?B?Mkx5aitXRXdQbmJ3QlZoeGpBL2M1QUltMTN5aWx2dGR3QkpyK05TbVMwWUFy?=
 =?utf-8?B?azBlTjR0UTBiR3dHWmV3WHkxYlFuOGtKVitJYUlPbHNldVpKb0RDZ2pqU091?=
 =?utf-8?B?dS9CbTRUR2hMbnUyMFJZS1ZrUDRyUS9nVzNEWHY3RXVhOWxwenpBa2hJMmdC?=
 =?utf-8?B?VXQvRHd3aHl5RUJhdEpCSDNkbDB5dWRpQ2RvQzZBVWc4Z2RwOThlbWNyTVhm?=
 =?utf-8?B?N1RGTzVGdUpMK0NjREpSRHh5MzFlM2EzQytZNEtnRVNxQ3picEY4WkRXWno0?=
 =?utf-8?B?SUtscWZ1WXVqYTJQMklFUUNtVTFCVzZoYVl4WEx1TUZnVDdMdkUrQ1p0NFNT?=
 =?utf-8?B?K1l6WldRbURNUG16Y0ZtbHEwRWorVFBvRG1UYXZ4bmRPb0t1TEdKc1FEb2pH?=
 =?utf-8?B?bkhPdElXRTVRYjgwTXRFdDA3Z3FSc0tZaGJoL2F4eXV3dU92U3VXYUJ1bnRJ?=
 =?utf-8?B?UHZXS00yeGZqaUVWLzAveDkzNCs1cExMV095ck9HMjZyL2cxMXdyMFV3bml0?=
 =?utf-8?B?S25kSkJ5OHJXaVBiYVR5VzF4Z3hEK1RlQ2MydWIyTzlLaVJRalI3Yk8zS3h4?=
 =?utf-8?B?bFpPVnI5b1BpOEdsU3lLTUZ1WkNUVS8wSzZVYy95LzNnZjNnbDNqaGRSRzlu?=
 =?utf-8?B?b0JJUXZadVdDREI2OHpNejZXRnQ2NEZ1MXpLN0k0dGw0WVBuSXlPQWg1RERa?=
 =?utf-8?B?NHp6L3hqYldFaEt3OVpkZDRaQmxVWXozeEp5bEt3cG8vTUU3MVpoYXEvSHlY?=
 =?utf-8?B?Tjl2aTN3eEtTZk9yZ2tEV0hKTVd0T3QyZG9ySG1SaGhJY0tmdThPallTRFIw?=
 =?utf-8?B?YWxGMS9hbS9YZHhJSm1KbkhXMTZzK296ZVhOUGZVSVdyTXl0aWJhM1pVMW5N?=
 =?utf-8?B?M3lKZnlFdEF6QmtXZGhZaDd5MDhhZ0ZDbmorNTZ5V3hSdUtzaUxtRUMvcG1l?=
 =?utf-8?Q?JQ/jBFcNF3T/e6mNE3MW9+pfl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b486b0-7e43-4a13-054e-08db82b0066f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:14:33.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ8vk1G/h3HSFfMkGQQVO0ZNey1/SRHAJLLqdy++h+qQLa7SxsiqQq6AS++JXSaGUXJD1CbtgWZT9Pm+zodeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6524
Cc: linux-pm@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 23/27] thermal/drivers/stm: Convert to
	platform remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KCkNjOiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBZYW5n
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3Ro
ZXJtYWwuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5j
IGIvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMKaW5kZXggOTAzZmNmMTc2M2YxLi5k
YTZhMjVjZTQ0NjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5j
CisrKyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jCkBAIC01NzEsMTQgKzU3MSwx
MiBAQCBzdGF0aWMgaW50IHN0bV90aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBzdG1fdGhlcm1hbF9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bV90aGVybWFsX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG1fdGhlcm1h
bF9zZW5zb3IgKnNlbnNvciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJc3RtX3Ro
ZXJtYWxfc2Vuc29yX29mZihzZW5zb3IpOwogCXRoZXJtYWxfcmVtb3ZlX2h3bW9uX3N5c2ZzKHNl
bnNvci0+dGhfZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBzdG1fdGhlcm1hbF9kcml2ZXIgPSB7CkBAIC01ODgsNyArNTg2LDcgQEAgc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtX3RoZXJtYWxfZHJpdmVyID0gewogCQkub2ZfbWF0
Y2hfdGFibGUgPSBzdG1fdGhlcm1hbF9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZQkJPSBzdG1fdGhl
cm1hbF9wcm9iZSwKLQkucmVtb3ZlCQk9IHN0bV90aGVybWFsX3JlbW92ZSwKKwkucmVtb3ZlX25l
dwk9IHN0bV90aGVybWFsX3JlbW92ZSwKIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN0bV90
aGVybWFsX2RyaXZlcik7CiAKLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
