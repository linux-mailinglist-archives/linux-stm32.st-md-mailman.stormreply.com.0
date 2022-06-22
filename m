Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEF554F38
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jun 2022 17:29:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC2E8C57B6C;
	Wed, 22 Jun 2022 15:29:05 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04602C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 15:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C24J7vJxooAMSwTnD/z9fqxuXAmEGvFBab7umMdE/cGKidw9dRDajKx8h3ObqhrJ8DVb7SinmCPt13AneiIafm4mgJn6lvVysJTxNrsoBiUIZmBEUFXnN1TgBJLnuiE7GqacgoO+Y0IMxgT/wcQIdhizWQWbomAUIzILGkU+4Z25NbwWDVbRydF8E+7zI9wNxop+WkoqAp5XVr4PP+84pbyuvKI936foW1/x1imgGJfmH2JiUdZvTDwOqo4+qxAiFB23wFgB/TQXFy57qxGX4beycREp6oa+UM8Bn5rb9+a5AxrJoh0W43ITc9WjtfUnTtZ2LakQgo7XpnF2fg/SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZWcOeWrYxr6YLyWmgFGQ0usbfmRPd+QgP9Yi/PkTOY=;
 b=PluHj0JM1p4KPsq7p80GtzotCwhN69SpZ+PxWc4rCJ/A6O+Si49LBlEBJslU1TeC7xNZdeR4XUYFRSGiAhEmSMfdJUHzROGdiDmRhh/4IS3g5q6erXfQiTzSoimwnwoaZshvR5jNfBe0yf+vvLJyGJMAp8KPdj7S8TN4XU0XK+Gor13wRq/PkI0bVGUTYpM9lnvE3ae7hOG3Hy2RCBBajaBrx+2CdBGIs9JgOTkFcP7wBAgHpW1/o9Zp8f1BEHbPoGv1OM4Anus2OfQhlfPxFOJAaOAWWfqS+Hnf193KggTecaOMkpOUUJFlduFqaa1TStKbW1uSW8GB33IyKx5lbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZWcOeWrYxr6YLyWmgFGQ0usbfmRPd+QgP9Yi/PkTOY=;
 b=T1p4sQaZ56OwNSwP5EhR6yDAOKRoL/38KKjDmmbE/Wsea6oBqs0hwPncDLSFFy+QaW5zic2xZh47CJQASRG7tYGQbfZTlFMJmiUxq5c13GWCzmQmKh6scUS4pH+zxC1R9P3qzwCSNpmMOB9OWL45D8HnhwLWFAxBHYLWFr1seGPZ5qZyHHixkefLuayPnCJrwyf/2iUb/pZyelwSlP29S9KhBURJlDmdqGrAPQm6ibNgggdowMuGJt0jpawTBBCMNrPqT8Qwrp1jmEgNgn6QorMcbF8DAiBiqao6LOVsTH8EVTLs2Z/ygoN0wUGLFWV8sbmReTXcJIAOQyqxAZzORQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM5PR12MB1754.namprd12.prod.outlook.com (2603:10b6:3:10f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Wed, 22 Jun 2022 15:29:02 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::190c:967c:2b86:24a8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::190c:967c:2b86:24a8%4]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 15:29:01 +0000
