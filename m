Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90F843523
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 06:06:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12134C6DD6D;
	Wed, 31 Jan 2024 05:06:08 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE0AFC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 05:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGp+gQY+/FhUkyyHP1JwdmeLFecAlTr1B6hV9O2c+YvdzFMA1eSsQi/Tv+01N/La9gifVYy4ySxOA37/NkNm4WDr2+vjEKf27alZmO0C3/VaSBDQ49732h8neogNC+QRk8RgiczRgC/7Bf+JMbaUzlM+TfVmTU9yPtN1QnVWtDH/EfJykmSfL0eCrddUBnS125UziCY0X1uNZSFack7dt6mEnGE3e8n2DGmsfBIF9lkcO/izMtEGyIK0qdeHkrrsCfWhJcwzGzEK6BuFESeKkFMTE1xMObfYkqnm+psQ+TyT6J5C8rbu77YBYjcga8GuStgmg4YKYGTnAnqKl95kTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZuZKm9q0muQXTMXS2w88pH2wU3XRLuIMFdL1Vl+CSQ=;
 b=JIXcz6yGTE5oSppJrctHRcYFU9ZyVhtnHzPyyfls4ryqCnNf626BZO3DOG27RvXb1sMu920ELav41tLkRQB2WHWHs/NJ350F0mXptQW46FcQKtqzoOrd59RT4DbuRV9GM+vdsqeHmyxxo+oVoYS+ADA7Jg8xmEf+rSbpqYTQP1LwCkBB5h3krZ8hns8QMDH8McUCn89WyJVm+gZzOsy6SRBg7fHUt43xZ89d/19FLYQnxwTiljsj5JJ2N4bhuQ11trUl5QvqYSxpBPB4FRQmXGwKL9yfyfzlpNG4MCAiuFapiGhMvHlY4Zy9F5FjwyPgORVcKvfSQKHRUIfwzVAO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZuZKm9q0muQXTMXS2w88pH2wU3XRLuIMFdL1Vl+CSQ=;
 b=XcwkIIHmfkI5X6ml7OImobHN11TwFe3fRkgYHddmilkC4Vm5XWE/yOLBc+o6HE7yZP5yXd4xSpq045wrkUgVqsQOUr8CbBXmSlBQWWBTeh5l8zWqWG17iCNHMoxDTiW0w9vI1y+X2UAtRGndy0FtlJVPa1Z93iHKfP/59U8MgHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:01 +0000
Message-ID: <87a5om6qiv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,	"Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>,	=?ISO-8859-1?Q?=22Uwe_Kleine-K?=
 =?ISO-8859-1?Q?=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,	Abhinav
 Kumar <quic_abhinavk@quicinc.com>,	Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,	Alexander Stein
 <alexander.stein@ew.tq-group.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,	Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,	Bjorn Andersson
 <andersson@kernel.org>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Daniel
 Vetter <daniel@ffwll.ch>,	Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,	Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emma Anholt <emma@anholt.net>,	Eugen Hristev
 <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,	Helge Deller <deller@gmx.de>,	Hugues Fruchet
 <hugues.fruchet@foss.st.com>,	Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jacopo Mondi <jacopo@jmondi.org>,	James Clark <james.clark@arm.com>,
 Jaroslav Kysela <perex@perex.cz>,	Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>,	Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,	Kieran Bingham
 <kieran.bingham@ideasonboard.com>,	Konrad Dybcio
 <konrad.dybcio@linaro.org>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
 Liu Ying <victor.liu@nxp.com>,	Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Marek Vasut
 <marex@denx.de>,	Mark Brown <broonie@kernel.org>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Michael Tretter <m.tretter@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>,	Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Philipp Zabel
 <p.zabel@pengutronix.de>,	Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,	Rob Clark
 <robdclark@gmail.com>,	Rob Herring <robh+dt@kernel.org>,	Robert Foss
 <rfoss@kernel.org>,	Russell King <linux@armlinux.org.uk>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Saravana Kannan <saravanak@google.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,	Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,	Stefan Agner
 <stefan@agner.ch>,	Suzuki K Poulose <suzuki.poulose@arm.com>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Thierry
 Reding <thierry.reding@gmail.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,	Yannick Fertre
 <yannick.fertre@foss.st.com>
