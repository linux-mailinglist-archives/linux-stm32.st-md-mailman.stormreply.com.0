Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA8C679DE0
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 16:47:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DDD8C69074;
	Tue, 24 Jan 2023 15:47:24 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50D01C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMJqLDsYNw56z8gTAq9N6nE6ZxpK8T0MxcuxQWjpvYhCpEeE/gcJPWUTg1xGTAcUS1mrK003D2wL/DX3ly1i43z2E9hzm/0QWgchCR02ZJxq/kVn4z10NB8PCOQwc+E1jPdJijQPeAGA3SJVKD9RupPbKnDfNfuxWxH1ksYGwPR/GMQMDG95bqbzyddEy62m/X8pluf3V2qM75DsLQnoCfGJHXLFwi7MX9uIlWYzNs+P6G6j3FQlkeQclU2zb5J5lE1ulFrgRwla0xHjK+TO/35q++RfTK9bAPy4854u7EwWDNkFoonSd47RfTt1TN/Ep1ghWH3fRqDezyjonN3zQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF0B4LG9GoBB9R4CxUON99O4CEEUM3c5osZC7o3geCQ=;
 b=XXSv0cW8YjZ5SWypYO8PLEE+k/n+pvbmS1KgjBZwROCRzJEe8nm08I7WUMe9Vi1JrSOJJOJS0hSMEkVoHRJgrHKx1AnJEPvgsLsEYBQfJtrQVMVmgFPKBZ3Ug43HxjoeWXFW8WhU2ILy7bRlbUKQou2+4syO5dcbp8UpGsXBK7SomuNArM6bnW11nopp/mIteCP1B0aBVw/TeFGE1/gej8wqnmlv89jNU3gxwQJWE6gpkMK/Cw4a7u5msuIYZ8VneXut7eaAMCh3RrAdNEwu4bXZgutXAI+ceiExfaQz+b5jSCV93mNrYqIXamvHESLLcikdqPgnTVYW5PyodtqyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF0B4LG9GoBB9R4CxUON99O4CEEUM3c5osZC7o3geCQ=;
 b=D84m9Tj2iS5nl5BHZcF152MeFgU6ulbYwYE9QGdF84MT7Oawy1fpL4tC9agLRgV8cEt5x3BeMnOLlkuDY2qhzFDnitxvVLYpwoNiolbBDhvWfwryq+Vq+ehhy/OueJhaz4F1yy+P2DiEKjdtOadjaFJGjLycjobil/UJ1XN5liM=
Received: from BN9PR03CA0808.namprd03.prod.outlook.com (2603:10b6:408:13f::33)
 by SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:47:58 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::a2) by BN9PR03CA0808.outlook.office365.com
 (2603:10b6:408:13f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:47:57 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:47:27 -0600
Message-ID: <d4ccdf63-a5ef-98a6-5e80-e06428ec97ac@amd.com>
Date: Mon, 23 Jan 2023 13:47:24 +0100
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
 <20230119185342.2093323-6-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-6-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT036:EE_|SA1PR12MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae91993-53ee-4425-d3d8-08dafd400dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jovbpdPHWAfdKTdDTVP5lY+H3lfC5gzJHFzCpjFAMosjstT9Z5PdtUJL919R2BG31ZUx3xWjtCsrQZ/uCz8ErFAZGtF9NzEP8K0QM9+FQpaJlxe7U0EO4azbhIGu0ReDXq0j4tdmeMHHygptLdqAB3hijobGqIN2U7YMH+KvHbcSrQ6PjvdwrO+nISGHnzQkSYtd17geHLYAHbSTr8bkSXNau72TmzW6FXZ3i5rEcKO1f0IBnGzdkbNozZW0FWv8gCYAXzEw8FcVNMsJoIYNhSjGUZXLq+7YaqVuk7U3ZP1893ZKn1Lz+EsVXIis5Rw/ysd+uEVVA3ndtXVeVbfrysqD+JXimev9cV1oY58RLYyaiGtA8+JkDN0tkd2jSJGvis/xn2AFiicAV0F/rRaIPSLICPgr3n9AMwAiYOb9J3kZRGx0UHS8ZokukzgKdvoyX678jM0Sp1hEnxbHJNQ4x2ls+jq7hHfs5jlDLfUnLccPm+ujwPCPlPzHUVBQz8e/0j8sWr9eLhL14046NI27ArGksX931pXiGsDNlYZmhAfZvT1B6W4meTCZjjLgxn9FSXBZWbinUcBcqaxMmICYN9OCm1Q5IkgIGPuG75XS1XOZ8/D7agcVr58WOnWjgGffFD03BpM5wBqCvwBFaw/L4T3CYIxXidgYc5sQy+pLf9o01aHJqnUl9JahJQhgcn4V/ttLDsBsyUcNax3KTlKYRhoSjjahUiPeCdVQHxNSaotyAVC9Lm0zje5P0b1Gal4XhN0X74leU+r7K8JC503XiaD9NEn0HFn7sy6LraETtw3g5r0z2wtVxE6LtBXpHHsKDZ4Kj95c8j/uHW9SCoI4BJB8OjEcb0yl07OGl+X7LNM+D0Y3cFXCUoi9Y+Nbt2z5ZZOW87EblK6LisRCUQMlw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(81166007)(41300700001)(356005)(86362001)(921005)(82740400003)(7416002)(5660300002)(7406005)(7336002)(8936002)(82310400005)(4326008)(2906002)(44832011)(7366002)(7276002)(83380400001)(36860700001)(31696002)(110136005)(478600001)(31686004)(16526019)(8676002)(26005)(53546011)(186003)(1191002)(40460700003)(40480700001)(70586007)(16576012)(70206006)(316002)(2616005)(54906003)(6666004)(336012)(426003)(47076005)(43740500002)(83996005)(84006005)(36900700001)(2101003)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:47:57.8430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae91993-53ee-4425-d3d8-08dafd400dee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660
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
Subject: Re: [Linux-stm32] [PATCH v2 05/13] mtd: devices: Replace all
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
>   drivers/mtd/devices/mtd_dataflash.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 3bbaa590c768..1d3b2a94581f 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -639,7 +639,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
>   
>   	/* name must be usable with cmdlinepart */
>   	sprintf(priv->name, "spi%d.%d-%s",
> -			spi->master->bus_num, spi->chip_select,
> +			spi->master->bus_num, spi_get_chipselect(spi, 0),
>   			name);
>   
>   	device = &priv->mtd;


Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