Message-ID: <04d96f89-cd87-945e-d603-637d8a0d34a0@nvidia.com>
Date: Wed, 22 Jun 2022 16:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
X-ClientProxiedBy: AS9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b22ff68-c897-4cca-d5f4-08da5463eefa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1754:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1754A36ED3B94A9A89F66CA5D9B29@DM5PR12MB1754.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGuym/fWf7mWMJhH2Gd4Gu4q8k2jhy6IkNEWFqyIO/T3Q9oP+OobPuVFWWPCFsV40TZp8z+NNc4PTd1rbIycZgWp1WqL3KHGg5/TU+ttkqQnYQdIObyfpj0ewu/VN4uioUM+Wjoutd/8GoDM7xqtTw9IVyceOocrTUU03pTGVhvCEQi0kmF5YyYRqqmK6LBTC7mecgoDsZ7y2cMoWJ1+AmJaSq/Ol9LsI09uBR8l2XIbLEcZ94r+u5X/STF8T1rjd5iSuf4QXcVNiwSHx7LmJQu0uDHw8naav85Xrtk2X/S8DjkZMzIu5CC3qQsPCrWcVPAnlXGQMbsoQZPh1HgnR70aPKgjMGDHPXh/BN0HcKnvvDzVZH4FRYeX8zgenzPtOYnZnLt8ADu5Gv9gxDEjNPg1OEUEfgesir20Zq6CdQJeXrkS1HarVOYk1j20OQpDoZL03eHovZD7TUQpUoQQNAGmvDenPyME9c8g0u+Fju0ooQbZnFlVp2DCb53dWUovarLc6w6qUPibQSxZhVETaiW6leHOQRSCvHoufrFB91/4kKatKqWd5Ix6AsN4NVlLEKB/mAsfcc3PZYLs4Y0RoSgnYlvctY1Lt4BmCBvvpVojr5fIISnqPR5Eed8Lu9V561cA6pG5ft+XxjTaw84rLMSDC1UtGcqwNLTAqsBjDkdCR8A/C4C99UZr7jA8BmXtEPCPdTTqjV1kAMY9/APMtH1m+zGgWhV2H0889epMmvI8Xpp+kA3deDmZ3HRM8Jc5z6hKu0ehzxXepWZaq2rytjg+ikt5EC+CEPQGmDSQ8BsQ1iR2hD7dL+EtpVikdqXFerONzmtZ42Tf4f4i9Yr6tJfWUHP2TOwWltRJChe2Is54jv74hI6kT0hvF48mNt5c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(4326008)(66556008)(26005)(6666004)(54906003)(66946007)(53546011)(6512007)(8676002)(66476007)(66574015)(31686004)(55236004)(110136005)(83380400001)(6506007)(41300700001)(2616005)(966005)(6486002)(7406005)(86362001)(8936002)(7416002)(7366002)(2906002)(316002)(31696002)(186003)(45080400002)(36756003)(5660300002)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlM5SE44akVVZU51OUVtYUhLdGxVckhTMmtlbHFpVzN6dXpqeVdXdk5PeXpV?=
 =?utf-8?B?ZXZiMTVGby8vUFpRTG9xUGdZUi95c1krRllJc00wRE82V3RXV3B3ZkVqOFBh?=
 =?utf-8?B?SHVpeWhsdngyb2YvU1RBdjNsNGJyRWZnYlRnMFE2RktYSmJMQzcyNnJrZnV0?=
 =?utf-8?B?bmdLVDBKZE5xbXU5bGJZWkZGL2dUTWFiNWtsNWZzSEtZWkhuSDFra3JrREg4?=
 =?utf-8?B?ZFNSSjdKcUpNT2dPSW04N2JlNXFFYjlSRWNuVzFMVlYxRVZCU0MyV3JNRm92?=
 =?utf-8?B?T0RsTXFUV0JZTFJmeG5TalBOOXlBRklSc25BUitCazhRL1pMUlBHR085cUVP?=
 =?utf-8?B?MzRjTXN0aHQyVDkyWHlJdzFtMmV2aHNUMWVvbGRKZ25qNFJBKytJTTdsNWNr?=
 =?utf-8?B?Vm5WOGVSdWRMNmFGMGNhVXBEamVZemtzOWt6VGcxQTRWNG4xNGVNTnZWK2Yz?=
 =?utf-8?B?SE5UeGM2WXRrb0Uyc1IrU3c4a0cwZlJaUER1TS8zTEkzTzJ6NFRTZ3NwY3Jj?=
 =?utf-8?B?aWVUZExPQk1KUmxpQkN4VXlUSVdhNlNIeDBtQjBXNWt4cXlTb2JzRGNSVms0?=
 =?utf-8?B?L1hicWJycFd1d0dvdjdib2E3a3lLUFNOR1JVRklkN0dySjg2aUxmYUk5UWZM?=
 =?utf-8?B?ek1reWZMb2xkYzA1eExLMHh6K3NuWFJEdnNxME5PTWI4RXJ3VUEzaW5EdlNB?=
 =?utf-8?B?cnVsS3cveVU4M3dOQk1BcVkxQ2NXV0JhaGV4bStzTVpJYVVhVS9SMzdWZGEr?=
 =?utf-8?B?Y2RxY2t1cU9RREJYTWsxTXJ6MUR3OUROdE9xWmpzSG9NNDJlbTRObEFHNnNp?=
 =?utf-8?B?a3FqU2dWZnZIQUhCRnVzV2poV3JUcENZT0JCcW1UMWNqeFRydE9YRW92Qms5?=
 =?utf-8?B?Z1ZNd3NjWU0zcGlUMWdNUlo5ZkpMZXdGTTJnRlBsSnlZaWRBeDRGb1FXT1Y0?=
 =?utf-8?B?N3R1NlU0ZFlYU0w0eTl1d3FGMXFSNm5UMXhhSHIyZVZlUnM0U2pHQ3JnMXNB?=
 =?utf-8?B?YXl1Ni80THdhY3Z0ZmVYWGdRQ29sdi8ydlhPWTNpNUJ1QTl3SXlaVzFqQ1N3?=
 =?utf-8?B?dHRVUDAxYTM0cDh6R1p6RDdDbXlIYTM5YkcxaWJydjVPRi9xMGhKTWRKem0x?=
 =?utf-8?B?bTBxOVNhd1YrRThGNEROeGM1cDRENk5CeHVWWENwakRMVmlVeGdwVWtiNU43?=
 =?utf-8?B?ekErcWVrelNuVTdnN092a1hJQjQ2V1hQRjJoK2VvdGxzclY0WUl3dmJ3U3g2?=
 =?utf-8?B?aEpEQm15ME92c1BMQmFrc3FGcnNvOUZoY0ZhTnBLcGtqOXQxRnBUTU9WK1dQ?=
 =?utf-8?B?amVETmxxTDNwaysvandKUGczL2VtRnRJaGlJMXpDaXp5bkQvb0I2UFdDN3My?=
 =?utf-8?B?NTJVTTVSNlE3cmtuR3A1L1g1bTFxRyt2MGV4ZVI3d01UQ2IxUDZtYmVDNkVD?=
 =?utf-8?B?dVRCTHFDcndxTlluSFZ3bnVQZEp6djNpZ29GcnQ2TFFXbHdQakx6Y0dudTB2?=
 =?utf-8?B?K2FnUU1LUW5maWh2d3dVM1BWMDY3a2NoUmtXMTFNNWkyb1BtdmtUNHpvRHAz?=
 =?utf-8?B?RWd5dHZNUUFrYVpMdnpMQkxHd0JTZ2FWMVdVU3AwcEFuQzkySEhyRGF6WFl6?=
 =?utf-8?B?a1FvMUJ1ODh4YVpkak96OGxjVlMzSG9PN09SOWRZOXJJL3pLbC9meEVSc0pq?=
 =?utf-8?B?amU2MnQrUDliaHY3dHhrTXpWcXRXNnhiRWJUNmZVa25NWURhUTNJWEkyZ3Ev?=
 =?utf-8?B?Yk5na3UwMXMxVHdweVRKRkwzRlI4NVE3QzVRejdFdHlxNEo5cm0rT3lWa0hv?=
 =?utf-8?B?ZGVtdkswWEtFNktKREdzN2hGd1RFaENZby95eWlpbVBoS2RibFI4ZlFCQytj?=
 =?utf-8?B?K0ZVc1NDWW5FQ2hpRzFydVhtYTJhZEtobTZyQURaWFhkZ2Qrb045ZW5RUCto?=
 =?utf-8?B?cFZCanZBYzBnNVJTRytrZk9GVUllNWtjZnRNTGhjUFJmVjNyU2JuOUhHK0VG?=
 =?utf-8?B?RURkZEh5a2p5LzBqcURlZ0E1ZDJzSG5XSXZSWE9nczh2bjd4aXJ5UHV1Mlo0?=
 =?utf-8?B?SWZjUmcyQy9nZENjVzMrdTM4SzRIQ2tEUWN3bC9uYWhPQ2NpV0FPN09pWFlt?=
 =?utf-8?B?ZlZtV0IzSGxKRFVEOWVEMlpXQWplL1NlYUFHZk5NQUpkYUZzU2RCeUpDNjZY?=
 =?utf-8?B?U3dGaFVSdTVkNVpLejNyQTFRZzV2MEFIZzFPaTJlKzFiQUZuTlh0R2tXU1BU?=
 =?utf-8?B?UVBNZEJYVGNWRTc3eFEwL0JoOHIxVlVqdEpqS3g2RHdSMGZLcitiUWRxamVY?=
 =?utf-8?B?emIzWUJJd2d5Wm1qWmdKa004NHpZUEpyelduWUMrVFgrWW5wK1B2anZmUmUv?=
 =?utf-8?Q?0E66pJxcpUhIoOvc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b22ff68-c897-4cca-d5f4-08da5463eefa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:29:01.6903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnyvwKwSQAW1n7ZE/7QvOrkpzQ6PxxiI6TskPkXk3rBMFzyuo7mHYyfWUYBKHDbb3b78ugHIJM4NSj711PHzbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Alexandru Ardelean <aardelean@deviqon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomislav Denis <tomislav.denis@avl.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, linux-iio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>, linux-mips@vger.kernel.org,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-watchdog@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 kernel@pengutronix.de, Lars Povlsen <lars.povlsen@microchip.com>,
 linux-hwmon@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, UNGLinuxDriver@microchip.com,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-crypto@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v8 01/16] clk: generalize devm_clk_get() a
	bit
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

