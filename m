Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE04768DD8
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7106BC6DD9E;
	Mon, 31 Jul 2023 07:17:30 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BFDAC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 00:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUTw+GaxXAo8m7B/4EiLWvPeyR6kNfHX+LqHUG+iO+b00q24d3uLSQMQioutIwk2jepTG8XvzFTTmRLL1uTZI1rQ0e+0yRR0kv5GOjnCCRYIKmZWZZ8n8b/k8Us6vAFFYKj64c9mRrMWikXudEHNc+aa2ZX0a3ODnhiCELeYPVDWNTjEzF/Cvp7kaTwKItgRhubTU0fz5U/I2kVk2fvXG2ePDZwzYAySeSgYHyYbDMrXXEzWoqrdwPxeWGHvH1lissVVPoKhXvO9VlI1sep6pJVNX1rKp+7EMW6qj6YApGp7lEuuvhaiKri9/QeSvUwFuNrH0jAmmXOtV869MH1jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z5H35+F0RctIC+ljl2z7BhYqWE5Rp24IPpYbkFwomc=;
 b=gbH852GnHE3csMzrWtRgQF9QPxLtJi8uDaojIjmx3r8W+0Ey1KWQD98QYjMfSb0mRCwHx5789Ox4uKJM6jaI74doWzmMnd/PFmDJ6vPMGTfiZGvUWjrTvE+GAdnB3Q9j8fREsEF/Wu3voozV3JHoDPDszMPAOQ/n9SlyWVLIf1DvOLVEj6Sj7k4iup0QT7f+nUeO6hO/9pUd+gsX1GDM6h64JI0YtXCYwvrwo0YLZpHYmEGIfImYDzQ75CwM4cu7BoYJdNXNT5Qi3nPWxL3CEXgzQ3msklUfFc+m3ZJoz4htvvW6ACUGUxlsX5GcmguYbFdhXqybrcK5rz5+GF7HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z5H35+F0RctIC+ljl2z7BhYqWE5Rp24IPpYbkFwomc=;
 b=nI0CjZDiXaSvo8Be/EgRitxDIdf1OSksh20gaEk9fZlmEtivU+COKbmPteZ8GuziqBaODlRwxWSspRnPNmTGj4isIkdWdEtwaLG4vfTlsUNJh5OlhOqI66vNu0Lk1ZNr2Mj8t+AOgOmzSS8X2yaqxuMTPKHYhhnDzWijroTOBts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22; Thu, 13 Jul 2023 00:07:17 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48%2]) with mapi id 15.20.6565.034; Thu, 13 Jul 2023
 00:07:17 +0000
Message-ID: <83bba180-faac-e2a9-e7d3-c5fdf5df2303@amd.com>
Date: Wed, 12 Jul 2023 20:06:58 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <o3dc4q27ap6rajsvpfwfvs3z3afekkwbhnclvswkaietciy2kc@unjf67gz5tur>
 <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
 <603f0b69-71d3-ad8f-4b5e-53b63a6fd521@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <603f0b69-71d3-ad8f-4b5e-53b63a6fd521@amd.com>