In-Reply-To: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Wed, 31 Jan 2024 05:06:00 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4b2bd0-dd7f-47bb-4141-08dc221a51a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w46a299M34MICNPJ225jDyxibkxykYwhjMoRNIfIgN8nkKtjf7eFwbJL33DF/GzxHL+A5ODLIvXKHhqJXBnP3ebu1L2P1hKhGYiWLxpC3PN/EyRhkrFQZAxp/lGURD2NBrlFHvR0sBs/5KYb7DLabHx3wXamz0eo3hpbIztZKkfzjqgPoBR5B86c07JNf39SwQXLQ4SI5kNIldy0BkQEhNfaPK8Mk9CVlC7ukIxdiedlys7UAf8TPt34HectboFmuekEcIzfeGjNbIoXTdAIyMwya/Mc4HRc1zVHSKbOJqTY44+CbJDs0mMA6+ISbtDg7R0MWPkDI3qt1bZKrDvtKJOOhSw0bGOoNx5dF7csq7AvZTBiwLN4PUH46KlgMxYjxc10d6ukNiUvzBM9o5Oprip4spujs9h2L61Sy3jTA6UzJwsbnTAHEmMeplB6LdTrlwLASrfz2AFB2QVjgFm1rhGFvZfKX8VyDplFXJGG3EQdtR4+a4nep7dTF5M5FT73WbUm6eDE+1Il35cpzG+/kuz0gzTdGjqc6zdl7+Ou2cqM/mGLW1ZNnfh/hvWUSqFLfgSOmDYUBu9kQ1mhrbP0nnv2KHAWQ1BDcArT1532ijLMa6j7tlHsRVriJLuco3SMEURsbHihWY9Rk0NHXNfF9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Qhah6vZlGbrxZfarsMCmrCrLJBrmZVHbc1XRBmLFIOM5raCSbFSp3o6xd+z?=
 =?us-ascii?Q?Wy4BizdiRQVM7ahCK0ZF8QSzLoy3xwEF0b/sgtNLP9Ii9d4AEUUkWohDT4e+?=
 =?us-ascii?Q?tI9pUiMu2itrXvcH7V9NmLM/OCQqxn6+jGhKWfbHcwN2u8d1/vX9w3wDTkkU?=
 =?us-ascii?Q?rvoeGpVUl7+90GTndyAeQlJbHhG2hO1VdtsQZbB7kDthFX6rLEJNiGj0TvFo?=
 =?us-ascii?Q?EIm+pOIMcr4S+oU9OjZVgEEv94YVokZkOD1vZSmi7wDTixF2D1ATzphKeYXc?=
 =?us-ascii?Q?iJBG2EnkaQCN92/It3Qd2oBV16R6eqjS3VlErKJGpMVDJkkJFcW08R/cK6QO?=
 =?us-ascii?Q?7TzaXZqkJUGIdohnKnvBK5N0kle+sl64w5uh71jQqur7Eor1GeTHzeu4M8Pg?=
 =?us-ascii?Q?LoNTQ64SIApFOtR36peTlGkOX0MYcMX+PaRXZfV4XJV7wUS3hnpw0AvCnNfI?=
 =?us-ascii?Q?82QyMWpk4m+F0EmF1cKgFi/JVw1s1ppzGhZtnOZkJTKagdTBs7VC3fxvNehh?=
 =?us-ascii?Q?lxE0in2BBqs46OoHWer+qjRyiKHHH1exAYAgWhFrRB46BVfs8NpsvYs50c0r?=
 =?us-ascii?Q?498xvizO6ooY7fjhjZUdApustc/7T3WmllOUSAOTsZjDGxwtHZjNGA8BQo9T?=
 =?us-ascii?Q?VX0d9n2t3dXZPMuJ2dl8AnAcC7diDhyAbVZCl4Qs86sbrhvv6nXrqhqqTXsb?=
 =?us-ascii?Q?uXdEBcYGcwofyeE0XO8NFM82obb3uIvtUV6WkhzAfFHEOOd6+sUjot/y625Y?=
 =?us-ascii?Q?jcbEHDJzLmgSTQFsPmql3Om50tGXL/Xn2Bhk4EBRoo2UG7xAcO9pr8CP/NX6?=
 =?us-ascii?Q?Pu2RG9sksWkNQc6yvQvBucDZIXEx7ZRWOdIvc7GXmKZsrq6xYKo85aapXVJO?=
 =?us-ascii?Q?ibAjrqPa12YAJ80p3gYOScJzYvnL1jZIU1+3ZI+ODDHUXckUnDUh8ZxpOLxc?=
 =?us-ascii?Q?QHDHttgOJNt/SUpMSSYMdrzm+muDQJl0nwQyA8Mae81CDSAhQ6KaMMKwDbOp?=
 =?us-ascii?Q?1JmaThW7GJFJdBZOU/Cwb2ypj4nKVO2oQh8Ohe2qFbVdDerLcCHliAhhd75r?=
 =?us-ascii?Q?Ck2JeWMay3RMsy1MOQ3obp99RGQ8rat4rJ8x8YNShZ99dk+nwgjnKZsusokr?=
 =?us-ascii?Q?dJHcfZeTixz1tY0OCKEuL600IWAy73oHHQLoltLbGBJSvvI/RXJi4kt7YXto?=
 =?us-ascii?Q?OS1oqcbDcH3wjN0TBLETBVkGwXS109k9qxmC5DMdHNe1ljy+noNDw7jxumOW?=
 =?us-ascii?Q?X0A2qP13Tnp8PIJ2253T5WKuN8CxmQsg22jDMbqvyjLRinM2QHgZnNYGG9bm?=
 =?us-ascii?Q?KB/joLuWE3Og88SCzYNZZsQz5V2oC5l8XU9cw2Mbpjo/1ODLxjauNFbX2Y2k?=
 =?us-ascii?Q?Owf+XXglVFfH2hhKrWIjEYGbKPGz4INacwfQApB+11YC6b5Y6CNQ/v4cRTuV?=
 =?us-ascii?Q?fMloxJbZ3VZ6uTKKXGR8A1pC/ZVesj5awAqnMoN30dG/nTejhuTr2AJFHdZ7?=
 =?us-ascii?Q?R/9SeNb/kwOQ8CemQWWbq4s3tn4YVqGW3+64fukwLqe1fhT9xqMG8HgaPWTN?=
 =?us-ascii?Q?cNrYn9CrqOYnQnJtqbqg1S5gTxOpnNP9JtwE6wLjCnN3qdM7tFqc1Hl5PtuW?=
 =?us-ascii?Q?NtpdrY+YzkGBvkJlYrNN8Yk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4b2bd0-dd7f-47bb-4141-08dc221a51a6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:01.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6qAWpbEz4kDmUz1B2EI06rdiwhWSs8JbzyGqhIQkW3XuY51M3nKA8oCdKME77irKJ7tal7MZfzO75Qy7+AA4AEcGOdwUg2vn569OUm52mM3eBH+Jz/PMgTGlMj4p3K/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8896
