Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F586F987
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 06:16:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D52BBC6DD6B;
	Mon,  4 Mar 2024 05:16:47 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2080.outbound.protection.outlook.com [40.107.113.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CD6FC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 05:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgnnemBLyd0JX93vUseHxxw6EW1dLdMgV9/ysf8LJcYw3hkuDtvSWQImOOJpQTLkg+7vjUYw5NmMBSAEm/fIUzkGCqv/blR98ZNuywXdJzePTzoWFGsDc3Frz0xvHkUCC0nlYYMFcH2jHUfAVO0XEtKhsT1YQix/RawfT/Ud/CnP+nOt0Pys3SETefWSmy4TmG/EWpEuX92aepqsPCO5fJ87gVyj06aibbNtnCZ+dJUCAuYY4yZkWmksKZG7m97QQ9NBcUyBuLzlD4Aloph7qTVSY7qHSIzHmVlHUSTue/GoapfWPoi7IXV3y/djTgiHkiyKfQ4WXQuBDKHWLlK21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=Dhj7B7q0YAbds3an2/uDPVIWRomeNzWcEkwKbEIEkxTltkgK3fNKGriBHWJzgghRsTqv3lpOo9wCVigEUHWHphkbr36qVWX2k/Bqd2GEHYuw0yj80WhdU0Hw0pFPjsWC3QmA0ShDty/+L1zvUtfab6RYrwxYLGzF+pjAWg/ciDBnCaXSckdoGIFUDmtKDensuOptU+etd5kB0oO4Qg2vXFYEVz2FOybbCWDndbawQ9kURBlNRIqk3nkJTE578imPsNm7LrTKvFjpJyaFEnig6CVkvZ8WrBiUQVZ5usCxbaci6crPrVIkPY/cesYtkBs5VqiWE9ux6vQ2CF+4p71T4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=L3Yvvu5wrTS0eFs32MUsSh9J2UL/PKq/Uf/7AhIniPtnKajt33Cwhv9ZJJiYoldnLZH5sp62imxEjzKkSuDtMkA60JArxhpwOF/uSxvGZMDJYFUbTGjQafZ/dxKvBmulC01fdWAJXbcX4RUuCTC/+wrKW/vUhc0i73ZE7R2dwp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6616.jpnprd01.prod.outlook.com
 (2603:1096:604:fe::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:16:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 05:16:42 +0000
Message-ID: <87jzmih8zq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
References: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, "Lad Prabhakar"
 <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Eugen
 Hristev <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 4 Mar 2024 05:16:41 +0000
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6f1ffa-ad5a-4f71-8bc9-08dc3c0a470a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yeRBJMdvOV/MHZmmaEQlT3LNiGRRzxmZks+64Hk4BQZzfFb7ZqnxAtq2eMWxvdfANe/0irG2/6cOtkdIVyL3OnGlEUvGUERW9+djVx4ISARbGB4GgVVdQGEw1qHdMkBnB5E2T2Xx6mCaR7qNdacUeepu93pv1VAm5ofEU5ovr6lGQG87FmUjv9MAvh3bBU6CpG49BeUkgv3Wt+06GpTSS5ba3BngM0x8ZhISCoRN9tUh5aDm1y6c8dtPKqGDObZJYMhIA/7boFp3wJyXiS7EBRx1C7o7D/IbGBi+0LipCA4UTc3acJuoc4K0elglB5tul2XRQgGHfzQoRpBm/ds7G2anEzv3WQa3QtwLcuMwvP9Lw7vEAZRPwqJ5ZHolVtcRBi87qWc9HduYJ6d526j2X6U4SOHqJIMrqBV0nEjkzTA9kwBdXg/XlOlVO+eOKFrzQ20beDvm/CKgLkbROYmpQ4z+dgmYIppE1hU2LVB3Xddbur4TVb+y8YhuJE95CcaoZ6uiR4DVAkTj5GY4WAJSZbJOar0z0ztriP8Ce2squ5T7wqR7vL8G1/jXeNFqChPAoYs6oy2NX0GVdPTTOv06beKWJfYPXIBFLXNipeSA17B/+0vIMAF7hurHicmj+qPwrF0nJAog+OSK/PFFW0MQeXWT5krl/DcO/kUUcojPjGubr7U5w47WFv1GXhsnKai
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IvU4vwrGHc5Vd6eJhNTkPK5uRVJeeOKrarNLItYzXj4Jl+rRaBvykgX23mss?=
 =?us-ascii?Q?eZRp8MO5AlqRwR6F5Q6V1AsYZGxJx54tPOUZ5TC1up6L9ai6AlN8Gu8SV+ql?=
 =?us-ascii?Q?PS6goQTvv2s93eo55rhcC929k44dKsIDWUI9GYB5LeQTPOolByNvXlOcpzPJ?=
 =?us-ascii?Q?FhO9ZW6HHjjUt9wusa/Ts31uhKO8/+XW7DggVkObrconXsXkUiiBxOXtt6PQ?=
 =?us-ascii?Q?n5AdhIaRuwwC+tIB4LkggH58p+DGiELlCjlWzMVkfWGjBFFLPvDXEYmGgqB1?=
 =?us-ascii?Q?7Em9tj7wfVe0ekeCQmDkkUjMgmEYfm5+CczaaSZNav67dbIP5flqxIzzQmFy?=
 =?us-ascii?Q?yk6Tbb8g8Zt7BxO+w+dN8F01zSJYzdOSomefWWcKfOfwd/wsnOvZ885P8mNL?=
 =?us-ascii?Q?ARDSec7VjAVPSWzL7CbBhA2KvwVFZEHnO2USmOjVX+oQ2LjctOV0mvagUJts?=
 =?us-ascii?Q?sYVfWQHRke9nPFQr1k7TybvlE+0v35StSb0UMkXZmZCsOwCoL8tOObe1ynKU?=
 =?us-ascii?Q?Yjkt8B/Zl79e9Jk+q8KllUHMYGaWhgEPh50x+8Kj4MQ6wde6UeGisfIU0WNE?=
 =?us-ascii?Q?YawVTIVpOPZobWgHdycilHaklMQpHVhYsu3YpugZEycNnNpOk9I3UFAoXHc6?=
 =?us-ascii?Q?fTWz5H/PpMK2/67VLsR2WHumb4DqAXQ4Ru4vsnUy4hWU+zX+liIVfuQzc+k9?=
 =?us-ascii?Q?EV82cmElZntMH2ZOKX0UO2xvo4lVWxaxWIb7bQ3b5EgXkfM9FdwrmZMkqZmq?=
 =?us-ascii?Q?zdt0i3fuH3NjLpdq6PYsPfJd8UOdopR5zsb0lDZf7uFuIZJob80RuWqaFscW?=
 =?us-ascii?Q?Za0jSfpyx1KADHkfCMZkqzxiDNL1yZ55wueUI9q/QxgoAlocwARiDIegCcS6?=
 =?us-ascii?Q?frHKFyaWZgu9vqxtGn6dKKyp0stPO9E07aOvugG4aV1JfwDegysdkSNwUe3l?=
 =?us-ascii?Q?/myRIvaIPjTrRimuj2KtdnQ+VrQCX4nug13cK6jTyJbN13jBbUOhL+VH9oNt?=
 =?us-ascii?Q?BO3mBYlXkyzQ/eb5df6fCoqWC/YTUZHorAspES1Aot1Ct3xEXyg4cUnULgW6?=
 =?us-ascii?Q?0vWmsGqcNLHZ9Gpj2ZT/FBpXsHSNhGH79ID9wHhJ8k599fULlbFTtZH8tQ3Z?=
 =?us-ascii?Q?DoYETOpaZ/2O0398QmQBduH3bUkuFx2tISHpe/7QxNaUPfK04iF1pubFLY1q?=
 =?us-ascii?Q?WAGYtJP++YXsplQA1E4vPHP54N7i4H6NqEWll2pfI7nnxIuBQraOikEXORkJ?=
 =?us-ascii?Q?3+XpJAjvC0kQZnwPU3slqFkzbUUCoLhKwQY9rSEcR3pOvD8Dy/o58CIVoPfU?=
 =?us-ascii?Q?uAECAqxubiiKbNW7ihbwY3D1tWbCNt2rVdU3ENIYkOhZXsaRVoLhdc4WzKD2?=
 =?us-ascii?Q?8U26jt/irUYiv2zLMQFY36UZS2q3xytf4FlAfNR+tq6cugzKaYKac8uzprSK?=
 =?us-ascii?Q?84ogN9XrDEQ4yETNkn7ZUWVPRQsAE9rm4dnWijflSmEZ+MnAcevjFgebmjny?=
 =?us-ascii?Q?V+WPhHZ/7lmO63ekUgKdZDSS9yLrpNkYCU3y+LJ9VQO8fcFq/g8fgOBq24d2?=
 =?us-ascii?Q?p5HjQkcW/HA2Hk+i1UvaQFjjSQcR0WMeftsOqa4mnHJBgrZ2sPW4XE47EICB?=
 =?us-ascii?Q?vZOJRTMiY6xPKSpQSE6Cz9c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6f1ffa-ad5a-4f71-8bc9-08dc3c0a470a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:16:42.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/YeQt0iLyiGlUAXtyF6YJdBdL5yWM9uUuvNWZmTSo4Mlb9TgZyVNHrestba5hrgBguSA/HeosSnh/ItW9VTfYM6V4ncZ9ha+jGJ9PDBrP025UNEAPr5eCttpVHjJq7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6616
Subject: [Linux-stm32] [PATCH v2 4/4] video: fbdev: replace
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 7 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..1f13bcf73da5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
 
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..14965a3fd05b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(const struct device_node *
 	return np;
 }
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port = omapdss_of_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep = omapdss_of_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..8f407ec134dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..4ad219f522b9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..0bd80d3b8f1b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2..2ef56fa28aff 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
 	u32 bus_width;
 	int ret, i;
 
-	np = of_graph_get_next_endpoint(dev->of_node, NULL);
+	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..a8c0c3eeeb5b 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -819,9 +819,6 @@ struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
