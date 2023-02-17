Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E46ED69B511
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Feb 2023 22:48:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC66C6A5FA;
	Fri, 17 Feb 2023 21:48:12 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02olkn2039.outbound.protection.outlook.com [40.92.43.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E66F5C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Feb 2023 21:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIcXh7fj30Lg2oasEGrd0VEV9/hIXUpS2kTIGpGFovvOQQe73PVhd8qVEcdt49TI+xudSN30M/CK2kU1l7pl9lnkBsll2Uq/g6hHnSGfa3vaF4hGEhHmAkmzNCBNgyjPVu76lE2LHLgtlBGAIfeVJbOFHn6g3AO/qQzoIqLNdO8NrIAloxej023MGi0mQ9KW+HnsRFJOBJjBT8dqXnDbFZCOprzjncdWxwhRS/3c9rirQoHDgOZvxKV7g18ZeljLaPGfUXs44q1EdesaUlx+UGeqtl2c3eTK9daOktM8mqtPcffMEhTWsDGApTHhIlEZK7m/JqYp4+pK7uMgGqMPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcCt0RNdQ+QgQUBydQYz6qHD68bospGPw02oPff/cNA=;
 b=gr855oexN+QDGlr09KL5yvKReytzqlM8Tn62uGyR8vkKhYncP5Np6XZuP+mLUGnqR7BsgnvcIXJQHhWMBhCNNQVFckPjFUikwEBDEO0NHULTEcLnSKBqNkSOZFDL8EKr1lrvQIoqOecc9FeRIy/BOqzQ/ShYbsoot3dN/9TyccZZRYnMV+I/oHgMqS6u4R+e5ExtZSuyUx3TP0VCVtM4meTOj0GzkP6P6H0Rm+4RCEUzNEMtw2heGIZTzbDoeLZ/GmOc0NWaPDhlqh4rjJv8iFU/VLRamebRTlxfbA268F0XrAFVUEAxam8jfSFMK/hvD/5RIroBmnrHEopTvO83Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcCt0RNdQ+QgQUBydQYz6qHD68bospGPw02oPff/cNA=;
 b=fYtnqeEYco65mZd3FQI7S+CVAnOfZxmcd7Ndc4gGpwljKZc+4ofxBOakq8lSlxE4cBGT1T0iHiAztiiThAn1XZpTkGRPf1rMUoKLLtXuQHMQvgA4vOOIVqfnfAIbO11wzMCSLkRZCAnUa4m2kyG6zY9lDVuoF7QmaaX/BiQkHyYxiYFZwyW9AqG2tgDH4ug0g/eqjjyA7nlrfhQG5GOR0YQALqSfuKyqfowohzUrikZEn4tj13UwANEu/XSqmJYKCiHdRyQnEDgd9z1UTC3OvCsLDA8YO8957YjHCcojWYs4OH4+3y/l8I7PSrZtJ9ygkzumd4XPn9OPT28eeRMrZg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by SJ0PR17MB5576.namprd17.prod.outlook.com (2603:10b6:a03:389::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Fri, 17 Feb
 2023 21:48:02 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 21:48:02 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Mark Brown <broonie@kernel.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>
Thread-Topic: [PATCH v4 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Thread-Index: AQHZPYeQkHeD5G7xAkKb48PQ8b+JNq7QFekAgAOiB+E=
Date: Fri, 17 Feb 2023 21:48:02 +0000
Message-ID: <MN2PR17MB337562A2EA2B0622F2943893B8A19@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
 <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
 <Y+zp5F2l8pffEEvN@sirena.org.uk>
In-Reply-To: <Y+zp5F2l8pffEEvN@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [9kVqeb50chAWbUIzN7Hz6lJ2MWVQZ78y]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|SJ0PR17MB5576:EE_
x-ms-office365-filtering-correlation-id: bb91410f-6944-4c43-2e59-08db1130a4f9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bY164nOCuWrKM7rLyh37ubHZfd6aU9/XOmq+XCCZwt4ynDgWAuO7Bwf95u/hOQVhZvZuNACyY2IgFwP3vi6SjJlLzSFeN+zCkLnrtG4l9lsu65SSclMG6i/5WdLYglaeFNy/WAX/hCU0Be97dPbZIOletdqN2y5mEwXz6XrUJZiUCMbA0N6ETfU/Mfn9VbXl9eqd/jQOcPtjooZBUrrm/O+7/xzEAKZQZMShFavjlsZTRWcnxhoWt/fyVjbD3aAsZrqg2BTtHdfLqHAO4HBTFylmxE/irkWuP7p8wi0dvrgKg0c+qOPdli56OsmdxgT6J9JCX2Lev97TP4K5s1ZkPJzGF3dANZ6ePsPG/b3r8jdGjxgz+NtNAXVhjJ705bWb5bOEPlSap9A0I8QPhESpx5YQ4EgIQYB3l44Oq4SLWjW3bxU2Bk38OuqbmiR3yZEFQz7uycodVL23nrFq+yx39fSC9azqkhUJAEsuwFmsUqy0DtG7LNSe1xWjecRaseqb06F6w2MVq41iAdCSJk9+oah8Ed4RY1qepdmNKYzMiVDfax504C8Oea6ZNa/FmyGUoG6ThKnHtcPwU4S0buzu5qKfeKMa+4FYdcQaxAOeaqaY7mlejk8YzsnSbrcARJeww9SpwNN14P6jEbGBWb3W0w==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Sm/TJo6hzC9xuYp3Il9O/mEdu+ZARkq/jxCZ9QwzkwMWSnxpgGB2edk3iU?=
 =?iso-8859-1?Q?RHmr+x2us4ahjCEkts/0CdSBIpyad5zKvRHi+yETMw8g4GsCY+HCG4eEs5?=
 =?iso-8859-1?Q?3MNjoS/nKRZSpiGfdEOFSFbbkkNIGFcg19OO3HJw/b6XWgv3AhepN6POt+?=
 =?iso-8859-1?Q?z1BYfuUnyL8W3oQbcz9k8ioUth1TH+pfR/+ETBE1JJdKSijG5EkdZEsYSq?=
 =?iso-8859-1?Q?cCrTQ4G5Fgy9fgU13Ki/beZ9bFqK/hDyeElxmsIc0P1jFYJUqp4nuW0hBM?=
 =?iso-8859-1?Q?qA0H4v9wmoa9rvV/XXKSN/arAv16X2WpGIVukMSjL1po7vKI8B6Gtx0Aef?=
 =?iso-8859-1?Q?JRiCtcuAOCAr2fUkmcBRST5kkSbOJX6He4APZ5+WuJZG5GXzcowNN6/79G?=
 =?iso-8859-1?Q?4qg/y/bSCIoGeC52R/wm6pcScZ/2L6+s+HQGr3aI862HJWbejATGR221hU?=
 =?iso-8859-1?Q?0/C6iNb2T2G99f6cX0+llCpaJ2aQbRjeTXqGvvBEe+dc8+TKM7NmbkyzP+?=
 =?iso-8859-1?Q?hhOfeRicai8K3fSthxgx738isWBbMzwy4fgT+f5LHNeze1ySRp46JO5UJa?=
 =?iso-8859-1?Q?LqcLcPq7mdcFPgtDjKWXAhL5wUXZ9woLZRflUiCFXHjGVQUiz6HzbEki3v?=
 =?iso-8859-1?Q?7hyTq3pVTaAyvxdylO6Q/As+cOAv1WYHUYrpfesSor7IJoLAhlcGhlgCUR?=
 =?iso-8859-1?Q?kLA8inscINbYYwhU6lpZFbZW29X9DDcRjofvjBEHkjNag9XOQK+/wG9438?=
 =?iso-8859-1?Q?/yYVSH5vERfvo+iFLM6yx2wD8ylGiI7quBSKVk8SEpkRCCDmfNIaUerDYi?=
 =?iso-8859-1?Q?quHecCLmiR/hxxhak2GZqlMWuNmbchLU6UAz7Joe1SBeDrnsNpoS3ezy9u?=
 =?iso-8859-1?Q?eY8a6H7OJLhDYgS0DQBq5S4LffAl7eths9mM20vzGAFbiA3TF6sDIRHtPL?=
 =?iso-8859-1?Q?1OzsKL5aQ5h45nOcPMEX/3jbmsGTEoQWp9b7FQbspb4O1dysTpxFuGOj4q?=
 =?iso-8859-1?Q?g0C7w5cfMevNhoDDEe20g0bmWFxcgkJgslECG9Ke6/NOcg5mz4YD1BivEf?=
 =?iso-8859-1?Q?fpk2ee9jevRd803bvzX/192bS2IgVUcraZiRyFsxzsChy7docZfZaKZ1wt?=
 =?iso-8859-1?Q?osuX26PgMVHvR2rbEtnm7XLO5VhVRUCkcUwenwkfeT41GrA0VNRvpk+Sbx?=
 =?iso-8859-1?Q?zz7wwscAUjJDzn6R4ZmcBgP2V2QVAYSGHTJ+xeOxRebMBRGxjrqVUGYki7?=
 =?iso-8859-1?Q?/eQoDOLb6TNAq4PQQi9MkNZ3mWvwKd38Kvix2EA0v3nFzYkoLF7HE4g9Qu?=
 =?iso-8859-1?Q?xqvd?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bb91410f-6944-4c43-2e59-08db1130a4f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 21:48:02.6797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5576
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "stefan@datenfreihafen.org" <stefan@datenfreihafen.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "tiwai@suse.com" <tiwai@suse.com>,
 "haibo.chen@nxp.com" <haibo.chen@nxp.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "l.stelmach@samsung.com" <l.stelmach@samsung.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "sanju.mehta@amd.com" <sanju.mehta@amd.com>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
 "michael@walle.cc" <michael@walle.cc>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "linux-wpan@vger.kernel.org" <linux-wpan@vger.kernel.org>,
 "claudiu.beznea@microchip.com" <claudiu.beznea@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "ldewangan@nvidia.com" <ldewangan@nvidia.com>,
 "windhl@126.com" <windhl@126.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "andi@etezian.org" <andi@etezian.org>,
 "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "radu_nicolae.pirea@upb.ro" <radu_nicolae.pirea@upb.ro>,
 "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>,
 "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
 "clg@kaod.org" <clg@kaod.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "libertas-dev@lists.infradead.org" <libertas-dev@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "masahisa.kojima@linaro.org" <masahisa.kojima@linaro.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "git@amd.com" <git@amd.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "yuenn@google.com" <yuenn@google.com>, "wens@csie.org" <wens@csie.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 William Zhang <william.zhang@broadcom.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "john.garry@huawei.com" <john.garry@huawei.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "alex.aring@gmail.com" <alex.aring@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "chin-ting_kuo@aspeedtech.com" <chin-ting_kuo@aspeedtech.com>,
 Dhruva Gole <d-gole@ti.com>, "agross@kernel.org" <agross@kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>, "oss@buserror.net" <oss@buserror.net>,
 "venture@google.com" <venture@google.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "jic23@kernel.org" <jic23@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "daniel@zonque.org" <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v4 01/15] spi: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
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
Content-Type: multipart/mixed; boundary="===============2825075445672252103=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2825075445672252103==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR17MB337562A2EA2B0622F2943893B8A19MN2PR17MB3375namp_"

--_000_MN2PR17MB337562A2EA2B0622F2943893B8A19MN2PR17MB3375namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The police came to my house you dumb motherfucker.
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Mark B=
rown <broonie@kernel.org>
Sent: Wednesday, February 15, 2023 9:19 AM
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <=
richard@nod.at>; vigneshr@ti.com <vigneshr@ti.com>; jic23@kernel.org <jic23=
@kernel.org>; tudor.ambarus@microchip.com <tudor.ambarus@microchip.com>; pr=
atyush@kernel.org <pratyush@kernel.org>; sanju.mehta@amd.com <sanju.mehta@a=
md.com>; chin-ting_kuo@aspeedtech.com <chin-ting_kuo@aspeedtech.com>; clg@k=
aod.org <clg@kaod.org>; kdasu.kdev@gmail.com <kdasu.kdev@gmail.com>; f.fain=
elli@gmail.com <f.fainelli@gmail.com>; rjui@broadcom.com <rjui@broadcom.com=
>; sbranden@broadcom.com <sbranden@broadcom.com>; eajames@linux.ibm.com <ea=
james@linux.ibm.com>; olteanv@gmail.com <olteanv@gmail.com>; han.xu@nxp.com=
 <han.xu@nxp.com>; john.garry@huawei.com <john.garry@huawei.com>; shawnguo@=
kernel.org <shawnguo@kernel.org>; s.hauer@pengutronix.de <s.hauer@pengutron=
ix.de>; narmstrong@baylibre.com <narmstrong@baylibre.com>; khilman@baylibre=
.com <khilman@baylibre.com>; matthias.bgg@gmail.com <matthias.bgg@gmail.com=
>; haibo.chen@nxp.com <haibo.chen@nxp.com>; linus.walleij@linaro.org <linus=
.walleij@linaro.org>; daniel@zonque.org <daniel@zonque.org>; haojian.zhuang=
@gmail.com <haojian.zhuang@gmail.com>; robert.jarzmik@free.fr <robert.jarzm=
ik@free.fr>; agross@kernel.org <agross@kernel.org>; bjorn.andersson@linaro.=
org <bjorn.andersson@linaro.org>; heiko@sntech.de <heiko@sntech.de>; krzysz=
tof.kozlowski@linaro.org <krzysztof.kozlowski@linaro.org>; andi@etezian.org=
 <andi@etezian.org>; mcoquelin.stm32@gmail.com <mcoquelin.stm32@gmail.com>;=
 alexandre.torgue@foss.st.com <alexandre.torgue@foss.st.com>; wens@csie.org=
 <wens@csie.org>; jernej.skrabec@gmail.com <jernej.skrabec@gmail.com>; samu=
el@sholland.org <samuel@sholland.org>; masahisa.kojima@linaro.org <masahisa=
.kojima@linaro.org>; jaswinder.singh@linaro.org <jaswinder.singh@linaro.org=
>; rostedt@goodmis.org <rostedt@goodmis.org>; mingo@redhat.com <mingo@redha=
t.com>; l.stelmach@samsung.com <l.stelmach@samsung.com>; davem@davemloft.ne=
t <davem@davemloft.net>; edumazet@google.com <edumazet@google.com>; kuba@ke=
rnel.org <kuba@kernel.org>; pabeni@redhat.com <pabeni@redhat.com>; alex.ari=
ng@gmail.com <alex.aring@gmail.com>; stefan@datenfreihafen.org <stefan@date=
nfreihafen.org>; kvalo@kernel.org <kvalo@kernel.org>; james.schulman@cirrus=
.com <james.schulman@cirrus.com>; david.rhodes@cirrus.com <david.rhodes@cir=
rus.com>; tanureal@opensource.cirrus.com <tanureal@opensource.cirrus.com>; =
rf@opensource.cirrus.com <rf@opensource.cirrus.com>; perex@perex.cz <perex@=
perex.cz>; tiwai@suse.com <tiwai@suse.com>; npiggin@gmail.com <npiggin@gmai=
l.com>; christophe.leroy@csgroup.eu <christophe.leroy@csgroup.eu>; mpe@elle=
rman.id.au <mpe@ellerman.id.au>; oss@buserror.net <oss@buserror.net>; windh=
l@126.com <windhl@126.com>; yangyingliang@huawei.com <yangyingliang@huawei.=
com>; git@amd.com <git@amd.com>; linux-spi@vger.kernel.org <linux-spi@vger.=
kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; j=
oel@jms.id.au <joel@jms.id.au>; andrew@aj.id.au <andrew@aj.id.au>; radu_nic=
olae.pirea@upb.ro <radu_nicolae.pirea@upb.ro>; nicolas.ferre@microchip.com =
<nicolas.ferre@microchip.com>; alexandre.belloni@bootlin.com <alexandre.bel=
loni@bootlin.com>; claudiu.beznea@microchip.com <claudiu.beznea@microchip.c=
om>; bcm-kernel-feedback-list@broadcom.com <bcm-kernel-feedback-list@broadc=
om.com>; fancer.lancer@gmail.com <fancer.lancer@gmail.com>; kernel@pengutro=
nix.de <kernel@pengutronix.de>; festevam@gmail.com <festevam@gmail.com>; li=
nux-imx@nxp.com <linux-imx@nxp.com>; jbrunet@baylibre.com <jbrunet@baylibre=
.com>; martin.blumenstingl@googlemail.com <martin.blumenstingl@googlemail.c=
om>; avifishman70@gmail.com <avifishman70@gmail.com>; tmaimon77@gmail.com <=
tmaimon77@gmail.com>; tali.perry1@gmail.com <tali.perry1@gmail.com>; ventur=
e@google.com <venture@google.com>; yuenn@google.com <yuenn@google.com>; ben=
jaminfair@google.com <benjaminfair@google.com>; yogeshgaur.83@gmail.com <yo=
geshgaur.83@gmail.com>; konrad.dybcio@somainline.org <konrad.dybcio@somainl=
ine.org>; alim.akhtar@samsung.com <alim.akhtar@samsung.com>; ldewangan@nvid=
ia.com <ldewangan@nvidia.com>; thierry.reding@gmail.com <thierry.reding@gma=
il.com>; jonathanh@nvidia.com <jonathanh@nvidia.com>; michal.simek@amd.com =
<michal.simek@amd.com>; linux-aspeed@lists.ozlabs.org <linux-aspeed@lists.o=
zlabs.org>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; linux-arm-=
kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-rp=
i-kernel@lists.infradead.org <linux-rpi-kernel@lists.infradead.org>; linux-=
amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>; linux-medi=
atek@lists.infradead.org <linux-mediatek@lists.infradead.org>; linux-arm-ms=
m@vger.kernel.org <linux-arm-msm@vger.kernel.org>; linux-rockchip@lists.inf=
radead.org <linux-rockchip@lists.infradead.org>; linux-samsung-soc@vger.ker=
nel.org <linux-samsung-soc@vger.kernel.org>; linux-stm32@st-md-mailman.stor=
mreply.com <linux-stm32@st-md-mailman.stormreply.com>; linux-sunxi@lists.li=
nux.dev <linux-sunxi@lists.linux.dev>; linux-tegra@vger.kernel.org <linux-t=
egra@vger.kernel.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; lin=
ux-wpan@vger.kernel.org <linux-wpan@vger.kernel.org>; libertas-dev@lists.in=
fradead.org <libertas-dev@lists.infradead.org>; linux-wireless@vger.kernel.=
org <linux-wireless@vger.kernel.org>; linux-mtd@lists.infradead.org <linux-=
mtd@lists.infradead.org>; lars@metafoo.de <lars@metafoo.de>; Michael.Henner=
ich@analog.com <Michael.Hennerich@analog.com>; linux-iio@vger.kernel.org <l=
inux-iio@vger.kernel.org>; michael@walle.cc <michael@walle.cc>; palmer@dabb=
elt.com <palmer@dabbelt.com>; linux-riscv@lists.infradead.org <linux-riscv@=
lists.infradead.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.=
org>; patches@opensource.cirrus.com <patches@opensource.cirrus.com>; linuxp=
pc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; amitrkcian2002@gma=
il.com <amitrkcian2002@gmail.com>; Dhruva Gole <d-gole@ti.com>; Patrice Cho=
tard <patrice.chotard@foss.st.com>; William Zhang <william.zhang@broadcom.c=
om>
Subject: Re: [PATCH v4 01/15] spi: Replace all spi->chip_select and spi->cs=
_gpiod references with function call

On Sat, Feb 11, 2023 at 01:06:32AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and

This again doesn't apply against my current code - I think the
best thing to do here is going to be to rebase against -rc1 when
it comes out and resend then, that will also make the issues
integrating with other trees easier as then I can make a clean
branch against -rc1 that other trees will be able to merge as
needed.

--_000_MN2PR17MB337562A2EA2B0622F2943893B8A19MN2PR17MB3375namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;"></div>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;">The police came to my house you dumb motherfucker.&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> linux-mtd &lt;linux-m=
td-bounces@lists.infradead.org&gt; on behalf of Mark Brown &lt;broonie@kern=
el.org&gt;<br>
<b>Sent:</b> Wednesday, February 15, 2023 9:19 AM<br>
<b>To:</b> Amit Kumar Mahapatra &lt;amit.kumar-mahapatra@amd.com&gt;<br>
<b>Cc:</b> miquel.raynal@bootlin.com &lt;miquel.raynal@bootlin.com&gt;; ric=
hard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com &lt;vigneshr@ti.com&gt;=
; jic23@kernel.org &lt;jic23@kernel.org&gt;; tudor.ambarus@microchip.com &l=
t;tudor.ambarus@microchip.com&gt;; pratyush@kernel.org &lt;pratyush@kernel.=
org&gt;;
 sanju.mehta@amd.com &lt;sanju.mehta@amd.com&gt;; chin-ting_kuo@aspeedtech.=
com &lt;chin-ting_kuo@aspeedtech.com&gt;; clg@kaod.org &lt;clg@kaod.org&gt;=
; kdasu.kdev@gmail.com &lt;kdasu.kdev@gmail.com&gt;; f.fainelli@gmail.com &=
lt;f.fainelli@gmail.com&gt;; rjui@broadcom.com &lt;rjui@broadcom.com&gt;;
 sbranden@broadcom.com &lt;sbranden@broadcom.com&gt;; eajames@linux.ibm.com=
 &lt;eajames@linux.ibm.com&gt;; olteanv@gmail.com &lt;olteanv@gmail.com&gt;=
; han.xu@nxp.com &lt;han.xu@nxp.com&gt;; john.garry@huawei.com &lt;john.gar=
ry@huawei.com&gt;; shawnguo@kernel.org &lt;shawnguo@kernel.org&gt;;
 s.hauer@pengutronix.de &lt;s.hauer@pengutronix.de&gt;; narmstrong@baylibre=
.com &lt;narmstrong@baylibre.com&gt;; khilman@baylibre.com &lt;khilman@bayl=
ibre.com&gt;; matthias.bgg@gmail.com &lt;matthias.bgg@gmail.com&gt;; haibo.=
chen@nxp.com &lt;haibo.chen@nxp.com&gt;; linus.walleij@linaro.org
 &lt;linus.walleij@linaro.org&gt;; daniel@zonque.org &lt;daniel@zonque.org&=
gt;; haojian.zhuang@gmail.com &lt;haojian.zhuang@gmail.com&gt;; robert.jarz=
mik@free.fr &lt;robert.jarzmik@free.fr&gt;; agross@kernel.org &lt;agross@ke=
rnel.org&gt;; bjorn.andersson@linaro.org &lt;bjorn.andersson@linaro.org&gt;=
;
 heiko@sntech.de &lt;heiko@sntech.de&gt;; krzysztof.kozlowski@linaro.org &l=
t;krzysztof.kozlowski@linaro.org&gt;; andi@etezian.org &lt;andi@etezian.org=
&gt;; mcoquelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.com&gt;; alexandr=
e.torgue@foss.st.com &lt;alexandre.torgue@foss.st.com&gt;; wens@csie.org
 &lt;wens@csie.org&gt;; jernej.skrabec@gmail.com &lt;jernej.skrabec@gmail.c=
om&gt;; samuel@sholland.org &lt;samuel@sholland.org&gt;; masahisa.kojima@li=
naro.org &lt;masahisa.kojima@linaro.org&gt;; jaswinder.singh@linaro.org &lt=
;jaswinder.singh@linaro.org&gt;; rostedt@goodmis.org &lt;rostedt@goodmis.or=
g&gt;;
 mingo@redhat.com &lt;mingo@redhat.com&gt;; l.stelmach@samsung.com &lt;l.st=
elmach@samsung.com&gt;; davem@davemloft.net &lt;davem@davemloft.net&gt;; ed=
umazet@google.com &lt;edumazet@google.com&gt;; kuba@kernel.org &lt;kuba@ker=
nel.org&gt;; pabeni@redhat.com &lt;pabeni@redhat.com&gt;; alex.aring@gmail.=
com
 &lt;alex.aring@gmail.com&gt;; stefan@datenfreihafen.org &lt;stefan@datenfr=
eihafen.org&gt;; kvalo@kernel.org &lt;kvalo@kernel.org&gt;; james.schulman@=
cirrus.com &lt;james.schulman@cirrus.com&gt;; david.rhodes@cirrus.com &lt;d=
avid.rhodes@cirrus.com&gt;; tanureal@opensource.cirrus.com &lt;tanureal@ope=
nsource.cirrus.com&gt;;
 rf@opensource.cirrus.com &lt;rf@opensource.cirrus.com&gt;; perex@perex.cz =
&lt;perex@perex.cz&gt;; tiwai@suse.com &lt;tiwai@suse.com&gt;; npiggin@gmai=
l.com &lt;npiggin@gmail.com&gt;; christophe.leroy@csgroup.eu &lt;christophe=
.leroy@csgroup.eu&gt;; mpe@ellerman.id.au &lt;mpe@ellerman.id.au&gt;;
 oss@buserror.net &lt;oss@buserror.net&gt;; windhl@126.com &lt;windhl@126.c=
om&gt;; yangyingliang@huawei.com &lt;yangyingliang@huawei.com&gt;; git@amd.=
com &lt;git@amd.com&gt;; linux-spi@vger.kernel.org &lt;linux-spi@vger.kerne=
l.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;;
 joel@jms.id.au &lt;joel@jms.id.au&gt;; andrew@aj.id.au &lt;andrew@aj.id.au=
&gt;; radu_nicolae.pirea@upb.ro &lt;radu_nicolae.pirea@upb.ro&gt;; nicolas.=
ferre@microchip.com &lt;nicolas.ferre@microchip.com&gt;; alexandre.belloni@=
bootlin.com &lt;alexandre.belloni@bootlin.com&gt;; claudiu.beznea@microchip=
.com
 &lt;claudiu.beznea@microchip.com&gt;; bcm-kernel-feedback-list@broadcom.co=
m &lt;bcm-kernel-feedback-list@broadcom.com&gt;; fancer.lancer@gmail.com &l=
t;fancer.lancer@gmail.com&gt;; kernel@pengutronix.de &lt;kernel@pengutronix=
.de&gt;; festevam@gmail.com &lt;festevam@gmail.com&gt;; linux-imx@nxp.com
 &lt;linux-imx@nxp.com&gt;; jbrunet@baylibre.com &lt;jbrunet@baylibre.com&g=
t;; martin.blumenstingl@googlemail.com &lt;martin.blumenstingl@googlemail.c=
om&gt;; avifishman70@gmail.com &lt;avifishman70@gmail.com&gt;; tmaimon77@gm=
ail.com &lt;tmaimon77@gmail.com&gt;; tali.perry1@gmail.com &lt;tali.perry1@=
gmail.com&gt;;
 venture@google.com &lt;venture@google.com&gt;; yuenn@google.com &lt;yuenn@=
google.com&gt;; benjaminfair@google.com &lt;benjaminfair@google.com&gt;; yo=
geshgaur.83@gmail.com &lt;yogeshgaur.83@gmail.com&gt;; konrad.dybcio@somain=
line.org &lt;konrad.dybcio@somainline.org&gt;; alim.akhtar@samsung.com
 &lt;alim.akhtar@samsung.com&gt;; ldewangan@nvidia.com &lt;ldewangan@nvidia=
.com&gt;; thierry.reding@gmail.com &lt;thierry.reding@gmail.com&gt;; jonath=
anh@nvidia.com &lt;jonathanh@nvidia.com&gt;; michal.simek@amd.com &lt;micha=
l.simek@amd.com&gt;; linux-aspeed@lists.ozlabs.org &lt;linux-aspeed@lists.o=
zlabs.org&gt;;
 openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; linux-arm-kerne=
l@lists.infradead.org &lt;linux-arm-kernel@lists.infradead.org&gt;; linux-r=
pi-kernel@lists.infradead.org &lt;linux-rpi-kernel@lists.infradead.org&gt;;=
 linux-amlogic@lists.infradead.org &lt;linux-amlogic@lists.infradead.org&gt=
;;
 linux-mediatek@lists.infradead.org &lt;linux-mediatek@lists.infradead.org&=
gt;; linux-arm-msm@vger.kernel.org &lt;linux-arm-msm@vger.kernel.org&gt;; l=
inux-rockchip@lists.infradead.org &lt;linux-rockchip@lists.infradead.org&gt=
;; linux-samsung-soc@vger.kernel.org &lt;linux-samsung-soc@vger.kernel.org&=
gt;;
 linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mailman.sto=
rmreply.com&gt;; linux-sunxi@lists.linux.dev &lt;linux-sunxi@lists.linux.de=
v&gt;; linux-tegra@vger.kernel.org &lt;linux-tegra@vger.kernel.org&gt;; net=
dev@vger.kernel.org &lt;netdev@vger.kernel.org&gt;; linux-wpan@vger.kernel.=
org
 &lt;linux-wpan@vger.kernel.org&gt;; libertas-dev@lists.infradead.org &lt;l=
ibertas-dev@lists.infradead.org&gt;; linux-wireless@vger.kernel.org &lt;lin=
ux-wireless@vger.kernel.org&gt;; linux-mtd@lists.infradead.org &lt;linux-mt=
d@lists.infradead.org&gt;; lars@metafoo.de &lt;lars@metafoo.de&gt;;
 Michael.Hennerich@analog.com &lt;Michael.Hennerich@analog.com&gt;; linux-i=
io@vger.kernel.org &lt;linux-iio@vger.kernel.org&gt;; michael@walle.cc &lt;=
michael@walle.cc&gt;; palmer@dabbelt.com &lt;palmer@dabbelt.com&gt;; linux-=
riscv@lists.infradead.org &lt;linux-riscv@lists.infradead.org&gt;;
 alsa-devel@alsa-project.org &lt;alsa-devel@alsa-project.org&gt;; patches@o=
pensource.cirrus.com &lt;patches@opensource.cirrus.com&gt;; linuxppc-dev@li=
sts.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&gt;; amitrkcian2002@gmail.=
com &lt;amitrkcian2002@gmail.com&gt;; Dhruva Gole &lt;d-gole@ti.com&gt;;
 Patrice Chotard &lt;patrice.chotard@foss.st.com&gt;; William Zhang &lt;wil=
liam.zhang@broadcom.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4 01/15] spi: Replace all spi-&gt;chip_select a=
nd spi-&gt;cs_gpiod references with function call</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat, Feb 11, 2023 at 01:06:32AM +0530, Amit Kum=
ar Mahapatra wrote:<br>
&gt; Supporting multi-cs in spi drivers would require the chip_select &amp;=
 cs_gpiod<br>
&gt; members of struct spi_device to be an array. But changing the type of =
these<br>
&gt; members to array would break the spi driver functionality. To make the=
<br>
&gt; transition smoother introduced four new APIs to get/set the<br>
&gt; spi-&gt;chip_select &amp; spi-&gt;cs_gpiod and replaced all spi-&gt;ch=
ip_select and<br>
<br>
This again doesn't apply against my current code - I think the<br>
best thing to do here is going to be to rebase against -rc1 when<br>
it comes out and resend then, that will also make the issues<br>
integrating with other trees easier as then I can make a clean<br>
branch against -rc1 that other trees will be able to merge as<br>
needed.<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR17MB337562A2EA2B0622F2943893B8A19MN2PR17MB3375namp_--

--===============2825075445672252103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2825075445672252103==--
