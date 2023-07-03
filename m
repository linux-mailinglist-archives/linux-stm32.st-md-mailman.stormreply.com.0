Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE3745BB3
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 13:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B8CEC6B45A;
	Mon,  3 Jul 2023 11:54:52 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2119.outbound.protection.outlook.com [40.107.255.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988F7C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 11:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoZ/VLjDvA9ZntXfzYZ3w5EhsRf4+xrfsje6krnt9Go6tD2+iIf7jaeGTmkuPRlYTuLLWmBP4ot0enIznUrP/FI/TmpEi5oi4DZOf81RdPv6SU0tXvpku+QKY+JMg7LXKZGnr8wDRxfRQTQVUZCZQ8nia0nM2gvuX1CCZY/xSathT3yxYAA10YXbTsX0bIO/MG81DD1RXtFAo4bHzYBJCjk3Oa1l/YgqUwS1CaYDK8jwSFTUqvE1OjtIOfhoZx6CDc2+WbY5IjWlfz9yjQQ8J1r/kRZO8tK/WkQoLKt7odJFOWFeRtiAXpMT4rI7k9RB5UVwqqtpVLtP8OdZu5ZU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YQsNC9wJsXaW4Hb4GE0OvDvtwFVjPiblL50s+eU5mo=;
 b=Iijd9IzT0Ux92rJJiRq/j3/S0Xi98dxcIDSQI3Aw3CKEOutC+/jOnLPc25QPdm+TjmByPKNmB8nuYkdjOYEwF04ySCmyyEM/4MRPTiq38dheOPZC62FYDsMWE+6JWwZh+pvu2+mgV9jc3VmPPM7e4iGGh5VIeaV8aIkfE6A9pLm/cYk/fJ7Pk+vaN1LTkhk24aa1RCCDKj66ASt4Lv+3mey9uLDiW2hIqnqHERQkPFFrDymceuR3beOTAS8f+BqOiVwNsSeKM/xHF96mKmDIlGrljjHEM5NvtFqcC+VhQ4MG+Qf7MvKZ4A5PSK5hJ0OzAPKlLxfDhVbMutaaS+YSTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YQsNC9wJsXaW4Hb4GE0OvDvtwFVjPiblL50s+eU5mo=;
 b=YWNXQznOECCKKv13fAyuNsju9YVTiYnE+eKxmzb6ypvYyhI9wZyDNB388z+w2XbKF/TaXxNL6g6Xc6Sucb7zwrbgdKDgwCF7q8OUlXz1mwtKRGmbo3bnnEvymVUM2Z9RT31+nRe/RB4pZ3N95WqieqYZQKftbM+E9xvKdCd28DeXi+WiAErKw20tvn+Lu6DabSF5h/d0mGWDVZNrDYFLbUVYgKpkwdYLXspe2fWSWQCks1Cwz8rCRZO4Tm53kOFxPkjiU/+M4r+IjaiRyxLG5dVneRxRq+a49y8+RTZ5YFvtt2FGBIiohq7nfA7B7TwkYriY/DbeZPVN03stHhAsAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:54:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 11:54:45 +0000
Message-ID: <247a8166-f131-2d07-ec2b-479a4c19297f@vivo.com>
Date: Mon, 3 Jul 2023 19:54:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de> <87h6qpyzkd.ffs@tglx>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <87h6qpyzkd.ffs@tglx>
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f5aa0d-5dfc-4d8f-8ddf-08db7bbc4b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHMmJzKffffDqbCG9voqvqnm8vcM3M+QymFAlci6hTPv3xBaf72JmE59qpVzioCBH1e2QxAg9ck2U7RIO5iNGrgJhDmDSna1ZbjqJhbJ1Scdi1WDsjG4tzo8smN3wFK0OasQ8lAu05HivnR9tp7EvOnuRlQqgvWYeOebvtpAhug5+ynJz8H86B6rDxNT6bVXH+r8DBUS4LCgdS3EhQhnZWCbQJAPOgNpyK3rXFFXNRU+7juZYLCe5vXGYzS1I7kEBRcDYo7XoLpY5+FiRbXhQUxL8vdJ8RJixwAadVQYq085eFu+yDDCvQzz9ThtJwkqxAJxJ6BYevNXCzpcFz45v0Kyq0K6qAMQUbG16WuS9j+bW6DB6VIgVAWbOwCe60foMD5H0laPZhlHvG7o/7jyGK/a3VWhaBcdgc1TtnOupzqOyGP+vbx09w0RxGyMozzoWeA53hapG71ZmqR3sS0YDcaACeZtKa4/tGr5tOJNwv0FSP2eLWngrOQULwugpIyLZ1fhAp3AzL4n20EyHLCHLiXGAL+zYCP7ZVuTyondrYHdYMVRedQPMPLrhm4nGechFSoIbYVoqwSReXf1/feB+/vNKN+WJ1lxXOhZajqd06dI5n8Cfsa+rxYlDjmKX9CZud/T6i9p25WT5pzFKPmEtMJ0GubhW6EthWyawJeiayW7SisSrHqEwppjJmi6OZuA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(451199021)(26005)(31686004)(478600001)(6666004)(6512007)(6506007)(31696002)(86362001)(2616005)(186003)(38350700002)(38100700002)(4326008)(66556008)(66946007)(66476007)(83380400001)(66574015)(110136005)(52116002)(6486002)(53546011)(33964004)(316002)(5660300002)(8676002)(8936002)(7416002)(7406005)(41300700001)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJnU29LZWFXOGtOdTFhVzhHa002OXpoRW5MWDNkUUR1MHlGejN5N21iaWpt?=
 =?utf-8?B?c3VMdHUxbHJJdHhGYzRYdE1iS1NPY3VBc1ZRbzExb0tyTUh3VW1rcUFndXJl?=
 =?utf-8?B?ekk0T1ZPb1BBdmV1cDkzWUJXUkFjZ0tqaVZQbFR6c21DeHdYTWtHbzFaSWJB?=
 =?utf-8?B?SHlia3krd3VwN25RS0xaano1NjZBY3VXSXZ1SlpTN0JKbnlVK1RpUSs3cGdO?=
 =?utf-8?B?blpiQnV5ektWMHpLRjF1U1NGSjhxaFJERWF4bDVQMEpDWlJkajBIT0Y0U0pR?=
 =?utf-8?B?bWRCc092b2NzV2JVc3Y1dDhGL011dkw3S3FqcFdrNUNWbStjUnZ5RGZoYjN6?=
 =?utf-8?B?Wmo0YzhZcDBTenB4TTNuTHgvc2Z5YkhpcWJyc1FXYUNodWJhUFhxZkNmZm0y?=
 =?utf-8?B?a0Rydmp4Q1BPSjg3TlArTFR6QlZUamZOL09WaDNKYi9ZaEdLcSt6OVVQR2Zp?=
 =?utf-8?B?cUFGeXYyNkRuekZ2UnNlK1BrMHZ5QkhuSWlWYWp6K2NMTjN4ZExPWnFML0Zq?=
 =?utf-8?B?WmdURkl4aEYzclZPYzVHOWxpdmJ4RDBnbmQ2U0twc3N1ZVYxR3lxdmRzRDJW?=
 =?utf-8?B?QURtMkU3ZDJ3czhCUy8zZ3hhUHhLWXNEeHJZZmtwOWtBOGZhbFgvOGRPTjI2?=
 =?utf-8?B?aHlMRUFka1JqNzNLQ3dEemZlV05TRzZnUW9iRDVidlB1M2E5L3RwV3JJdFZZ?=
 =?utf-8?B?azZ5T245NDZnejlkbjZZNUlKVjkzNlRiLzh1ZEN0U3pSWW05eUJJZi9haHo0?=
 =?utf-8?B?WlBHcUVvZWFwQmJnSTdWRWpnOVp0MTlOQUxCQTV2emNBaXRnSjVPR1VxdXYv?=
 =?utf-8?B?U1Z2T0JMRlJiVDJkMHJRczdvdWNxTTBpY3dlV1BHZmNSWlBVb1I2TXpGVUph?=
 =?utf-8?B?MnpGU0dxUXYydTFPZS9saEtVSXZOaFhsaEp4MkRwZnNrM3F5Z2E1Ynpud3FW?=
 =?utf-8?B?UHlEbDE3NldtMmQxYnIyeUFBMmRKNVRCb3p2MkJjSVkrblFqSURMTWQxTXVO?=
 =?utf-8?B?RUVJK0RRcDBHTHpUQ1gzczNLcHhIS3Z2MHlkMTIzbE9sOXRNVWtSVmdSejBI?=
 =?utf-8?B?U0pjRS9laEJadDMzWE1RSmtqNmVoVG5NenFTM1MzWGVYalBTMnhicEtYeC9x?=
 =?utf-8?B?TTFTUXlUQUE3YXZPNWFOMDV1aStHaE91aEFkdEZxOGM4ZFc3NkxBb0VtNlhm?=
 =?utf-8?B?UGdkaUs5L0ZrVDhTbHhzSWxwMVYwUjRGQmdENVViU3N6SExxU1VmYnk2Ylp5?=
 =?utf-8?B?bGhPOENOWVprY3FEbk5yQjViYXZrak9hdFdaSHRGZ0NZQjBySStXa0xUTmg2?=
 =?utf-8?B?RXRnaklTcmNLdlVXdEo4YnJQaEpOZDdjMmlHU2VOYzRxVUxYSGIzWUovNlNM?=
 =?utf-8?B?c2paQVYxN2JWYlBxYjNCZnhjZFNaSVBVSmJOd29lZGE4Wm81MmErMXV4OVYx?=
 =?utf-8?B?cTV2RTVRVFM1WE0wek9WcWI2MkppQWhoSFBObVluM0pyd3FZZHU5dm9DMHhw?=
 =?utf-8?B?eVV4STJDc1VLUExUYlJQc3l4azRydFlCUXlFcmd2MnRPeEh1cTdlNTJXNENF?=
 =?utf-8?B?MFJjYmRDTmt5eFAwWGFqYnhtMHQ1SFpnZEgrN2J0aENHc1Q1ZHU4VGJiTWpv?=
 =?utf-8?B?RUYyOTBxQ2QxTkVib2xLR1BVaFhVNzFxRWROcHorajdhU2xKK3BkeUpobkpl?=
 =?utf-8?B?SlB2YndlMWdLbnFieG5VNGJlTkFXTys4eEV0Z1pMOFI2Um56TVd3ZmFXNFJr?=
 =?utf-8?B?aWlJeUk0NnJVVXBMMnd1Y21VakRndTlJTEo5QVhMM3hKcnVnNWdmb21RNnhH?=
 =?utf-8?B?Sjdkcm9ENllRcUFNZG9PMml4aWsvVVFXMlRyZE1zaFJlQS9EQ1JwVjByV2xL?=
 =?utf-8?B?WGUrdTB2amxCUnZmby9QTEF0NVFnek5ocEEvVGpaNlErTWw5N2F6MHp4dWNr?=
 =?utf-8?B?ODgwVHFrYWtnQW9UN1lPRVhSUDlKSDgrVFA3L2htTWFkcUE2amhhNDM1QVJW?=
 =?utf-8?B?N2pwRG9WVFVjUjhVaVV2OG5WSWpubzhobzBncG54cmE2L3E4clVpemlSRjQz?=
 =?utf-8?B?U20vcTg2Ujl3ZmhjTWpKWXhrZERPajQ3UlUxUUE1bGluQTVzRUcybkh3cyt0?=
 =?utf-8?Q?lsNsZbrBmqFgNN5FtOi9mr6YA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f5aa0d-5dfc-4d8f-8ddf-08db7bbc4b33
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:54:45.0795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH5O4g+V3QGvGU5DyLeWrW3VVlgdk1jrXrw9vmBJUe/MFKvvD8CeLDa0+azQuskWI8QnrQf5kycZeQpdzWdi9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4461
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
Content-Type: multipart/mixed; boundary="===============7044354422025058278=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7044354422025058278==
Content-Type: multipart/alternative;
 boundary="------------5cKFZRjN9RDUAaGXaEAsVmXS"

--------------5cKFZRjN9RDUAaGXaEAsVmXS
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
--------------5cKFZRjN9RDUAaGXaEAsVmXS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi <span style="color: rgb(18, 23, 50); font-family: &quot;Microsoft YaHei&quot;, arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(247, 248, 250); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"> Krzysztof,</span></p>
    <div class="moz-cite-prefix">On 2023/6/30 19:11, Thomas Gleixner
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87h6qpyzkd.ffs@tglx">
      <pre class="moz-quote-pre" wrap="">On Tue, Jun 27 2023 at 13:00, Uwe Kleine-König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Jun 27, 2023 at 06:12:01PM +0800, Yangtao Li wrote:

While I assume changing to dev_err_probe is a result of my concern that
no error should be printed when rc=-EPROBEDEFER, my other concern that
adding an error message to a generic allocation function is a bad idea
still stands.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I agree in general, but if you actually look at the call sites of
devm_request_threaded_irq() then the vast majority of them print more or
less lousy error messages. A quick grep/sed/awk/sort/uniq revealed

     519 messages total (there are probably more)

     352 unique messages

     323 unique messages after lower casing

         Those 323 are mostly just variants of the same patterns with slight
         modifications in formatting and information provided.

     186 of these messages do not deliver any useful information,
         e.g. &quot;no irq&quot;, &quot;

     The most useful one of all is: &quot;could request wakeup irq: %d&quot;

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
            ret = devm_request_threaded_irq(....);
            if (ret &lt; 0) {
               dev_err(dev, &quot;Failed to request %sinterrupt %u %s %s: %d\n,
                       thread_fn ? &quot;threaded &quot; : &quot;&quot;,
                       irq, devname, info ? : &quot;&quot;, ret);
            }
            return ret;
       }
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Here. <br>
    </p>
    <p>V3 was modified according to tglx's suggestion, if there is any
      problem, please point out.<br>
    </p>
    <p><br>
    </p>
    <p>Thx,</p>
    <p>Yangtao</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:87h6qpyzkd.ffs@tglx">
      <pre class="moz-quote-pre" wrap="">
       Then convert the callsites over one by one with proper
       changelogs and justification.

       See?

Thanks,

        tglx
</pre>
    </blockquote>
  </body>
</html>

--------------5cKFZRjN9RDUAaGXaEAsVmXS--

--===============7044354422025058278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7044354422025058278==--
