Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F56D4CA6
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:53:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9BB2C6A610;
	Mon,  3 Apr 2023 15:53:05 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2131.outbound.protection.outlook.com [40.107.94.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B521DC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ05EheKz1Hd7/BFojYWpszyh+cp4f3gfREiyIjxlNlYTvefkwwTtfwV9FuDeV2xTotN1yTmA/9QFM4Y5B2VdrJ4drA+QgAo6fhSErvM40Hlqi5zMCbFAc7JFmG4OY4oah0ex3yemmX8JZlCjdI0fDr+0ZTjJZfRszorpUnxu2LoBQR76MWl2SYyVqj0EESKvSpyu+UioOzOqBVvWUYyl8Nu0r5lzTWU3Y+IsJ9NhK5GBZ0IXDgak2Vb6gCb8XKO7G538AYElgAuCWMzYKx1RL5fLBfXD2EE5F6Q7eeTILuON5u9095y/qYLNvs1S83BeOS4vr5RHKGniit2sE7X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F6DCkzY7x7C+oTr2ABQ/B0b4KuCx9ypSsK9IexnGpE=;
 b=and2UvBis/O0xfzoSxAkKS0jk17mD/I0oH95uWgizPZijdS03lzvc7mTFweUr8X1zJVtcrhgPCm36iCAVO0bqcom7DMb1pu7H5lWDF6RlQes6LDfcxVvxORFkFM3+CLhI4GF8mRakg7pGr0/cVWDoxwmFN1BWshVja5iVA9ZpXRwtgCtMUaKK5tmD2OIWp+JInuUdlnv6+FiUDWI7EYc7selWZEFSFPSgtVDJdU/572Nvz0LRtSmf5Nyq/bnjixq4ocS6FeWXIvxXxKRLnoHAeasI4LnlSw+9HLwRtKY6xpM+7IjtU9/MJARs7vWGYWc05rTIInOVUfEJC19XjanDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F6DCkzY7x7C+oTr2ABQ/B0b4KuCx9ypSsK9IexnGpE=;
 b=jmlzwe3biYkXV8JrnxqJHt2UOOsAKPkM4SWOadplZLHzEtrO0JPKGLLJ+U79voing0zlNg+3HANS+htd3x1PXPkaMi6tuOv/DV+A+GT7K/BUhuY3sBUJc9Yuvm6x6nKM0If13cuQ9kgP5rpqoMCek5eEfhoHQZkrILynaJJ2Bis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by MN2PR13MB4069.namprd13.prod.outlook.com (2603:10b6:208:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:53:00 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:53:00 +0000
Date: Mon, 3 Apr 2023 17:52:51 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCr2U3EbRBr4NtgX@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AS4PR09CA0004.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::10) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|MN2PR13MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 587c8265-4b04-488a-e30e-08db345b8044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jduOpqFTMO7Nff/9zjVfw5+VkUOEdZcxn8WZcOTtmmex2eOiG/33spwMmnq7PEhJBwDYTEPzMKbSizYleJ2gQ5BQZZtnDjfCFqqaOOXDtCuazchfdUZvXlzIBtfl7EYyLpQ6rfX6ABTrFj2zrPZgQB5XJtdzsCQNy7AJOjrRErDglu2FOLbLrmcGvQPSo6wwnoeMZxDjYVYWO4vlAybQ24J5xtqG/7bTSGHg0W7cc1gpqLN2uyGrUAaVMfkEmGvR7GVBHmtRa74nkCrKHQ3kZt0hrJAYYbI91Hl4p+HdU1SZv/T2yL6yoM7iPSB5s08QkFOaF9zKU3Lg/7ItUCgrfgF+iLW2b7JZry8O/BP9ckKbZk+GtpsiIZomUv2bPx80bbUyZ37JGLrmYrTdl/sbAyRzoKkP7wK6kIy5QH1dh7jFjCUhjVZnkYwxQJRSsVC5JSS8JAr0B2SUwWUPsHKm6bzqlKV6w2Gb0+NPwv+sAqhTsWkP8DoNgnCHpzFGK/Yp+AnOT8j8kUhotzKvGltiYaL8QQa5AodeQa0o/bxo9S1JKouYJIvPoYarziRhEACK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39840400004)(376002)(136003)(366004)(451199021)(38100700002)(5660300002)(7416002)(4744005)(44832011)(2616005)(54906003)(316002)(6486002)(478600001)(186003)(86362001)(6666004)(6512007)(6506007)(41300700001)(36756003)(4326008)(6916009)(8676002)(66946007)(66556008)(66476007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGEzcXViT2hDaWUrQUJrcklIWS9BSkEzbGl2OWY5U2N0aHVQZVNKWTg5Z0R2?=
 =?utf-8?B?YjdVbVVqUXM3VWgwTHZmbmlJWmU4TVRxQXJ2VGlsczJ1eVdlUjJoR1Z3dTA3?=
 =?utf-8?B?c3d1Zjh0SnBRdGhoaldvYTZHK0tFRHo0Q0JlTVRsN1BPakhrRlBpMnJuT3Fl?=
 =?utf-8?B?bXhmL0t2T2c1Zm81clRPSCtWL2VaU3pzNk1FS2VCM2RQQ1ljU2ljRXNuaE1k?=
 =?utf-8?B?bnNBcHYyWEgxM25UWDIrSnhBMEpFcTdaSU0xUTRnL2Y4b3pBYnVidHAzVTY4?=
 =?utf-8?B?RVhFNG84Y3krd2Ruc2NVSU5HVnZRelllcE9QMzIrY0hER0VwNHBhbjFkaHMz?=
 =?utf-8?B?K01oZFBTZG4wNW02SEVxZUVDdTdVNVJKbUYvb3M4Y2J5a1FxZzIvKzltRjk4?=
 =?utf-8?B?UE9aSzlQRUt1alJMMkMrandFbS9tV1BwY0JqMlFsSGh0RjV6WXVBZGh0ek9x?=
 =?utf-8?B?MWF2YmZxckRsMGQ1YUZQWlVFYlcya3AxZWZsTG1MUzlNSkRTcUkzVVlwSUZU?=
 =?utf-8?B?VHBuTWk2eEhVVVJaQlpEYmFBd2hCdTdMdVhTenNCWnpibFNOU3BLU0toNERN?=
 =?utf-8?B?aEJiODdWRGs2YXRaMjVYeXh2RVJpSmQwMUpkeGxpSklUVFlMSHEreENId01U?=
 =?utf-8?B?aXJBZXNremlDMWVRMHZKYmhhUHBEZXBkQ29PbDE3UW1ZQVhFclJ4T1N5VFNU?=
 =?utf-8?B?VENCMGwxYmR2NHZlUTd1NW02UTFQcElrVjhSaVFEdlYrcHQ5WWRtNmlUdHpQ?=
 =?utf-8?B?VXRqSmgrNzRjeWQ1dVRaVXE5M1BvcnJsb2VZSnQ3eU95OHppOEtnNDBNS2U3?=
 =?utf-8?B?aFQvNmV2b0k2b2x6M25CVmJFNjEzbmhkcHUrclJpSlV0SGxtazZkR3NJN1lF?=
 =?utf-8?B?czduc3hUQ3U0VUhsNXZNN0Q1UG9XZWV6MHRYS1dySlZuME1PY0FldjA2c0NP?=
 =?utf-8?B?cWlMd3VmUlQrQWZ6bTVVdWhFQjh2UnFIdjBJcGM0TzZReHJZU042Tno2cGdL?=
 =?utf-8?B?OTErenNKUmM2TGZlVmtDTlRWNXN3K2Zwd1BzYWNDRXpMUGZnQjM5aEFycXJF?=
 =?utf-8?B?ZFkxUituYUpsYmo1RTdYNXg1K2FvenUvNkxjbE9QaFF6ZG1SaXMzKythWDIx?=
 =?utf-8?B?WTB0dU51NzdxUlkrTGlxYVFDa0pIeThvN2dULzUvaUxFLytZeU1xanA3UFV0?=
 =?utf-8?B?SDh3OHNKOHVYMDd1NjJxM0g1N2tLWmFhek1WUlFYR21UZEJTS05iaGdRUkRr?=
 =?utf-8?B?S3c4am5jak10S0hTQmlSZkFMb0dGTGtjN3ZhbzZWQ0hvQ1l5M0t1emdEOUE3?=
 =?utf-8?B?cUpFUmJudjgvVWJ0d05TREY1cTdjaXZhYkhnbXF3TnY3SytvWk5ac211S3Ns?=
 =?utf-8?B?R2VvWTR6RkQ2eC91UFltd002YU1peWgxQ1lpNEN0ZkpTaFZTU1dFTU5DWUdk?=
 =?utf-8?B?ODJ3aWp1dkZHb2cvL0dPb3dVNnJkdTVOUjVvNm9peEJaMG5aK1I2azdYY0V6?=
 =?utf-8?B?UGNrUzNzYkJKSXg1OFRDK2NjZVNVcnFzdTJNYWc2cWowRWp2bm8zbkZ2cXp3?=
 =?utf-8?B?SldGN3M2MHg1SDNvU0U4ZXBEcjM3QThWSHR6Y1B3QkU0cWhxR2c5ZHljZGth?=
 =?utf-8?B?NE5LK2Z5RlRMeEVFdEkvUG83V2xVd0Y3RXdYYjF0WjJDczE5ck42Vy9pTk5k?=
 =?utf-8?B?a2s5VXM4M0VOd292STN1N29iOWhZK3F2R0V2aHlEZmd4TDh4MlJIclZZSnNY?=
 =?utf-8?B?QTVnclFGazhvTUZKKzJxRXYyWlZkaU5mdi9tVStqV29ZZDBDVUJsZU5BODBa?=
 =?utf-8?B?bk5NM1BvSEZXVEJpRk83SGoyQ3Nzd0JubUo3RGRUdllYc202RWZKb1NJdHJH?=
 =?utf-8?B?eGZCRDJDOFdJbWtBNGFXRVN5VWFCMmFiRFNXdGZYY2VVcGVuU09aSXlwNVlr?=
 =?utf-8?B?WjVPRitWSlVQaUxCcnVSM0xwOHJQMW90Z01yeVNSdXFpNmx4d1VDOFN1MWRW?=
 =?utf-8?B?QU5ZemtNVlVONHpiTEhwQkRxb2ExSmJWZzBQMFdBUGhsRkxEMzhLUjhjN0J2?=
 =?utf-8?B?bUJZZUhrMzFYWW93a0ZGRWxQQzdtWHhYbDQ2eUdPVEhWUGFvT0FtajRVMmMv?=
 =?utf-8?B?dWtuQ0NZYUw0SnB0MmhSZ2FIemhEQnpycTF5T1M5RUFxR3pQQlExNG5KZ05Q?=
 =?utf-8?B?UjE0L3Y5cDIvOGpscWRxd3V4amtiM3kvd01teC9CNE1kWHNQcW1HMERHTFU3?=
 =?utf-8?B?QUIvdHhEZE1JU1ptYjVqeFR5TEJ3PT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c8265-4b04-488a-e30e-08db345b8044
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:53:00.3693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLzJM2CT/06zXQ0JHbAbLPTUo7LlscYeMKZq/+iDmCMQThshFgJEa5Lsnxy6vgctIOg6QrOz7GUskzCiJ4lg6cBBWUtaIroDIBrDuJTSEZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB4069
Cc: kernel@pengutronix.de, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: dwmac-sun8i:
 Convert to platform remove callback returning void
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

T24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDQ6MzA6MjRQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
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