CgpPbiAyMS8wNi8yMDIyIDIxOjQ5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBPbiBUdWUs
IEp1biAyMSwgMjAyMiBhdCAwODo1NzowMFBNICswMTAwLCBKb24gSHVudGVyIHdyb3RlOgo+PiBT
b21lIG9mIG91ciBUZWdyYSBib2FyZHMgYXJlIG5vdCBib290aW5nIHdpdGggdGhlIGN1cnJlbnQg
LW5leHQgYW5kCj4+IGJpc2VjdCBpcyBwb2ludGluZyB0byB0aGlzIGNvbW1pdC4gTG9va2luZyBh
dCB0aGUgYm9vdCBsb2cgSSBhbQo+PiBzZWVpbmcgdGhlIGZvbGxvd2luZyBwYW5pYyAuLi4KPj4K
Pj4gWyAgICAyLjA5NzA0OF0gODwtLS0gY3V0IGhlcmUgLS0tCj4+IFsgICAgMi4wOTcwNTNdIFVu
YWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBj
MjE2YzgxMAo+PiBbICAgIDIuMDk3MDYwXSBbYzIxNmM4MTBdICpwZ2Q9MDIwMTE0MWUoYmFkKQo+
PiBbICAgIDIuMDk3MDc5XSBJbnRlcm5hbCBlcnJvcjogT29wczogODAwMDAwMGQgWyMxXSBTTVAg
QVJNCj4+IFsgICAgMi4wOTcwODhdIE1vZHVsZXMgbGlua2VkIGluOgo+PiBbICAgIDIuMDk3MDk3
XSBDUFU6IDEgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjE5LjAtcmMzLW5l
eHQtMjAyMjA2MjEtZzM0ZDFkMzYwNzNlYSAjMQo+PiBbICAgIDIuMDk3MTA3XSBIYXJkd2FyZSBu
YW1lOiBOVklESUEgVGVncmEgU29DIChGbGF0dGVuZWQgRGV2aWNlIFRyZWUpCj4+IFsgICAgMi4w
OTcxMTNdIFBDIGlzIGF0IDB4YzIxNmM4MTAKPj4gWyAgICAyLjA5NzEyM10gTFIgaXMgYXQgZGV2
bV9jbGtfcmVsZWFzZSsweDE4LzB4MjQKPj4gWyAgICAyLjA5NzE1MF0gcGMgOiBbPGMyMTZjODEw
Pl0gICAgbHIgOiBbPGMwODhjYjA0Pl0gICAgcHNyOiBhMDAwMDAxMwo+PiBbICAgIDIuMDk3MTU1
XSBzcCA6IGYwODBkZGU4ICBpcCA6IDAwMDAwNmNmICBmcCA6IGMxOGQ0ODU0Cj4+IFsgICAgMi4w
OTcxNjFdIHIxMDogYzE1MDE4NTAgIHI5IDogYzFhMDRkMTAgIHI4IDogYzFjNGVmYTAKPj4gWyAg
ICAyLjA5NzE2Nl0gcjcgOiBjMjE2YzgxMCAgcjYgOiBmMDgwZGUxYyAgcjUgOiBjMjczNzY4MCAg
cjQgOiBjMjZhOTY4MAo+PiBbICAgIDIuMDk3MTcyXSByMyA6IGMyMTZjODEwICByMiA6IDAwMDAw
MDAwICByMSA6IGMyNzM3ODQwICByMCA6IGMyMDgyODQwCj4+IFsgICAgMi4wOTcxNzldIEZsYWdz
OiBOekN2ICBJUlFzIG9uICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgSVNBIEFSTSAgU2VnbWVudCBu
b25lCj4+IFsgICAgMi4wOTcxODddIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogMDAyMDQwNGEg
IERBQzogMDAwMDAwNTEKPj4gWyAgICAyLjA5NzE5MV0gUmVnaXN0ZXIgcjAgaW5mb3JtYXRpb246
IHNsYWIga21hbGxvYy0xOTIgc3RhcnQgYzIwODI4NDAgcG9pbnRlciBvZmZzZXQgMCBzaXplIDE5
Mgo+PiBbICAgIDIuMDk3MjE2XSBSZWdpc3RlciByMSBpbmZvcm1hdGlvbjogc2xhYiBrbWFsbG9j
LTEyOCBzdGFydCBjMjczNzgwMCBwb2ludGVyIG9mZnNldCA2NCBzaXplIDEyOAo+PiBbICAgIDIu
MDk3MjM2XSBSZWdpc3RlciByMiBpbmZvcm1hdGlvbjogTlVMTCBwb2ludGVyCj4+IFsgICAgMi4w
OTcyNDRdIFJlZ2lzdGVyIHIzIGluZm9ybWF0aW9uOiBzbGFiIGttYWxsb2MtMWsgc3RhcnQgYzIx
NmM4MDAgcG9pbnRlciBvZmZzZXQgMTYgc2l6ZSAxMDI0Cj4+IFsgICAgMi4wOTcyNjNdIFJlZ2lz
dGVyIHI0IGluZm9ybWF0aW9uOiBzbGFiIGttYWxsb2MtNjQgc3RhcnQgYzI2YTk2ODAgcG9pbnRl
ciBvZmZzZXQgMCBzaXplIDY0Cj4+IFsgICAgMi4wOTcyODJdIFJlZ2lzdGVyIHI1IGluZm9ybWF0
aW9uOiBzbGFiIGttYWxsb2MtMTI4IHN0YXJ0IGMyNzM3NjgwIHBvaW50ZXIgb2Zmc2V0IDAgc2l6
ZSAxMjgKPj4gWyAgICAyLjA5NzMwMV0gUmVnaXN0ZXIgcjYgaW5mb3JtYXRpb246IDItcGFnZSB2
bWFsbG9jIHJlZ2lvbiBzdGFydGluZyBhdCAweGYwODBjMDAwIGFsbG9jYXRlZCBhdCBrZXJuZWxf
Y2xvbmUrMHhiNC8weDNlOAo+PiBbICAgIDIuMDk3MzIxXSBSZWdpc3RlciByNyBpbmZvcm1hdGlv
bjogc2xhYiBrbWFsbG9jLTFrIHN0YXJ0IGMyMTZjODAwIHBvaW50ZXIgb2Zmc2V0IDE2IHNpemUg
MTAyNAo+PiBbICAgIDIuMDk3MzQxXSBSZWdpc3RlciByOCBpbmZvcm1hdGlvbjogbm9uLXNsYWIv
dm1hbGxvYyBtZW1vcnkKPj4gWyAgICAyLjA5NzM0OF0gUmVnaXN0ZXIgcjkgaW5mb3JtYXRpb246
IG5vbi1zbGFiL3ZtYWxsb2MgbWVtb3J5Cj4+IFsgICAgMi4wOTczNTVdIFJlZ2lzdGVyIHIxMCBp
bmZvcm1hdGlvbjogbm9uLXNsYWIvdm1hbGxvYyBtZW1vcnkKPj4gWyAgICAyLjA5NzM2Ml0gUmVn
aXN0ZXIgcjExIGluZm9ybWF0aW9uOiBub24tc2xhYi92bWFsbG9jIG1lbW9yeQo+PiBbICAgIDIu
MDk3MzY5XSBSZWdpc3RlciByMTIgaW5mb3JtYXRpb246IG5vbi1wYWdlZCBtZW1vcnkKPj4gWyAg
ICAyLjA5NzM3NV0gUHJvY2VzcyBzd2FwcGVyLzAgKHBpZDogMSwgc3RhY2sgbGltaXQgPSAweChw
dHJ2YWwpKQo+PiBbICAgIDIuMDk3Mzg0XSBTdGFjazogKDB4ZjA4MGRkZTggdG8gMHhmMDgwZTAw
MCkKPj4gWyAgICAyLjA5NzM5NF0gZGRlMDogICAgICAgICAgICAgICAgICAgYzI3Mzc4MDAgYzBh
NzJkMzggYzE4ZDQ4NTQgYzA1MzA0OTAgYzIxNmM4MTAgZjA4MGRlMWMKPj4gWyAgICAyLjA5NzQw
NF0gZGUwMDogYzIxMjAwMDAgMDAwMDAwMDUgYzIxNmM5YzAgODAwMDAwMTMgMDAwMDAxN2UgYzBh
NzNkNjggMDAwMDAwMDggYzI2MjllMDAKPj4gWyAgICAyLjA5NzQxM10gZGUyMDogYzI3Mzc4ODAg
NTY0MGUxNDEgYzIxNmM4MTAgYzIxNmM4MTAgMDAwMDAyMDUgYzFjMDlkZDQgMDAwMDAwMDAgYzI3
Mzc1YjgKPj4gWyAgICAyLjA5NzQyMl0gZGU0MDogYzIwOTE3MDAgYzBhNmU5YTAgYzIxNmM4MTAg
YzBhNmYyODggYzIxNmM4MTAgYzFjMDlkZDQgYzIxNmM4MTAgMDAwMDAwMDAKPj4gWyAgICAyLjA5
NzQzMF0gZGU2MDogYzI3Mzc1YjggYzBhNmYzYzAgYzFjYWE4ZTAgYzIxNmM4MTAgYzIxNmM4MTAg
YzBhNmY0NTAgMDAwMDAwMDAgYzIxNmM4MTAKPj4gWyAgICAyLjA5NzQzOV0gZGU4MDogYzFjMDlk
ZDQgYzIxMjAwMDAgYzI3Mzc1YjggYzBhNmY4NTAgMDAwMDAwMDAgYzFjMDlkZDQgYzBhNmY3YzQg
YzBhNmQ0YzAKPj4gWyAgICAyLjA5NzQ0N10gZGVhMDogMDAwMDAwMDAgYzIwOTE0NTggYzIyODY0
MzQgNTY0MGUxNDEgYzFiZTdmMDggYzFjMDlkZDQgYzI3Mzc1ODAgYzFiZTdmMDgKPj4gWyAgICAy
LjA5NzQ1NV0gZGVjMDogMDAwMDAwMDAgYzBhNmU0ODQgYzE2MTU3MTQgYzFiZTdjNTAgYzFjMDlk
ZDQgYzIxMjAwMDAgYzE4OWE5OWMgMDAwMDAwMDAKPj4gWyAgICAyLjA5NzQ2NF0gZGVlMDogYzIx
MjAwMDAgYzBhNzAxYTAgYzFjNDk0ZTAgYzIxMjAwMDAgYzE4OWE5OWMgYzAzMDIxNDQgMDAwMDAx
N2QgYzAzNjQ0MzgKPj4gWyAgICAyLjA5NzQ3Ml0gZGYwMDogYzE2ZGE4YmMgYzE2MjY3MDAgMDAw
MDAwMDAgMDAwMDAwMDYgMDAwMDAwMDYgYzE2NTU0YzggMDAwMDAwMDAgYzIxMjAwMDAKPj4gWyAg
ICAyLjA5NzQ4MF0gZGYyMDogYzE1MTA1YmMgYzE0Zjk3NzggYzIwOTE3MDAgYzIwOTE3ZDkgMDAw
MDAwMDAgNTY0MGUxNDEgYzFhODg5MzAgYzE2ZGE4YmMKPj4gWyAgICAyLjA5NzQ4OF0gZGY0MDog
YzFjNTkwMDAgNTY0MGUxNDEgYzE2ZGE4YmMgYzFjNTkwMDAgYzE5NTNiNGMgYzE4ZDQ4MzQgMDAw
MDAwMDcgYzE4MDEzNDAKPj4gWyAgICAyLjA5NzQ5N10gZGY2MDogMDAwMDAwMDYgMDAwMDAwMDYg
MDAwMDAwMDAgYzE4MDA0ZGMgYzIxMjAwMDAgYzE4MDA0ZGMgZjA4MGRmNzQgYzFhMDRjYzAKPj4g
WyAgICAyLjA5NzUwNV0gZGY4MDogYzEwNmJiZjAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgYzEwNmJjMDgKPj4gWyAgICAyLjA5NzUxM10gZGZh
MDogMDAwMDAwMDAgYzEwNmJiZjAgMDAwMDAwMDAgYzAzMDAxYTggMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAKPj4gWyAgICAyLjA5NzUyMF0gZGZjMDogMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAK
Pj4gWyAgICAyLjA5NzUyOF0gZGZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMTMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPj4gWyAgICAyLjA5NzU0Ml0g
IGRldm1fY2xrX3JlbGVhc2UgZnJvbSByZWxlYXNlX25vZGVzKzB4NTgvMHhjMAo+PiBbICAgIDIu
MDk3NTc1XSAgcmVsZWFzZV9ub2RlcyBmcm9tIGRldnJlc19yZWxlYXNlX2FsbCsweDdjLzB4YzAK
Pj4gWyAgICAyLjA5NzU5Nl0gIGRldnJlc19yZWxlYXNlX2FsbCBmcm9tIGRldmljZV91bmJpbmRf
Y2xlYW51cCsweGMvMHg2MAo+PiBbICAgIDIuMDk3NjI2XSAgZGV2aWNlX3VuYmluZF9jbGVhbnVw
IGZyb20gcmVhbGx5X3Byb2JlKzB4MWY0LzB4MmE4Cj4+IFsgICAgMi4wOTc2NTBdICByZWFsbHlf
cHJvYmUgZnJvbSBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg4NC8weGU0Cj4+IFsgICAgMi4wOTc2
NzNdICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UgZnJvbSBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MzAv
MHhkMAo+PiBbICAgIDIuMDk3Njk2XSAgZHJpdmVyX3Byb2JlX2RldmljZSBmcm9tIF9fZHJpdmVy
X2F0dGFjaCsweDhjLzB4ZjAKPj4gWyAgICAyLjA5NzcxM10gIF9fZHJpdmVyX2F0dGFjaCBmcm9t
IGJ1c19mb3JfZWFjaF9kZXYrMHg3MC8weGIwCj4+IFsgICAgMi4wOTc3MjldICBidXNfZm9yX2Vh
Y2hfZGV2IGZyb20gYnVzX2FkZF9kcml2ZXIrMHgxNjgvMHgxZjQKPj4gWyAgICAyLjA5Nzc0OV0g
IGJ1c19hZGRfZHJpdmVyIGZyb20gZHJpdmVyX3JlZ2lzdGVyKzB4N2MvMHgxMTgKPj4gWyAgICAy
LjA5Nzc2Nl0gIGRyaXZlcl9yZWdpc3RlciBmcm9tIGRvX29uZV9pbml0Y2FsbCsweDQ0LzB4MWVj
Cj4+IFsgICAgMi4wOTc3ODRdICBkb19vbmVfaW5pdGNhbGwgZnJvbSBrZXJuZWxfaW5pdF9mcmVl
YWJsZSsweDFkNC8weDIyNAo+PiBbICAgIDIuMDk3ODAzXSAga2VybmVsX2luaXRfZnJlZWFibGUg
ZnJvbSBrZXJuZWxfaW5pdCsweDE4LzB4MTJjCj4+IFsgICAgMi4wOTc4MjBdICBrZXJuZWxfaW5p
dCBmcm9tIHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjCj4+IFsgICAgMi4wOTc4MzFdIEV4Y2VwdGlv
biBzdGFjaygweGYwODBkZmIwIHRvIDB4ZjA4MGRmZjgpCj4+IFsgICAgMi4wOTc4MzldIGRmYTA6
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIDAwMDAwMDAwCj4+IFsgICAgMi4wOTc4NDddIGRmYzA6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4+
IFsgICAgMi4wOTc4NTRdIGRmZTA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDEzIDAwMDAwMDAwCj4+IFsgICAgMi4wOTc4NjJdIENvZGU6IGMyMjg4NjgwIGZmZmZm
ZmZmIDAwMDAwMDAwIDAwMDAwMDAwIChjMjI4ODY4MCkKPj4gWyAgICAyLjA5Nzg3Ml0gLS0tWyBl
bmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4+Cj4+Cj4+IExldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSB0aG91Z2h0cy4KPiAKPiBZZWFoLCBzb3JyeSwgdGhlcmUgaXMgYWxyZWFkeSBh
IGZpeCBhdAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDIyMDYyMDE3MTgx
NS4xMTQyMTItMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUKClRoYW5rcyEgV29ya3Mg
Zm9yIG1lLgoKVGVzdGVkLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KCj4g
KFBybyB0aXBwOiBUaGUgY29tbWl0IGluIG5leHQgaGFzIGEgTGluazogZm9vdGVyLiBJZiB5b3Ug
Zm9sbG93IHRoZQo+IGxpbmssIHlvdSBmaW5kIHRoZSB0aHJlYWQgdGhhdCB3YXMgYWN0dWFsbHkg
YXBwbGllZCAoaS5lLiB2OSkgYW5kIHdoZXJlCj4gdGhlIGZpeCBpcyBhbHNvIGNvbnRhaW5lZC4K
ClRoYW5rcyBmb3IgdGhlIHRpcCEKCkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
