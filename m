Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32969843562
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 06:07:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC76BC6DD6D;
	Wed, 31 Jan 2024 05:07:21 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9715C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 05:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8BR6oM69lMcvMVNkiJqPoUcmhFiPDhQiL6GzBSvNPuXLFHhTLO9ZJ2RWoG7Z3L+xqm5MpjJO1fFl1TrGEA4yyISROGZ8M/KFg5R6aeLcomKtQ6kFQxKg0k0rI8Rr5uf9anOiqFRQAWdBCMOJiD3vUqd+qgSbOaWZwZ+J2U/OAKnlloi5FCe9gOZ7P8QK+D1adcrpmZ7cuSpQLFWIodd4kJeVnDkv5fMUxG9km882Nsamr9ZWfcadRV9xb5h8mP2x9rjaF6TdpJVZdep+yBtIItFjDBzq7LdTJnMBSAokm/9ebGA5o1Y4/ADB+SZ+1Avcgp5ReOYoQGStbLFfu9Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YkguD6Nb2YTrJ9YueK6LgjU1+wzkQfx+I18V/tA3I4=;
 b=J9wHHPExE6/QsqAtkPbZQQYX+ne/6tQaTlMcfHdDUnIyro7CpYI/zkW14WXiCi0IB7VAX8ARO/v0Jn7L9KlsQKPZQ+VTdvo5WO3sPFTV5m412k45bfAlkCNtxqcLmGZ9wIh4241q3pdqcYjcSft0Ve9DlyefZZOOck6aCH6PgX/XMGR2TaQysZOntHUR9maQm7z4XgeAe0k0upKzzdGY5RQP2DVBpskAl9awUng0c0yJRairlLDsYs1tUCYLX1FaxEat5Vi0j+PtBi5g4ykT6HizzzAxy4nBjlkyD/OqpQajuOLrvzKkhvYe9pylv8lnv5yemqpXhf2HRfTxhIOQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YkguD6Nb2YTrJ9YueK6LgjU1+wzkQfx+I18V/tA3I4=;
 b=On9zmb1ruVk/D9LWJHmxrYJbOf70dysVlUyQHY+diTqV+M0X4zo/UY4mcOLJmYxoRUZxQNy94HckP6PuBb8NREp4+GI3pNz3ggwEYoITtf0VQsQQGfWyKBRM008y+JITyavBGe6St/iQPL3ONm+Qi35hjXuTttD/dOUmHgUajcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:15 +0000
