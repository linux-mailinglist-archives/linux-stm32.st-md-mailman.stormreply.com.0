Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42C58D9E6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Aug 2022 15:51:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1E15C5EC56;
	Tue,  9 Aug 2022 13:51:01 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A44C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 13:51:00 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2045.outbound.protection.outlook.com [104.47.22.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-1c9PDSh-NUG1R0aouwnaPg-2; Tue, 09 Aug 2022 15:50:57 +0200
X-MC-Unique: 1c9PDSh-NUG1R0aouwnaPg-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0543.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:42::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Tue, 9 Aug 2022 13:50:56 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 13:50:56 +0000
Date: Tue, 9 Aug 2022 15:50:55 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20220809135055.GC44926@francesco-nb.int.toradex.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-6-francesco.dolcini@toradex.com>
In-Reply-To: <20220712163345.445811-6-francesco.dolcini@toradex.com>
X-ClientProxiedBy: MR1P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::10) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33be9af6-2b3e-4095-8ba6-08da7a0e2ed4
X-MS-TrafficTypeDiagnostic: GV0P278MB0543:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ff3TU9jL00kxch75++t6wC3AZj1gMcxxzAgqjqOKtwCE/ArYV5w5OOpuvhG3i9xDL+5j+jZ6CMmte2BPHJjhONPk195xH1grfl9fwa+ZguldMLa7g5TghjMhnpNliO/rMANSuWxG/xDsHybexDK8dR7IzRnlviqY6I1AJljDZN5QY+bQlzhwWauH6ZIFrHPyZRMeOgaWi9w1u6LTjo45ssL4QGqf1Q7a7RZuFXSHq8aX0H8p8nMIC2va5CFRpuv3E0pYwjo0ozjhpdcglPeqBvEaka3AScd3+RaGKXsFCH9gBNf6sfip708Fxwmn9K59YG8HAx1tk7qcIgyibxZEq3ue5SRbpczQG4RcbaK64Cqq7Z9CBS7jTDLC6ziJ21CE4YYkOOxQIgTjjwEnsp5l9eflEL4pTG9SvETb/24QF2ksgK2NlgvCbazK3aluT4C5Wk5X1mQOrsY0MRnflMcPUDm/kFWSRP9Ak82bu0C6FwyrSv9PrthH8MiGubhMitRh9SY4uFLzH4xFICMuDxa6cKiAztQtiMRMJlWtvn5iUNsD/hlIswAfd3kiNd0oWSy6rWCVZBAjoeBeoSqXHqtkVGj4W62ipYd0zWHcd9hFnLT1rjoJ8Ozdqd1JEXvVzjxWi+Pbk31LsioTJMzJxdvxKTaBrOiDMxtHGS4V5Bjt4cH6qLiUw71VzqhhS1SQjhw2G2saUdvFBuHy82q0Yo0zkw69pC7G/dUnBfXLG0geKjjVSfAM5PKXNhpM7Q8ImkEN+fc0Myq6iW61CnFsj02Mg5ZTOMjNv/pZ6WNteHRfbZcG8rfIeAmlT1nMdUKaxNBy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39840400004)(376002)(346002)(136003)(66556008)(8936002)(4326008)(66476007)(6486002)(1076003)(478600001)(33656002)(186003)(316002)(6916009)(7416002)(5660300002)(8676002)(86362001)(54906003)(66946007)(52116002)(83380400001)(44832011)(6506007)(6512007)(26005)(2906002)(107886003)(38350700002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L8GiGN986DYbWOsV9xJQ7q/+/KeHS4sltCFTEJCsyFvtcUe1vCjI4MUySZnS?=
 =?us-ascii?Q?bBYDfm+2HdscH7gXke/+Nv3d1f+mxNzCD+spp6OOizEb16fA7ZBmsg56III2?=
 =?us-ascii?Q?3zUo/QSfCTRIUFmiS3GkqGH4/nPIJ9QjGehbY2HEXdO4U/8E7o48gIxaNd25?=
 =?us-ascii?Q?6xjJByGk+eI/91o3FHugs8L0Q6PTaNx0HfxLa/CcZoR88ODN7mnxVNh9AsrY?=
 =?us-ascii?Q?J/twq9HdcpYDX+anWLlbNhxb1Y0lekkmgFvPfPYtXF9SiYhq2shjRh6ANwjr?=
 =?us-ascii?Q?N2pn2w2JAiVXkHW1yYhXDD13vy0jlBN2TCxl6ciNj+1W7X1Fw62CQ20knYlt?=
 =?us-ascii?Q?SRRBQ7+htEC/yvhXts9SYiQ4wkcWLxACBwq1psR4qJY51S/Bmfwr8/7O4NC/?=
 =?us-ascii?Q?Dl6umDbxm7c0B4TzyFVeBLWZI5imL2l7XOIfOy+wA5cDJOLNjLhtoKe0hoJR?=
 =?us-ascii?Q?4UEd5aujYDjXS3uNQBk/XFZ5ImIseGr/L30Z4e89e13fQxjJ0VkMkp+qcXR7?=
 =?us-ascii?Q?8ZFtgD3Z5EayqttoZIlw6cmUYjCZ1cfT2bR36JnLmDx2AwVmq65HczcG+K0V?=
 =?us-ascii?Q?+L+UWkvtkOD23p/rKjFbbGgBkhnAGKZDnB6rr/O/W7ZyzngBHk0xKC7YoCO8?=
 =?us-ascii?Q?ls1KKoNAcuoRuRRbuX/dqCckFl5x+NujYMZdZSjM5B+xNDdwxPLO60uNJtNt?=
 =?us-ascii?Q?vKK8mSIFpxNUaev+1DHHAJbRvlZPFwA2uTuMdd6y9GsNCb23WuhuDVF+21Ky?=
 =?us-ascii?Q?wFJ/5qJcc6pToHlmr3Y0NHzhaeiB0nfhCXNoBvThE5DmH8byCxxd5aQCB+Hn?=
 =?us-ascii?Q?55nNgY2aPQAtJIQGl3y3j0kOFc7WC9t4PXQYLlk6r3jRPkZQdGWiLRHb5SrL?=
 =?us-ascii?Q?BGfrmAlIscif/s+dnBNM+hntXx2FVHOaMLdeZvZP7WuxZvqpgxjxxnSpXDsx?=
 =?us-ascii?Q?FwnfYS00EEH1PsdVsyCPqg9tn2URzwxnXrZx5e/HNfVhHC2bIiyIc/p43Zxg?=
 =?us-ascii?Q?a+eBI04T82O7fZKa8M9S5lU5A/26ONed0O3oTXwl/b1inPDSwM5Y4i1EIpT+?=
 =?us-ascii?Q?wy11riYYdkUQONxlclaHAbN9Uor8UcFpPoqf6g8WuPkP4ZNiziBwt+j1vJfk?=
 =?us-ascii?Q?oI+HMdKACdg9WNyLDD8USEVGOCl5tCoes7/Iy0W3HaS4IJ+pRxM6eAoE/BQd?=
 =?us-ascii?Q?4vj2xQILAoirt2p4WclKQJUSwAjaBPRZa/t0GEjlIJPKXUuI+QqPArKf6deT?=
 =?us-ascii?Q?Lu7HYrFqUiD2w6TH8YVO0z8fZYstiRg1U9FHRnY8/PILs3Mwp/gGQOIDYn+R?=
 =?us-ascii?Q?u5bjwGr7aAFZgPDzu8MUhhQvhchlOO5fznMx0qx7uGwZeSzONU4cMOQUl52R?=
 =?us-ascii?Q?HrrNHTmvoxMnLRvVynCXqjvgn9HyzZLth+T9Xn85Z/0PqJIHGdZFFZq7vEj5?=
 =?us-ascii?Q?xP4uo8QBWtI5G1wkvL2ROeUDJKB3k1W53B7rRcPFO3WkGAgmkux8YB6OTaz3?=
 =?us-ascii?Q?jbXvt+1Ue3VVH3/HompfMzQASH7ps8YBV0OHW8+eizJGs9dpE57I3GbpqcB+?=
 =?us-ascii?Q?N8wbBZrO5FohaXo0nohXvGtAM9uC6VI9mdZ3R49gle0YttcPgOHx9OuBQVEH?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33be9af6-2b3e-4095-8ba6-08da7a0e2ed4
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 13:50:56.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR3n4PnPaZkIFFEhBkEOcyH9vax/tohY4ccgXde8lUidXQ4MbZ6dclA815VBNU3tKUrhOhtOwRU3WuqbITdQVrr4AMgIyFqSD9OKCNwTzkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0543
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Disposition: inline
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] dt-bindings: input: touchscreen:
 stmpe: Remove node name requirement
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

Hello Dmitry, can you pick this? Patches 1 and 2 were applied to MFD
tree.

Thanks,
Francesco

On Tue, Jul 12, 2022 at 06:33:45PM +0200, Francesco Dolcini wrote:
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index c549924603d2..238b51555c04 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -54,8 +54,7 @@ Optional properties common with MFD (deprecated):
>  				1 -> 3.25 MHz
>  				2 || 3 -> 6.5 MHz
>  
> -Node name must be stmpe_touchscreen and should be child node of stmpe node to
> -which it belongs.
> +Node should be child node of stmpe node to which it belongs.
>  
>  Note that common ADC settings of stmpe_touchscreen (child) will take precedence
>  over the settings done in MFD.
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
