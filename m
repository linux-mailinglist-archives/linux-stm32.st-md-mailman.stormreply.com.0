Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2A679DE1
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 16:47:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8724DC69077;
	Tue, 24 Jan 2023 15:47:24 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A570FC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO7fxqTbOvojCqRXdB0tsU0u3+BBOPlKNXuqCuy2ZahkxPwHAcArhJ/X7/XsLMH41MkQhoiQoLhLFdnwkH5C73nBAKelaH5aN0Ey3OujKe/oAAw0c6UOb6uvuO8ZQ848idPIzaehe2EgP39PU8vRdO9jKNqeND2yt5mDnPz9Ch3UMjGoKlWIxeu2Tz2Fqi+gbaSqYyecvxxzrvDlTsSuGbrGw3DfZMC7lF12UgkjGvlrEkgfKRj7VHJqvJ2psQFMCo/h7wzxr/Zp0ih+IxMUiXBlfelRrn17VmpA1pt4mjBa+o7rqll8Rh0x1JiJODpR0YFnVz7QoZH7sujQzikaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZxjqfR9G6InPHzpGxzZ7Kb1U93N3GyytVg9q8O7KgA=;
 b=hR2FcDcAszCJ3APgHhKIVRC+CNowKeSSM9GMJWGVV2KUInb3UGTP12v9nYc9ItQEVrnCxQTnAAyh6TG6wgo5keVMFI7uLFBakJ501eM2j0DT+UqGewDd79Knj55+mOEpZcy9jG4ULlHoD19iADgcUEMVC1TWn+waJNK2CJASzJcC3yX5jjvrfZRjrjji7r0Uscmqm2JL3czkMSRyDMVdWkjmjJdkf71QHs969aFIF95xOd4sXf0Ow4rSBz8+bUgJcppaW17fHqK6JP+5uE9uhmU1GiPdvJT2SM0bhB540J/JLCohS0Rz5yj+hpC56v3o0DnAiiYyvELgXvVN5YcjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZxjqfR9G6InPHzpGxzZ7Kb1U93N3GyytVg9q8O7KgA=;
 b=jLEZZ2BEQb6nurzp0TAn8XPtNRd4svJXtXYK2JadNaHhBIJ9XqyfYNNnrAPwjbQ6FFlCfFEO80MbuwmWYgRebeC0LcN2kzRuWidGmtcRpOlTlzhVFh1OOBuX2d7qCM0m3gTfuViq9rZWqfqeP0EYijeftDYkcuvYyD+J5k6kJ/E=
Received: from BN1PR10CA0018.namprd10.prod.outlook.com (2603:10b6:408:e0::23)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:48:12 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::1f) by BN1PR10CA0018.outlook.office365.com
 (2603:10b6:408:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:48:11 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:47:41 -0600
Message-ID: <32009f51-ece1-a008-0c59-c0d42d9b0130@amd.com>
Date: Mon, 23 Jan 2023 13:47:38 +0100
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
 <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT053:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ab8c5c-ad68-45fd-dbef-08dafd401650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4HphdwZCvhbRuYkKCyHgRTS+eRpQPHyfmEH62xTxj9QpVA/rM+wwcce9Iw07rd9CjrGy1KQKf1oDNQGeslec1d/z+EHDm/qpQgRP1bV1RQK1IRd0aoZzHQH0rugZCA0nqmgpolzKQGvLqVURNc9takOIX6y5BE90+Wbsa5/IdMP8il49/U7CxPjsSElqt1bi2bMlNwfdzOA3pK2UrNioB7IuKoWtnGMgVc6rV2VuDO6M/QotRoO+ks0qvsbNZj/iazq6cZDpKBw1AeMqOSAAtuAgEU3130yEuYtNouJ5P09V0DiuillkAG5yvpkbtBDqEBxr7v5/Mo8X6t/KBq21iaUyV5WXRpdPK6SMn94qGnZHuqwOa+zkmhgEEstz+GrPHtR3zKhoLZTlewpIWiiBQjVHsSeAlc6eoQEVFa6Lp9xt0GiKqYyabOUlkS9HUP32GJl3+oO6Zbv+zyfRFwFb90YlvQbg/O3Zjy/K6z/GLl529YukHaoSm1KV+x0owQzG7PFNafsEuA1D1Sv5YYG4Pua6iBbai/WjMbCyVa17KLDaCb3CDgD882z5deUFAdxWYcRjRi38ndem0Ev352IpX8N6Rh9JJER9IqJBESpxvfdgTx0ZMnHjzBUs/L3JmGBaFUlvIUjQeRI1IY07hdM+Xol9bCE5fIpk7DDtacOaA/Zy6BUy7gO4YqybJWmV/j2sJIccTQ47D25Gypd+U8rol0QV2dK2F8sDgOpSZSweYtAeyEJoODC12Bp7GGyajGhDguBIVCSROCDYk6tu31/OSBlNhXJoJYoVljKIcC/KOUfgZayaXNiMc5zbNDrsASvpbaKRxrqRMjBpKx4lJMTQUsdEm8iAHCNygwqf1/13yb5uYML3WJmONcIPynPo2ln
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(921005)(82740400003)(5660300002)(81166007)(356005)(31696002)(86362001)(7366002)(7416002)(2906002)(7406005)(44832011)(41300700001)(7276002)(4326008)(7336002)(8936002)(82310400005)(40460700003)(1191002)(16526019)(186003)(8676002)(40480700001)(53546011)(26005)(6666004)(47076005)(426003)(336012)(16576012)(316002)(70206006)(2616005)(70586007)(54906003)(110136005)(478600001)(31686004)(36756003)(43740500002)(84006005)(83996005)(36900700001)(41080700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:48:11.9072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ab8c5c-ad68-45fd-dbef-08dafd401650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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
Subject: Re: [Linux-stm32] [PATCH v2 06/13] staging: Replace all
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
>   drivers/staging/fbtft/fbtft-core.c | 2 +-
>   drivers/staging/greybus/spilib.c   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index afaba94d1d1c..3a4abf3bae40 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -840,7 +840,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>   		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
>   	if (spi)
>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->master->bus_num,
> -			spi->chip_select, spi->max_speed_hz / 1000000);
> +			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>   	dev_info(fb_info->dev,
>   		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>   		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index ad0700a0bb81..efb3bec58e15 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -237,7 +237,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
>   	request = operation->request->payload;
>   	request->count = cpu_to_le16(count);
>   	request->mode = dev->mode;
> -	request->chip_select = dev->chip_select;
> +	request->chip_select = spi_get_chipselect(dev, 0);
>   
>   	gb_xfer = &request->transfers[0];
>   	tx_data = gb_xfer + count;	/* place tx data after last gb_xfer */

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
