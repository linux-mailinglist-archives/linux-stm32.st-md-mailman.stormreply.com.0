Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ECC8491E3
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 00:44:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DDF3C6B476;
	Sun,  4 Feb 2024 23:44:53 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D67EC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 23:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlL2dRGMsTIvtqiA/w1SVs36/siA9y6+PxzLSBE4bkZ8PZgTGGH0iQMpuAu3Jq94/I+xFZRrXo3DjtRn1CTEczzvVB3HYv/MbGMu/as0l7MkQJqjOuxXJ8hwQg/qNfp3d9wGC6Lsl/QzF4pcdPWe8zec+EcJ+xuaryEXcZsJpz5ItLpAE/tlXU3zx55IOy4XcFBKu8XSbjtNJ4dMKLQVsv7JgJI/IK7RfMX/rTgVB5Owgr8BzsTl2HF9Np+TLpWcpinvuAwN/Jt1R+8cayi68FNlqpgRd1DvYrr6qiiTKeytWR9XSnTe0oF/7IydhIOPAlwFUKDcZM2r/hJsEsWanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAIGVyqVDt1okm0zADf/MCqj5u3NVqHjHiCFJPiPG6E=;
 b=G/MSoyvLj1hSW7K8L92orU8tatdo7q3n5BZLOttGhL0UnX4eHWiWcwUYobA8BUZqnBVNQvDnuoMDEYtmvCB5QrK59rH8hKHU960FngbHpnRlVno/E49jyO/2U9Upb0Yv9+Gv9gX9zVUmozYqVYgYibZBPOJHZ7Zr0olZZ9CqTLFBO67EqW7V93W2C/HBNKh1bWFfPfRF3bpTCCCSgufMS2a0of3xZHk5SbCeXlocWW/GrO+7UGY4D8j46npqeYx0J4uSQYCjAR6bY4dTlC8+TAsWJxvGDetztmq2tLPZGWMp3twwoW54lepV/4c2rHj0sS/JZwUMsl8dbSc2Yk5YbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAIGVyqVDt1okm0zADf/MCqj5u3NVqHjHiCFJPiPG6E=;
 b=dUESpUC3D7P6nU5PeIQfjD8E4H9/8Mi5dwrPWIQLg5dBBA9+iGitBA88jCILFRlKDbjYMkWZK48bzcdMM54gQRujOE5RBA+FBgpE1v1q4ZUoDuH9pTBPXS+s70Mj/cgwPuPWCDbqwSTu51f1QVG0OLJWnuHzWZqasZ+9qjkZ76Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10656.jpnprd01.prod.outlook.com
 (2603:1096:400:323::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14; Sun, 4 Feb
 2024 23:44:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 23:44:40 +0000
Message-ID: <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20240202174941.GA310089-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Sun, 4 Feb 2024 23:44:39 +0000
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10656:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9702a3-24e7-4d54-2b1f-08dc25db4164
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /O52G/Tf4EynOcF+CqlepmWEhaPKnRSC7dHmtSIHmNjFXLCtWrivEuE8w7zTy0crJC+Kp05Gy1W4kVB6ir6xcO8b0+sLfhM9YgHBbcwzx4k5FWm5mM6Qtig0wWJwUvdGYwihvC+3V4AC1Wg4mimEqp9ocfNxQEGDr261+Xo7WVJgBNT4mMmZA0VTJCPw39KTly8iInLeEG0L9RqpUPmt1w+WpewISnpi2a/cZ28hUdk3Qx+FuqJin/ERQtbhrkx6r2iJ4MM/0H20HA7TdyR6rSM5WcjUHpxcbADjhHpAbPR0WEOgkhol1o2izt5i9ObWqNz9YNy4+EHsiWZVd42jorfk+6Lm9ItSfbh3/syuN+adMU+a3vd08c1f3rku/PI0qDsgliiproGiY6DVMYNpG48pqW3J+h6KSHa3xZAPfEDdkzVkDA2G7ip1EgE12hk1RePaldVLx/LftupAoyRYfbPI27gyRoVf2pfS8x1jot4OTUGYq0xocxCpGGWX8QVI7TNbC5L4It9DKF7g+6UL7mINFX97/VXXzsqbE/94Ka3CQZH+0HwiM2fhoSZoi4BFdGoFLALGTlYiqlcnqmFQPcxFLfLA7esClBdQ8CAWq/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4326008)(8676002)(8936002)(66556008)(66476007)(6916009)(66946007)(316002)(54906003)(26005)(6486002)(966005)(478600001)(38100700002)(36756003)(2616005)(6512007)(7416002)(86362001)(41300700001)(7366002)(6506007)(5660300002)(2906002)(7406005)(4744005)(52116002)(7276002)(7336002)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MlOk4Y/sddMQ2YpdYHdbIaOjKUW1atQ/ZAkXUtAY/udPsvSEzQ9wb6w4+9+8?=
 =?us-ascii?Q?16VIPm0Om7pDBamGT853Es+d7hy+wxbWlMU3kcNkuP+DAn0EImtAbpOdXjcH?=
 =?us-ascii?Q?OjXCfnjqy5XlsYTOjQEMv5XFJn9QIp1Pof3/uFQLv2x7jYHi4oSaOemQFXhb?=
 =?us-ascii?Q?QdMDNwsfMx1uWMN5IgmHYyg8iDRKxneb12fssDp24dSBDw6/mrIho9I5bIAl?=
 =?us-ascii?Q?MORU8FW+DfNXTE9i0/IlhKcaqA5oon5WpH7p5xDQu85KFCiMSxGq7X7Ww+od?=
 =?us-ascii?Q?aRmfHONS7Gpo6UMMwiCKwAEvBQC8PBCv4Nr4aGSrWXV7a0/dHJacqnbaVEBS?=
 =?us-ascii?Q?0elyliUF00erR1BQVIUZgVTgOeI1v4lPoEijOujFlFnt+Rbhl6E/KiauXLEk?=
 =?us-ascii?Q?qmly06ccIQcVZle6EcA6BMFsfV0viDT5YoVwHzBIWFysAdyN+4CCKPoERS8N?=
 =?us-ascii?Q?rsuvx3BG5ycwVXeUD1yowGjjO1NF7NmX4eTxsFnOdIi70LUs3edxFTQeOQHN?=
 =?us-ascii?Q?spBmqxPzXCokgy/uata4WktGY/6qXMBAdwr/EEjSmxmzKo2fRJ7pevzp9pLN?=
 =?us-ascii?Q?mLarsYujvZk+avqcbI71Mk1wKScfmz8qqaxAf4RoTYzyxlGFBpjbKg0FgFcN?=
 =?us-ascii?Q?lC6G6jPiZ57QNlEAk/KB9mGLZzKP6l5HfSxdxkKsMIeC7MAKMJexruFRJjdG?=
 =?us-ascii?Q?M1GHAqylyyfhxUwwKJ1BDhKz1oGFa4Rva5HK4peUcaccoGMckcQdFnUT1x/l?=
 =?us-ascii?Q?8WpUxweIkdcq02wmX2hL+cg3vzaXD8JXpPLLvsu5JT2OF7cCKryqlN2VycBZ?=
 =?us-ascii?Q?SgJW+QPjAIh/BPSYOtSC3yg3JoIZ8y03HyA9WVzQWw6NKiegYI4Uu3PixzGX?=
 =?us-ascii?Q?a+gCVAIGpdvmV8WzvmLBbM7Thdv2LIB0wH29R0YK5xBHMzRRs9wN6KbU143T?=
 =?us-ascii?Q?HUP66jrA2i/QuGvSgE4d7MNzoBoHpuyLOJhjbgHtAx8SrA3AfQ2VGEMcAGOq?=
 =?us-ascii?Q?ACWB8BaIYcTHB5OO27tai+9ezbVvbwhRHaChfAxOAZo/2kWhEfV2NEyXWN7w?=
 =?us-ascii?Q?Xmg4ynr68iMGMdenbsM0zhry1BKsuki/t/1Izw/6ouFnuQnXamyBYOnC7I27?=
 =?us-ascii?Q?y0/3H7oIHr4wRkagezECt6IJ2LdJsyGwOaNFwHBOx/ZHNALAFL5tzOXeYkGy?=
 =?us-ascii?Q?GwjwF6OX0MFJYMg0Gy7HYZ1G+0HlU+yKmILIL3GtQTv+oiRaxoW6y+ZcjFir?=
 =?us-ascii?Q?02ALWGgznThFG7IAiUL07L1WbFcx5aPxONUMp72pagrPaO0/cacLHDOX8jV3?=
 =?us-ascii?Q?WGq8wtnSTrFg0+M8d3kOk8UPnudW+XkPwV0DsZ5O4ht8vpoP/u1lafOEhfBm?=
 =?us-ascii?Q?VlNFEqUYYr9mQskQ0NQqDIqg9p9W120bGkdjJZe7nGBJDedVlvVOkNbvkveQ?=
 =?us-ascii?Q?jnZQxVAoLRulrLUIqByzrlICGxao6qG+p5RwFC0JGaFafuJWcHgrIE+p96Oa?=
 =?us-ascii?Q?kanv3Oy9e3D/KBKbY8hcDQnKO65cXuMzb+KRWJ2VwvprFSskYwcKt+82BugF?=
 =?us-ascii?Q?ubjnn/VZZAg4DiHXRXltfRS/FEFvAXXbeSN5TtI164qE8fEO3+7bZELmwmF8?=
 =?us-ascii?Q?YueRChZ6xIjhwbKZh1GH/J4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9702a3-24e7-4d54-2b1f-08dc25db4164
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 23:44:40.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kjz26qbchml8CHh6clYPS1ycK8vwv3eyyJSmF5HgNCf49rF5esw/Tuz24MY6Wj87Zxz+cVpyjTQcx1XymcJbKt0T46SF360Kx0R1bL8HAvASpMJALlHoRaCE/xNEUW6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10656
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

> This is assuming there's just 1 port and 1 endpoint, but let's be 
> specific as the bindings are (first endpoint on port 0):
> 
> of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
> 
> Note we could ask for endpoint 0 here, but the bindings generally allow 
> for more than 1.
> 
> I imagine most of the other cases here are the same.

I will do it on new patch-set

> > -	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
> > +	for_each_device_endpoint_of_node(state->dev->of_node, ep_np) {
> 
> I would skip the rename.

It is needed to avoid confuse, because new function will add
another endpoint loop.

see
https://lore.kernel.org/r/20240131100701.754a95ee@booty


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
