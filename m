Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3E679DE6
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 16:47:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A756C6A5E4;
	Tue, 24 Jan 2023 15:47:25 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6364FC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnKsF6LBUrKkn0Mnuw6SamF/N0HPeuCUsAjtBtdgyWcCg2l+d/qWWNwjGKPzdyVBQIjkZ8lzwVfQto+IXTkAymQ7jYXo3HZ8djUPYmBcFBErcYEuYsdTbiZJghUMS9EMKxXjYVY6gOhnjELx8UeyNeO3H9kcL+ArhM5aT+RCTLH+OUEJFJnFQp0eTwhB0Dvvr5R1tCtAktOhkl8Ur1JNjM9PKLE/WGwTxgV8zQzwtu9v14AqGmU7ILE3tgysrVOYf4o2jgSp7R5ejphqbSQDDbgzH4GmzMCbZd7ie/kXFHdqwpePtJNmCUZhEzFpohnqmXpYsZY/xJzMSOFnuE3pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51S5FiNiqQDRtVieBY7BSMUmTfNUOguheJy/bviC9FA=;
 b=XUWNyxdKbAi0wMGcOV0focalVujxXgf2gRsrHA3IAUnk+2reChTAClORVgJKQY6aQkdXGY0GZsvAKpXu0GE6PJcJT1kPnQN5pD/dFNs8J+JLsz7U4Iqdh53jMZprU7gQGJieZrl7jI/TEfKTNdQEwIcNcAZMmRmbDF2c3g+713VdWXudRnaBI17gwSy8vsF6f6FtLJ3gDZnbfm8II7RmTi5KVp/65OoLHI/ROtuaZa27/xhGq1VYxZpGCvTiOe2LWg3dBhm84bWrIaFvZIIAsqhR3AWAWg0Nnkn31JgHCs7brJKhYpKZn1QZ3F2qMFuYBghF1GsMtQ5XXdGQO+kJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51S5FiNiqQDRtVieBY7BSMUmTfNUOguheJy/bviC9FA=;
 b=bs54k86S0k8mdDIrQ7pdz3kdWXBEeCSCRpRlwmLR9Jr+F84fk2qlSq5eUkGfk1p/QUskLjPZZaro0Cl+ySmKd8XQOxqIG8vhaE7M8OcntB3zteITyZxy7Vez7LWXPZXqqIiMJ4smilCQxLF46JtxDEzfVDfYy8cD/nG3tNXiCNA=
Received: from MW2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:907:1::14)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 12:49:29 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::5b) by MW2PR16CA0037.outlook.office365.com
 (2603:10b6:907:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:49:28 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:48:56 -0600
Message-ID: <85dc2301-4d10-c909-cadf-6f117fe041b9@amd.com>
Date: Mon, 23 Jan 2023 13:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>, 
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <jic23@kernel.org>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
 <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
 <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <eajames@linux.ibm.com>, <olteanv@gmail.com>,
 <han.xu@nxp.com>, <john.garry@huawei.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>, <khilman@baylibre.com>,
 <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>, <linus.walleij@linaro.org>,
 <daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
 <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>, 
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
 <kvalo@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <j.neuschaefer@gmx.net>, <vireshk@kernel.org>,
 <rmfrfs@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-8-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-8-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 74485f74-9001-4db8-2120-08dafd404418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/W95gBj9xn8fgltb4SgKpzc2RdFp85EuJy18MHhn4dtFg8RMQcxka4C7O+zOompfQdvYxP3rjMOPJU4FJ8sMn0DUXGuP1e0zy4fWPPuzxcLVk5ZaQ3pA7PycIjXFRxXAPM2sZ4SwHBqnHZ6V5ykFqB71n/yIrKxW8+lVW4OG4uVOFZJeX7zn745vWQl747jvNDzXhSDvyt7KTK/nMFarDSG+PH0RMH/UPRlJ1DudUIoj0uwpvbBmb8QjoSLIXRKgYkZjDHASEnNGY49JAwlyNtQ9/0KCUscrEPjid1O6U1g9PNGCK2kjREDOH4tHkThTgSq2iP9/GEVrLo/qjajhw4GTItZutFOU9Exqt2rrgMgeD1Uo4RR9BRce8Z3HazHiYg8In4L8vFTjXERQt/Mqm6eoaJabJVZL6X12bGPp1/6ps083Dmdd4Gah98IC4D1z731+5WqgMgJhD2YDuL8zqzUyiBr7KIpt5fWO/qyI+uENk6z+h4rU50bXE6PY0T+bDEZeSflwcky02l3qKh5V0P3VSkUKOEvEBkhZvg741jPT5vbUBIloRGi1kaCDQMWdik8yo/xjtdG5NDpHlksdxJ+cXJd/zFbEkU3CcTEB/GiyqKVojRwQ8b02bN+rgrDpoNAVNcTmwAbKPFgla/TBKRfwZPgKqH8BlcLMCMHfAvmVGaRKEcKUUz//eO6SIgXHSqo1xKUCTMJsqZ8w6mbenwbMhreMJH5HeKMdO+XQmzwDBLLL6fGDkh4u8FUNdcVt0xTqnRIKMN4sJDqhmd+bhofeNBuHk5fAY2IjOT5Jo63dCkZlN3IeyUbMR1u7nQeWuDOF4pWz/LEUba8i/aFEkyD+wp03W+d7LOb8f3xbILp96k1m2rmMsqdWtnTeba15X3522VYCbzRYdvdi0DQ/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(1191002)(82310400005)(478600001)(426003)(81166007)(54906003)(83380400001)(2616005)(82740400003)(41300700001)(921005)(356005)(316002)(16576012)(110136005)(36756003)(36860700001)(7336002)(40460700003)(7276002)(8676002)(86362001)(44832011)(7416002)(7366002)(7406005)(31686004)(5660300002)(4326008)(2906002)(16526019)(40480700001)(26005)(47076005)(186003)(336012)(31696002)(8936002)(70586007)(70206006)(53546011)(36900700001)(43740500002)(2101003)(83996005)(41080700001)(84006005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:49:28.6481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74485f74-9001-4db8-2120-08dafd404418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331
X-Mailman-Approved-At: Tue, 24 Jan 2023 15:47:20 +0000
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org,
 linux-staging@lists.linux.dev, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, greybus-dev@lists.linaro.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
 venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, palmer@dabbelt.com, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH v2 07/13] platform/x86:
 serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod
 references with function call
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 1/19/23 19:53, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 5362f1a7b77c..270a4700d25d 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -139,7 +139,8 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
>   			goto error;
>   		}
>   
> -		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
> +		dev_dbg(dev, "SPI device %s using chip select %u", name,
> +			spi_get_chipselect(spi_dev, 0));
>   
>   		smi->spi_devs[i] = spi_dev;
>   		smi->spi_num++;

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
