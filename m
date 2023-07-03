Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C1745BD5
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 14:05:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D02FC6B45A;
	Mon,  3 Jul 2023 12:05:27 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2125.outbound.protection.outlook.com [40.107.255.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE6AFC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 12:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyBBtFXUmWhnNBY1Ka7ahhA+NXNnSF3WIeVXqRMeo7JKChXkb4nGHodfhvWcZ1LG9B+/bEixhImOWRQGveizBiSfITx6aVwbi6DWgmgyib8ni59meVmd9Bmf62cKnN57UFOIS+xp1JjN9RgpX6ApuX78/6ilDFHLFsVfNpuLN8zq1+X1dDkfTsy3Xzy+ezf7okP4efkNSC1is7zTgfD67nSMv70SeMmpMgDKmx1GTvOKQbV+id+8m1VplEYiUaOPqVtajdLZA/BZo2mRukOj6RLgIYU3soBAu9+Ef/G6TznIXk+MByj1uRQsLHqjLMNnoCUITga2dc4k9ks7o4q0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY8qoEgGetxRqvjxV7AidUakI7o0oUdFVdIR9y9eouY=;
 b=VEjVV7aQawhzbIfu86Ay1/nhsxmPB2xOO4GHUYox3frKBS8uczTJxk3EWZtNt7r3wmV6YQ3Wt853BS/ei35FTf9eyki2u4Bv+bdQ084XDtnYC+5ieCTx8xOr/ciXaRxIfYe4J1I0cWFk5Zr3Gp0JvtAJSvMkXpoy2L0xSnC86oP3n02onEyLj0A+xx2hsxn9vtUskfUi9Q9x2VzKebazzX/yi/50TeAuqB0KQwSy5XO6oLAyhrJ2LOrFyHOSzoFZGkgPjifVVevPUI09ZdLGn9LXFVdQOy4AxhwcxdgZFEoQ56uQyjIeB1J5qBU6OmVMak2P+O/OS4PyP+cOuSvA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY8qoEgGetxRqvjxV7AidUakI7o0oUdFVdIR9y9eouY=;
 b=fzh7QzWl3fsdPYnytKp2paFEMuBF036E/WkhZYIP8NIwcX5yWfycCqFrrNWaNWvqLSHku0z2SUjxlA9rsQsxTYZTYOuGbaRG1wGza7OX0XYoRdC1OaKmfXbfz7s4sjPaF2Y14RxTOf3SIui8Hefqo9FGNDGWg8DLFznCSXFBmfJRhBvT532d8wx9ytsJkNyDmjFHp3/z/5Jggf6CvtHizavzeBbWK8TY+pGbIuEoDICNP2ZBPPvQSXseu+LXbf9ZE+qHSF1Q/m1v96rZeo2H+aljxbn4OgrWRpPPD9q9r4SQX7xdK6RTFnjq7NFsfIMJGvD1VZo4gOtQ0Fp3Q3VUVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5380.apcprd06.prod.outlook.com (2603:1096:400:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 12:05:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 12:05:21 +0000
Message-ID: <faa09723-37be-cc88-f003-b426e3da75fe@vivo.com>
Date: Mon, 3 Jul 2023 20:05:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de> <87h6qpyzkd.ffs@tglx>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <87h6qpyzkd.ffs@tglx>
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5380:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b034dd-39d5-4d51-d15d-08db7bbdc691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfdnIKgqne3OEkSsZtHWzj9ZZLVaVQghVdoN8wj0H5yzQRmikCMAcA/XjHgjF3px1wLA1xLVRNBsljfqyHMp00Xur6kvirIGdJSvkbhiGqOczTx9dnuoYcyCj5aJlpR0qjEY8v8OiDFoVCwxBF4SBxnF34Vs9feelpmZBMG7qcsDeHiBU/RL+7v4JiGQLhS5OcvUnbzECxItjAVimpYtlSzuBhjHq8593GPoyjyZ1yk94bZ60SW3x0VifdY3wAMCXV4uhFM7S71VmvVe+bK6FMK1khQQV0P67ROgEfr2eieu0/0cGniWLCL2gf6jqLMEJb1QUsYSG2sTLTafuIFukCCKTxDxSfDLLO+vUkIy2PI5LxVxj33AD+2/tMKc6Dq0ytIwd/wz6Q3mpX4FwhCZrs/p2YhqZ78L4u6/o6or1X23Ua3XBJff07aun+v6yGSu7iRwOOV4WNkobGTcm92SaEHbxw2jIxdXYxzK0uClgjOi9GXDaQ/eyJKfVnhvShfh7DPpYwJF5yzC60hsk/bK/W3tyEMRvunNcyfcqzLfmD+Ugd4xk7bX355I1gp1SH8rz1UkAz1gpFeobQCmuku2gcKFCPIydd3brEEmYAR8YGm0zLX128CTdazUbbfExEmOrSDrtHQcyxAX1roc4GjTSBUPLujlCjvmuLp1Z5MFT7fbm1Jq3BAFzU+IJPB4Ir7N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(6666004)(38100700002)(38350700002)(52116002)(2906002)(6486002)(33964004)(8936002)(110136005)(8676002)(36756003)(41300700001)(7416002)(5660300002)(478600001)(7406005)(31696002)(66946007)(66556008)(66476007)(53546011)(186003)(6506007)(26005)(86362001)(6512007)(4326008)(316002)(31686004)(66574015)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cSs0UEY3NFF6YSttbitMS0l0ZmFrVDI2VGFYUWlIQWFvaHlVakY4NW5OT2Y5?=
 =?utf-8?B?L1hiVXQ0M3htWUFpNjlQaDVTTHdJNEE4dXJxOHo1K3BTOUEvVm9MUE01eEwz?=
 =?utf-8?B?aVd3MlcweGI2VzkrclRmbkhGdTE0QXg3QUhZSTNxMXIxREQyUjJXRDF1WWdE?=
 =?utf-8?B?a2xoRHNTNUg1UHRZODNReVh0bFZHRFRKckxLemVRbFJyaGJEN1U2RzkrZFN5?=
 =?utf-8?B?MmxjaHg0T252TGY0SGRESHRxeFd1Ukh3VEhRRzVtd0hZaVlEb1JMOWpJOWhG?=
 =?utf-8?B?QVQycW5BZXdHa2Vab01FcDg1UUd3UGxVZnpOa2czalZQS1FheEl5WURFTlpX?=
 =?utf-8?B?S0tjMVBrKy91djltSzBSTlkvbW85N2ZJNWFZQmNXc2JpR3lISDM3b0sxQkNi?=
 =?utf-8?B?blB0MUFEM2Z4S3hWYW5VQ3RsSG5Yc2tLS3B2emovWlMzRmV4Q0RzLzFyS1NY?=
 =?utf-8?B?eTMxVUwyY3BoaXEydGs4VHRweXpLNDhva3E5bVE5K05wVDFBVDFNRVlXUlB5?=
 =?utf-8?B?UU1GKys0eWpkMWl2V3c0eXRvOFdQYVU4ZmxMbXhZaWEvcmFpRE5MVEJGZGlI?=
 =?utf-8?B?VTRuMlBrQ1JMQjd6NG9KZzF3alZlSVk0dGpCNVZta2tUelBuVzFKd3lDUjJz?=
 =?utf-8?B?Z3lLd2t4elYyWEtGOUJmSFBLcjhsNFM1R25xamhJTGFHWkhCcUVobDdTSU5m?=
 =?utf-8?B?Unc2NWFWWDZqSlltRkU1SCs1REliYy9SNDZ1ZlhCQXlPWFFUT1ppaERGYlYx?=
 =?utf-8?B?M0NDNW13NzdLU3FpUmRkbDJHQldyRjRoZTZPa1YxRk5YS0ZmWi80am1DVDdO?=
 =?utf-8?B?YS8wVGRnV1BXSEl2M09kOUM2bm5jUllnalRxRHJOclVjTUZ5WTdlUmNnUE95?=
 =?utf-8?B?ZjN5YTU0ZmFWOTRLZW5OM1dHMmtkTUY4NW1GY3hVQUhzdURQN295d1RNTHFp?=
 =?utf-8?B?Zm85aGt1Zm42YUpDUVZ3SVp2SjR3U3BSOHpwQmE0Sm8rZ1Z5bWUwZVJxelF4?=
 =?utf-8?B?akVtK2JjMGkvTzlLOWNXellielZCVDhIQ1JZUzFWMDZjUS9BQml4RXE1SWRq?=
 =?utf-8?B?TVZYTHZ5WTc2OFFsT2gzYlg5QUZNWkpzeVl5TnZtbFEvZElmUjlWR0tBb0gy?=
 =?utf-8?B?MUF3REpnOHpBSllGcU5zQjl2eklPOE01U0xSMCtqWXRmTkJNa3gvc3lhRUNE?=
 =?utf-8?B?MmVTR0hmdFpYaVN3ZFMxTTRxWThaOFhGUzIrbUxjSnJWZTdRN2FoZjFlRHRS?=
 =?utf-8?B?cjBlQkpRazVXdFNaWTlpV0hFUEhoeHpwWS9xRFBybVpRc2FJcnhRaTh0Vy9T?=
 =?utf-8?B?L2M4cG8yUGtzWktOUVZqVGtFQnhwbzFxNnp3R3UxenEwL2MzbzVHaWJ3a3VG?=
 =?utf-8?B?ZnZ1QXliNHdsL0JENEJuNE1HZmMvQnU1WTdvVkZmMFZ6dVVxSlhvZHlSMklT?=
 =?utf-8?B?ZllSLzVETzYycHBrSFYwcEFDN3NMd1p5a2dVTWI5Z3VjcER3S28zMHBlWktl?=
 =?utf-8?B?aUYyL1F2d2hvL0pqY3NiMHpLUWNiNHdoa2cvVWxmSmdVMGdYM3ppa0ZLWXBF?=
 =?utf-8?B?bXRuQ0QyR1lyY04wQmFmTi84TTdwaUM1N09qMEhOc2psZlFnUStLQldKdmZQ?=
 =?utf-8?B?QXUvWmg4R2lsdlFIM2pmeWdRZFR1akVONjMzOEtWSzdDdWtXcWFlMzRzMjY2?=
 =?utf-8?B?ZEowdUR6TjFvVFVWT2xHMjI5TTFpSG9leGtSdnVNdlZ2RjQ3K3dMVmQ4Y3pD?=
 =?utf-8?B?Z2Y4azNWTmtzaTZwMVc5U1ZhNFYzRzF3ck9pT3A3aVN2Rk1Ma3JHaUNuaXIx?=
 =?utf-8?B?UnpVa3QyUGpmY3B2T3paQXhibHFFc3lLVDNlYWNSbUpWZGMwd1FnVXBtOVY2?=
 =?utf-8?B?aDNwSFNJbzFyTzVlK3pEdU14VjRVUDY1ZjJkUlQrUHFReERobUsxeFJqQlRR?=
 =?utf-8?B?OEJmTG44eDhGTTc5dE80anVTQzBqNmczT2VsK0hwN0sxSXNuQkJwK0pGUi8z?=
 =?utf-8?B?djJwSWJrb2ZhNUcrRUNhZTV4MTdKcmRIVmkvZnpiN1dJdFEyV0RqKzRVSDRJ?=
 =?utf-8?B?RE5leEhnd2VkeFBjQWpqVEMwYkZaWE0xUjJLczBiNFNIeVFORk03NFhyNWpn?=
 =?utf-8?Q?jqnXzOAne/ZwFmc6+GAhYt6vR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b034dd-39d5-4d51-d15d-08db7bbdc691
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 12:05:21.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT5+eTrug1J2bXx2r6l/f+BCb6SaiJs8mg+sDyhQ5GKOfWir2aPBdGXgjMcLMhH/nVhGwFR+j4P7/Uc3bF5Hmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5380
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
Content-Type: multipart/mixed; boundary="===============6146136797586688090=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6146136797586688090==
Content-Type: multipart/alternative;
 boundary="------------OWqGTO0eE0MlhdQdhA8zGzKS"

--------------OWqGTO0eE0MlhdQdhA8zGzKS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 2023/6/30 19:11, Thomas Gleixner wrote:
> On Tue, Jun 27 2023 at 13:00, Uwe Kleine-König wrote:
>> On Tue, Jun 27, 2023 at 06:12:01PM +0800, Yangtao Li wrote:
>>
>> While I assume changing to dev_err_probe is a result of my concern that
>> no error should be printed when rc=-EPROBEDEFER, my other concern that
>> adding an error message to a generic allocation function is a bad idea
>> still stands.
> I agree in general, but if you actually look at the call sites of
> devm_request_threaded_irq() then the vast majority of them print more or
> less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
>
>       519 messages total (there are probably more)
>
>       352 unique messages
>
>       323 unique messages after lower casing
>
>           Those 323 are mostly just variants of the same patterns with slight
>           modifications in formatting and information provided.
>
>       186 of these messages do not deliver any useful information,
>           e.g. "no irq", "
>
>       The most useful one of all is: "could request wakeup irq: %d"
>
> So there is certainly an argument to be made that this particular
> function should print a well formatted and informative error message.
>
> It's not a general allocator like kmalloc(). It's specialized and in the
> vast majority of cases failing to request the interrupt causes the
> device probe to fail. So having proper and consistent information why
> the device cannot be used _is_ useful.
>
> Yangtao: The way how this is attempted is not useful at all.
>
>      1) The changelog is word salad and provides 0 rationale
>
>         Also such series require a cover letter...
>
>      2) The dev_err() which is added is not informative at all and cannot
>         replace actually useful error messages. It's not that hard to
>         make it useful.
>
>      2) Adding the printks unconditionally first will emit two messages
>         with different content.
>
>         This is not how such changes are done.
>
>         The proper approach is to create a wrapper function which emits
>         the error message:
>
>         wrapper(....., const char *info)
>         {
>              ret = devm_request_threaded_irq(....);
>              if (ret < 0) {
>                 dev_err(dev, "Failed to request %sinterrupt %u %s %s: %d\n,
>                         thread_fn ? "threaded " : "",
>                         irq, devname, info ? : "", ret);
>              }
>              return ret;
>         }


