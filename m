Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45795AE698D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jun 2025 16:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09AD3C36B35;
	Tue, 24 Jun 2025 14:51:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5A1C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jun 2025 14:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaA8mevSOcaHvMUlcRGmJh8eJNjWHXS5u09Lc0p5IyTB1/jwRXIv9PbG7Rjx23wej8nP3k1azq885G3uVBHgdG6XQrrtLoNIbLd+oFBF0WHDDwJ9Dpa8ETmg/+KXySqTsOx9Y/xoOeEYWccNchjnkd08D0roOolvor8/ot5dEc8I2Ioz5YrzAgAwB6fgrgLa7m9T4yuIj20uHhEADQrka1gRqqpZFxqXpnNMl4ARa/UkO3UocRqXT58visMlNguGJxM1jb1fsGTefjorHNiB+g3mYU/m1ws41CZ5q/HHQZ1Ekh5mFzG2OwLuxPQdBMPTu3ZJT2HkWj/8M+/VmG16sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ3rlgY2oZPEX2xsII/7Vq+BhbgeO4x+HbsERcZiPj0=;
 b=V/ALYUqmUQiPTc927cIwbP4Y6X/xU9YoMIs/eWrWAtEfipNgx7d6SWBOxITnSEYH0QQMmrOFHklP4W0KFT30Bw8xnL9kmT8xnUkverUN7DO70ayTiC7iuL2w/pUirJrVOzzXmwA9Ngy7ssu0A2h6zYRPu9KRheoA8ZN52f1XtCtLUp44louOPw6h0SOhOaIimOMpE8uhW7en7KNVhzPGXf1YyTzy39iBsFsAzZS9Ctikyl0+LRa1OaMmKjoAC4pGqlKgTfUlPyi5i1HX497atTwlAJvkGZyNoG+qc4TEAs00oGmo+3OlRCEiBZjlSQB+kmzujSuS8NDlUrfseh40/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ3rlgY2oZPEX2xsII/7Vq+BhbgeO4x+HbsERcZiPj0=;
 b=Y3wqqpcr0KrnkkJcSF7r1udNTyyOOKxdU41Qk5wrzRzCIUxyDt+wRoNPzulROdwoUbYXwZIIyUFvVKOELPj45DRB6WEiVQgSBuxoUqn0BShlyluPj4PsBVKnKpbn8tVl6cQ8f/+w2qqaq+RGyPSM7AW5LopPin8iJcXeaWhhCM/PuiG57hQ32f5bC0V6AMZ4o9EeDdEZ0Kmh4NT4TQ7FLpLRmojwSh1NWTL9YiYA6k+cCnrUaI2ry/yspamDw1oN9xOIr3pCj4Bx+HG1dLjvq8xqhiwkbcPsGuxAW49vLdDOebCAyjqo8L2ZyHP9Gq3KJtpx6EtJwSvLegVmeGqNqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7622.eurprd04.prod.outlook.com (2603:10a6:20b:23f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 14:51:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 14:51:16 +0000
Date: Tue, 24 Jun 2025 10:51:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <aFq7WJ3Fqe9p0EhA@lizhi-Precision-Tower-5810>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
 <20250623095732.2139853-3-joy.zou@nxp.com>
 <urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26>
Content-Disposition: inline
In-Reply-To: <urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26>
X-ClientProxiedBy: PH3PEPF000040A2.namprd05.prod.outlook.com
 (2603:10b6:518:1::56) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a94dfb-0eb5-4192-b0ed-08ddb32e9260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fTYZAbS+sXRAoPQQGQoJo/KrxB/4t3sWh5IPG6m/8Z4GjuVgDRlMFoRC3mXn?=
 =?us-ascii?Q?XDVCZ36gz0Dt0lgxXPURLl4WwY1eTcU2A+LLYWojJU5MKOqMCrbo2qIcBcgs?=
 =?us-ascii?Q?wa952qpv1DCAAwbFyC30yjx1F/AidONLl/hRmGsol8fZC67sCX5KTPWkrKTB?=
 =?us-ascii?Q?i3T+ncT3+nNTP/M/Hu8GUI0c/5qWjRtZfdtEdkzspDVeDz7Bg81xR7JZ8zI7?=
 =?us-ascii?Q?8sFg7d75vs0GBqJIsUxXR3RKlN2g9TsJBKY9XDeaIoYdphsAYxcZS1Sx7slB?=
 =?us-ascii?Q?mRI/4mJ+j4ydvUbQsdjU0Sh+qS8+iInE6np3YIyKti/CbH1RXNbS3JLNAXzx?=
 =?us-ascii?Q?EP/L54U9NXNRJ8AHBSIoNb8N7C0tKQrBkKS6xz4tH7okuu/LLww517XACF1t?=
 =?us-ascii?Q?pLgfQrV+JXNZzPqDkT09oXbrmVe7BKOXVyVs+YyqkAIUgBABR9wCBWWyGwTY?=
 =?us-ascii?Q?lelbSSgp5zNdcBm3SxaixJwgw/yA0geskpH8hm5FsM7tYNPnu2gtW3Q+Sysj?=
 =?us-ascii?Q?IGGJtPzcJW1YDy6woRyquBi7h09n8WQAwuP98ARQFTxvRVsTLKX4JZf9VErd?=
 =?us-ascii?Q?+RMMRsKBXaXEncsGvofaeoiD3dogk01QSBo8upCtsnPP7FgqAIqzIk5xaVeT?=
 =?us-ascii?Q?Lck/0J/nqBaFHo06761T4Pq6X893IwmPQ53ZwQ++Avux4hdSzr9F0VgKn1Ya?=
 =?us-ascii?Q?pqmp7I4gCzyS0xwqf+H9hzjt2YiKwD2NVWyDch6x4/Dl4rKDLpK9oBvjXSvN?=
 =?us-ascii?Q?sVWboGVpM8vA5plW1LTdn4aQhBqic5I1Sjcnko9v1aQyg0T62d933CSvVCFq?=
 =?us-ascii?Q?uslrkEAM3S740jW3jdd4o4ADJhvCjsv0E1hCNod6lOcDZ54MhAyaneLQLvRR?=
 =?us-ascii?Q?VQdwtDJO5O5qhODlyDTCNMKnzYzwbGNHF4C1r+fjPsAI9vyLHIHAaYuEQH0g?=
 =?us-ascii?Q?oV0VCwamOFCLDmqRf4FNJ6x2s4LPOIsMid4LQvxhh04hFkKdkcHqGns5dmoL?=
 =?us-ascii?Q?/FqihMb9sN1aDem6duOGYFXCZ9UCAsQmgRA3dDPOSao/Fzq+//kZsEmQITjC?=
 =?us-ascii?Q?D1aHsEUkgg6JbyQVbfVMXrp/dfKBJxtbP91H7SB2gLyMsu8zczm2oTnG6JKN?=
 =?us-ascii?Q?MC8DpFWnSbp1gzHMFeFuH1wx15N+Hv2WaZKvGVZpJczce2AEVtdXXAeqUlQ1?=
 =?us-ascii?Q?9bEtOD4jIoliiQXB/pxMCIlNJ8MlkBmmlYyby/bErNbKdmutw2PZ7QDT23ey?=
 =?us-ascii?Q?jSBb6e35Dn1RIGZbU31J921gpIlrFfIpz9YvPewVMf304r5M/VJHEbtZ0ICc?=
 =?us-ascii?Q?fvF0WgmN9wEd+QipXB/X3nChrQxde7bbQI5oHKgcTaUIJZ6e/xk/zXgl5grR?=
 =?us-ascii?Q?oSiVVj7zska8ejhhzgN5CdaxyunIG+4H9bd7O46sN5WOIFnBM0wsyTApGUR+?=
 =?us-ascii?Q?DWsHzqKE5yDEFR5byVF0484jTqlS6lDXAR9few4e4VqExOUiX6wYWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xiRIFGdtshBHjnSvnrohbuusfucGm/pCj8Ru952Sb6mtzaXR6b/FJEiAGPuQ?=
 =?us-ascii?Q?VVszrAE4kQRWkKBJEJZczq0o/NXkuV2H0fwi/axjAIsnNa27BVVFn6qe9UWF?=
 =?us-ascii?Q?ZAlchvfNxIRRVSqAqe2SZAj/B5VJ41//7P1Yn2mRQLs2Y9sVfImZY7Ah0bV1?=
 =?us-ascii?Q?N2mr0KnhnwX3dEdLl67sc2T5OH+6K+CLzBS5k/NpOeEf71l4UjryqBfAocWw?=
 =?us-ascii?Q?yj/sH4vXRp3BPpPimQWcGfa78Nm7GQU/CTnCoZpU4s/CV4/DnSsTKY5Rw2sH?=
 =?us-ascii?Q?Pj4/3wnq5nik+n3IlF7KmaCm6TVjtE67heIRND4raQWJJVETnnID3x5uEVhY?=
 =?us-ascii?Q?8phZasAmry/LNgux80Bodjb+HZADY03b/DSxJBA/IuICGtkstXNgVTtonEgV?=
 =?us-ascii?Q?RLyE8MQOMgup4f8iyb0k1ezOTWVYCKqfKI6H5cjNuyJfg3Fri0jJWceU6Los?=
 =?us-ascii?Q?h+wX+4CbmIs2SCvp+ADDZ4Pt+oiDwh/2pVfSnSwg5B7L1F+ekGcWT8Gni7o3?=
 =?us-ascii?Q?xaqasJZTPsJFSC8DyiiQy8U5DaruPd3IACvcuVBkMpJXZEhC/9A/feBmrgn4?=
 =?us-ascii?Q?5cv0c3FFdsCToSQWjgznN6o94f7NG2EDSIZ1ZcBakYG1ySwNLiwXmI5i267f?=
 =?us-ascii?Q?dXXkO+eIAj07xxHq3Lla+1Wqu58Om73kzNdWBIfEwh3CBV3/GDuMN9UWgikL?=
 =?us-ascii?Q?z+weDd0TMeQ2ly0UHr3USHLhEI2rHV5HO80G75VI2/Tur69QSzzokwRIUh3p?=
 =?us-ascii?Q?VmPcxR+WIvFeMIH8dVNAdI5RCQU0u05FDhXyeWm6f4d8bzCWoob7M/1Uqv8z?=
 =?us-ascii?Q?bWQMysr8KBePsu50ir4YEN8XJvaBlhRBPDQorihhwUUB/IJGLOrFzzbFSEoi?=
 =?us-ascii?Q?Cg9ImZ/dJ6xzH/X6DGGM+eBhHyh6YmBXbP7O2b65gtjild5+nHI3pFQFOnds?=
 =?us-ascii?Q?iAmatq3U/UkSPih0grxUL1QhCF8Fjxt2bXH/iPOeqKwgnKfTzVdyiboei04+?=
 =?us-ascii?Q?GZM+/KNmrr08zq8EJ4BdAnYHTEi9fqV5wqbtMBolcwl2yvSf4xQOtrLOJB4u?=
 =?us-ascii?Q?4/zZsHMQa3Zk6+soQiHto55ovWKy94oO8SRebqOQ7g5Qtl0vhD7a3QORfJes?=
 =?us-ascii?Q?iLmQtNEGbp+8pZwliapDktx/LpWcXhmd1cua7ZyC5eqTWUolDkq9R4LF+65h?=
 =?us-ascii?Q?uvttrocSllolhV5Y7uX+/kbELh7Ls+VSC/bnJTX3VqTcaI47cb1ZLu7e65lY?=
 =?us-ascii?Q?lyh/h9xqMMO56+5SICO58IS+IB4NzCUUkLUxh7AbFmLge6KzXkHYNebJyh6X?=
 =?us-ascii?Q?nP5D1DWLxVcq6qe8Y4DxORDZECDheb39RHTVRl8Uir02QPT/Mjq0H04Xevc8?=
 =?us-ascii?Q?pfLhW56/6rbXmR8zwZ7ivll821rbxJxQ17OZk/ThfG7fu9LgG9rf5XiEotiE?=
 =?us-ascii?Q?Y+I10LJ+JAH19L2gDQHfKeaBetX1gBeDrNYEUaiEqoAdKxLQ/b1KbsBVwIuT?=
 =?us-ascii?Q?Xsg07nfZRdqJLociM4mx/g9x0vrEf/eGuHHZig0Sau/MSqSdddiRGGxe/IUq?=
 =?us-ascii?Q?8oMGfYptQFv60k5J9ZIzxGsmkC6Nq6RIDZp9D2Dt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a94dfb-0eb5-4192-b0ed-08ddb32e9260
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:51:16.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTwpvXHZXKvbgnZOVVTJRLeEU2ZHiAK68ySMkBePBIFo/9dl0ICwQZSDnrVVl65LkKPOvShwKYskddm5+c+lsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7622
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, will@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 Joy Zou <joy.zou@nxp.com>, devicetree@vger.kernel.org, conor+dt@kernel.org,
 ye.li@nxp.com, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux-pm@vger.kernel.or
Subject: Re: [Linux-stm32] [PATCH v6 2/9] dt-bindings: soc: imx-blk-ctrl:
 add i.MX91 blk-ctrl compatible
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

On Tue, Jun 24, 2025 at 09:28:43AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jun 23, 2025 at 05:57:25PM +0800, Joy Zou wrote:
> > Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
> > which has different input clocks compared to i.MX93. Update the
> > clock-names list and handle it in the if-else branch accordingly.
> >
> > Keep the same restriction for the existed compatible strings.
> >
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > ---
> > Changes for v5:
> > 1. modify the imx93-blk-ctrl binding for imx91 support.
>
> This is just vague. Anything can be "modify". Why are you doing this?
> What are you doing here?
>
> > ---
> >  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 55 +++++++++++++++----
> >  1 file changed, 43 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index b3554e7f9e76..db5ee65f8eb8 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > @@ -18,7 +18,9 @@ description:
> >  properties:
> >    compatible:
> >      items:
> > -      - const: fsl,imx93-media-blk-ctrl
> > +      - enum:
> > +          - fsl,imx91-media-blk-ctrl
> > +          - fsl,imx93-media-blk-ctrl
> >        - const: syscon
> >
> >    reg:
> > @@ -31,21 +33,50 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > +    minItems: 8
> >      maxItems: 10
> >
> >    clock-names:
> > -    items:
> > -      - const: apb
> > -      - const: axi
> > -      - const: nic
> > -      - const: disp
> > -      - const: cam
> > -      - const: pxp
> > -      - const: lcdif
> > -      - const: isi
> > -      - const: csi
> > -      - const: dsi
> > +    minItems: 8
> > +    maxItems: 10
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx93-media-blk-ctrl
> > +    then:
> > +      properties:
>
> Missing constraints for clocks
>
> > +        clock-names:
> > +          items:
> > +            - const: apb
> > +            - const: axi
> > +            - const: nic
> > +            - const: disp
> > +            - const: cam
> > +            - const: pxp
> > +            - const: lcdif
> > +            - const: isi
> > +            - const: csi
> > +            - const: dsi
>
> Keep list in comon part.
>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx91-media-blk-ctrl
>
> This should be before if: for imx93. 91 < 93
>
> > +    then:
> > +      properties:
>
> Why imx91 now has 10 clocks?
>
> v6 and this has basic issues. The quality of NXP patches decreases :/
>
> > +        clock-names:
> > +          items:
> > +            - const: apb
> > +            - const: axi
> > +            - const: nic
> > +            - const: disp
> > +            - const: cam
> > +            - const: lcdif
> > +            - const: isi
> > +            - const: csi
>
> No, look at other bindings how they share clock lists.

Sorry, this method is what I suggested. becuase there are pxp between cam
and lcdif, can't use simple minItems/maxItems to limit list.

If put two lists at top, clock-names list have to dupliate at both top and
if-else branch.

If there are better solution, please point me which file have good method
to share two totally difference list.

Frank


>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
