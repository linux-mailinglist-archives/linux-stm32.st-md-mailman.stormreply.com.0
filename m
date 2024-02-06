Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4084C104
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 00:46:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06BDBC6B463;
	Tue,  6 Feb 2024 23:46:04 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071.outbound.protection.outlook.com [40.107.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA8B7C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 23:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjrFxlwX0ttvaSYUOR7O2LYzg3bFwFX5BEMZDQguLvKFyHXg+9GKQb6K1foeB8QOgTr39WYUwksz6ekNGvRsZ21AgMxqF49kcOlj60fiEtPLviQzuDjy2nmHUqnjzyho0rFd0gXOqso3iX6FHDSKFghGjBfeBCtY5YbZKHrSbbpdZUlaMumcZf667BZNDSYx8RwCt7IZbXFkQGzeFtSXCO9ZNWkqBLgI2toQW2disHEBsLQuTulRc2UCaB1ZyRsy2l8H+X2l8JUyo7yxWnueiuFQnrIi/04cOK0d702zsCFPCDoxD23sxF5ilabixc1xaa6V5z/y3oQrn7C3efaG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXqga/h53ac0JohmIJJb8G551KDCXPwVCjkJw9FN+Ho=;
 b=CA7G6MEtBukRthiW4md3rIuj8s35QKl61ObBumVrCM0J8maBJkLMe4thf6o09WmvB5FvIHBqs4DEo8yDz/drrnci/Q/QPXrCo0KHT4qMqZGlDHkMH3RZ0C4QOLNZvZMDu5Wc5iwOlolu/DH4mqJjNzeFSs0Z1kF19psmEHZ7zCsvn0LUN6DM4ZBWUzlMLhh6OpLSXz07PLPB7MJKssVc2WIiE6RUPfQIgeDk4T1gqvKzQ0/V0fW4qw8mip/h1aK3uqzyOXVAd+hlbY+meNqAhviYbJybx1Gh0PLdmNdmszAwHbnN9TZa2g3nuwIA9o881efMlWtoK97sWL0UvRukww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXqga/h53ac0JohmIJJb8G551KDCXPwVCjkJw9FN+Ho=;
 b=HJE3IoqRigYXsNq+U0zorCMDT4GUMCsTJQubQKbeoO1aj3oFuT+NGV5TeRHg2gdn/+/MXA/tX/cIkGyTXhqJWdNayCRXXBXh79kvP7KApRt8dIw4F+u2pa2KJKmApvex1RGHie//UNM9CodWr6S6Q34RpUVJv6AviD+ILr1GFF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11485.jpnprd01.prod.outlook.com
 (2603:1096:604:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 23:45:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 23:45:58 +0000
Message-ID: <875xz1tave.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240206162506.GC2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87plxanvx1.wl-kuninori.morimoto.gx@renesas.com>
 <20240206162506.GC2827@pendragon.ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Tue, 6 Feb 2024 23:45:58 +0000
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11485:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0d0c34-337d-4f33-16de-08dc276dc4ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPHH0b5aqEj5ngRXKzRy/BQlocy8PDMBb84sI4GE8Oa0+J8w0lom3gv3hyH7Tg/eu6pFxCTsCTn9a2Rp2mR7KhhdfFwhmga9jOqvqqSzWDQxMRwUOlfbwOQtd2BSowXRYnW7wpsDsxZu0txZkdocFuuSNZ2OnDraBhYqk0Rjv6qFu8UM6DG+2+rLtRQMW6I0AV1Ib3qG4fijp34fGA9um4xFKffwbAqOYZeUlsK6EaUa7Grv+sL9YvNhNEQQCaOrHJDO4MFGZ0wXZAIhLj6GxtYGbRMNU4zONBUKch2VtZ+50FE8X17VBlf6Llq64pjNRJ2qUXN1Xq72jcbHOj6Ejj0oaz7AAuuHs+yvqzNYJwBPaNl9h3TawG37KpvKPCbdsEggGXG2Sex26jUQJSc3yO/QB2Tho36InnQ8xP4QZLQ9wpzvya/zYaUeOi/418FPfT6xdW25ccc/s5+kPc3M+7BpZnxh89OjGTVCMI0OZl/jd1/eq00YxqWIzOgXv8JEs2TQgdHw28OF5NHko1VASJHhTAmEDBWD95NpJHDKPAdwJwqmOb6261JR7cRMAtL3b+CiNLxCBXEiHqSqzeo5dLa4GGeenPgMbVWPeR81QWTRCqiiu7UtiuWiUSrMDyNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(52116002)(316002)(26005)(86362001)(2616005)(41300700001)(6506007)(4326008)(8676002)(6512007)(8936002)(36756003)(2906002)(478600001)(7406005)(7416002)(66946007)(5660300002)(6486002)(4744005)(54906003)(66556008)(6916009)(66476007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKrDCfLGITzda9tkv2RMeuDsk9+xQWhlHRrgybOlaE9B4k4wOlJPBjGM/Hlh?=
 =?us-ascii?Q?mmMArzmBiR1PSqUNCqhpyJ0h59R9OjmrDDNKNurDDk9FgP9vr9dStSzwYn46?=
 =?us-ascii?Q?QKkCB34ITCXJs0hCwQWXtql3AR5mwHbEgcfcKSkD/6GyoayyYFymkMTkHREA?=
 =?us-ascii?Q?l445JpI62s6lLXIxzX7lJvwfopxppeDA4o3bpnPUmD74CCQGSGPgHWPHswHf?=
 =?us-ascii?Q?Bq3V3B0+IncXCzbo/Tc/xQuIiJKzFvRojrS8qVH0BFTIffG4kO5uvX3CKUhP?=
 =?us-ascii?Q?HtjbG8vvgSsrMf6o9zmIyUcG5V3Z1uWdYuhOyoXfjWHWGBeUP8Vky2e4PcmB?=
 =?us-ascii?Q?lSiv5B3h7GfM4Zuju7awRPNIEjkdPqfdJraCyCwzrDYlaVEkc7Cxn6SLhO1r?=
 =?us-ascii?Q?dO0nYCfx75e+8arCYi0PUlqqRwLqayVxklxbhDkx9fCytmLtST94S3eCvKV9?=
 =?us-ascii?Q?QI67vXz2ts9my6wlN3j5jqCJ83oWSJ41689/m4TDDqJI9NQSe95A3dEfFPf8?=
 =?us-ascii?Q?JCrT/+arg3LeN6fldahlCllgQi4zKBoLmG5CB1yvoQyuw8OSyWzazEvKsr2l?=
 =?us-ascii?Q?HsicAvltPjyJ9fNWB6S8hsb1BUSOqdVSbgD2Q+1BmIYZFo7Tgwnxv853u6Qz?=
 =?us-ascii?Q?/liFHrVv9AX0fOJaASURs2VlkAYGqnBTd9kdLSh6tRZs6bs4yUw8tz4P2Yre?=
 =?us-ascii?Q?BKYuxQu95iO8TvlvaRP4MS8f3lq5ncryLOhopLPskzBQ+NDb1pus2gQ10Hj3?=
 =?us-ascii?Q?TdadQR9/JYYdcXnr6zIAUffbb+3C10iiNr05JeCfuDzUlf4MKcfVN+Wfll7V?=
 =?us-ascii?Q?qD1fLYP7/MalytsNSSLGH7bfBmqJqSkJxWQjW+fR1GnvEqyGFHJnn/vCmbOz?=
 =?us-ascii?Q?M5iVY2Dlqpouf1t+ESa+PJxwosNyQI+gL0UnS06qf+KscgzIqk0+iiwUfpOS?=
 =?us-ascii?Q?l2IzTd5SrnYGJvL61mFq498kS6auqVcqxWtDokArZ+L9O49+rBkdb7JBBAsg?=
 =?us-ascii?Q?Sg6QyWqtXQhiwCXqdq6Abkx6yJkrc+iMLcA24MzNsJ8uMCjqjUJNpHzFup8j?=
 =?us-ascii?Q?NIOcuM0QdrdiP/2JvGTL6CJcLdCv3xmcmDjkjAt6IllKeN+MjlLAbiUxGQBW?=
 =?us-ascii?Q?sFaKQa1zpIf86ui28De4cmOUTmedSgmByJk5zz3ttM8sAp5sq322J/zU8Iog?=
 =?us-ascii?Q?qSvZkLeRR88VXw/VzAcZ2p3XzRgNbIOSI5tfiJQTYcX16NnoVDZhBg51sEfe?=
 =?us-ascii?Q?osgdXuwXMtHU4VYgLDQEToX8Zgor6jJaZMUHtGZx7PFQvHRzdPi/70b6K7xs?=
 =?us-ascii?Q?wE+CTULqEmDj62qzRB29RE9hNB8/j4sdozkTqUhrPp1CZZFsDPWRvrNiOvrS?=
 =?us-ascii?Q?S9ZLvEVH5pDESnwVbOzOVgTIob3fGvT4Di6+8XsPrOWqXtA/EqWb7U/rjmQt?=
 =?us-ascii?Q?Er8vCqNStq+z8AtRBuZAMT7Y1YSHe5u3KqjATfZLDt+MsvFFdJdwu7GgPHaJ?=
 =?us-ascii?Q?O7+3BXJiEJwR/B+NiMo6Yb2iEmSu8ru1UR3R6xi9ltWxOuItuRkkAdOaKqkf?=
 =?us-ascii?Q?/bb+/RkFdS9jWF0So+WV/h1Q9F6x8tMT15mXhQqnupcGLYqeVjIiSqVfIrm6?=
 =?us-ascii?Q?M7J7b8FiMK/qDCGRfrD7qCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0d0c34-337d-4f33-16de-08dc276dc4ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 23:45:58.5705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQKXJ2gcrlsY5BNQNAEXuhJ2GwIQo5el2kFv4yTsXUFbD/RvegMG/Ajv/Cy40JRSL9tj10cZ0GrdnUPoUkV5ZMkz1y9gj3ty+AE9MFkz2EvdNWj8BA+lbX56B5n6FdJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11485
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Helge Deller <deller@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 =?ISO-8859-1?Q?=22Uwe_?= =?ISO-8859-1?Q?Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] media: platform: replace
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


Hi Laurent

Thank you for your review

> > diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > index 686ca8753ba2..3f8bea2e3934 100644
> > --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > @@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
> >  				 &state->max_num_lanes))
> >  		return -EINVAL;
> >  
> > -	node = of_graph_get_next_endpoint(node, NULL);
> > +	node = of_graph_get_endpoint_by_regs(node, 0, -1);
> 
> This is not correct, see
> Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml.

Hmm... Then, It can be like this ?

	+ node = of_graph_get_endpoint_by_regs(node, -1, -1);




Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