Message-ID: <87wmrq5bwd.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Wed, 31 Jan 2024 05:07:14 +0000
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 847c950d-96b9-4b84-9aa6-08dc221a7d90
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RH+bMvsy0O18grUiYZpJXvirihPF5CM2booA0BIV9vdBZaVvbxmFXsTEKq3QFMZ/7Xg+XifW/t7d3Du7uZY2KC8nfsedNom26J1dRJUNLTNp/WoievKL7GH/JP8YH9paLuYKBSAua9ttA6uxpM0Nau0oYNCv68hp4VnrWLXqf5/t9ybXX0HGHienDSQEC/LqIVDUG9jlgpwYe5P3GzYsI43aUu8shETM3YxRm+Xi0+fUbtNoGk40bWQm7U8HsMoAtw5LL4DzhBq5vz8NlJkc5hEy9xIVdckA+rCS0W6pSkiiPmzA4IcL7ewgR79tvcIaFLrWOvRUmSVXbnLhmh1OHONhzwug1VxVRwdYyFI90Ftujs0ye+XVB0GTjqdOnHF8j3lwU4k3Qd1xzyFWtXsW8cE7P89/dkelXcbs6LFzbWa2wJJmwpZxHvUd9tphbPegJurGxgTb1romVZpXyniSEKH/v2VHb31j9CnznHsbCcX9S9zqpQwi9bMsrczSS9K0/udaZ7s5YW7AFYzzkkAuaOZeOo4nxv8lBifyelUx7V0PB9CF0xw36CytED09v6MRMCQ5Je7Lr/QH7TzCz6nPdYGnskup5N004WhNDcj2znI65LWzaqSvcZNEeyf15yClDxJgUvnk8SQMoxI2vOKxL4+LcMkbuDAZJbr8OeibYpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(4744005)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(2013699003)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyuNmP1MqPVEw3n/LiGwBpfuFOqFnkDJPJ4GFfSfViK1+SdDJKoLVInIohvy?=
 =?us-ascii?Q?YMi6GQPCCsS5Fagq52gSWIXf34sWkupLjQuY+MxapeZME5ya32bLIi0SVVuH?=
 =?us-ascii?Q?4u7c/rZ9sZxv52ahlr1IHjq8fmT+0leLi6sH3tlklpflkGOepPPkXDkaIn7b?=
 =?us-ascii?Q?cu75kREsI+2dUX99RHNyz9/MmGH/zSUkehxBlilWiY9oNKElYr/w4Oa3JKmE?=
 =?us-ascii?Q?/maqWOTr1g05A5Azq6GaOj5D+UtGo2gfzeniXHcJq4AVmK7spJkfxlI+pDJg?=
 =?us-ascii?Q?ER5I0beDLbs1SzKVypIPkBUMSU5uC6JOJNDJNBs4sDtDvZZARMovEuhCL8BI?=
 =?us-ascii?Q?E+AFV6jvaDr8xWIkVXWEbJtbQEngQojl7Ij2wPmkCZuWWiilpg4sk7OIgSaa?=
 =?us-ascii?Q?r9cp0TL2/EJJ8K6XmjXox5mDPQz4L9IgD+iKsBhvlGakJwwzridBoXORBjLx?=
 =?us-ascii?Q?Qz285k9mDWXA5xVFL7UMnmXgODv2yaO3TizlSx5KGXqr5KKqBkIDkGpLZJCe?=
 =?us-ascii?Q?wTjYA+MIULvi/X+975uIGpBUIH4oPtMgghElG+UowownAVRbzZCQnYvrhx6k?=
 =?us-ascii?Q?N1MJ9DcDrjEYSh78GwpVCFzfg/URJoosxgrU7pwc9wMim7IO/0g8zQ9XrVPV?=
 =?us-ascii?Q?vi1SSW5nxtbnDdB+8OAumWwO30cX6/3qHFgyPlsufNgX1U1QMb+EaG6Y8X/M?=
 =?us-ascii?Q?WPvhNcNaz0KGoqtAAndDHw9JfGJrF2IO8pTVMlygDd8ZVY29KqJXxpQsHv65?=
 =?us-ascii?Q?3Qmx/PdXFrVBmBCSyemPpqwWRnXvYX47lcwKM0Ldevec+Q5jeAX1xdltv5Zn?=
 =?us-ascii?Q?yMdk55Vt7mc8+fvC6bD4sQo/dqHpgMyBFh3p00xZjJKDuADEgWjtkw+lwJiJ?=
 =?us-ascii?Q?BnlcFY0yomoq7Ps2arq389JHWiyX0T2zpdJEh7XjTYvz3Ea0tdfBL7+rHP2/?=
 =?us-ascii?Q?RLKSZnTw2YpSfj/7erF6zGhyebklB+CAu6HbLRxHXVfHxWvVfWn1raGIGSeU?=
 =?us-ascii?Q?T13pENoRdGbl/YKKC6XRuaX1bCmPE/h9aVLLU8EphfUbHlhncCWRPeiVpWDj?=
 =?us-ascii?Q?0qf+6aS4ke3DBdxH1JGQvTt8t2x2KdbqiLdsRioiXgGA4fCkQwZecANu8JeO?=
 =?us-ascii?Q?+QeLAaGxBWR2S9Epvr4WBD1xgR0sVpIPucKUc2sQj40SB02AMGQ6Wt3Rg7nl?=
 =?us-ascii?Q?3CfxAjogTs1x/V0yQMpVUEe2+mQ7PX3V/T2XIdKZSerFw2nPqEuplTvMV3Ti?=
 =?us-ascii?Q?525AQ87yHN78FJ7qR2Hy6+M+8cbKaOVzfPY/U8xms5RFVCl8spxOj5x3PnT/?=
 =?us-ascii?Q?KpSP7h84h+k4ob2Fq/9KqJSiOvn6GpYzPHZz7dVfeEGrIm6thb/HP6x3KHx/?=
 =?us-ascii?Q?fRHNwx3v1WYgDPFj+jMKUDvghXPPEIZo6oYKC7yxNFJPh8hgGqVvHK4AOQn0?=
 =?us-ascii?Q?/0hQyvI5o8bbaG2+gNvrNGPlsgRQbNR0Sc0xpnR7JCCR/0NUbOF+lvduzm2z?=
 =?us-ascii?Q?pJvIEqhiVMMzdFF34cmFVMUsJANTJPypDPsVa2JVCcZ2+9zOzIDf4QiK/fak?=
 =?us-ascii?Q?y3sR2vFVtI1DfVkgKTMc8vcSrHY0nfb79rxubeCpLVvMUhHtrLaGKOSPAvx6?=
 =?us-ascii?Q?yLOV4iyD2AsA/f8UyB61P1M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847c950d-96b9-4b84-9aa6-08dc221a7d90
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:15.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53qk35+Og93BEjB0yIY2chG7AjYvuqUW5g6hf2ONOYU02jrHspTw0oTQNwZOIh3Kw8CIBCCSOjCYYvycyVh2zDM4RJB5VCT0Bc8zB6eQb13O40vI5cU/0K7566SeqKPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898
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
Subject: [Linux-stm32] [PATCH v3 19/24] ASoC: audio-graph-card2: use
	of_graph_get_next_endpoint()
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

We can now use of_graph_get_next_endpoint(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b2bd5b70a712..70f34e920423 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -555,7 +555,7 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		if (*nm_idx > nm_max)
 			break;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
+		mcpu_ep_n = of_graph_get_next_endpoint(mcpu_port, mcpu_ep_n);
 		if (!mcpu_ep_n) {
 			ret = 0;
 			break;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
