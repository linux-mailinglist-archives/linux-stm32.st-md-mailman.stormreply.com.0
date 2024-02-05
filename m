Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EC84AA90
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 00:34:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 124DEC65E4C;
	Mon,  5 Feb 2024 23:34:12 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAEA9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Feb 2024 23:34:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSncuTQQRUMza2hJZa7n5crJoCJb+E8Xl9OQjVy9zKW3rc9yemcA2ZVoBia3O6hm8I4k49nm/2wDnIkLKmAiUf/clAioaoqZvGrQTrhvl3VxgL0j2UTnOZuK1u7uXGjR+ipARIhy0T5qBRMyKovpbOr83mWK3BaUwJBY02yWAW9rqQ+3IsMbRyIEWbeNPmZ/KwCXjZLlldFNiBhoYycPJocmviYHSATdLgTP86MRS4ck9aAKR9iZ++MhGzYI6q2o4WviX2A2k89/u0UE5aPuGpXjg2Z91B6Xu+hTwBzxMGPH8LmfZFP8tKGP8k2594mtyRMzMi8Qskg1kIs/UjnaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6CTY1AE3rULai2Q51dhU2cOWwixx0Jb0zGXhDmQbK4=;
 b=PG741DE+EYVLJs1Ezt9kKWKPLLwIKl4c9M/G/ficgX8cERwYrZOTiH7XtkIyZ5tIIjtiMRYe/zNXHFhil4Sa5yfeDJgshCf8Ja/UjuhRunuozkNhR/pA5uagKekYzxsrTxceWIEbSsVu1HjNH7rSuEjK29G16/nWhFZjA8n5wWSjtiPulLB7lLHO6ZwCm56mtCcc6KU7VV0idDMZRT0F7ITR+g1Crp0XF5KNXoFtMcu+Lu4jmPXRkX5L72sGapqGubRg3Uo3irJBzcs6YKMTkBIiQTwEPowgaD/QIs8jKvWnLOAy7NsrKDwEn5dtOEiqSnoKeOwnQ8FK3n+FVaGfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6CTY1AE3rULai2Q51dhU2cOWwixx0Jb0zGXhDmQbK4=;
 b=LdM3kakPz0Gu1LB1SkQiYsY3sOKjhyBHLnJYZqliuP2WuwPNQDLsQBbKrEepvdxJQgtrt1PyBeNscxaOgN+LzlHaWOis6u3LaWHJNZ1m1TWAdsuavp7PDT9ZzmgC6vC3qYVryMbijBXsnqnAR427m7FOFXYxyMEN0/DMHkIfLNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5621.jpnprd01.prod.outlook.com
 (2603:1096:604:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 23:34:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 23:34:04 +0000
Message-ID: <871q9qpjtg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20240205165517.GA3486840-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
 <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
 <20240205165517.GA3486840-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Mon, 5 Feb 2024 23:34:03 +0000
X-ClientProxiedBy: TYAPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:404:29::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe7e1f7-a8c1-4f9d-aee6-08dc26a2f09b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R03WMc6xoMjPuunVmHoqrgpDL0tud2ZU2G/xDUyO57Wv/gkQNewAh8XaaPrfDwm+3HFpYCYifn+ghnZSkbbMAJA/ak5F6NdSssWAFHIX2qhjnRVOvOldMr6cHKsCHcslQh5SQAv85HsqNpHL93BsMfecMQLdzo1bmOwr5Zd5n5ww5fhUz3JspN83FgviomVORLG1WMsu7VH3BilhlIR5U1fFl6pOpByAdDBwvJ0TKYhSY9fXgO4F1J9KgeOmnh+kxMWITjbv4wibjrLWKBJDJl0U0inJ1HBHmdlt0N6wCEIJCAqTypm69hnjrlkReVijYglx9R8yZkyT+tYkZ4EA2GCsReBYlC3LaKD+VK70GoowpeE4mmn5RbTYz7O8LNEvoueMkFKGCnHWwvWTyzDGc1QHH3gRhnU33wwxEV7PTcf/PZQ02wC+XDNedLdo0H+a0+31180skN6jxaMUFgXicA44GzgjotARWvfxCbuP64qd1PmjDp/DYIqYb2UFyr710JvBJ4taJ7kqHP1gi869ZqPDGVn4JaKygQOgzjFeEQzF4OzG+2uUCOl5pPuMcM8B+dkUR/6oolLBj0nKeaEscleSiGzXyztA9oK+xQ92+Vvgtv6+SIm/fn+jTLGGaaDr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(6486002)(36756003)(66946007)(66556008)(66476007)(54906003)(52116002)(6506007)(6512007)(478600001)(6916009)(8936002)(8676002)(4326008)(316002)(38350700005)(38100700002)(26005)(2616005)(86362001)(5660300002)(7406005)(7366002)(7336002)(7276002)(7416002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYueY2tTFnTvcjbzmfnnVLDV0hb93H4eCtj3dlbjh1K4m55NXcs1sbvoGSXn?=
 =?us-ascii?Q?dk14v4gUOVRve2l2Ish8uRnZZ4XhOC1ymtzCTXQknP2rseCepjw6gYfatmSH?=
 =?us-ascii?Q?hxlE6aN3UW+J+iJpPnqSYyvdLreYauOwsQyB/NR2a5fmTRUhupe/U5xwYRAN?=
 =?us-ascii?Q?zWUal/mCYlA27/pvxmimsGIgJ5e81vA8r73NOvDaiERtjseZogKBWxMa/d11?=
 =?us-ascii?Q?G+oXkYgNOlb7CAztNGUb9tABrsL/RhTUFCtu5NGWO65PMZ4cAbRBMe9YI/+O?=
 =?us-ascii?Q?slQrvmZYIh3QoZWCjQ0oYzeYVBgxrsnyrxwzq57qhXrwk1s7F2eFTz0ySVdt?=
 =?us-ascii?Q?Dpa7EKDM3OZnO++e8mj1KapWryQ6d6UDVvPDlDWOv7GmzHek2aS22CdVDZSa?=
 =?us-ascii?Q?uryJOqtA7uycyA2jpOECQZ2jhvYPQuzxVIM38IzwSphvLPxzccCFtB817blW?=
 =?us-ascii?Q?R1dwLKJquWxwvgH8p0yVN4q3NO70crkOs9nRNLo+AgOl3PLG1JrlH+RV/R1z?=
 =?us-ascii?Q?vOBirVGaDtMwdsmqyeaRMiK259kPz4bGmYd6W9TpZOl/jqW6fgvd972k9RMS?=
 =?us-ascii?Q?2Q1txnpj57dlyaePjdb4QVz8XA/hOEpWB39kFueje1Qsj76F1fz8XNgYDtjF?=
 =?us-ascii?Q?nPe3sefVW3w7fDMWM++SBiKxddG20KTQg58gojHuU6giFDNZdMBwIPUGGOTL?=
 =?us-ascii?Q?cj1u9jA/gKQM1CUlhBo0XvItN7O3oP2SHEbCFY3Bdp7X52sOkX80NDk7cv4E?=
 =?us-ascii?Q?Hws458hBAPRs3BoOtafbr9WDvYeuEaW5Oo0yokVrvr77zzB159KQ/1ee/+W9?=
 =?us-ascii?Q?jNkyoio/2NlhTRPQEjxsX5Jl5INXEbZRocrjHNgisg6kytwxkZmUY4NxvxVG?=
 =?us-ascii?Q?SGSxYqB258SKBc2XrY4TmworovQTlqLzaVneUAc+bqMd+BWSORoVZyU8FPIa?=
 =?us-ascii?Q?q76/30vEFmbnUJAuKI3zKUJx7IpQVUCKGz9dYTA9GgvHYl/c/LuXhSTvJ5a0?=
 =?us-ascii?Q?jTlpohDUEOuoA+qPW0LrIORgrVfOCyTi3J25KhwJfxk7VTSV8tM6N/CrQ328?=
 =?us-ascii?Q?MOM7f/fifRzSeIGDQzxmTa019BMkAuEc9IHsy6RK1qJOHLt0oAbp9EoT/nSl?=
 =?us-ascii?Q?ZkNxm3ExpePj2gesPNTVhgUzEj4xJqZCDVwQGUdo8HXzXMAzDTBSZ8d2Z8GD?=
 =?us-ascii?Q?lK43yJC0tZy5GLGgGEbSAuod/fHcMKcODYWiiS7lnxDVx4Q66hgUVCBWq0y7?=
 =?us-ascii?Q?559fu/S6d83gBDN4zrm+RwvnqmY5LspM+/a70csQoqTpmprGkKMYkjRNpBrr?=
 =?us-ascii?Q?tD3wQCLjSIdhyoeGEt+3vsZYJ5+06Zed0ULR/ZP2BW1HzMGZXxYRne5nLFxs?=
 =?us-ascii?Q?utkKo4wKgDqGkDnTZNMDwNNcAY0N2EcoBjHHhY3+PRCkgItB1erjkjqfw3h7?=
 =?us-ascii?Q?iFzOeBXQ39pJux/3T5h8NeGJHdUNFzRyhjlUVGQrryTZFokbbpmlj5U85oZ+?=
 =?us-ascii?Q?Sqs4QlB1BaRLmh0dCjcALywQPVQwatjwFmZfy0EHC9BJDWFAq8GeiTQgFVIG?=
 =?us-ascii?Q?273gBU2/1s15zvVpu49UMZ9lQEtd6d6whEOTXgrC1mLc8Oi2r+7RxTCyruJ2?=
 =?us-ascii?Q?O+yYzChOstN1QM7owDBZG04=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7e1f7-a8c1-4f9d-aee6-08dc26a2f09b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:34:04.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F57SjbVYIdTnAKUq0fEW3bYhZPCvtoKU/E32wStH3OvWgE+2xmKubE9TVsW6bnKXdOA7MxYtnbvXjGgHmq2trvTAt4CzKtuZmSGpuUV1sNJ86gJ6qF4WFAfMwMWghu7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5621
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

Hi Rob

> I've read the threads already and think you should skip the rename. Just 
> put 'port' in the name of the new one.

OK

> That and taking a port number param should be enough distinction.

I think we want to use "port" directly instead of "port number"
on new function.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