Here.

V3 was modified according to tglx's suggestion, if there is any problem, 
please point out.


Thx,
Yangtao


>         Then convert the callsites over one by one with proper
>         changelogs and justification.
>
>         See?
>
> Thanks,
>
>          tglx
--------------OWqGTO0eE0MlhdQdhA8zGzKS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><span style=3D"color: rgb(18, 23, 50); font-family: &quot;Microsoft =
YaHei&quot;, arial, sans-serif; font-size: 14px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; background-color: rgb(247, 248, 250); text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;">Hi  Krzysztof,</span><span style=3D"color: rgb(18, 23, =
50); font-family: &quot;Microsoft YaHei&quot;, arial, sans-serif; font-size=
: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; wi=
dows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-colo=
r: rgb(247, 248, 250); text-decoration-style: initial; text-decoration-colo=
r: initial; display: inline !important; float: none;"></span></p>
    <div class=3D"moz-cite-prefix">On 2023/6/30 19:11, Thomas Gleixner
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:87h6qpyzkd.ffs@tglx">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jun 27 2023 at 13:00, =
Uwe Kleine-K=C3=B6nig wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jun 27, 2023 at 06:1=
2:01PM +0800, Yangtao Li wrote:

While I assume changing to dev_err_probe is a result of my concern that
no error should be printed when rc=3D-EPROBEDEFER, my other concern that
adding an error message to a generic allocation function is a bad idea
still stands.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I agree in general, but if you actually look at the call sites of
devm_request_threaded_irq() then the vast majority of them print more or
less lousy error messages. A quick grep/sed/awk/sort/uniq revealed

     519 messages total (there are probably more)

     352 unique messages

     323 unique messages after lower casing

         Those 323 are mostly just variants of the same patterns with sligh=
