Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBC084ABEB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 03:06:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1887C65E4C;
	Tue,  6 Feb 2024 02:06:10 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 426FEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 02:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAMWl0pSD2ECBYn0JopotoMW9C1vUBrxSNq9lH7FVGRvM3QDOvMt2IXbwEkvedmVR3ieE0Ec4jLsbRj9nZA/VjKsmKWPQxQEjmiBtdkUS7laTkFYD5cyBb4vH2ULL8j2HeNLNucqYBtNto5H3+gVMB0SjKq87aCla3J6J0RPW7mHPmM4ERYCk/zWQtyhgbXATSjNA7nrV4+tNROzP69Wmo+WhkhSgyAhP+QfaskB3ka8WogtvgEf/JZMpjSMPzq+97m2wI1CY06RG1xDFo+zd0yJe8x9nfurWjeRB1u0GXb7puGG9Gi9wUWofY18cTf3nzKaF7buovtL2e1shx+3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPZF4Q3qh/8eLPV0mgQR34euQlUVEVr+ITaD7QNZ4bU=;
 b=VLwf9saLStPeMhyLaViVq6oXCEeOZkucqhDB3YW43tyyezLyywX9iPjRPxghVbpeBCZwI8H2Z1e2L/6+hTi50I41+DFYaW4ufOtBfM2NfnTKHqJ+HVRNR+Kh+Fs6voC9E5aXjOKsbdBT/iZ9NHLO5RkkcmajjjhUhawAlY+I4x6Sp76VVv9hqhSP4D3kgpYg5tu+8nKWJRotmE0vLiSQK+p/Fw9T9cMKhFVs3p7WxUbNyDUfepFzYMwGGtCCpZHddcbKJsKV6DQoPxl0QKx+R9Hs0P+Vf4VIwe7k5UauwX/Tw+m2z509A6USp33ECFcNqsL6bWTOVvmfka/JCjQwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPZF4Q3qh/8eLPV0mgQR34euQlUVEVr+ITaD7QNZ4bU=;
 b=JxhOOCwCwBmlt60XXWDjRlVvRii21/CgvQwKyfoKOlv1c0nfQ+tKUuRfTXAvAg2AlYi21P3hJEK18gJO3FokPAgnAw9nwu8h9JaCZuTlxo+t+VD/YcsBE/zEJ1loFVdpOevno/+yE1XJMfwCdO63FW+HEAcqWtYbfKCoY95yXdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9556.jpnprd01.prod.outlook.com
 (2603:1096:400:19b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:06:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:06:03 +0000
Message-ID: <87wmriny7q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
 <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Tue, 6 Feb 2024 02:06:02 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6a1e2e-6252-40c5-d70f-08dc26b82b91
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8G3OKnKmXpdjOWzPlNclmCc/7CdNqD8PZTzYZs32sCbC4zn0eBxEjw4js25Ar+ieLWHKfFdAYq8+S+93H7nddhqGW/QMAvHhhuqAgmqY5ItzpuZI6S/TA3GYPr9DvlSC5MEKXV8TUeW7OoUkEP0N3b9qVHCkP2ZTcf3azlOzdB46n63B3c76rjH0STQkhE8K26MBTTjf3rPtklqFxDBvFCVmPlgXaq5DbRobihDGnFXN9rgLT80hlRQr5JLsmdMVWYIq2Yuhi12DQJiB/Xj2Bgw0JQrNb3pXEnC7FGRJ6NnCJBxhy35YOdxcyHSokihBNZacPnLzWcji/nK9h4/0WBShAU5TApjfTdMwhQENEZIQkaQ7TN+MaorT5ziFXDklAR3OLRDD8q6sz9PLiuZX+6XgD/pZEiQPjOwOpoit5M1zJBUeY8lQDdq57qBzxrEHTZRXTtX45CpHmHy0z88NHOV7kSK0SsEnkSW8gHMNU1Sd0Y/M1TBYG69bKlummZsRT9A13ElefcpOGS55oyWIO7LLDr+q3Lxg1enA1KGDAeIPg8yIrS3bX+/coSVNSDaIBfw8qr4mK4m4Qc9fvqqfzN9cVC7OMGeVKkx3R3Kp+SHEcpKyuqo9rIhEu3lQY2DI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(66946007)(6512007)(6916009)(66556008)(66476007)(36756003)(52116002)(6506007)(478600001)(6486002)(54906003)(8936002)(316002)(8676002)(38350700005)(4326008)(38100700002)(26005)(86362001)(2616005)(7416002)(2906002)(5660300002)(7406005)(7366002)(7276002)(7336002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?chpzc4MYgHRdatDvRkJ3+9AHnhnlVL7DbJhatXFVsFIHiU3Z/4SfA1uVRIZh?=
 =?us-ascii?Q?KszR4xjcFkNbzCqAD5wWru9pzdb5zu3gmh/FJROTwIp3dImET4CQpo9eHsSf?=
 =?us-ascii?Q?5/o4hOWDzFinabyzkRTYG12Jm1UZSy6ciLQHLAJm9EKebD4b7DhWE2a3MM4/?=
 =?us-ascii?Q?y083NBMYFmio8AoiEhcN406q5pO3+M4Gd367MXiLXv0JRziXcLSQExDJ5/zg?=
 =?us-ascii?Q?7qOGJLE9oujOAIhwlZGfstrbfqRxFtGsecjl9G4CuYP7ue3PPAABI8uA4w4G?=
 =?us-ascii?Q?KmFlzk86kyFbaL2jnb3uiHP9hcogvhBXD2KFKLdo4KkV7qghJaab26TJMOvZ?=
 =?us-ascii?Q?D5sM8m4P10mRaZ1TWnlxmNijNV9KznR6UV3XKncMB57ZqABalei7PfG9ii+A?=
 =?us-ascii?Q?rEknweRN+0Lr05yu0cZHhUP+WFX8FX35+oyM7BOcH7tRv37OVTAI1PQwli18?=
 =?us-ascii?Q?gVtWOX+RLWDCjx7PNRHArp+/cp9qT/PpXZwCffCLi92L0okv40zKxK2UzRAs?=
 =?us-ascii?Q?qWiCgZhPJQf8osfGkcwF5BFbwemofhOQo9WED0+XIMBGt8AnpZKcZfz2Z4V/?=
 =?us-ascii?Q?gTgnzE9QQQhkAC3cwIImy2zruc2me1nmzD4NFqKSo8xYlOcMDo9nQCTANRFf?=
 =?us-ascii?Q?RIB2/4GWyEkapdTw9nIrr+Y/iy/Q+cfHI/oV426nvAlVwlUI/MoDN8T/imBM?=
 =?us-ascii?Q?zH1D+i5Drqdwym98KHT5kIm/1ebS91AWwsG25aAiTY392F8gaq5XK1YQiWdL?=
 =?us-ascii?Q?VtHKnJUeOYirch+5oaTWDVOultT0bm7zVVcmntomUmIfs4uC75elBbFxhddN?=
 =?us-ascii?Q?Lz1WlhemBh8EZuncG4duj/UHqCVXXjd9AtBHLPqGpg5oVNJpe/wMBLbC86bF?=
 =?us-ascii?Q?oDl8KCimpPwrkg4MS6RDSX88Hurn80xz13hpCtPcRxzoD+Mc8cpIOaY1rC4Y?=
 =?us-ascii?Q?41BKdopaye+6ziAKskemHPgWTG0mPDxdMo6Y3rG2clFDhdz7YGSudbjbkft5?=
 =?us-ascii?Q?bkDKzfBIryhywYleT/1GgJXVNVCcWcjslSjZVs0LOfm1yw/CLMs9JPCUDXHz?=
 =?us-ascii?Q?mvugjJpW6gAEGnetQNHFXUiHf0p9/dR9qk+aAL1RfwmQtDs8yCj74/VWeD9p?=
 =?us-ascii?Q?acpvE1SiTvjKElT4KBpPShDo8ZktuqDEycpN1lr5PsmI9H9jc7pvsVVRZDBt?=
 =?us-ascii?Q?uAdWDE1Mtd4yFH1h+wGw7H3jVq0I3zRZPdeHT3ihZ7sF4zQlF0vkZMf0ovqo?=
 =?us-ascii?Q?TsGxEZNkNMJhSZHxcaFG78OOKzhtMb1ksFraZRhqFEoVZDJ1yvTFk/SJgzPG?=
 =?us-ascii?Q?z4RtUVVcGdPip8RGeKzmoECS+6+p14CwOVcZAUQFwo254uHSRGZQNqhhGdAY?=
 =?us-ascii?Q?K+aegKBeEHcv8wGa9KY/weeRl0OT+Z9LiOnGNwZFaFx9Fxwhd/ibuDGyFUKY?=
 =?us-ascii?Q?5atdqaIb7siZ+Ga8uRIlXxilPpMYO+zWrwv5Yd7TTjwqsqhVzaLvGZlIiVWy?=
 =?us-ascii?Q?X77CwR6zyEDFL5X4ehB/s93Urh4Yxu7artdqlmBfo8+lR0HVscsvVHpk1A02?=
 =?us-ascii?Q?MHcHabbC7nQNky76jnEXWwCAvqgaLm3d0xhUALLcqaeuNo4g9sUxnAB/w+io?=
 =?us-ascii?Q?Mn6euzJXQjOCCoi/Pn611M4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6a1e2e-6252-40c5-d70f-08dc26b82b91
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:06:02.9564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeBeigpbAQOCwV8SEyxuae6SNV3YTmKYhQn2bb/wq8UKip+MXTT9ieAFG6/o3EsW5ph97QJyWvDAIxM/xxyUOz+Sn846JHRynf06/1JF99BlwCCmD0druG3TqiRAe4/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9556
Cc: dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K?= =?ISO-8859-1?Q?=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Saravana Kannan <saravanak@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?ISO-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Harvey <tharvey@gateworks.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Todor Tomov <todor.too@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-sound@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Leo Yan <leo.yan@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 05/24] media: i2c: switch to use
	of_graph_get_next_device_endpoint()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


Hi Rob, again

> > This is assuming there's just 1 port and 1 endpoint, but let's be 
> > specific as the bindings are (first endpoint on port 0):
> > 
> > of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
> > 
> > Note we could ask for endpoint 0 here, but the bindings generally allow 
> > for more than 1.
> > 
> > I imagine most of the other cases here are the same.

I'm bit confused here.
You mentioned that -1 is wrong in previous mail.

	Most cases are in the form of of_graph_get_next_endpoint(dev, NULL) 
	which is equivalent to of_graph_get_endpoint_by_regs(dev, 0, 0). 
	Technically, -1 instead of 0 is equivalent, but I'd argue is sloppy and 
	wrong.

But you mentioned -1 here, So, I will use it on next patch-set.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