Cc: linux-fbdev@vger.kernel.org, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-sound@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 linux-media@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v3 10/24] ASoC: switch to use
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

of_graph_get_next_endpoint() is now renamed to
of_graph_get_next_device_endpoint(). Switch to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c             | 2 +-
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/generic/simple-card-utils.c | 6 +++---
 sound/soc/generic/test-component.c    | 4 ++--
 sound/soc/sh/rcar/core.c              | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 73fb35560e51..1e1d9c7abdc7 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -870,7 +870,7 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
 	 * TDM support is assuming it is probed via Audio-Graph-Card style here.
 	 * Default is SDTIx1 if it was probed via Simple-Audio-Card for now.
 	 */
-	sdti_num = of_graph_get_endpoint_count(np);
+	sdti_num = of_graph_get_device_endpoint_count(np);
 	if ((sdti_num >= SDTx_MAX) || (sdti_num < 1))
 		sdti_num = 1;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 62606e20be9a..c3763719a69f 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1104,7 +1104,7 @@ static int graph_counter(struct device_node *lnk)
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
-		 * We can't use of_graph_get_endpoint_count() here
+		 * We can't use of_graph_get_device_endpoint_count() here
 		 */
 		while(1) {
 			port = of_get_next_child(ports, port);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 81077d16d22f..2c89b711b1ea 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1049,7 +1049,7 @@ static int graph_get_dai_id(struct device_node *ep)
 	 */
 	i = 0;
 	id = -1;
-	for_each_endpoint_of_node(node, endpoint) {
+	for_each_device_endpoint_of_node(node, endpoint) {
 		if (endpoint == ep)
 			id = i;
 		i++;
@@ -1093,7 +1093,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	/* Get dai->name */
 	args.np		= node;
 	args.args[0]	= graph_get_dai_id(ep);
-	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
+	args.args_count	= (of_graph_get_device_endpoint_count(node) > 1);
 
 	/*
 	 * FIXME
@@ -1122,7 +1122,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 
 parse_dai_end:
 	if (is_single_link)
-		*is_single_link = of_graph_get_endpoint_count(node) == 1;
+		*is_single_link = of_graph_get_device_endpoint_count(node) == 1;
 
 	return 0;
 }
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e4967540a2e1..0ebacbcddee3 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -538,7 +538,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	struct test_priv *priv;
 	int num, ret, i;
 
-	num = of_graph_get_endpoint_count(node);
+	num = of_graph_get_device_endpoint_count(node);
 	if (!num) {
 		dev_err(dev, "no port exits\n");
 		return -EINVAL;
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_device_endpoint_of_node(node, ep) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0b1aa23c1189..d0581232063a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1298,7 +1298,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 		if (!of_node_name_eq(ports, "ports") &&
 		    !of_node_name_eq(ports, "port"))
 			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+		priv->component_dais[i] = of_graph_get_device_endpoint_count(ports);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1510,7 +1510,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 			if (!of_node_name_eq(ports, "ports") &&
 			    !of_node_name_eq(ports, "port"))
 				continue;
-			for_each_endpoint_of_node(ports, dai_np) {
+			for_each_device_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