t
         modifications in formatting and information provided.

     186 of these messages do not deliver any useful information,
         e.g. &quot;no irq&quot;, &quot;

     The most useful one of all is: &quot;could request wakeup irq: %d&quot=
;

So there is certainly an argument to be made that this particular
function should print a well formatted and informative error message.

It's not a general allocator like kmalloc(). It's specialized and in the
vast majority of cases failing to request the interrupt causes the
device probe to fail. So having proper and consistent information why
the device cannot be used _is_ useful.

Yangtao: The way how this is attempted is not useful at all.

    1) The changelog is word salad and provides 0 rationale

       Also such series require a cover letter...

    2) The dev_err() which is added is not informative at all and cannot
       replace actually useful error messages. It's not that hard to
       make it useful.

    2) Adding the printks unconditionally first will emit two messages
       with different content.

       This is not how such changes are done.

       The proper approach is to create a wrapper function which emits
       the error message:

       wrapper(....., const char *info)
       {
            ret =3D devm_request_threaded_irq(....);
            if (ret &lt; 0) {
               dev_err(dev, &quot;Failed to request %sinterrupt %u %s %s: %=
d\n,
                       thread_fn ? &quot;threaded &quot; : &quot;&quot;,
                       irq, devname, info ? : &quot;&quot;, ret);
            }
            return ret;
       }
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Here.<br>
      <br>
      V3 was modified according to tglx's suggestion, if there is any
      problem, please point out.<br>
      <br>
      <br>
      Thx,<br>
      Yangtao<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:87h6qpyzkd.ffs@tglx">
      <pre class=3D"moz-quote-pre" wrap=3D"">
       Then convert the callsites over one by one with proper
       changelogs and justification.

       See?

Thanks,

        tglx
</pre>
    </blockquote>
  </body>
</html>

--------------OWqGTO0eE0MlhdQdhA8zGzKS--

--===============6146136797586688090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6146136797586688090==--
