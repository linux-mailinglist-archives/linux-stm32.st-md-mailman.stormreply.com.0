Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE45717DA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 13:02:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F5E4C64104;
	Tue, 12 Jul 2022 11:02:42 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2AFAC640F8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 11:02:40 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2048.outbound.protection.outlook.com [104.47.22.48]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-3X3glB--ONuAuMx54EhdAw-4; Tue, 12 Jul 2022 13:02:39 +0200
X-MC-Unique: 3X3glB--ONuAuMx54EhdAw-4
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZRAP278MB0317.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:28::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Tue, 12 Jul 2022 11:02:35 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 11:02:35 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Lee Jones <lee.jones@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 12 Jul 2022 13:02:32 +0200
Message-ID: <20220712110232.329164-5-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712110232.329164-1-francesco.dolcini@toradex.com>
References: <20220712110232.329164-1-francesco.dolcini@toradex.com>
X-ClientProxiedBy: MR1P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::11) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbc5a66c-a8c5-45c8-3af5-08da63f606ad
X-MS-TrafficTypeDiagnostic: ZRAP278MB0317:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Meup2MobrVbfQ3dEJscTVNRTEu5bXRry9LQ2Jg8SKr5g0dku1ozcIuiwSTe8CAgJriUHR/0OqbXd80H9himCe2CkeLevGqYukBdEffTXJP7sDW/eqfdjyu73cVnYVTXtuWYjtQ5JmjcSjqQ6L8iDEMqHvli7ehM8z7C82e5w9aZC1i+zaR9lAg66hES9JjfAxY5DIaT0QlpxSt5OjhQ3ObpR3ZWmPX2T87ASkDu1QrMUi08V7vM7IqLykmJONSUcKeSO3rvsy96LIKV+6sb5xqdfG9X5qasc606WDiytWWhvbYiU7ZpN9INHdPgCsXTm/HvDqaLysqJYqfYjN7AccKeleG4DyvNfQJSh22qPpJMc5jQyiToSOSIJVhTfnGy+y0fV6mI/GGug9yP3yb76XdFvK4VRFVKSJ4lF31/vbv30yqIkKMg12UlS5IITE5qOUhIhd6G1ZDLgLbXoHKSyFbnSGqliQqRbic3zgCwecQZqxUUoQ7FYmnWGdbMRZqGC671sYACOjU8NAa5wgpDbQOcZgFuSvgSj/yGj/LiXW2BneDGp9uMX+hYqyxl8sqaMZ1gUGljBfZv/sr5Kh06hFxjDoJSOD6UnK0tEVdqWQEsmmy/T4EVDPazGwZbMqYDiTtUM5fmKumnVdkex0qLKJsC4XT7S/VRWrC929N1nN5Yyv60p3mG6fAZMjxy5Q3DeEktxHBFsYK3JWINn9nfV6ZDb7Sl6AFUuLCTAFEaTSDAgwiGNrNc4otSK4ZGeVP3RD8ih2rGiSSCTkVHOQrOEOtk/um+qpn3L/w86bNPkkSEX7zp7vpcNeHo/BY1BrQrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(66476007)(38350700002)(1076003)(52116002)(41300700001)(38100700002)(2906002)(186003)(6506007)(6666004)(44832011)(36756003)(7416002)(66946007)(316002)(110136005)(8936002)(478600001)(5660300002)(26005)(86362001)(83380400001)(66556008)(8676002)(2616005)(6486002)(6512007)(4326008);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ud9MKl50gj/9XeL+A/pmBK3IDePNudQK3WG6SG4XR+NoSH64BCngxZahCfZk?=
 =?us-ascii?Q?8C/R3nIRwLZK5rfa8RGnWYBMeU85lFm3UZaAFmdh8dpNf01NIoZDu7oJCfsA?=
 =?us-ascii?Q?Q1XRIuCDmocl0Z5d7JhCS/s5CFs8ttmvTvS0eJdLw6e3WENIEA46pz96CA4N?=
 =?us-ascii?Q?hTbfJnHfxxqeMvmv7ZsS9KZ5+qtIcA7W9fvB9PP4y4A/i5a7tk87CoJnaQiU?=
 =?us-ascii?Q?EdUwvwSgYB1KHWqjGRF0qutqA5cTeivGWf+0uEUxj36X87t01Xg6aO7tZIJd?=
 =?us-ascii?Q?+2UsdoHZSIOqWkByrCQIv/ejid2zyvuuyAvNtd2Tyq4ncmYTnIAR30erbKSm?=
 =?us-ascii?Q?b3TY2Mhy3pS29omiR5g6Ss+pTe3+1n1yMZklRNKSplNECLLlMbYhiKaYthqe?=
 =?us-ascii?Q?Imd4fdL9l+73NevhqrV0bM3Y3VViyHgxoS+HkZcvdPzhBrfV+76ASVnqdYDt?=
 =?us-ascii?Q?u8Pp8rIPUn7eFIp0shUFZHfCrd+zYbOgijcJw3aIcC7Am4XaTLGqjdqpk5Fs?=
 =?us-ascii?Q?RmhKQcq0NQfqfBPs0D085wZl9Sb2xMVC1FJZeBt0pE3pj2m9ZBc+sF3dg21C?=
 =?us-ascii?Q?1vv24xlWPUVgD4YSev7vtY6qqkVGD5eW1w3OVLFZ12O23qNHbhLiWzPpU9W9?=
 =?us-ascii?Q?Ch6NF4yGYdmdzV0nWiWCrrkKInpHzRSVPVNUHA2MV1S20oWFbsAcC/HCNDhk?=
 =?us-ascii?Q?ko9UyoUT1sMW/J8HM8sUgaB1wGfoUqFLcesiH1bvlLFTqe3kNNZRH3bmiCmd?=
 =?us-ascii?Q?Afhy9m8JR5ggU/ZY49ZXmL0uD16u5YVKv0SIXrOYS+gc1G39RFxUVKEB+KBb?=
 =?us-ascii?Q?FAYT3cVojuk3jOcMGxvKM9tO8UXYc51qFJT4Kwr5KtTOou764bLB7ndfDcOn?=
 =?us-ascii?Q?2E0F3bvWufDKhj47pE7ozjDaJpMXSspdHjEd9pVfVB/6LLD/FnG+Zgfj1hDB?=
 =?us-ascii?Q?fMUF8SvJtm/PaBD6rAk+qSJQ6uUwP6ZCSI4R0a2R2kCUokCU1G3MDKO9h7Lo?=
 =?us-ascii?Q?E45lwpXvcOzvY7o8/oUKQtCHpF/53/vp6g+vOGSB7UWN0GePgoEdzMUOvEkl?=
 =?us-ascii?Q?Sym5BsD5Cs1qZ2aptkkpSKMU3WGNtaJAifQB7g7jTicuYw20yxpFbKkSufVz?=
 =?us-ascii?Q?moJalIx+vztVR1/JFW3wzE7nR1egqkt1PgA0kmjzS+zEXO0dsvbOqSOXNsly?=
 =?us-ascii?Q?7TlEvxqLPcLAeGDjr9lsxUz1aSe/C/5O+eqynCq9qFAtp0AjsfrjUeCxfMpZ?=
 =?us-ascii?Q?UuDT8cwLVtrwgTPNMXOLi86wuKrT68NzVTEEL5giGAT33gxABR127tSz93Sy?=
 =?us-ascii?Q?5pvyWa2TX83VBdjAwWWb5TzKrMSt1UyeZgdnqDwS8O1UzJTuKMqRjQdsQcsH?=
 =?us-ascii?Q?peESZ9YoZgv3Wa+tP/JXihE6zfoYUXofZn8BffhIXKmWmL9vfZ29gKSc5osA?=
 =?us-ascii?Q?2ETkFD1mTLPfC6ehrXQibbHQ66TzdoAyNQfHvIKd/YH5G/XOm83Qc8Xd2SFv?=
 =?us-ascii?Q?dUJg/V21h9TF+/ZzNWwMETtMgGmXic9MAzG6kwRnfYw150BElwmy4vg0H5ol?=
 =?us-ascii?Q?xUQAbxkjpLet6GP7ivWlWlsXstT2K33SObVKL1fSUN1PC/ybU6ikowbg/P/s?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5a66c-a8c5-45c8-3af5-08da63f606ad
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 11:02:35.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTz4EGCqEMzwLMRKrPnjLQ82qGUngByD64V4HnCQQbErsDXCJp+x2/jZbUyS1I72xIC5BhnxyKRVOc97bG8iOkO/mYUjkK6vUx2RgaPoVLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0317
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 4/4] dt-bindings: input: touchscreen:
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

STMPE driver does not require a specific node name anymore, only the
compatible is checked, update binding according to this.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index c549924603d2..238b51555c04 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -54,8 +54,7 @@ Optional properties common with MFD (deprecated):
 				1 -> 3.25 MHz
 				2 || 3 -> 6.5 MHz
 
-Node name must be stmpe_touchscreen and should be child node of stmpe node to
-which it belongs.
+Node should be child node of stmpe node to which it belongs.
 
 Note that common ADC settings of stmpe_touchscreen (child) will take precedence
 over the settings done in MFD.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
