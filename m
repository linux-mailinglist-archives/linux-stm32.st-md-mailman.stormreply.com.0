Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC46D4CC0
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:55:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DBAFC6A610;
	Mon,  3 Apr 2023 15:55:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2093.outbound.protection.outlook.com [40.107.223.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B11DC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWe594003AkZmy1vwknqhEtyaXWhINyqdaBpoecM5OOMk0N17R7s0t9KolodtPjvaiNGdXmB195MkjwSCiKmS8QXdRpgOVWCsACBkcyr87cwBvURNQkYHaz1H7ttlrY14k2SWSyc5aR48qE5NQq4R/05H+IFR8yyB5BRRWo5FH+d0f5suNcVMqWbBSID6woD8eXt1HYZK31Pq4Qrg6o0qlfzqX0x+7VE2bN3ht7S7X7ZxDi3SfzAeXAoaBZr8wZe5u101JgfS1vBkGAE5rx9wbw4H/13ToW5APhHNyhSkS0uAvMAbZH0l6lgciGbWI2hjCy7bkq5Ay886e0voQbNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+YVYTGo2pr2JuszrU+NBVUV4x9UUygJDzD3MpMj8JE=;
 b=WLHbNqUa1ia1mummG5jxzqDIjbfiUC20qICKttrh5LPtmSBamlkrTOt0+HBwK8SF9z6EfI30nc5oKIkfzCB0+AHpWvFieHnmPweLv2Q5ModfTqGAmnFwqdpS8QevoJt9bS5vmOoHpqL0ZumUkGS9yZyIMyFrlkGQE51DbXkDmB4RM1BSQ8wHQ2C1IMGJAgVolnQYJTqmLFtMvDMgKOl7861zMoCtDS4tU1zlNo0GQMgTZghEUSZhqkV+THvPoagIcepzaeoPchWfTwqKQqV4xu2bOhWlbC2wRr9QutEZQg1tBGUIXFpNmdXY7l0ZI4JX8+eBJ9OHo0deKie4UsvPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+YVYTGo2pr2JuszrU+NBVUV4x9UUygJDzD3MpMj8JE=;
 b=a8cKyMUJ+EzSt5q+3TrMVeTfcX5c8xmvpB4tpM4Bn02lqaRvqx51lk6FDuYvqL9xQ9UHV7mAZKr61H51Wt3pYnuPpPlYS70u+JQTy2a9GoPGc+Xs27cIAxGYg8VKPMuJHc2pB174e+1Qo4XbdZQO5BQ116loQRdjQ9p6xQ5m/ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB3719.namprd13.prod.outlook.com (2603:10b6:610:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:55:30 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:55:30 +0000
Date: Mon, 3 Apr 2023 17:55:20 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCr26P9DGZFZy3Vq@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR02CA0197.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::34) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB3719:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cc14f8-0c86-4f96-a3d3-08db345bd974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDBP7MA6GGybR5O+n+MWC64viQtZhUZ6TchTFeP5Ztpeqb2dhVKRWElVLRXBMohaOnL/B+AYrs+QQ4gM1vTmgf87VamsfFtXQpBd766KGpXMHjXM72DjW1DBR4Ikg/U6OsMkBtO9UqhLAE91JAlwbEr5MNB9QuAE6fja+PgV74F7vLtXS8NgZGQxiEG5Afz6PuTa8byJJNJDQwqKLpAjoqus/VHhkXS6npla17SL4F2uDQaGtpcnHRzGVIgiAW9P7FjYgekcVo1mfv/z0rCng+3RRu+6yQDCtvPXtpF6Do8j2tQNXmBrQ9Sn+wsv2sK/xL056OerYhxsXUfb5EHFEgyWTg+Rfg3bjhBLRJZCpxzZQpcUvFbVkT+5udUTWF3mir7b6XV3N4qmSoseeebN23D+GrCPzWUngxMb7rOjhI9q4FxbEfWxJpqtahMz9VoKvq3fosQ/SzFGjtUVNRqNdohgYLF5Ri8iFXZ863q8nhBxsqv89cU+8fagkgx0xXduRROLPlaJkgVvQl4mZLR96ZVKhOOua3dfFHuo0D7/A7K9hPf0srFyKJJ6EXG0XtYK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39830400003)(396003)(366004)(136003)(346002)(451199021)(6916009)(8676002)(4326008)(66946007)(66556008)(86362001)(66476007)(2906002)(41300700001)(316002)(54906003)(478600001)(36756003)(38100700002)(8936002)(2616005)(6486002)(5660300002)(6512007)(7406005)(7416002)(186003)(4744005)(6666004)(6506007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmhLQ2l4b0w2UGlHa3BURUVxS2tkdTk1WWpWbXN2dWJZaWxsaG1ISGwzRjZQ?=
 =?utf-8?B?V3dFNnNrNW9vdUZ6ODFPS3lNdVRjR1VrZktFWDlyMVY4cmFPb25FWDNpN3ZW?=
 =?utf-8?B?NzlqVko1TWlucElqNkFRMVNQdDF6UTd3U3ZsRlQ1alZWbFJNbTJhQ1dOTVFZ?=
 =?utf-8?B?U2swN1hYeVladUJXSGM5OEhjQmZjQlRXdXRmQjc0SUVZYzFoMUh5M1dCcEtB?=
 =?utf-8?B?RTRLcFBnWUJaUS8vVU5nSW40cFhUMnNoUU9NdjVyaU4vQUl5TmpRbkE3MWp3?=
 =?utf-8?B?RDN6OFBNa09xK2dQcmc0b29ZYW10M3AvWFhqZFBwYU82YVg3RnVnSlpTeTM3?=
 =?utf-8?B?dVVLbGtsMDEvSmM0V01hOVRtWHFMVFZPM1VLb3o2enk3MGNQQzdoYlhySU9O?=
 =?utf-8?B?TWZSbEc5YWpCTWpPZ1BrbWhlb1NkNUhVTHBlKzY4eXBMTHBScThvWUM3YUQw?=
 =?utf-8?B?cTdjQ2lBdEZnc0tyZ3ZBdE9JR29zdlRodllYUk5BajYvdGVPdWM4K2d2RURt?=
 =?utf-8?B?L1o2TDBlOEhrenNOR0JmTmxUTFowWDVQblJoRmtKc2tKcTQ5WUUveHN1dXpN?=
 =?utf-8?B?dzhzSFlvZFRmZzBDampvbjBsOFF6TEl2K055ZUdWZWsyc0JxVHhSRlpobmpq?=
 =?utf-8?B?SUZwNHNJWnZVRXdkaytxK2F2TCt2bXBuaGx3MTVuUDVsZ05iQTdyVDU5QUF5?=
 =?utf-8?B?ZUVZRUNFYU9XdGFCSmI2RVVQR2FyNkU3WXliRC94cks2cDV4U3JiS0dqc1Bu?=
 =?utf-8?B?VFlrZWx1dXM4UCtTMHlsZkFFaUNjaVJUbUlwSnBoblRhdEhHeU1jNEYzeFIy?=
 =?utf-8?B?VXhjMHo2bHRLeG9QNmw0Y3c3ODhITnY4bVR3a3QrZ3JKNFgrL1I2bjE1ZFIr?=
 =?utf-8?B?cXp3aUVjVDhRMHFaS0lHLzJxRzVaUTdybUYzQW10dXdLMWRZUnhGZUNmNENE?=
 =?utf-8?B?eW90bmxiZmZ5MG5scndhMkZwQ2J3bmJNZThybHlnNkxPKy9DeUZ5c0pJVnVO?=
 =?utf-8?B?Z04yMXZ4T1NVK20ySDB5RFB5Y2NwZ09SaUUxMFFRYmhLL0FrMTErVGZXRHRm?=
 =?utf-8?B?dldqNEQ5S21IKzR2MGJiSlptcUpJQW9ud09ZTzhwTGtsZ3ZwbmRieHgvNFhY?=
 =?utf-8?B?b1FWeUZZMFBQTTZpV3kyWkRpLzJaUGN3akZyTUJFcCt0YWlBMHhqWHBxbkFy?=
 =?utf-8?B?NDlrK0U2L2tkVytPWGIvamlOMzdWVnd6MVBSTkNzdnlYYk9XM3E0a2VveGJq?=
 =?utf-8?B?UXIxb1p2ZW9PUHhBakROckU1TEpQUWdKaHQ4RnhTYjUybmVmY3FhUTRid1l1?=
 =?utf-8?B?Tm84S1VURVU5LzhLRHpwVUhXbWdHNnJQS2p5NWt5bnNDa2FrazZTVVRBdnNz?=
 =?utf-8?B?Z0ZFZU9zYjFnMzRQUHFqenFxMWp0d3pMU2ExYmN3aTArL0o2SGxUYVlPOXcx?=
 =?utf-8?B?MWZ5R3MxQTBpNEJzRTd4b0xoM0pnVkkrQk5sQkhOeXlYRW9tNkd4MlhRZXJn?=
 =?utf-8?B?REQzQzNoMkJuM3FGV28wLzk3cU1jVXpJSVRQeW4zYmg1cXhXcGwwUy9tYnFN?=
 =?utf-8?B?eTIrSHpDYmJndVZVdXV4MzN4UFJ0S2YrNHF4QlBzSmZ3UnFtK2tzek9qRG56?=
 =?utf-8?B?enRTVmpwT1Rablp1dUU0aVdUSE8yZWFMc2UvbXFnT0drNmVFdGNKSURSVlJ4?=
 =?utf-8?B?dzJZWTVtQ3NRY1ZqMUdGenIzZEQ3SlFNUnM4SmhtMDdVcFBUdHk0SEpuWCtS?=
 =?utf-8?B?aTNzZUNkN1RqNkxEMk92N0NmYmtGb3NIN3gyNHNDNUtNSkE5a0syU29BUThD?=
 =?utf-8?B?bmdvaVJqZGZzRVlSU1RQUlVtdXV2dm14SEhlUFB4OFZBR1hhdmtPanp0ZE8v?=
 =?utf-8?B?SFpXOW1qbS96UUJuVHZDWFJray9FY29qZjFURHZRemFaVFFlQkdQdG80SHQx?=
 =?utf-8?B?T3o4b2tzczJpR09mWEgxdmd4S2ZjbDJuSWlNMWJWRnB3MzBmeVJON0JpcjlQ?=
 =?utf-8?B?NFBpTG5tZVlqODl6clQwWWZmbS9qYjhJa0NvYXFVR3hWSUU5WUlad2dhZmJN?=
 =?utf-8?B?amtVd3o4ZXVoOE1aQkhuU1NIbXllTmdVSCs3WmRZZlJvQStDcENxOTdKVk5D?=
 =?utf-8?B?M3l1a25OV1F4MG11RHF0MnZ5eWZLYmFCelNrbk9mMWtDYS9iYlNLL3pvNjVo?=
 =?utf-8?B?RkZZeW5ya2p5MFNrR1BnYmc5eDcza0FFR3ExUEF1Q3Y0N2RIeGRlYzJzdjdr?=
 =?utf-8?B?R0RVejRpN2N6YTNVdU05L1R3bHJnPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cc14f8-0c86-4f96-a3d3-08db345bd974
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:55:30.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi9ouKvLIseYSWu+x4/dzhuaT4Kd3OVKmu3Yn7inqxlbAOfeIqnoTDZyBnyWeY9OITutOt71PTxLoBlQP+UZRyicvCOPgS/BGQYNhSem74I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3719
Cc: Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: Make
 stmmac_pltfr_remove() return void
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

T24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDQ6MzA6MTVQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIENo
YW5nZSBpdCB0byByZXR1cm4gdm9pZCBpbnN0ZWFkCj4gd2hpY2ggc2ltcGxpZmllcyBzb21lIGNh
bGxlcnMgYXMgZXJyb3IgaGFuZGluZyBiZWNvbWVzIHVubmVjZXNzYXJ5Lgo+IAo+IFRoZSBmdW5j
dGlvbiBpcyBhbHNvIHVzZWQgZm9yIHNvbWUgZHJpdmVycyBhcyByZW1vdmUgY2FsbGJhY2suIFN3
aXRjaCB0aGVzZQo+IHRvIHRoZSAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBGb3Igc29tZSBvdGhl
cnMgbm8gZXJyb3IgY2FuIGhhcHBlbiBpbiB0aGUKPiByZW1vdmUgY2FsbGJhY2sgbm93LCBjb252
ZXJ0IHRoZW0gdG8gLnJlbW92ZV9uZXcoKSwgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1i
eTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