X-ClientProxiedBy: YQZPR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 4992d380-7822-4818-e82c-08db83351e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OetvGvXD4kbxnCvicm9ni93hrWSam1zxuJRcM29ALwkNkH1AFtPd7P/Fyut+wVTwNRt8kO+LhdiIUSC1nQqS+szX772rIFaiUjeRRephMzDJ3xy8rpIje9x49uMfe9F9/LjfLGoWKdfeJqcwYUureMjoenn97vO+dYMxty5PauyatVWKpap4APxXn7eypRg6Z4r7zknOnRzj29/lHavwBcALufwcs5VfL/FigAspNt75CSQuPhNMs3a08krXLPL/erzed/WZkLd+0FBPGRAp8c5vsiH52N3jc94uvGRANw+kb5Uw+28WUhzIvnpwvEa8VJCgsr3deKdhL3+f4AT3drVotCYjrDbci0NrK24snHfS3m1Tgo31MAq7mIH2elLJ/JhuClAnoygxSAIg+mYpet5v7nkLkibMmthjZRSUisxDItjg1idZmrA18aJ6v/BkjE1N8YzvGJ1bxPasqsJUs+I4kfjVsctqSXhZQXRMaJR9zJe9rGcf2iFQ+IDOhHlM56aUv6o7oe7mIuzVXImAvsy3PM1U9GPWr9Kase/6s8ozNB6wq8z8Yd3XwvsQhOBf6vk0a3KEotDh3oYEJEq+43G/I6/3LDwJlkzPH0DpqdI8I6zEDNPCZU/Kpsp4gjErmrS4H6o/dX3ChVCJ3du5ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(66574015)(2906002)(2616005)(36756003)(41300700001)(83380400001)(53546011)(5660300002)(26005)(6506007)(186003)(7416002)(7406005)(7366002)(7276002)(44832011)(7336002)(8936002)(8676002)(31696002)(54906003)(110136005)(6486002)(66476007)(66946007)(66556008)(4326008)(6666004)(86362001)(478600001)(38100700002)(31686004)(316002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2N5THVtVkpNaWV5NUJIRG1QS1dBa0dqbXpYZnpOTmxFZ2pDVUY2U3M4anh2?=
 =?utf-8?B?SW1IOTlCN2RVbUJha2hzY01aZkFZT2UxTndiR2dKNlVjVFZINDJXLzRYN1Aw?=
 =?utf-8?B?djFxN0VGZVVyaW1xSmhTN1NpYmo3NGRLTVl1Mlo0L2V4cklISHM2bStXL1lj?=
 =?utf-8?B?bVZTd2pTaGJVcG9WN0svQ0pQVXFQKzEvaUsxTlJIblc5N2l3TFNtYlpqSmNh?=
 =?utf-8?B?Rk1aZHBZUS9oanhwOGxzV1VCMFR2MjM3UmdzRE43V3F4V3dMQVRYdy81bVQ3?=
 =?utf-8?B?bFhHb1l1eHR4d0YrQmkzdVpVeEkzVm12QjgzektVUTA3OHduVGpOMU9sTjRR?=
 =?utf-8?B?SXRCN2MzSE54R3ZXZWlsNVVYY0xKZC9neGFwNlE3Y3VEczN6TzZXQkxkNWtn?=
 =?utf-8?B?Z2djZkJkc3JIODc4UDkzbkRpZzhDSDBRZURpK0Y4Uk8xMGdocis5WHk3RTJT?=
 =?utf-8?B?RFVWQkdQQWJ4OGNoNmcrNnRWenpVc0F5aFlXclU5VWZDV0FOYUcvQURNYWpq?=
 =?utf-8?B?MnYvY1lWMEE1eUJYSEdOenMzSzBXK2hmMDdOcFcxSGpKWHZoZjNFNlJRZkFC?=
 =?utf-8?B?WWdhZFhiN0FqaWwrOWdpZE9tWXdLZ24wVkpENmViYjJMVnZVdlowQSt5ZjNs?=
 =?utf-8?B?Q3dpTCtQQnRCbXBORUFFL3d1OXZrMi9rTHVIZnIwaVVtblIydG9wOU9KWG42?=
 =?utf-8?B?aHpqZ3FTdmJqVTM5NlZ5Z1NDNUtwSENnMkFHNEdFRjREMlhoRVQxUnY1MU9N?=
 =?utf-8?B?a2E5UEFpbGd1Tm8wY1MvS1REUndERkZzSmpXdVRGeTRGbE1LSStTSDZDZS9v?=
 =?utf-8?B?SGlESDlSTm5ua01YTG5tTDF6NDY4T0ZaMFIzZHpRRWF3ZnROeHpVQjN6TGp2?=
 =?utf-8?B?bGIyMXMzeXdnSjNyM1ZsL1BVNG1tVllETDZVQkxUbDdrdkp5K3VzUEZwTXJw?=
 =?utf-8?B?Ly9yY21vcTN5T0U2OEluWkNudUdUc0NuN1hFNFcvclZMOTVtT1lIZGEyYTk3?=
 =?utf-8?B?NnIxelRjR3Z2cEdxTk1OZHFTWExuWFhMM0hucU41QmVGOHRBTGVORWJ1ZVh2?=
 =?utf-8?B?NmoyMktEQk1FSEEvRUExaHozL1dNOEdqSEFNcmdHRlNleXpUdVR2Q0VDc2Vt?=
 =?utf-8?B?Q0N4cnFaaW8vb0NVeFJBWmN5Yi9uTnY1WmI4SXVFc0oxNk9pOWlOdHBhNUNt?=
 =?utf-8?B?MFVwaFArbmNEN1lad3poLzNqMk94NnYvYnFJUDNmRW5BelcvRUgwYk92eTlo?=
 =?utf-8?B?eWQyQm1OZnZ2YmlIR2tNNU56Wklad3hQVWRGc293cXladHY1ZVFuZllaZksr?=
 =?utf-8?B?TFpWYU1PT296TU9lQ3gxZnJVaDgzbkxDZnZoV0pwMkNRQW5rTjRBcDFtbGZO?=
 =?utf-8?B?cm80NWVqSlhRQllRcjY1V2lRYXZYeTRHTEVJNHJsWkFVcGR0aHY2QU9lc3Ry?=
 =?utf-8?B?VjFHeXZHVmZNWG81U1ZCV2xzdlJKQUNzTG9uejVSR3IwTDYyZTkrdlpWVk1F?=
 =?utf-8?B?YVYrdEFrSGRLWWZBYjlHS2JsOTYzRWU0TkwzYktqZndTMlphbnNiT1FPUkd2?=
 =?utf-8?B?Y1R1TC9sSStwQXJWZ25uS0JIOWFMcjBsUzdYTDR5c281a0tKeHdzZDUycnVh?=
 =?utf-8?B?SHljYmNUVDNicEQvWTNxc2YrVkJIWkNaYXVrN3kvRmlxQ0dVRVFLNVdReVFX?=
 =?utf-8?B?QVhZMWhJQXRZRHYvOUFDKzhpNHdnQ1JPempmOFd3d1NGTzJOZytqQVNKS3Fk?=
 =?utf-8?B?NHhmUlZPYWtQeG00SWRHOCs5M3RMOUVZWlBSWEtTWGl0NFVpakdCVk1KRU5Q?=
 =?utf-8?B?TU15QzQzUy95TkdwbCtqN3Q5UktoL2Q4N2taVG0wajhFRDlUY2oyUXlOMFlP?=
 =?utf-8?B?d0JhWSsxVWZqdnpmL1F6R0xzSGRJSUlGdndBb2lseVZOOEEzWXNnZU4rRjlH?=
 =?utf-8?B?QXdkaW05Q2RLUlNiQThzeEFrS0hVM0lOc01yV1VzVE4zQlc1c0Q1ZWNiYWFJ?=
 =?utf-8?B?c05Oall2M3JLQVltRlB4MVdzU290dEdXdzdsT3JUM3RZVGFyQTRLZE42d0hD?=
 =?utf-8?B?Tm5NbThmYUJ5YjJ3Q1JuaW55cmlBd3BGZUhKcnZ1dVhseHhEU1dTc1VYbzNP?=
 =?utf-8?Q?k7m36FXVjmqGRYjPJGL1uTMxN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4992d380-7822-4818-e82c-08db83351e21
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 00:07:16.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKN08Ur9guvB4xSjc0iFLLgs5BPyDy2I6XIh73skvHxQqbwwf8rx4nqW3J6KPWkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>,
 Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 amd-gfx@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Roman Li <roman.li@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Clark <robdclark@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Li <sunpeng.li@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, John Stultz <jstultz@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
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

T24gMjAyMy0wNy0xMiAwOTo1MywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxMi4wNy4y
MyB1bSAxNTozOCBzY2hyaWViIFV3ZSBLbGVpbmUtS8O2bmlnOgo+PiBIZWxsbyBNYXhpbWUsCj4+
Cj4+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDAyOjUyOjM4UE0gKzAyMDAsIE1heGltZSBSaXBh
cmQgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1bCAxMiwgMjAyMyBhdCAwMTowMjo1M1BNICswMjAwLCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4+Pj4gQmFja2dyb3VuZCBpcyB0aGF0IHRoaXMgbWFr
ZXMgbWVyZ2UgY29uZmxpY3RzIGVhc2llciB0byBoYW5kbGUgYW5kIGRldGVjdC4KPj4+PiBSZWFs
bHk/Cj4+PiBGV0lXLCBJIGFncmVlIHdpdGggQ2hyaXN0aWFuIGhlcmUuCj4+Pgo+Pj4+IEVhY2gg
ZmlsZSAoYXBhcnQgZnJvbSBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oKSBpcyBvbmx5IHRvdWNoZWQg
b25jZS4gU28KPj4+PiB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nIHlvdSBkb24ndCBnZXQg
bGVzcyBvciBlYXNpZXIgY29uZmxpY3RzIGJ5Cj4+Pj4gZG9pbmcgaXQgYWxsIGluIGEgc2luZ2xl
IHBhdGNoLiBCdXQgeW91IGdhaW4gdGhlIGZyZWVkb20gdG8gZHJvcCBhCj4+Pj4gcGF0Y2ggZm9y
IG9uZSBkcml2ZXIgd2l0aG91dCBoYXZpbmcgdG8gZHJvcCB0aGUgcmVzdCB3aXRoIGl0Lgo+Pj4g
Tm90IHJlYWxseSwgYmVjYXVzZSB0aGUgbGFzdCBwYXRjaCByZW1vdmVkIHRoZSB1bmlvbiBhbnl3
YXkuIFNvIHlvdSBoYXZlCj4+PiB0byByZXZlcnQgYm90aCB0aGUgbGFzdCBwYXRjaCwgcGx1cyB0
aGF0IGRyaXZlciBvbmUuIEFuZCB0aGVuIHlvdSBuZWVkCj4+PiB0byBhZGQgYSBUT0RPIHRvIHJl
bW92ZSB0aGF0IHVuaW9uIGV2ZW50dWFsbHkuCj4+IFllcywgd2l0aCBhIHNpbmdsZSBwYXRjaCB5
b3UgaGF2ZSBvbmx5IG9uZSByZXZlcnQgKGJ1dCAxOTQgZmlsZXMgY2hhbmdlZCwKPj4gMTI2NCBp
bnNlcnRpb25zKCspLCAxMjk2IGRlbGV0aW9ucygtKSkgaW5zdGVhZCBvZiB0d28gKG9uZSBvZiB0
aGVtOiAxCj4+IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pOyB0
aGUgb3RoZXIgbWF5YmUgYSBiaXQKPj4gYmlnZ2VyKS4gKEFuZCBtYXliZSB5b3UgZ2V0IGF3YXkg
d2l0aCBqdXN0IHJldmVydGluZyB0aGUgbGFzdCBwYXRjaC4pCj4+Cj4+IFdpdGggYSBzaW5nbGUg
cGF0Y2ggdGhlIFRPRE8gYWZ0ZXIgYSByZXZlcnQgaXMgInJlZG8gaXQgYWxsIGFnYWluIChhbmQK
Pj4gcHJlcGFyZSBmb3IgYSBkaWZmZXJlbnQgc2V0IG9mIGNvbmZsaWN0cykiIHdoaWxlIHdpdGgg
dGhlIHNwbGl0IHNlcmllcwo+PiBpdCdzIG9ubHkgImZpeCB0aGF0IG9uZSBkcml2ZXIgdGhhdCB3
YXMgZm9yZ290dGVuL2JvcmtlZCIgKyByZWFwcGx5IHRoYXQKPj4gMTAgbGluZSBwYXRjaC4KPiAK
PiBZZWFoLCBidXQgZm9yIGEgbWFpbnRhaW5lciB0aGUgc2l6ZSBvZiB0aGUgcGF0Y2hlcyBkb2Vz
bid0IG1hdHRlci4gCj4gVGhhdCdzIG9ubHkgaW50ZXJlc3RpbmcgaWYgeW91IG5lZWQgdG8gbWFu
dWFsbHkgcmV2aWV3IHRoZSBwYXRjaCwgd2hpY2ggCj4geW91IGhvcGVmdWxseSBkb2Vzbid0IGRv
IGluIGNhc2Ugb2Ygc29tZXRoaW5nIGF1dG8tZ2VuZXJhdGVkLgo+IAo+IEluIG90aGVyIHdvcmRz
IGlmIHRoZSBwYXRjaCBpcyBhdXRvLWdlbmVyYXRlZCByZS1hcHBseWluZyBpdCBjb21wbGV0ZWx5
IAo+IGlzIGxlc3Mgd29yayB0aGFuIGZpeGluZyB0aGluZ3MgdXAgaW5kaXZpZHVhbGx5Lgo+IAo+
PiAgIEFzIHRoZSBvbmUgd2hvIGdldHMgdGhhdCBUT0RPLCBJIHByZWZlciB0aGUgbGF0dGVyLgo+
IAo+IFllYWgsIGJ1dCB5b3VyIHBlcnNvbmFsIHByZWZlcmVuY2VzIGFyZSBub3QgYSB0ZWNobmlj
YWwgcmVsZXZhbnQgCj4gYXJndW1lbnQgdG8gYSBtYWludGFpbmVyLgo+IAo+IEF0IHRoZSBlbmQg
b2YgdGhlIGRheSBEYXZlIG9yIERhbmllbCBuZWVkIHRvIGRlY2lkZSwgYmVjYXVzZSB0aGV5IG5l
ZWQgCj4gdG8gbGl2ZSB3aXRoIGl0Lgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+Pgo+
PiBTbyBpbiBzdW06IElmIHlvdXIgbWV0cmljIGlzICJzbWFsbCBjb3VudCBvZiByZXZlcnRlZCBj
b21taXRzIiwgeW91J3JlCj4+IHJpZ2h0LiBJZiBob3dldmVyIHlvdXIgbWV0cmljIGlzOiBCZXR0
ZXIgZ2V0IDk1JSBvZiB0aGlzIHNlcmllcycgY2hhbmdlCj4+IGluIHRoYW4gbWF5YmUgMCUsIHRo
ZSBzcGxpdCBzZXJpZXMgaXMgdGhlIHdheSB0byBkbyBpdC4KPj4KPj4gV2l0aCBtZSBoYXZpbmcg
c3BlbmQgfjNoIG9uIHRoaXMgc2VyaWVzJyBjaGFuZ2VzLCBpdCdzIG1heWJlCj4+IHVuZGVyc3Rh
bmRhYmxlIHRoYXQgSSBkaWQgaXQgdGhlIHdheSBJIGRpZC4KPj4KPj4gRlRSOiBUaGlzIHNlcmll
cyB3YXMgY3JlYXRlZCBvbiB0b3Agb2YgdjYuNS1yYzEuIElmIHlvdSBhcHBseSBpdCB0bwo+PiBk
cm0tbWlzYy1uZXh0IHlvdSBnZXQgYSAodHJpdmlhbCkgY29uZmxpY3QgaW4gcGF0Y2ggIzIuIElm
IEkgY29uc2lkZXIgdG8KPj4gYmUgdGhlIHJlc3BvbnNpYmxlIG1haW50YWluZXIgd2hvIGFwcGxp
ZXMgdGhpcyBzZXJpZXMsIEkgbGlrZSBiZWluZyBhYmxlCj4+IHRvIGp1c3QgZG8gZ2l0IGFtIC0t
c2tpcCB0aGVuLgo+Pgo+PiBGVFIjMjogSW4gZHJtLW1pc2MtbmV4dCBpcyBhIG5ldyBkcml2ZXIK
Pj4gKGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9sc2RjX2NydGMuYykgc28gc2tpcHBpbmcgdGhl
IGxhc3QgcGF0Y2ggZm9yCj4+IG5vdyBtaWdodCBpbmRlZWQgYmUgYSBnb29kIGlkZWEuCj4+Cj4+
Pj4gU28gSSBzdGlsbCBsaWtlIHRoZSBzcGxpdCB2ZXJzaW9uIGJldHRlciwgYnV0IEknbSBvcGVu
IHRvIGEgbW9yZQo+Pj4+IHZlcmJvc2UgcmVhc29uaW5nIGZyb20geW91ciBzaWRlLgo+Pj4gWW91
J3JlIGRvaW5nIG9ubHkgb25lIHRoaW5nIGhlcmUsIHJlYWxseTogeW91IGNoYW5nZSB0aGUgbmFt
ZSBvZiBhCj4+PiBzdHJ1Y3R1cmUgZmllbGQuIElmIGl0IHdhcyBzaGFyZWQgYmV0d2VlbiBtdWx0
aXBsZSBtYWludGFpbmVycywgdGhlbgo+Pj4gc3VyZSwgc3BsaXR0aW5nIHRoYXQgdXAgaXMgZWFz
aWVyIGZvciBldmVyeW9uZSwgYnV0IHRoaXMgd2lsbCBnbyB0aHJvdWdoCj4+PiBkcm0tbWlzYywg
c28gSSBjYW4ndCBzZWUgdGhlIGJlbmVmaXQgaXQgYnJpbmdzLgo+PiBJIHNlZSB5b3VyIGFyZ3Vt
ZW50LCBidXQgSSB0aGluayBtaW5lIHdlaWdodHMgbW9yZS4KCkknbSB3aXRoIE1heGltZSBhbmQg
Q2hyaXN0aWFuIG9uIHRoaXMtLWEgc2luZ2xlIGFjdGlvbiBuZWNlc3NpdGF0ZXMgYSBzaW5nbGUg
cGF0Y2guCk9uZSBzaW5nbGUgbW92ZW1lbnQuIEFzIE1heGltZSBzYWlkICJlaXRoZXIgMCBvciAx
MDAuIgoKQXMgdG8gdGhlIG5hbWUsIHBlcmhhcHMgImRybV9kZXYiIGlzIG1vcmUgZGVzY3JpcHRp
dmUgdGhhbiBqdXN0ICJkcm0iLgpXaGF0IGlzICJkcm0iPyBBaCBpdCdzIGEgImRldiIsIGFzIGlu
ICJkcm0gZGV2Ii4uLiBUaGVuIHdoeSBub3QgcmVuYW1lIGl0CnRvICJkcm1fZGV2Ij8gWW91IGFy
ZSByZW5hbWluZyBpdCBmcm9tICJkZXYiIHRvIHNvbWV0aGluZyBtb3JlIGRlc2NyaXB0aXZlCmFm
dGVyIGFsbC4gImRldiIgLS0+ICJkcm0iIGlzIG5vIGJldHRlciwgYnV0ICJkZXYiIC0tPiAiZHJt
X2RldiIgaXMganVzdApyaWdodC4KLS0gClJlZ2FyZHMsCkx1YmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
