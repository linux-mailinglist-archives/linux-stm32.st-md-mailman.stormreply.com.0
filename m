Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 000366FB6C2
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 21:33:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB9BC6A606;
	Mon,  8 May 2023 19:33:32 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2110.outbound.protection.outlook.com [40.107.93.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D41CEC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 19:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwiYB+AySIxpj+EEHjPtCriL2f6GQo0auEfLFENlf5opbYOkXruhqy5cZVi04dQNW1axVGx7UigZQXgF4QvC+pc9T2W5R2lfXk6DG45tqZetoFa+lBFCVXrglzjSuw9+MHRcvrisQt4efRYvAuXKu0plG5jgzqv9oiarWhDhykE61DnHVv541STTG6obRCeuhcTzjnbf8JoZmbIb9yjLBqL41mGph/G+9tbRTqiaiwPTghL6pA8DfyuKvwEk7e4wuj0UiQHNZoybsd7T93d7iva4ejVqRghJIkqzNfLzereIVqDgUTCv12EpTrQhMbZ63RB9d7NFM/HWY18vCZIJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXG6b7mGseq/vYBZHgaCkVN49X6djXXVyqGlJlblIAs=;
 b=gYGueAvG4WHZC4nJGMVOgvP1wT/IlUoh6krnSVlrDhe+P40WnO2I6CM1m1tDLWuln1PggSdp1iq9LLcvNzOTripjUYxCmZ+NslYAzDPBuJoe1Qw5XHwEQ2HIZJ1KxU3tHJYsYfpyCH7eUx6uLRAgdQebC0sdDlL9B+k5aLVZS4qIdaYqWOzOWnQDD8InrzkDHFPMxwbRSFXp3BNjFuMGmFxVshdv5vMqDywsqEH5Flgg3eEgOK3J2bodKuhUQqhhzBRatj3GA5+4qHiY8IBbcHAm/EIX5YLpZGHxFCxu2nk8ydloz+ayu8AC1IprilD1+IdAHmvB/igQmzejWCC9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXG6b7mGseq/vYBZHgaCkVN49X6djXXVyqGlJlblIAs=;
 b=ATtFZcraXer4Y9VPBLQbrl5k3JLJvIA0HVLqwJBShI7xOm5kZDPel3S2XJ2u4EPDzHuwNCNuF2rIoV7za9BrDWOURQABV6ebV/vjXuuGiLtfSIalOw7TpWZn0JZyxHNMjxvqFHn+pZkE5i8UkWEo4IhHwSIAt+0s2RzLU3mBHTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BY3PR13MB4834.namprd13.prod.outlook.com (2603:10b6:a03:36b::10)
 by SJ0PR13MB5707.namprd13.prod.outlook.com (2603:10b6:a03:407::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 19:33:27 +0000
Received: from BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::d98b:da1b:b1f0:d4d7]) by BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::d98b:da1b:b1f0:d4d7%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 19:33:27 +0000
Date: Mon, 8 May 2023 21:33:19 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZFlOfymAc8vgboO4@corigine.com>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-3-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230508142637.1449363-3-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To BY3PR13MB4834.namprd13.prod.outlook.com
 (2603:10b6:a03:36b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY3PR13MB4834:EE_|SJ0PR13MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c48673-5b06-4c7e-a804-08db4ffb18a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymtXOTXCstB+HA2X9pHIPiLe2sFqnWqNLyf2ScIM6wDjGv2ur87y0Sxseod7hdgYKg7rzHW2K3JbMwpp/ywDURYwAimm4w63XpP+H6/ieQXaQ+tMFTT+C+Cu5M/J3YnqCd/FO72EwmD94LSaEgj6BJsBJSzgJ+ssCPsvRxs5Lul3et6esEx70Jf/5HVE2T0okBXDR3UTdBogNQk5Nq03ZwclVO9PZ6X+009WDZ9g1+eaxtuCafZBi+SRbBTqIY8jpc05/+dW51+PsUSBxmdlFkONssNALVqJK3QaweO92nECzlJHzKacFxp6ln+ljp1+Tbnv/X2l7+zOtWMp3c6fXXLj3doVdrHBAVpZLA+6Z72ttOkZhN0LBOCsLQB/++yK769SQDbKCFZW7HJP06Je4znE2ZzJnlXAZdkgmHa9iQ/EwMOB0UWaFSj9RP3UOees3IyiEpH8qGwSRJRbH9fTNeJIsUZvEuCGt2gnVqL4iLtOTPvtrfr1FZELtsrMufpmb5in2jYTqA2bWvJWRWEmfYyiVdoMXF30sagFA5GIG5BQsEsvcfcnj3qzy1liDD/1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR13MB4834.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39840400004)(346002)(451199021)(66556008)(6916009)(4326008)(66946007)(316002)(478600001)(6486002)(54906003)(66476007)(86362001)(36756003)(6512007)(2616005)(6506007)(6666004)(44832011)(5660300002)(8936002)(41300700001)(7416002)(8676002)(2906002)(4744005)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1UblJuSHY5NlBRQm44T0RnQXFNNno0NmhiRGs1cmFxQnZ0NFBqNUJNQXRn?=
 =?utf-8?B?YU01RGRObDBoclZwSWN4VDk0bnNOamxyTFRESjc1aWdZalUrc3BDTksreDBM?=
 =?utf-8?B?bWR5ajBmcFFWS3BPRGdXMzdCMGhsV3UvYkkxK3BjRmh2Z1dpeXdONGlOR2c0?=
 =?utf-8?B?cE5Wdkh4ZzRpc1F2VHpwTDlLYWQzSVZERUE2cjRhWW1ZZWw5WDBUMlM0WEJs?=
 =?utf-8?B?N1RkS1FnREZjMUhQSk5GckJnVVBQSUg3d2o4d3NpYXYzRnY1b3hhVFFuaUdW?=
 =?utf-8?B?c25kSGs0bmd5UUNLNWI5cHNLR2ZqQStpblpLa0p4WDZGNzh3OXBSZEhZZzhy?=
 =?utf-8?B?RDEyZm1tSjFRc2xlSkk3d0ZPQThKK1ZzdUVVcFNyV252d29nRWdoamxRcDFY?=
 =?utf-8?B?YllMZjlGckZqcVhJc29NdHJzbzVES09vTS80U25TRm1EU0xGb3ZDK0t4QWxt?=
 =?utf-8?B?dWkva2pLb21kNy9yWkhIWTRCYldKR1dqN1dPczlVNTRUQWNUZWtZOG1Uc2pk?=
 =?utf-8?B?Z2EzL1Z3Ynd3aHpOWXVGOHVKZ3dnTFh3c0x1K0tqdVpqbWtCWklRNGpGb2FT?=
 =?utf-8?B?cGdwSFQ4cEtwcVJBckwzMWZsVmVMVmJDS2xhOTJRc0RDVWNhT3llWEptaGJk?=
 =?utf-8?B?Z2NkY1dBNWVOTm12Z2xubXBUNDIyK2kyWVd1Q2FzZ0NxblM4ZzZndmJxd2Iy?=
 =?utf-8?B?c1kxTWIrMDZrYmZoVnRFTVdxME1kL25GVFZxRzI5Qm1jUndNZVRvNmtxTk13?=
 =?utf-8?B?UUlEdGZxZ2Z4bE5Bem9xUFExSkR6TEkxK3B4Z3hmVDE1ZXkvbnRWak1Ebm52?=
 =?utf-8?B?cjB3OFc5cHBuYkxIem93WkxpRDZCZTV5NHFQdndMUXZXR3J4aVJrRUFCYS83?=
 =?utf-8?B?YTQzakMyUWZsSmx0MlVOdDJPai9GVU9CZllPVlFKdlBsYVNIV3hZVUhKWTBk?=
 =?utf-8?B?UlFrRW85VXpTUW5vSjM4WHY4b3krOWdpSWJtbnFMRFU3NzF6MHlxMFVtbWdD?=
 =?utf-8?B?MnIrR3ZCS1BWcmdReUZyNWJneWovTFVaa09NYzhmSy9PSDZnWUJYRzdBOFZ3?=
 =?utf-8?B?NkQ0VmdqL0lWK0JWYmpSV2IvNTA3d0w5VTQxK2ZQUk05VUFjRFQ4eTNhYzVI?=
 =?utf-8?B?QS9ZQU5OMmcrNlc1ZUNRak8yd29TbUluMFV4b0NlalRuOFhhdElvME1TWEY1?=
 =?utf-8?B?K0ZUb28xUW9ZbUovVjdEQllUeG1MUDE2VmNGaUlWSDl1T0llNHhOQ1hnMTdP?=
 =?utf-8?B?VVkxazJNOHpKSXdnRXREU0JoTjJQRjZVaG10c1ByY0dXTTJOVWpUVEpCZWpj?=
 =?utf-8?B?cGM2bUFUYU9ROHhqUkhaMWEzN2VnVDFjZEo0YWJnQ1BBR3FacnpCRkhJbEU0?=
 =?utf-8?B?SE1kRld0cGFrMzR0U3RlaEpFb28vOEk3d0hHc2l3c1RaQkxYY05tclNzL3lu?=
 =?utf-8?B?OURReWdMV3BNTFdvOTB6aXZpNWNMUHJjcVJWQnVMVVhLWEtoVW5IUVI3TkFC?=
 =?utf-8?B?Z1dwUVU1a1Q0RnJ5UGs5ajNLUmRZL2cvSDd1eXZGaTBTaWd5cHVrVmEwS0VJ?=
 =?utf-8?B?SWMwU050Kzl3cENvbjZFejVLMmpFSVRvMmxWSERGWko5L2Fzbkg5dFhLK240?=
 =?utf-8?B?ODZYWVhJOEw2eHhGU2E0aEVORWJSYWlvdmRlNlhkVVVtL0tEbDhhbDc2WEtH?=
 =?utf-8?B?YzhNWGlDdktCdDBDQllHVDRFMUIwSGdYNGJaVDBIaWRpcTNqQkptRG1mVEY2?=
 =?utf-8?B?ejZGUWF0V1h6dS84TmJpQmw5SHZZZkxhVG5OdEdiS0xIMW14cEgySlZXOUdT?=
 =?utf-8?B?eWhEMDZwMXk0ZlhiRGYzOU1TNlExRndPNnR3R0dWd1MwTG4wZFJrYnNwdUd1?=
 =?utf-8?B?QXQ2OTQ2OUJoU0VBWWFid0pJYVIzclBlUi91UHk2L1hvQmF1WTRFSTdBTndq?=
 =?utf-8?B?YXVTN0E0SUQ2RHJuVVFpZTJGTTFRYWQvRE9kV0Rjb1JVWHVsOFUvSnRpQzFS?=
 =?utf-8?B?eUFsRnBNWkdwNjVoMFpRM294c3lKVnVNRmRpaFBVVDhMQ2s3UzlxMVZvQkxN?=
 =?utf-8?B?RE56NEZQVXJhaDl4YU1ldDM1YWpwOVBWNWxKb3VxNkE1TWFQRzJMNUF2OHlP?=
 =?utf-8?B?MWYxSEFwMXgxVEVBaUdyczJYWkdvajRQWFMrbnV3OXd0dnRyTXJ0cTd6OUhw?=
 =?utf-8?B?RXBRNFlQM05leDRyZldNcVFPc2krRU85QUp5Nkh3eVI5SFFFajIxSlk0MWRJ?=
 =?utf-8?B?Wmp6OStDV25Qa1pPelhobUxGeTNnPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c48673-5b06-4c7e-a804-08db4ffb18a6
X-MS-Exchange-CrossTenant-AuthSource: BY3PR13MB4834.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 19:33:27.3751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT3NN96ftyt2VDX6Xj/MsCAsZelsA674ITVQ6EBuuVipDVNO5wHvmnWJUhNH6+73kFo9Y7TUyP6lxNJYzO/9UQKwwfjBsMlChuEUxE8VdxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5707
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/11] net: stmmac:
 dwmac-visconti: Make visconti_eth_clock_remove() return void
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

T24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDQ6MjY6MjhQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIENo
YW5nZSBpdCB0byByZXR1cm4gdm9pZAo+IGluc3RlYWQgd2hpY2ggc2ltcGxpZmllcyBvbmUgY2Fs
bGVyIGFzIGVycm9yIGhhbmRpbmcgYmVjb21lcwo+IHVubmVjZXNzYXJ5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
CgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
