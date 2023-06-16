Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10599733247
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 15:34:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B35D9C6A610;
	Fri, 16 Jun 2023 13:34:15 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9694C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 13:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rj13uQkjD0Q8KuX1JdcMhGPftR0iWvyLNsfFyCwU3h5SH+uXElSmOtUf2g8lt5ih1khWqBPEulHXIkXGfF1zjo9L5bGBDSp9QVh8xsEoMaBMm5BJhS19BMT1DXmL71uISpTStejidB4t2pZGnyysQrp2asJhHFO217hXxQW/D8EI2FOj76Kv/KUjOxaVkIV8BnbU/C/lCssUBR9eKsKtTXCF+grrd5spGvHlTLU4FHH9QlosVeZTA2t0frJfSfSxKnafLAgu08tNW4lby6dSjve7Spy2klzWYGAucbaneWtaizRKK4F3IstyaM/fAArvyxkSVfgmDf1ismmZOQ3Qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDGLgsnVK2pDQSL+JffKvAe970DrwfRVp4XtOdPqoUw=;
 b=HDF2gjBCx57wfnlcMd4v5sELAHYKSNPNtWxNlO2/i1enZTOCH/HzJHgfciufiEL1OKmfn3af6jXnQ6k2Xr4iHvA4kdN9Ma5Qimw9uS0ddhdDZyEiaIoYycGuhkBMsxb0AziLOeMEV9TaBchxGnLApioZMp/Wcxgnjhn6tsyIJIvQkUmxGNdoOYyDlFGf4dgBHresfQp4vC2Q40EmGkcv0lyZU2owDzXl1rSBjqbbgs/TjTi5O70ebmcRsryjvln6Cyodtrms0oKm/edWYJA0BTBauIwD+3URlJS3ksBLzR8yv5gSCzpRuR8hWa3PeVOzuxYB21oluOjMtruBN9OgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDGLgsnVK2pDQSL+JffKvAe970DrwfRVp4XtOdPqoUw=;
 b=Djqoadl/JB5sBKU8rBF/hujmHhRSlEH1x5Zr/SS/dRsWgh8FPz57DxvPLBx/Slt01BtBfT3SqGXUVOvl3i3/EzURp7qLxe4TW4nkqdYDV/4C2x0bjKdH2DfDmUj5WWNEtjpas+m7b+Wz7MxPJ/Lyp4US0c8dso9gWVPnKvb5yeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BN0PR13MB4741.namprd13.prod.outlook.com (2603:10b6:408:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 13:34:09 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 13:34:09 +0000
Date: Fri, 16 Jun 2023 15:34:01 +0200
From: Simon Horman <simon.horman@corigine.com>
To: alexis.lothore@bootlin.com
Message-ID: <ZIxkyfRIuVcmCzmD@corigine.com>
References: <20230616100409.164583-1-alexis.lothore@bootlin.com>
 <20230616100409.164583-4-alexis.lothore@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20230616100409.164583-4-alexis.lothore@bootlin.com>
X-ClientProxiedBy: AM0PR10CA0120.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::37) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BN0PR13MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 99287348-1802-447b-ce56-08db6e6e5d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0UMqj5KhexdE1v9+qug3hTBJSoXWmvve8HcAxkMddVK6IwkLLtjdav+dAFLU072pFA+HtPwq4bWhnofAg0l9gp6Gw/MfebLZxy5+ZEWIFfRGJTg/ErgQtd5ZEbRC/S/lTlf1TbQMtPobmZCF5elOZ92hfYmmpzc2RsMVd0eeklQk9Oun5gJ16K1UEE3wFLZ67YLHWUe7RsFGdL4aa1rgAW6ygGi1HbpAY8TEYNj5DGePtuPsemq5uVygEktB3jvwyTxkktoLe+kUMYy4iqVSpxaLiUdGDd775hBor/pPAQ43oLO3rwONYyU1FIP6vi3gVpCIEXkwnSgXXDE1pPqC8NN+fAiR8qU9Pd7dga6QKEw/R5TOfGvkS6I1pEYS0az63q5oGTzDtbDc4BcRCMX9/GVPA657lHZz1AygyQ7ZTX110Zf9ElZEaaTepsCGUUjKM8IJYAmbUP/keepUYvp4HYCuWglsSPetTYdsq1HCuQP5VtGOckU1ry34nChZ7JzwbMLjoN8kJEJBPDZEM8XNTgFYFS8xLM6CARTr6NF0+s7TlEy3IrQktsDbAKN5KR9DZ08nc2L7l6L6bYBqke0skrxYFajTH57AZ1hAETVefc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(451199021)(6512007)(6506007)(186003)(6916009)(4326008)(66946007)(316002)(66476007)(66556008)(2616005)(83380400001)(6666004)(6486002)(54906003)(478600001)(38100700002)(7416002)(44832011)(8936002)(5660300002)(86362001)(41300700001)(8676002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05zb0lVVmUzT0N6QTVhWWF6N2lIUVp4RFBwSUxudUdhVStRS21SbEJqcWo3?=
 =?utf-8?B?NWQ0M0tLa2tLRHZzRTFZb1Z1MU9xeTlFc0szUXR6L0hXOTdZdG51c21NRDJK?=
 =?utf-8?B?SFNGZVlYY2hUdENrdVVoQVdOZW5VcUlVZ1VGbGF6ME82RkdMSEtaNGw1Q2tm?=
 =?utf-8?B?WlMwNVBQS2xWRTdaRGVWVS9HdkNWQldYUVVnZno4ekEvM0hhS1BFQUNSRlBm?=
 =?utf-8?B?MDZFZEZiUWlOVUlmUjFSYkxlM1pMV0Exck0yWXJGKy9TbGFUTXZoM29lRlhH?=
 =?utf-8?B?ZXdpNEcrZTlDejRuRkVnd1MraXFaOUhoZ2xsQis3M21zeDhkb0hJcUd0SUxa?=
 =?utf-8?B?YjJJVi9za2w3TFhxMmpoaUJGYlc1TGI5dXpNdWRuRjVydUIzaTdBaWFsd1Ji?=
 =?utf-8?B?b056MDBPK2N1UGo2eEpZSGVRK210eEMyNG9TZG0xeVNmbkE0VVEzcmcza1k1?=
 =?utf-8?B?MkFVRjMyN2l1M0ExditVWlZOekZUOE5CVzlqakN1UG9YSUs5NC9JS3lYem9I?=
 =?utf-8?B?OHJVUHBqcDlOa3VhWkFyT0RoNkNTcmdkeVJWR0tRc2tncytGUVNYZE1mOW5J?=
 =?utf-8?B?cWJORFpMNGpJQzh5eTViWURKSEVJbXQ1SGVweHdOc24zYkRwQ0l0UG5lWWRn?=
 =?utf-8?B?RWJRdHFlZCtQYzZ4Ukl4Smk3SWtpVGlMVGpzOEVibzdlcFZiQ1ZVUklUMUxO?=
 =?utf-8?B?eGxRazlFL1pJZ0w3QSt2SVpmeDFBMnBzNTFUYVJTZE1ZamdzZmFoY0tTb1BJ?=
 =?utf-8?B?bXdKdVJjckF5QVlGWXlYaE9LVnFRNkRIQWtDNU5LT3pTVDBGenVvUjBNWDlT?=
 =?utf-8?B?K0piNkM4WEExNTJuNmRPS08zU25ua1NBbmp3S1p3b3hhOGJLVVlBZFR6U2tT?=
 =?utf-8?B?WDN0RlN0MnFpSHF6MVM1UnZmVHBFMWJHa2tIaUR4VjE2VVlPaUswdDkwZVJn?=
 =?utf-8?B?bktONVc2anZpNHdYR0xUNm1KUUNEZEt3bkVCbmNwaGwzQWxNSWcvTWZwQnJi?=
 =?utf-8?B?d01XdjJ5bWlaRmdzWkJ3elllaW9wSDJtbGR6Lzd6ejFDamppZG41RjEzS1Zp?=
 =?utf-8?B?aVFrNU9nQmxBVTlkR1V6U3IzbU1CQWxIRkVxakx0SWpzNmlIYzB5OWcwZ083?=
 =?utf-8?B?TG1mT1Z4RUNCY0dTMzI3Q01XeStObW15bVpwbVpiOXBYWXNIV3RNN2pCN1lj?=
 =?utf-8?B?MlpqUlRJSUxGRSt4VmZ3SW50R1J3ZTdFTUFPOW53OHF1cXd4enZQVnc5aWRz?=
 =?utf-8?B?dEVHaXBaeEpQMU5waUwwVndaY3pPU0xFMEVrRzl1YzArN3p4TVMxdStGVHln?=
 =?utf-8?B?eDdaT21hWFY4VzgzNGNtYWJoQjBWb21MbTB6MStMWEZHTStKb2NQRisvNTJG?=
 =?utf-8?B?WHBadVBib0hEQTlZQng3WlpvdVVNaDJxOWVDa3dOR1FMbjBNNGg1MzEvQTd4?=
 =?utf-8?B?ZjJEN0FDb0VKWmNTckFKWUJYMmhnQmxSOU1rL2UraFBMbWcxQ2xMeWlBSU93?=
 =?utf-8?B?N04zUy9RdmVDMnNkeldSRU03b3BmRXkwR01PM3BuMnZvNjJXQnVJR25OVFVE?=
 =?utf-8?B?WTZUcnQvTmc3L244ZnZFSlpIQlFQL0ZtN0Q3S3BETmZrNFp6U0x3TUM3cjRs?=
 =?utf-8?B?NjkwZjNyNnZIOE1aV3Z0d1ZnKzZtTS9tdmhmbFJuU0NyTjVwOWFTcUNZQSt3?=
 =?utf-8?B?WnI0TzFPc0t0N2paY3hhVzFRWWs1VElNYzZnbVFFd3RXUXgrUjZTSnIyUFAv?=
 =?utf-8?B?OFErUkFIYm1mWk9mV2V2YU1HNUgwUzgwV3pCbndtVyt6bVg1Um1UUEZvVlk1?=
 =?utf-8?B?NTdTS2hnUWpwa29uVU1oWFU1QmxXRjlMNjlabHNPaG5sNGNvSXk3b0VlUitT?=
 =?utf-8?B?bTN4Tm0wQUVGMmNoekFNY0hQU0luNktjUFVJS2JHdytzUTlNbGlGL3Bib3Vi?=
 =?utf-8?B?TzA4THhwL2ExNy90MWpvMFlVSjFiZHhkOWJnOG9JYUtHbVBmWW1uNTluMUpL?=
 =?utf-8?B?OWlNZTNYeTd1bngwWHd4QncxVTdiTHNxb0RpN1M0Q25kMHlkQXVlcVNKVkJB?=
 =?utf-8?B?TDZkT0VoQ2RScjZjU2JVRzRHUmppcElLbTNtRzJDRTNGR2tSMG4zTGdMc3Vq?=
 =?utf-8?B?cGR2T3ppS2lJUXdZZm1nQTU2NXdNTDJNYUhveGxWTklVclFuSVRjeWZvWkov?=
 =?utf-8?B?UFIyekd3ZVFNcWUwSGx2ejlJVDNwSVNpd2dMaGlSTGJqejhOaWRqZTFHbFVP?=
 =?utf-8?B?YXBLOGZZNFMwV3RNVFFmcDJqelJBPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99287348-1802-447b-ce56-08db6e6e5d5f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:34:09.6730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqBudurq9dnoXiUo/HTgJOgR3H7rzSl/+Od22PTRe4KvHDrE/GOyZIPPySSkIPN9+NViBFPd7F/zvN/+PEN5VQga7erDTKCW9dcoAfo4DH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR13MB4741
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/8] net: stmmac: move PTP
 interrupt handling to IP-specific DWMAC file
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTI6MDQ6MDRQTSArMDIwMCwgYWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20gd3JvdGU6Cj4gRnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KPiAKPiBBcyBmb3IgYXV4aWxpYXJ5IHNuYXBzaG90IHRyaWdnZXJzIGNv
bmZpZ3VyYXRpb24sIHJlYWRpbmcgc25hcHNob3RzIGRlcGVuZHMKPiBvbiBzcGVjaWZpYyByZWdp
c3RlcnMgYWRkcmVzc2VzIGFuZCBsYXlvdXQuIEFzIGEgY29uc2VxdWVuY2UsIG1vdmUKPiBQVFAt
c3BlY2lmaWMgcGFydCBvZiBzdG1tYWMgaW50ZXJydXB0IGhhbmRsaW5nIHRvIHNwZWNpZmljIERX
TUFDIElQIGZpbGUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5s
b3Rob3JlQGJvb3RsaW4uY29tPgoKSGkgQWxleGlzLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoLgoK
Li4uCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYzRfY29yZS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0
X2NvcmUuYwo+IGluZGV4IDAxYzA4MjJkMzdlNi4uYjM2ZmJiMGZhNWRhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMKPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfY29yZS5jCgouLi4K
Cj4gK3N0YXRpYyB2b2lkIGR3bWFjNF9wdHBfaXNyKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikK
PiArewo+ICsJdTMyIG51bV9zbmFwc2hvdCwgdHNfc3RhdHVzOwo+ICsJc3RydWN0IHB0cF9jbG9j
a19ldmVudCBldmVudDsKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwl1NjQgcHRwX3RpbWU7
Cj4gKwlpbnQgaTsKClBsZWFzZSB1c2UgcmV2ZXJzZSB4bWFzIHRyZWUgLSBsb25nZXN0IGxpbmUg
dG8gc2hvcnRlc3QgLSBmb3IgbmV3Ck5ldHdvcmtpbmcgY29kZS4KCglzdHJ1Y3QgcHRwX2Nsb2Nr
X2V2ZW50IGV2ZW50OwoJdTMyIG51bV9zbmFwc2hvdCwgdHNfc3RhdHVzOwoJdW5zaWduZWQgbG9u
ZyBmbGFnczsKCXU2NCBwdHBfdGltZTsKCWludCBpOwoKLi4uCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmggYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmgKPiBpbmRleCA5ZTBmZjJjZWMz
NTIuLjkyZWQ0MjE3MDJiOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfcHRwLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfcHRwLmgKPiBAQCAtMjMsOSArMjMsNiBAQAo+ICAjZGVmaW5lCVBU
UF9TVFNVUgkweDEwCS8qIFN5c3RlbSBUaW1lIOKAkyBTZWNvbmRzIFVwZGF0ZSBSZWcgKi8KPiAg
I2RlZmluZQlQVFBfU1ROU1VSCTB4MTQJLyogU3lzdGVtIFRpbWUg4oCTIE5hbm9zZWNvbmRzIFVw
ZGF0ZSBSZWcgKi8KPiAgI2RlZmluZQlQVFBfVEFSCQkweDE4CS8qIFRpbWVzdGFtcCBBZGRlbmQg
UmVnICovCj4gLSNkZWZpbmUJUFRQX0FDUgkJMHg0MAkvKiBBdXhpbGlhcnkgQ29udHJvbCBSZWcg
Ki8KClVuZm9ydHVuYXRlbHkgdGhpcyBzZWVtcyB0byBicmVhayB0aGUgYnVpbGQgb2YKZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50ZWwuYwpvbiBhbiB4ODZfNjQg
YWxsbG9kY29uZmlnLCBhcyBQVFBfQUNSIGlzIHVzZWQgaW4gdGhhdCBmaWxlLgoKPiAtI2RlZmlu
ZQlQVFBfQVROUgkweDQ4CS8qIEF1eGlsaWFyeSBUaW1lc3RhbXAgLSBOYW5vc2Vjb25kcyBSZWcg
Ki8KPiAtI2RlZmluZQlQVFBfQVRTUgkweDRjCS8qIEF1eGlsaWFyeSBUaW1lc3RhbXAgLSBTZWNv
bmRzIFJlZyAqLwo+ICAKPiAgI2RlZmluZQlQVFBfU1ROU1VSX0FERFNVQl9TSElGVAkzMQo+ICAj
ZGVmaW5lCVBUUF9ESUdJVEFMX1JPTExPVkVSX01PREUJMHgzQjlBQ0EwMAkvKiAxMGU5LTEgbnMg
Ki8KCi0tCnB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
