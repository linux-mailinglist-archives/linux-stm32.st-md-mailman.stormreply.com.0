Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA8AE4976
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 18:00:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1947C32EB0;
	Mon, 23 Jun 2025 16:00:46 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013050.outbound.protection.outlook.com [52.101.127.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44DE7C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LabcuhEI7R0OHPDl6CGYqLYHr25DLNeSHKGqMPr4MfdhX4awHYAPAmAi/eeeQEPseWETC+yyre1zu99BG0riVszYD6/N67ns4bPopLPXSQnkcxbZF0itwQTjAA+CkmAro6VMxzLG75wo43Rzkn2BGRJq/Dj2g8WrWr26yHNTaboJ6NFCGsprYtQ2gfkNbtA0FMOOAc3JIp4gK2T6YSqQg1Mv2LUkIdYXqZF5h+2JAtwR0grQd8XODViNAcXWzkTlf2YhBu5E2R2+yAQ3lqSQq03XJmb23B64ppOh/gXRBMQpd/jNmiYxWF5eZSx3R8izm+yqfVxBAEnyc1oyYCg2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vocg3RzS4BO05UD+5EdoWPqN5uUHyMEOG0x3xH7h0Q4=;
 b=dz8+M5m+mmzBazqnVCC7L7DvavNn7/+kSpg7rYTuQ2p6w2zXVHqmGKtITs579/D1w7zTXWSAj8kNl5B4lalgeGkLHNcH2NWbtBHZb1yDp1TSwkHBVonA/CdkHzugH6SaaPotJ0LAoV88GGXa+g3bMbhM7bCIfvc3LzPYlsHQKnsxhSrB6U5RrjIwDVb3GloRZwPCOF/1mkuX7sKu4172F77qF4XLU085UTT4mQz1yu0Dggnkvj7Qq4mBMZQVUVudS2GW5yLTJ8xTWnFsu9zlDhKjr6AZWhfvDeMGQX/ZUChcWZOslGUM/e33x94XM/YDHUOuHsN1eyvxB+R5ASSptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vocg3RzS4BO05UD+5EdoWPqN5uUHyMEOG0x3xH7h0Q4=;
 b=Q+xc1/8kKmI1r2CZ+jreb/MupjlqPrTomkN+wUhfEIHAroHfoJtx8uZJ2DJKCY6Bj8V7SWVZomsR4oiwsFyma3lzWU4TkyTJaGu9pjgN0vvdgIeUaI+SxnOjmzOruoomkIeL8EJz2lWuAw4RPmbrjHySSHlCcn3fosNPjgK6oxeYELjVKsjVMp3668rj9PI41U7dxuFKNn9NxW4mNpKfzZP7xH2evs9eqiXweQoTl8hYDWu7zHo9nZf1LfJ2NgKuFKcgeDazHKunGi7FFvlWmyKVzih5gIrtBgOX7UWzypyBjqpP+E5tHeKbNVrqRabdpsw9lQ73uqrJeOfJk+ZUcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by TY0PR06MB5185.apcprd06.prod.outlook.com (2603:1096:400:21f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 12:32:08 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:32:08 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Conor Dooley <conor.dooley@microchip.com>,
 Julien Panis <jpanis@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Costa Shulyupin <costa.shul@redhat.com>, Yury Norov <yury.norov@gmail.com>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Caleb Sander Mateos <csander@purestorage.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Mon, 23 Jun 2025 20:30:34 +0800
Message-Id: <20250623123054.472216-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623123054.472216-1-panchuang@vivo.com>
References: <20250623123054.472216-1-panchuang@vivo.com>
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|TY0PR06MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: c61aa7dd-385e-48db-7762-08ddb251f7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnJxcVRJM01VNHBES0FKVkpFaDh3NnJxbXF5N1RPVkRhdG52Tk1pWEV0WnND?=
 =?utf-8?B?bTFTbE1kdUZJQ1JqZXM2WnVTYU1XWFBTWGtpQ3BzQ1ByaUE2U203RVh0RTZU?=
 =?utf-8?B?UlJROCtqWWhxTGlZMkQyenZqRWJnYkgveHNpSncyNGNyaEw1MXBGb016S0s4?=
 =?utf-8?B?VGtlTjZyemk0K0FLOVJ4VXM5MnMwaTBZL2ExdGl4Lzcxb1Q0QnhsdmtqUGJw?=
 =?utf-8?B?L0hUbG40WCs0Rk9WcEwwSXZENkRTQnZiVlhvckRhQ2JDYlhMRHFMZ01SaFFK?=
 =?utf-8?B?TkV4Y3phYTlnbDdxL0RnZk9UcVFWbXEybTFuVTVUYmcxaitIUjhUQXAvMGVW?=
 =?utf-8?B?NHNaZzNyUkI2em1UVjBUV3JyTGtVWjdVMmU5N2ZnRmczVFFvenZ3K29ZMkJw?=
 =?utf-8?B?ZXlHWTF2bTVnWVEyem5MZTkyZjRPWFEvNDcyekJ3dHdENS9McGFnajZHR2tj?=
 =?utf-8?B?WGY0M2hzNzA5T1VxWnJ1QzhmVFpJVm9ubGpsTVl5N3BlK25zeUtiTzFlQktT?=
 =?utf-8?B?UENHeTlrdHEvN1hYNXNhWDhUZS91NjdVTGF1Vk5pcjV1dXFKMU9iK1R5VDJX?=
 =?utf-8?B?R1licFByczFwdWlkcGZQMnJZdmxoWVpTR1R6dFU0akJRN3FRZHJIbFd6RWhZ?=
 =?utf-8?B?bTNUUzNLNjJQSlhsYU1BSzBBWnppL0dnUkxPU0EwZ081OFdJZFUyV2tGd1Nq?=
 =?utf-8?B?dlBBeEF3L2xpc2o3WkpnMTFsczdKbXNpblVYVStXa0NCdjhEUWxqRm5LK1FK?=
 =?utf-8?B?T0poM05BbnlUaEJwOER4QnFnc2FKSUVER0lGaTVscysvM0FlcWJRYS9mWVlF?=
 =?utf-8?B?UXdsSXoyVlI4NFBSM21nZkVudUJXWUdCdGhFTWJ5U2h0S0hKS0ZaQ3BMYS9Y?=
 =?utf-8?B?WTFJNTJydmFGRjJ5ME1yQ2RMSUttejVnZWQ5QzlXZmk1cVVGWU5NeThVTzdZ?=
 =?utf-8?B?L0lod05BMEJ5bDZIdlpsRXpyWURHZGtzWWI0WlRpd0Z0bGsrcDU5ak8rMGg4?=
 =?utf-8?B?N1MrUEROZXdoZTZxSkZDdmIzSVVFek1MNXhtTjF4M3ZZWWUzRHJhcHZ5Zzc3?=
 =?utf-8?B?VVFtcUN6ODR5c3I3UDFJVSs3T2NTY3praUxSM2R3UCtpVjRlUVZQUlhCTDBv?=
 =?utf-8?B?Snp6V3h2eG5BdVpaMUdldy84aFFzME0wdTMxL3JIK25CYkcyMWhjSmZqd2ZJ?=
 =?utf-8?B?bFU0QlpxUzdoajRHNFdaeFRhRXF5UmcyWkxtVUhJcFlyRlVwUW5ZZHJMdWdN?=
 =?utf-8?B?RGlXNDFtYWx4Q1hJZFkyK2tiUm50eURhbXdrTHJ3bFlRWWRKb2pPalJZUkJE?=
 =?utf-8?B?UGVDaHJuSEhYMzd3K2lIOTVWem1jMkY0b3NTemo3Q3JJOWRyQkJiWU96Z3E1?=
 =?utf-8?B?ZXJsZkpQbGRSMGpNWHM2aEJ6cThNb21FSWxnYVVJazhscDl2ZlhGQ3Y3eWxE?=
 =?utf-8?B?TG1hbm5ObXZXM0xBeEJQQnpkK0VVQzJOY3I0SkRRQ2N2TTh2R25lZnFSVDV4?=
 =?utf-8?B?Tm5sZlY0YmEvZHhHa0VUWXBwNGxCNTlXMU5lQTZWdjlGREl4Rm82YmZ4RVJy?=
 =?utf-8?B?VFFNVHNMQ0V2WTFXR3BGU2lnUnpXT20xNE90TGpscVlTN0I2NHdYWXVZN0Vv?=
 =?utf-8?B?bEswQXpXdVlUUithTnExWWxSYUtjcTA1THQ2KzQzWkFudWNja0RWT09yNncx?=
 =?utf-8?B?TldNQmxIbzNQYmtMazRSUjV6c3luVktMZVI4ZGpaN3gvWExheFEwQ2k1YnZu?=
 =?utf-8?B?VFBlWlZ5WXpsVkVxT2ZCUllobkR3aEZMWlUweEFiSEFYUmV4bzBnQyt3Zkh1?=
 =?utf-8?B?cmFqeXlRbHNuYlZJWGVzRm56T2k4WEE5SUcxaC8xeWhRdlNXbFJCYlhTZmUz?=
 =?utf-8?B?Z2pMK3pmUEF1TXpjV0NrU211c0dtU3BWN2ovSkIzYllPMmxiTWxmRlNPWktK?=
 =?utf-8?B?MGZpNFZMdlRkeDdGbGlkVCtkQjAwdCt3MmNDYktJcTJLMUF0emRzWExnYzBV?=
 =?utf-8?Q?vGbVMGJiVqd+Xuj82qbiunZZjucegU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS8PR06MB7663.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekxlN21nczh1ZzVhTi9CbzN3bWMzZXRMTjlBL2xURUpwYUwrTktVanFnWU0x?=
 =?utf-8?B?Q0dQa3pmNzRQcDdBbjNkS3hFNFB6aHMxOGZObzRGTzU1eExjT0dlOFlubXRs?=
 =?utf-8?B?aFJaM3lieDlHb1RiTGxkYTVobmRTNUhnZ0hONDRkdzhuanFxb3dRSWlPSkVR?=
 =?utf-8?B?WEpSNWtaYUN3Q3NreDd5OCszSDBDemk2cC9WRXNnc3UvOEtQV3BhMjhscGc0?=
 =?utf-8?B?Nk9hUTJvZFhSUmFqZnJ0VzVkMHFMZ0tkeHl1b3JXdE50NmhjV0krQm1hMllj?=
 =?utf-8?B?VDZNZGs5UVQ3KytRUm5LMktRR0tJV0FuMFdsQUQzRUlIMnZpQkNXVVN0a2d6?=
 =?utf-8?B?am9XZzlrY24zUUN2cFMrWVRCVWlJa01ML0ZLVllrOUw5TlB6WjFjSHo0T3N1?=
 =?utf-8?B?SHkxWVFpaEZIc2pQU24zR1h5RW1ObnUxYXdETWVDNTQvNVo5T2VabEdSZFpw?=
 =?utf-8?B?ak1tTzBwTyt2d09WUko3WjhTQ29Ib0ZDR0hleS9NYnZMVjZ4cTNHTjdoNmo4?=
 =?utf-8?B?YjMwdm10U3FvNFNUMUlKUi8rUVdsL0hWMEJGSjRPeWFBeDh5bFhMM3Z0TUJC?=
 =?utf-8?B?MDQ3TmF4MW0yeTdRN2JIMnRKN09BSjB6VW5FdTNqRUZhUDlUdjdPVHFwZnR0?=
 =?utf-8?B?TmdYNy9ud1FSSVRPMU91cHNyQTBHbHJaTnNYL2tHWW1mRk82cElrTHRiTE96?=
 =?utf-8?B?VHVyUTNuTkhFRTZ0Y2JBdDhsWDc2ck1XWE9yMDVpZk5QT3RGL0l5Y0IyTFJm?=
 =?utf-8?B?SGFpSFU2KzdIMXJnVWJmRlNPdGxpdlFZVWhWYzBBQ05ESncrYUw1Ny83Tmt1?=
 =?utf-8?B?RHBqaE5KdUx6Z2FnSHkrQThJN1NwcnNDVkhpTVo4akhKVEcvd1RUa2RpbXZF?=
 =?utf-8?B?REZZU292Z0U4N0JHVXd3WU1HZlRKRzNIRVM2UmdEWXNqU0Z1TlVCWTNZK0Nj?=
 =?utf-8?B?bElXcmZaU2F2RTlHTGZvczUwZGNWVm1VOTBWZ1hEMEQ3MXdGNXcrb21pT3Ru?=
 =?utf-8?B?VXFMVjIxV09qTkdZOUhxdGFRWWd0QUlVQlBVUm9PaS9wQ2dVN0dxa3ZsUEkx?=
 =?utf-8?B?YVUyMWZLdmFvRkZPbHBJOXFNSTZEejFneWNHUUt1dm9MUE5tdWJKdUwxcGIz?=
 =?utf-8?B?TjBGcmJJcnZvTzFMV3A1WWVpTHNYVzNmWFZXVGZ4c3JNMk11aSt1NEJudHRt?=
 =?utf-8?B?ZHdCZ3A1TkJySUd3ZGFCZnhNejJCVHZ3Z2lnWTFSZm5IbHE3MzBnQmtnR2hF?=
 =?utf-8?B?Z29aMHZkRS9JR2tvcXlsT2R6UjJRck55ZWJYa0xzUXRRQmJaY0pialJtZkNp?=
 =?utf-8?B?Zm5HOHY0S0xhRWROcjErTytOVWlUSDhkM0F3bmF3cURFVXVib3p1OFNRS2lT?=
 =?utf-8?B?OHhSMTFsQXkxYVJ6ZkpvVm1BRkRXYU9DcnRsQi9wRGJ3M1hTaG1Eak5SQks1?=
 =?utf-8?B?TUhtSWsyZkxDNmQ3ZTRmcUorajgrK1hkcUFPdG8rNzVubFc4N1R6UnZ3Q25u?=
 =?utf-8?B?NjY0S2ZiMmdVbk1sTEFPN0pOVkVPaDZPQXh4ZS9Bd2pqMFJKQjVFeXdzelpS?=
 =?utf-8?B?ZUl5NGVVYkNYTmNPN2J4VHZ6K251NUJYN0RJZlNFNWZUUTlQZDBtV0ZDTXJ0?=
 =?utf-8?B?TFZ1aGpmWUo3ZXVFUGRsRndPV3lpc0VmMjVWd0VBamVkaWFNSHF1VFZnUWVv?=
 =?utf-8?B?N2IrekJ1anhPaDJLc3dzbTFDVHF5MitrYWhBcm1mTytiSUFhdDFkcjEyVGt0?=
 =?utf-8?B?bVJJTVRJR2tBS0wrUzlqWDVRZGRlOTBubFE1Z29vY3AwT0YySGd6NVRtK0lx?=
 =?utf-8?B?YmVvTld0Qk0vS3NtRTd3ZDNoU3dRLzU2YWs3d3lSbUEveHpKbHVoK3VGajUx?=
 =?utf-8?B?dE1GbkZvU0pkQkhqemtXOFF5MFhJZFpGc2lNS25EbjRrMkpMS3BnU0h4Z1hF?=
 =?utf-8?B?SUQvWUliUFpIL2JZdFdIZWxlZTdTYklFdXBIamh6UWV2dFlCNVBXUDR5Mi9w?=
 =?utf-8?B?RllWV0Zsa2NiQ0pzaU8yRnNEbmRWKzBPOUxOZURIdE1HMjd2NTRVUVlFUE1s?=
 =?utf-8?B?a29RTHpMSGR1UGZZMVFuUzM2MGtLQyt3bTNhVTFYOVBOUHAwUDBtU0k2TE9O?=
 =?utf-8?Q?iMKdvg6GuIQuRKhYwwKmP7xAH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61aa7dd-385e-48db-7762-08ddb251f7eb
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 12:32:08.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8TrhS4vQSuLAO+GIir2a6VCIS0vwqh+lw53pF3RgoxHJvQjWInSiMN/Rr3pbfTx8t/tHesWblORkRrIeMwyaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5185
X-Mailman-Approved-At: Mon, 23 Jun 2025 16:00:45 +0000
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pan Chuang <panchuang@vivo.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Yangtao Li <frank.li@vivo.com>
Subject: [Linux-stm32] [PATCH v6 01/24] genirq/devres: Add
	devm_request_threaded_irq_probe() and devm_request_irq_probe()
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

RnJvbTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+CgpUaGVyZSBhcmUgbW9yZSB0aGFu
IDcwMCBjYWxscyB0byBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxIG1ldGhvZCBhbmQKbW9yZSB0
aGFuIDEwMDAgY2FsbHMgdG8gZGV2bV9yZXF1ZXN0X2lycSBtZXRob2QuIE1vc3QgZHJpdmVycyBv
bmx5CnJlcXVlc3Qgb25lIGludGVycnVwdCByZXNvdXJjZSwgYW5kIHRoZXNlIGVycm9yIG1lc3Nh
Z2VzIGFyZSBiYXNpY2FsbHkKdGhlIHNhbWUuIElmIGVycm9yIG1lc3NhZ2VzIGFyZSBwcmludGVk
IGV2ZXJ5d2hlcmUsIG1vcmUgdGhhbiAyMDAwIGxpbmVzCm9mIGNvZGUgY2FuIGJlIHNhdmVkIGJ5
IHJlbW92aW5nIHRoZSBtc2cgaW4gdGhlIGRyaXZlci4KCkFuZCB0Z2x4IHBvaW50IG91dCB0aGF0
OgoKICBJZiB3ZSBhY3R1YWxseSBsb29rIGF0IHRoZSBjYWxsIHNpdGVzIG9mCiAgZGV2bV9yZXF1
ZXN0X3RocmVhZGVkX2lycSgpIHRoZW4gdGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhlbSBwcmludCBt
b3JlIG9yCiAgbGVzcyBsb3VzeSBlcnJvciBtZXNzYWdlcy4gQSBxdWljayBncmVwL3NlZC9hd2sv
c29ydC91bmlxIHJldmVhbGVkCgogICAgIDUxOSBtZXNzYWdlcyB0b3RhbCAodGhlcmUgYXJlIHBy
b2JhYmx5IG1vcmUpCgogICAgIDM1MiB1bmlxdWUgbWVzc2FnZXMKCiAgICAgMzIzIHVuaXF1ZSBt
ZXNzYWdlcyBhZnRlciBsb3dlciBjYXNpbmcKCiAgICAgICAgIFRob3NlIDMyMyBhcmUgbW9zdGx5
IGp1c3QgdmFyaWFudHMgb2YgdGhlIHNhbWUgcGF0dGVybnMgd2l0aAogICAgICAgICBzbGlnaHQg
bW9kaWZpY2F0aW9ucyBpbiBmb3JtYXR0aW5nIGFuZCBpbmZvcm1hdGlvbiBwcm92aWRlZC4KCiAg
ICAgMTg2IG9mIHRoZXNlIG1lc3NhZ2VzIGRvIG5vdCBkZWxpdmVyIGFueSB1c2VmdWwgaW5mb3Jt
YXRpb24sCiAgICAgICAgIGUuZy4gIm5vIGlycSIsICIKCiAgICAgVGhlIG1vc3QgdXNlZnVsIG9u
ZSBvZiBhbGwgaXM6ICJjb3VsZCByZXF1ZXN0IHdha2V1cCBpcnE6ICVkIgoKICBTbyB0aGVyZSBp
cyBjZXJ0YWlubHkgYW4gYXJndW1lbnQgdG8gYmUgbWFkZSB0aGF0IHRoaXMgcGFydGljdWxhcgog
IGZ1bmN0aW9uIHNob3VsZCBwcmludCBhIHdlbGwgZm9ybWF0dGVkIGFuZCBpbmZvcm1hdGl2ZSBl
cnJvciBtZXNzYWdlLgoKICBJdCdzIG5vdCBhIGdlbmVyYWwgYWxsb2NhdG9yIGxpa2Uga21hbGxv
YygpLiBJdCdzIHNwZWNpYWxpemVkIGFuZCBpbiB0aGUKICB2YXN0IG1ham9yaXR5IG9mIGNhc2Vz
IGZhaWxpbmcgdG8gcmVxdWVzdCB0aGUgaW50ZXJydXB0IGNhdXNlcyB0aGUKICBkZXZpY2UgcHJv
YmUgdG8gZmFpbC4gU28gaGF2aW5nIHByb3BlciBhbmQgY29uc2lzdGVudCBpbmZvcm1hdGlvbiB3
aHkKICB0aGUgZGV2aWNlIGNhbm5vdCBiZSB1c2VkIF9pc18gdXNlZnVsLgoKU28gYWRkIGRldm1f
cmVxdWVzdF90aHJlYWRlZF9pcnFfcHJvYmUoKSBhbmQgZGV2bV9yZXF1ZXN0X2lycV9wcm9iZSgp
LAp3aGljaCBlbnN1cmUgdGhhdCBhbGwgZXJyb3IgaGFuZGxpbmcgYnJhbmNoZXMgcHJpbnQgZXJy
b3IgaW5mb3JtYXRpb24uCkluIHRoaXMgd2F5LCB3aGVuIHRoaXMgZnVuY3Rpb24gZmFpbHMsIHRo
ZSB1cHBlci1sYXllciBmdW5jdGlvbnMgY2FuCmRpcmVjdGx5IHJldHVybiBhbiBlcnJvciBjb2Rl
IHdpdGhvdXQgbWlzc2luZyBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24uCk90aGVyd2lzZSwgdGhlIGVy
cm9yIG1lc3NhZ2Ugd2lsbCBiZSBwcmludGVkIHJlZHVuZGFudGx5IG9yIG1pc3NpbmcuCgpDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+CkNjOiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+CkNjOiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1l
cm9uQEh1YXdlaS5jb20+CkNjOiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAgPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBM
aSA8ZnJhbmsubGlAdml2by5jb20+ClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9u
YXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBQYW4gQ2h1YW5nIDxwYW5j
aHVhbmdAdml2by5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9pbnRlcnJ1cHQuaCB8IDE1ICsrKysr
KysrKysrKysrCiBrZXJuZWwvaXJxL2RldnJlcy5jICAgICAgIHwgNDMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ludGVycnVwdC5oIGIvaW5jbHVkZS9saW51
eC9pbnRlcnJ1cHQuaAppbmRleCA1MWI2NDg0YzA0OTMuLjVjMzlmZjdmMDMwYyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9pbnRlcnJ1cHQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ludGVycnVw
dC5oCkBAIC0yMDUsNiArMjA1LDIxIEBAIGV4dGVybiB2b2lkIGZyZWVfcGVyY3B1X25taSh1bnNp
Z25lZCBpbnQgaXJxLCB2b2lkIF9fcGVyY3B1ICpwZXJjcHVfZGV2X2lkKTsKIAogc3RydWN0IGRl
dmljZTsKIAorZXh0ZXJuIGludCBfX211c3RfY2hlY2sKK2Rldm1fcmVxdWVzdF90aHJlYWRlZF9p
cnFfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaXJxLAorCQkJICAgICAg
aXJxX2hhbmRsZXJfdCBoYW5kbGVyLCBpcnFfaGFuZGxlcl90IHRocmVhZF9mbiwKKwkJCSAgICAg
IHVuc2lnbmVkIGxvbmcgaXJxZmxhZ3MsIGNvbnN0IGNoYXIgKmRldm5hbWUsCisJCQkgICAgICB2
b2lkICpkZXZfaWQsIGNvbnN0IGNoYXIgKmluZm8pOworCitzdGF0aWMgaW5saW5lIGludCBfX211
c3RfY2hlY2sKK2Rldm1fcmVxdWVzdF9pcnFfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNp
Z25lZCBpbnQgaXJxLAorCQkgICAgICAgaXJxX2hhbmRsZXJfdCBoYW5kbGVyLCB1bnNpZ25lZCBs
b25nIGlycWZsYWdzLAorCQkgICAgICAgY29uc3QgY2hhciAqZGV2bmFtZSwgdm9pZCAqZGV2X2lk
LCBjb25zdCBjaGFyICppbmZvKQoreworCXJldHVybiBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJx
X3Byb2JlKGRldiwgaXJxLCBoYW5kbGVyLCBOVUxMLCBpcnFmbGFncywKKwkJCQkJICAgICAgIGRl
dm5hbWUsIGRldl9pZCwgaW5mbyk7Cit9CisKIGV4dGVybiBpbnQgX19tdXN0X2NoZWNrCiBkZXZt
X3JlcXVlc3RfdGhyZWFkZWRfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGly
cSwKIAkJCSAgaXJxX2hhbmRsZXJfdCBoYW5kbGVyLCBpcnFfaGFuZGxlcl90IHRocmVhZF9mbiwK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9pcnEvZGV2cmVzLmMgYi9rZXJuZWwvaXJxL2RldnJlcy5jCmlu
ZGV4IGViMTZhNThlMDMyMi4uNDBlMzg2MmIwZTgwIDEwMDY0NAotLS0gYS9rZXJuZWwvaXJxL2Rl
dnJlcy5jCisrKyBiL2tlcm5lbC9pcnEvZGV2cmVzLmMKQEAgLTgwLDYgKzgwLDQ5IEBAIGludCBk
ZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IGlycSwKIH0KIEVYUE9SVF9TWU1CT0woZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSk7CiAKKy8q
KgorICogZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycV9wcm9iZSAtIHJlcXVlc3QgaXJxIGZvciBh
IG1hbmFnZWQgZGV2aWNlIHdpdGggZXJyb3IgbXNnIChyZWNvbW1lbmRlZCBpbiBwcm9iZSkKKyAq
IEBkZXY6CURldmljZSB0byByZXF1ZXN0IGludGVycnVwdCBmb3IKKyAqIEBpcnE6CUludGVycnVw
dCBsaW5lIHRvIGFsbG9jYXRlCisgKiBAaGFuZGxlcjoJRnVuY3Rpb24gdG8gYmUgY2FsbGVkIHdo
ZW4gdGhlIElSUSBvY2N1cnMKKyAqIEB0aHJlYWRfZm46CUZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBp
biBhIHRocmVhZGVkIGludGVycnVwdCBjb250ZXh0LiBOVUxMCisgKgkJZm9yIGRldmljZXMgd2hp
Y2ggaGFuZGxlIGV2ZXJ5dGhpbmcgaW4gQGhhbmRsZXIKKyAqIEBpcnFmbGFnczoJSW50ZXJydXB0
IHR5cGUgZmxhZ3MKKyAqIEBkZXZuYW1lOglBbiBhc2NpaSBuYW1lIGZvciB0aGUgY2xhaW1pbmcg
ZGV2aWNlLCBkZXZfbmFtZShkZXYpIGlmIE5VTEwKKyAqIEBkZXZfaWQ6CUEgY29va2llIHBhc3Nl
ZCBiYWNrIHRvIHRoZSBoYW5kbGVyIGZ1bmN0aW9uCisgKiBAaW5mbzoJT3B0aW9uYWwgYWRkaXRp
b25hbCBlcnJvciBsb2cKKyAqCisgKiBUaGlzIGlzIGEgdmFyaWFudCBvZiB0aGUgZGV2bV9yZXF1
ZXN0X3RocmVhZGVkX2lycSBmdW5jdGlvbi4KKyAqIEl0IHdpbGwgcHJpbnQgYW4gZXJyb3IgbWVz
c2FnZSBieSBkZWZhdWx0IHdoZW4gdGhlIHJlcXVlc3QgZmFpbHMsCisgKiBhbmQgdGhlIGNvbnN1
bWVyIGNhbiBhZGQgYSBzcGVjaWFsIGVycm9yIG1zZy4KKyAqCisgKiBFeGNlcHQgZm9yIHRoZSBl
eHRyYSBAaW5mbyBhcmd1bWVudCwgdGhpcyBmdW5jdGlvbiB0YWtlcyB0aGUKKyAqIHNhbWUgYXJn
dW1lbnRzIGFuZCBwZXJmb3JtcyB0aGUgc2FtZSBmdW5jdGlvbiBhcworICogZGV2bV9yZXF1ZXN0
X3RocmVhZGVkX2lycSgpLiBJUlFzIHJlcXVlc3RlZCB3aXRoIHRoaXMgZnVuY3Rpb24gd2lsbCBi
ZQorICogYXV0b21hdGljYWxseSBmcmVlZCBvbiBkcml2ZXIgZGV0YWNoLgorICoKKyAqIElmIGFu
IElSUSBhbGxvY2F0ZWQgd2l0aCB0aGlzIGZ1bmN0aW9uIG5lZWRzIHRvIGJlIGZyZWVkCisgKiBz
ZXBhcmF0ZWx5LCBkZXZtX2ZyZWVfaXJxKCkgbXVzdCBiZSB1c2VkLgorICoKKyAqIFJldHVybjog
MCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgbnVtYmVyLgorICovCitpbnQgZGV2bV9y
ZXF1ZXN0X3RocmVhZGVkX2lycV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGlu
dCBpcnEsCisJCQkJICAgIGlycV9oYW5kbGVyX3QgaGFuZGxlciwgaXJxX2hhbmRsZXJfdCB0aHJl
YWRfZm4sCisJCQkJICAgIHVuc2lnbmVkIGxvbmcgaXJxZmxhZ3MsIGNvbnN0IGNoYXIgKmRldm5h
bWUsCisJCQkJICAgIHZvaWQgKmRldl9pZCwgY29uc3QgY2hhciAqaW5mbykKK3sKKwlpbnQgcmM7
CisKKwlyYyA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBpcnEsIGhhbmRsZXIsIE5V
TEwsIGlycWZsYWdzLCBkZXZuYW1lLCBkZXZfaWQpOworCWlmIChyYykgeworCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIHJjLCAiRmFpbGVkIHRvIHJlcXVlc3QgJXNpbnRlcnJ1cHQgJXUgJXMg
JXNcbiIsCisJCQkJICAgICB0aHJlYWRfZm4gPyAidGhyZWFkZWQgIiA6ICIiLCBpcnEsIGRldm5h
bWUgPyA6IGRldl9uYW1lKGRldiksCisJCQkJICAgICBpbmZvID8gOiAiIik7CisJfQorCXJldHVy
biAwOworfQorRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycV9wcm9i
ZSk7CisKIC8qKgogICoJZGV2bV9yZXF1ZXN0X2FueV9jb250ZXh0X2lycSAtIGFsbG9jYXRlIGFu
IGludGVycnVwdCBsaW5lIGZvciBhIG1hbmFnZWQgZGV2aWNlCiAgKglAZGV2OiBkZXZpY2UgdG8g
cmVxdWVzdCBpbnRlcnJ1cHQgZm9yCi0tIAoyLjM5LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
