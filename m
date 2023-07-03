Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A828745821
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 11:13:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54253C6B45A;
	Mon,  3 Jul 2023 09:13:48 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2111.outbound.protection.outlook.com [40.107.215.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B31F7C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 09:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1xHkIb9Sbxvr4xJqBmyqYdXMymUQ/+k7CnWe8t9ozRfjKC1e2gPJTZfgZpLhEZ7JXF8y5kYUCdsVXNp6F3qRSuWiJYRjk14L5D/FTg9s4AH2hMqUxUlSDUoKFajxQFEfhkyvRqHDeBzvmtjzigDzcCoPlRT0QUFfG4d8MN58qbUUqg7pkdZAoMBizHsa2CuhFwj4IxeiXeGXIpiz7hiYEV+KGVl7lzEB+BeUuWNONwzy7UZJv4RDd+drNFgvTMVEIUq45TkHysrjGFWI+Z9qfBrUIHhG4Kl9o31ydbp4NbBed2sZXt2XeDkIFSFmK58VRcxsp5/6qtWelhKZbDa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czK4J5IXuhM9FcHbc3AGmLW4qty5n8A7jCu7uUaSXaE=;
 b=dbgDqvBYLuEozdIcYI/Da5ZMxJRCSKiGXzePxP3TlKDS2tqYOhzViU0QDZ/EGNhmsIlAs+ERd1VPi875TAyqziZMW7sx8OtbCZGEcY0DCseTfvi4hU/9pQu5jLBqIIUIHna/uuCNei9xbw9Z3k25d+LpNUlFsXB53VUcvgET7ef2K+p+8L4frj0u4j+TWuGcUkmnskudBCGsT2pH8lmFem0PadQ65IvrbqvGSCwNjxJCU4hNHhO0uYFstdvaHxF6A9798znMxnsdejiYrSth0Tuqpm3HPgVhmVxd6be2VMyIHn7Rir87OVBLAnX2TJuGLunfTaqBaOgyFecbyJACUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czK4J5IXuhM9FcHbc3AGmLW4qty5n8A7jCu7uUaSXaE=;
 b=SU8O+Hw0TMTkpu0cu+voeWHi9pzPWwTbsaBKLZggBTsoYyMSqfT8k0D2ibGF+4/gG1e3ORkgViy3FxE8x0Gx8PpLVksFY8MIWNj0s62bx4dOxFwN8NscDfE32lQCTf6RTkMHMPXVxuCnCxNw9WJuJd4zxnsbjaqlPIpDxc9Lvzen55kSEBHcp9Mvf4o+B3ChtgdOjWjJrPnXgPxA1DtfRJtcxIG33VKtokhyPEkfddBUnS35hiINhNUAzEQKkxfA4KaQsa8YyDTYKAMrZC4km3WJl0ISWg2DC8lwiYxsJrPjTgU22tOfrHypYQEJXmcWxgumegcdepQffmKM8gHMbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6507.apcprd06.prod.outlook.com (2603:1096:101:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 3 Jul
 2023 09:13:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 09:13:38 +0000
Message-ID: <690b12b7-5586-6ade-de83-99f463bc8397@vivo.com>
Date: Mon, 3 Jul 2023 17:13:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de> <87h6qpyzkd.ffs@tglx>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <87h6qpyzkd.ffs@tglx>
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bc9ed4-346a-4e04-1fe5-08db7ba5c992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6g2591paU51B2LYfKRd3d8yTh3hnH7RW/52U8T0DgoZ/TcZOBLFgaTWmhSDCXX0b5HH5PRolb6hi8tJ+awJu4SPYiFQopWd1v8WK6ciWg80J/FudpD26VflnwIvuxfYu0iqpCX3UmFs+MGq3USNh8tMWv7ImsnMyntqUipN1sp+m5KegxnLKRH3xeu12qEBEOw5FPX99Zm/epC04jN2KfYTn2IXBkGaRQKIkBWFDO/uabW8fzQHUdEJkiyjQtPiBU1fWFVfJc6kBL+oTj6UhOAGN3ZatERcnB2mrNMJq4MRAtsdL5r2oIs0N1KH1A2aflBrMJakDeUW5r93Cu1N0/bqa6/yWA2c+WR8rjFIErVNaNs2GEVih4O6WvyGAogf6ZVA8xQZQsL9YnJS0ZooF2PDLTFYtweFBIi4oYqmr3RoFulhN/Wven6fSgK8gDu5OYf/1CwCTKZI+IoiFA+16Se/DSuAaj4sRBhei3y6aR6XmwSo6d68D02rKhCYmCeEae1PV+ZoXEnhcvuSUbJZC8D12SFWzYsZ/EvtHTaSZKffJiknBDqHCqqdfC9FpcujnxuGeQDsUoaU2ziMVoMJhzPztqIjPLAIv6ajG/PKWot76MjAeW4TnAol4k4ADLAteCHZi40h3eeoxMRKaak6DufcDULEC2N/gE4isFaBp7TqzFEJicjTapjcprSNVMQA3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(26005)(66574015)(6666004)(6512007)(2906002)(186003)(38350700002)(6486002)(52116002)(38100700002)(2616005)(83380400001)(86362001)(53546011)(6506007)(110136005)(31696002)(41300700001)(316002)(36756003)(4326008)(66946007)(66556008)(31686004)(66476007)(7406005)(5660300002)(7416002)(8676002)(478600001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJlZ3VDTGJWMlozNkFoRlgxTSt6S2pTS0J6d2wyQU9DVEJVVEJhUStDSU9m?=
 =?utf-8?B?K3hGdXRYeFRocWFwTzdNeUx4V1Z4emZKdGdnYS9iWmpRQlFPeGNVYmlGWHRw?=
 =?utf-8?B?ZUptbU9lVXhha0lDZ1k4WVdJUW95MEV1MTA5SzFYVVhWMERMbXhRM0dWdmVR?=
 =?utf-8?B?Tnl4OWNzMm1qS2JISVc4WGtkWWFiQ2krNUlTNjd4Rkl5MW9mL1VDNXZhckY5?=
 =?utf-8?B?M2htazFsY0pDVjlYei9kVjlxTDRJcllhS3VWbGQxWnUvWTB4VFZXNk9oVFNQ?=
 =?utf-8?B?a21vMU5yL1U1ZDFzRTNMdVgyOUphNXhrbjBoMEVnR1Z2d2R0clh3R0FtUHVp?=
 =?utf-8?B?SUk4WXFrTzhFVTI3WkNNSXE5ekgzL09nK3EwZEpOTWpKc1BaWmxHSXNqY044?=
 =?utf-8?B?Zm9ISHR4UWo1SHBlRjk3by9jUTc3TG9VK3B3RmtpQ1ZVU2JubTFvN1ZWRzhj?=
 =?utf-8?B?WXlILzV2ODEwcFB6NHRVUGEyQWM1MzRXbUREM2hEK25XdjZtU1Fmb2E1T1FY?=
 =?utf-8?B?cm1rMlhPbVF3UWR3UG5qajQrMVFKSzkyVXlNcVBiMjFNL3YxeUxidCtVbzhZ?=
 =?utf-8?B?UmlWK21EUE4ySkM0US9sOGc1SGl5ZnpVVCs3bjJneGhvL1NTWVJPczFsdmhw?=
 =?utf-8?B?bjNzamF3dUdVWVloQm4zMi9adWhaSC9iOWp0RmFhbEYrYitxNDRWRnE5U092?=
 =?utf-8?B?em0vemd1R3RWOEFSSUREcDZ0RmoxRlVNeDVXRi8vazBPZ29nbnI4bFg5a0ta?=
 =?utf-8?B?MW1XN0RTT1RnditDb3V3YjRsQnJlUlR6VUU1N3ZjWTBqN0RFeE5nNWU4eHg4?=
 =?utf-8?B?L09lU3Rlclp4RmE4djljNkRDZGdrekFUdXZvS1FHWDMwZm1FMlB1bVhMWW1I?=
 =?utf-8?B?Zmw5NlNDcE52T2piaUhDcmN1WE9CZS9oRUdHTitLNEpKSVN6cVMzUHdjUnl4?=
 =?utf-8?B?SldzaklaUFFyUXVzSE1Bb0VCbGdxdnFSN3VlY3NIQ0FNdGx3ZjkybW9sdytX?=
 =?utf-8?B?M293VEFhTURpWmhuUTl0QzJTYlp6aytqaVZBekcwc0lSZ0UzbWhkU1ZzQkJT?=
 =?utf-8?B?UkJSRmVSa0dVUDBEd1ZRVzFCc3JYbzRjWDk0akZmZlVqOUN0a09TeTc4bzhI?=
 =?utf-8?B?U0dtMXR3ZzVnaWsyY1I5dXRnUTU2YjRQSnJkMFNJWnFvNnRscE1kSXhDdlhy?=
 =?utf-8?B?bXVEWDZrM3BLajlpTU85dUtZVy9EMkpsSjM3VjU4NmZObGF6N2Zrdm5HMHRQ?=
 =?utf-8?B?aGNHY1pXR2xuM1Nsalh0b3NXNmYwRmttRXNsRnN4empMV0dWNnhhR0c3YWJO?=
 =?utf-8?B?VUl3Z0RhZVNtVmJZU2tIalRlTnU0ZXliQTVqK0huc3ZzY21RV2loNjVQS1FR?=
 =?utf-8?B?WE9GOG9EZFJ2bEJGYzYyakN6S01NcU5uWDJLSVQ0UHFVUWdsbEhyM2EvV2Zk?=
 =?utf-8?B?UjBFWXRralJxbFJwM29KL2hLUlpxWkdzbnB5N1E4SlBua2I1TnlMMFRsRHNs?=
 =?utf-8?B?S0d3WlphKzY0WDdZNWxDM1Y1NnUvc2VQU2tySHQvSFRUZ1lxWW9MSzMxWHNO?=
 =?utf-8?B?TVdEbzhvSG0yRlp3TU1Ia2hNNnZZUUxFUGNrT3BZWWFhVVNWbG9CaVJCSzlD?=
 =?utf-8?B?eGRhZGZiNXdaRUN2d3IwRlF5ZkZBWjZqcEJOdDVSbWpIbmp6SGxZZFRvMFZw?=
 =?utf-8?B?ZHc1dDBYZWc5MEpLNlU3a01SbnQ4d212Q0FSL0w1cjMyNUtOcGdCRGcyVXdX?=
 =?utf-8?B?T21CcDlxaWtKR1NkN2s0Y0FjcFFmUzR4WHVFYU9iNHNpenJ1R2ZDczUwc1p2?=
 =?utf-8?B?aVlhcGdkUkpScHlQd0drY2FSNWZyelVsYk52aVZ2OUVPWk1kcjBvekFHcnZs?=
 =?utf-8?B?ZmZ5TXlnNHJXR004WTVoU3lodjN5UFcwQkNLWW5INEFTT01DTDhZRE9QK1Bi?=
 =?utf-8?B?UTUrdzBiTXZ4SnJNdlg4cUNUOCtFQm15d0lDVDNrWDZ6amdWejFmWUZ3RTRW?=
 =?utf-8?B?a24vaGpraFovK3ZYOUNsZjc1aE8wZExJcmpMaTRRREJzZzZ0OHhoMXRBVWhL?=
 =?utf-8?B?SXlBdFdlVzdlTUZ4bGR6aldhY0liQTRmWWd4MDJ2TTFMTU9VeWM3SkJrU1V2?=
 =?utf-8?Q?tcer0ixeYUQPoh739LvZi58+g?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bc9ed4-346a-4e04-1fe5-08db7ba5c992
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 09:13:38.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45HHPW41jyFfU6ygCABPNLCVpuXp5YnPFEFqyreTnASH2xNOJ9mJy5fIzpwYHJuIiVU7Rtje5G9JegX6uRNFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6507
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, miquel.raynal@bootlin.com,
 srinivas.pandruvada@linux.intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, bchihi@baylibre.com,
 florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 chi.minghao@zte.com.cn, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, wenst@chromium.org,
 rui.zhang@intel.com, thara.gopinath@gmail.com, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, matthias.bgg@gmail.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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

SGksCgpPbiAyMDIzLzYvMzAgMTk6MTEsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBUdWUs
IEp1biAyNyAyMDIzIGF0IDEzOjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gT24gVHVl
LCBKdW4gMjcsIDIwMjMgYXQgMDY6MTI6MDFQTSArMDgwMCwgWWFuZ3RhbyBMaSB3cm90ZToKPj4K
Pj4gV2hpbGUgSSBhc3N1bWUgY2hhbmdpbmcgdG8gZGV2X2Vycl9wcm9iZSBpcyBhIHJlc3VsdCBv
ZiBteSBjb25jZXJuIHRoYXQKPj4gbm8gZXJyb3Igc2hvdWxkIGJlIHByaW50ZWQgd2hlbiByYz0t
RVBST0JFREVGRVIsIG15IG90aGVyIGNvbmNlcm4gdGhhdAo+PiBhZGRpbmcgYW4gZXJyb3IgbWVz
c2FnZSB0byBhIGdlbmVyaWMgYWxsb2NhdGlvbiBmdW5jdGlvbiBpcyBhIGJhZCBpZGVhCj4+IHN0
aWxsIHN0YW5kcy4KPiBJIGFncmVlIGluIGdlbmVyYWwsIGJ1dCBpZiB5b3UgYWN0dWFsbHkgbG9v
ayBhdCB0aGUgY2FsbCBzaXRlcyBvZgo+IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoKSB0aGVu
IHRoZSB2YXN0IG1ham9yaXR5IG9mIHRoZW0gcHJpbnQgbW9yZSBvcgo+IGxlc3MgbG91c3kgZXJy
b3IgbWVzc2FnZXMuIEEgcXVpY2sgZ3JlcC9zZWQvYXdrL3NvcnQvdW5pcSByZXZlYWxlZAo+Cj4g
ICAgICAgNTE5IG1lc3NhZ2VzIHRvdGFsICh0aGVyZSBhcmUgcHJvYmFibHkgbW9yZSkKPgo+ICAg
ICAgIDM1MiB1bmlxdWUgbWVzc2FnZXMKPgo+ICAgICAgIDMyMyB1bmlxdWUgbWVzc2FnZXMgYWZ0
ZXIgbG93ZXIgY2FzaW5nCj4KPiAgICAgICAgICAgVGhvc2UgMzIzIGFyZSBtb3N0bHkganVzdCB2
YXJpYW50cyBvZiB0aGUgc2FtZSBwYXR0ZXJucyB3aXRoIHNsaWdodAo+ICAgICAgICAgICBtb2Rp
ZmljYXRpb25zIGluIGZvcm1hdHRpbmcgYW5kIGluZm9ybWF0aW9uIHByb3ZpZGVkLgo+Cj4gICAg
ICAgMTg2IG9mIHRoZXNlIG1lc3NhZ2VzIGRvIG5vdCBkZWxpdmVyIGFueSB1c2VmdWwgaW5mb3Jt
YXRpb24sCj4gICAgICAgICAgIGUuZy4gIm5vIGlycSIsICIKPgo+ICAgICAgIFRoZSBtb3N0IHVz
ZWZ1bCBvbmUgb2YgYWxsIGlzOiAiY291bGQgcmVxdWVzdCB3YWtldXAgaXJxOiAlZCIKPgo+IFNv
IHRoZXJlIGlzIGNlcnRhaW5seSBhbiBhcmd1bWVudCB0byBiZSBtYWRlIHRoYXQgdGhpcyBwYXJ0
aWN1bGFyCj4gZnVuY3Rpb24gc2hvdWxkIHByaW50IGEgd2VsbCBmb3JtYXR0ZWQgYW5kIGluZm9y
bWF0aXZlIGVycm9yIG1lc3NhZ2UuCj4KPiBJdCdzIG5vdCBhIGdlbmVyYWwgYWxsb2NhdG9yIGxp
a2Uga21hbGxvYygpLiBJdCdzIHNwZWNpYWxpemVkIGFuZCBpbiB0aGUKPiB2YXN0IG1ham9yaXR5
IG9mIGNhc2VzIGZhaWxpbmcgdG8gcmVxdWVzdCB0aGUgaW50ZXJydXB0IGNhdXNlcyB0aGUKPiBk
ZXZpY2UgcHJvYmUgdG8gZmFpbC4gU28gaGF2aW5nIHByb3BlciBhbmQgY29uc2lzdGVudCBpbmZv
cm1hdGlvbiB3aHkKPiB0aGUgZGV2aWNlIGNhbm5vdCBiZSB1c2VkIF9pc18gdXNlZnVsLgo+Cj4g
WWFuZ3RhbzogVGhlIHdheSBob3cgdGhpcyBpcyBhdHRlbXB0ZWQgaXMgbm90IHVzZWZ1bCBhdCBh
bGwuCj4KPiAgICAgIDEpIFRoZSBjaGFuZ2Vsb2cgaXMgd29yZCBzYWxhZCBhbmQgcHJvdmlkZXMg
MCByYXRpb25hbGUKPgo+ICAgICAgICAgQWxzbyBzdWNoIHNlcmllcyByZXF1aXJlIGEgY292ZXIg
bGV0dGVyLi4uCj4KPiAgICAgIDIpIFRoZSBkZXZfZXJyKCkgd2hpY2ggaXMgYWRkZWQgaXMgbm90
IGluZm9ybWF0aXZlIGF0IGFsbCBhbmQgY2Fubm90Cj4gICAgICAgICByZXBsYWNlIGFjdHVhbGx5
IHVzZWZ1bCBlcnJvciBtZXNzYWdlcy4gSXQncyBub3QgdGhhdCBoYXJkIHRvCj4gICAgICAgICBt
YWtlIGl0IHVzZWZ1bC4KPgo+ICAgICAgMikgQWRkaW5nIHRoZSBwcmludGtzIHVuY29uZGl0aW9u
YWxseSBmaXJzdCB3aWxsIGVtaXQgdHdvIG1lc3NhZ2VzCj4gICAgICAgICB3aXRoIGRpZmZlcmVu
dCBjb250ZW50Lgo+Cj4gICAgICAgICBUaGlzIGlzIG5vdCBob3cgc3VjaCBjaGFuZ2VzIGFyZSBk
b25lLgo+Cj4gICAgICAgICBUaGUgcHJvcGVyIGFwcHJvYWNoIGlzIHRvIGNyZWF0ZSBhIHdyYXBw
ZXIgZnVuY3Rpb24gd2hpY2ggZW1pdHMKPiAgICAgICAgIHRoZSBlcnJvciBtZXNzYWdlOgo+Cj4g
ICAgICAgICB3cmFwcGVyKC4uLi4uLCBjb25zdCBjaGFyICppbmZvKQo+ICAgICAgICAgewo+ICAg
ICAgICAgICAgICByZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKC4uLi4pOwo+ICAgICAg
ICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZh
aWxlZCB0byByZXF1ZXN0ICVzaW50ZXJydXB0ICV1ICVzICVzOiAlZFxuLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHRocmVhZF9mbiA/ICJ0aHJlYWRlZCAiIDogIiIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaXJxLCBkZXZuYW1lLCBpbmZvID8gOiAiIiwgcmV0KTsKPiAgICAgICAgICAg
ICAgfQo+ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgfQo+Cj4gICAgICAgICBU
aGVuIGNvbnZlcnQgdGhlIGNhbGxzaXRlcyBvdmVyIG9uZSBieSBvbmUgd2l0aCBwcm9wZXIKPiAg
ICAgICAgIGNoYW5nZWxvZ3MgYW5kIGp1c3RpZmljYXRpb24uCj4KPiAgICAgICAgIFNlZT8KCgpZ
ZXMsIHRoYW5rcyBhIGxvdCBmb3IgdGhlIHN1Z2dlc3Rpb24sIGFuZCB2MyBoYXMgYmVlbiBzZW50
LgoKCk1CUiwKCllhbmd0YW8KCgo+Cj4gVGhhbmtzLAo+Cj4gICAgICAgICAgdGdseApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
