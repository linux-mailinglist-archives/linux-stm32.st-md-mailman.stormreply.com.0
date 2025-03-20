Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC950A6B5C4
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 09:05:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6764EC78F65;
	Fri, 21 Mar 2025 08:05:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 318C9C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 15:49:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AuZ92Z6N+K4s7u52WHXJuQvvWLH0YzdH0SVVyZ9eeqnLxlKicsaVZXS+KWG2QFw9tNvMJ3Bgzo2rdAthCFl4Yfx5f2IZYpuwL3OoHJK6HuvQMBP2KrmmEwuJ0LddlgCEiMMUL53MlusN2Iy9BnCysDyX8XBNUaehMQB2VdYMrWoMTpiN3NGwxPvE2Bm3TEYklH9z40GPBimlA43A7Bj6ua4mKo8VHlegeTc3LXJvQZQ4sTsCb7+0WCjWE/+D5D+8EKSIVMy08uM3iAG1yNBadGFkIn0CxUXbh8FM68vwBx4y5LgVv8HzzUGyzkMMkKIkea7stIb+LQYoBC/oQplbiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=PWGskK4DyJSJk8ih0BPUQXBDo3r1HBEgsL8ukD3XDYkQQlS/zW8ocOVal9J99+b6LlL/dmR6ub3nnVhxlc4MEBxl3pKxVYeSecwhxsuFRLn/TcuPCcio+K2zDmmY9/vtdgW9synoK2qg/r4ba/3C6NLySJ5MuVnMndfu2cfNWs+QiUYi0OHMKihNsUXIpZKnnVlhu6n90/XhVLIyvLawDwM38RJ5Vb911m+7NNUtiEuMgDwBahibzRynmnWooQ9TKh8j/bvk889T/8QPorG/bY/KKHjNL1MlOf0OuT+D97Vpfj0oxxZAhwEzxo8OnomJXsRx6P+cUrtnRFK8oKzrUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=pass (signature was verified) header.d=arm.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com]
 dkim=[1,1,header.d=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=poCV5M731rNmjUaaKbU5iECRtz7o54+WRvR+/7qQ0efN7piGCfCJKz4+4iN62VveJYRkvWjW+f/wLXpzJOX/ciMNS4cvwyiNqVBT8Di81tgJbEQaH0ih7liMFNFJ/17lbRcr/6+oUeuv4x3jE6kAoQGbjapN3au72cMlaitr4sc=
Received: from DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) by PA6PR08MB10418.eurprd08.prod.outlook.com
 (2603:10a6:102:3d1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 15:49:00 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::e5) by DUZPR01CA0064.outlook.office365.com
 (2603:10a6:10:3c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 15:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:49:00 +0000
Received: ("Tessian outbound c541cdb55eba:v597");
 Thu, 20 Mar 2025 15:48:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0c55902ceb5e97f
X-TessianGatewayMetadata: oz1CWi7ZcfQC6qehWVMvtKsn26LS38K9qFU8a3MQ5KhgaZcIC9I6fNnBHFgl8BSPXQWPiseievNI1EtFAxxAwYZeQ2xV5nrpxmL1XMwBaSfuAn84+hDWAHgmjPxFjdSdu1U/sWRsS9obxsooO82KEA==
X-CR-MTA-TID: 64aa7808
Received: from Ld278db1a9a7b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCD19D75-6D54-4344-B331-302CCCB4BECF.1; 
 Thu, 20 Mar 2025 15:48:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld278db1a9a7b.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 15:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/JcnD35ZIafdLZfiZYTJqwOMXaxWaBA5EmT9zUHckuphSBpEzktE/U1S5R0+hwMUYYkw393ejogTUR2ZPoLUUdu7xBzf8joz7x6zahyvmZLUQXiKGK9thFocQQgFf0pPyQtAFie9O5JsRq4kT+ApMgUzkb2d0YObmShOZsbmeK060VRBylJfe5JlPrFtSQkehPnLeF1v4iMLLWz/NC9lHfb1GfePTFn3gp8JoWf+tSkGzBx7j6YCVNCRxm07re4A2xoYFNrU6FDasjEjLfT7ybMjiQ1xdiN97rwMesmWP4eXsLMwKmR6E5wtXgjcXgACGBk5B9DdVu7KWiSSlHwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=tJAn9x63BcQRUGyU+0imvKxHwhfhhCcZP9w40JTdg8LkYukwOs9CpP6trnnT4I0YxG8wY9v2Pf4/k1m8+Pdd3lI1It56cXSFku/rAbaNLqyJV7K5gGnZ1VbTLGjVFXt0dxT1/Ed/wBwataG6Bihou1WTTl7roHF0ww3IP51zqNqBolIRGgRHFIqnBwtbrRUyLjmxzVYA656NscXpAWyKJV79NB/AuDjfQH1GmpZUg0gLj/gRpoEKJHoGZqvOM9o11EBSjOVCsPlrUYCFqLxtdQJGG+OOIhrzRlKULFkK2DR1Dp+t0YENnDaGmyQ9qngNvaOsdggWoU3+PfkcYupFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtSl5te2Ejwe3HWh23jUS+g821nGOJGcEJXqw5CX/KY=;
 b=poCV5M731rNmjUaaKbU5iECRtz7o54+WRvR+/7qQ0efN7piGCfCJKz4+4iN62VveJYRkvWjW+f/wLXpzJOX/ciMNS4cvwyiNqVBT8Di81tgJbEQaH0ih7liMFNFJ/17lbRcr/6+oUeuv4x3jE6kAoQGbjapN3au72cMlaitr4sc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB10670.eurprd08.prod.outlook.com
 (2603:10a6:150:169::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 15:48:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 15:48:52 +0000
Date: Thu, 20 Mar 2025 15:48:49 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <Z9w44Qq7Mo+kTWZ9@e129823.arm.com>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
Content-Disposition: inline
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
X-ClientProxiedBy: LO4P123CA0527.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV1PR08MB10670:EE_|DB5PEPF00014B8F:EE_|PA6PR08MB10418:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c0ba87-defb-46c1-c425-08dd67c6bb7f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?+zO5+4oZKyeyBnp4IKpBeONVzqP0x50Xg1JzLhD8CmNy26ta6A2HN4Na400X?=
 =?us-ascii?Q?ToXkvwu5Uq1P647AcgIujI0T8PV5sY87xUpFRGtliJe3qIdavGNMp1CgoF1e?=
 =?us-ascii?Q?Znxguoro9i55a4j9I/FUlb+snL1MJ1VTRK9yr5nfyMilscnJZK9mokprgWqE?=
 =?us-ascii?Q?lnF1pW44uvKKBcaKVbjdc53y5dymfDdkgmi5eA2muxp9DgWvQXam8jH1NOyT?=
 =?us-ascii?Q?aT8v3s4JB7gFsGCiHQQ7C8G0wLPsdHxQlb3dM7AR2BJaI17zt5oDyWBYs80r?=
 =?us-ascii?Q?fRvkfGJHzd6sznFqSnXrYvcDpbAHjt1DlO1O12ki7pyWDJGlD7tUQm+DSvKy?=
 =?us-ascii?Q?vvTn1RJ9Am+/pmRTHWNZAziO4FAOm7hJF41AEuupa1f8/EPRYRQ94EyGUQHI?=
 =?us-ascii?Q?28eBcHo/z8lHFqpJLdkCEEZsbtJuqWR70q2V4hLiNqV+WHtyMZ8IGvsmanjT?=
 =?us-ascii?Q?MQTUMQ7krZ0x+fvJ13NYpUUU8kiS7gFEoB6tx93+86Obgv7uc4JEWnDILtI0?=
 =?us-ascii?Q?Xj73rr2Flh3O5fGoZrYXOZq4956XV9YBkDTI0n5B/kRfV+mLaLKXyBDOzyOo?=
 =?us-ascii?Q?crwpTWt3pnX/exYc6t602DV9zb7Fhbf0Ju5puUwoI5N6nabFP8AS6swaGa5k?=
 =?us-ascii?Q?LT+rAM5GrngPTV9ARvav7rblv8aiTpg8+9vGgRYuEYrpn8UWMcTjfjnVMpqK?=
 =?us-ascii?Q?yev6OBc5tTbeo7KDUru2A91w+AoI1SvD9FSufEE0QG0TyCquJbZ3boAaLmIl?=
 =?us-ascii?Q?Z0S+ciVK2eq+8UBi1HYG59SYZs0m7hkn1qFlbA/wOmj6IY4Lg7GUA9PNKikm?=
 =?us-ascii?Q?A82wZeEqI7rdlwuxWiYNK3j/TDEu9XWAud/bC1WNhebYNJkEWLENkqD/TWej?=
 =?us-ascii?Q?Q22BHTnN+oZ6Sg6sdQ5vrXsmm6iIwkEI8ffDGH4TjTuzvf5HVW1dgyeageEC?=
 =?us-ascii?Q?gtRHUt9vUP4BzNlIGeKvNzpHvC7ULrlARoIzfY4xcIlo11tcDsVnjoL+S7/3?=
 =?us-ascii?Q?2kqVnX6uD20Q635yX5oJPL+/jmTMaf3H7fJhMP3Ag5gbcMu8PelDBvc0zY6H?=
 =?us-ascii?Q?v+gFlO3zx3v3ZuZbp7RDOZ3+YjEb6ltN04RNN9ZuDjk/4rzAVwosuNjoRyQa?=
 =?us-ascii?Q?9tCsIoyFiORhfN/074zeFEq4fo9emOwqvub42rvjt2xuSPZ/2jpYT6C6l/pr?=
 =?us-ascii?Q?CZGmk4FY/8ZdGe/IqBr4M0I5JOTZGRfUG02xpJrg3lHCrqm2ZGH9sNBASuTL?=
 =?us-ascii?Q?EKKPviIZqUBSEPP6bxMK3rHN9DNbMS8DvU0T9Azn3M/alVFY+9brp+NmwvVD?=
 =?us-ascii?Q?y84EhbKSltVzZh3UBAUYzNtUYuU97NcShAChyO6N57hNhw0QlqLBNNL5YUEJ?=
 =?us-ascii?Q?L35sItaUJv2lupZYPD99qm30Xdw1?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GV1PR08MB10521.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];
 domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8415fb90-3032-4406-d8c2-08dd67c6b66d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aIyQmsm8kNEzSGQsNQpLdwylHhSbAsgTBOlu6D1Bbv7W/vVg1lyuWKX1ZY3Y?=
 =?us-ascii?Q?iH8M6bloDthbCPR0ixt8fsbc0QgsN/ckOCVca/osVrTVpH5AQa5TrM+7V0y8?=
 =?us-ascii?Q?eOVXqX/WFL6UKo+VpqX8rPzf8HLQ8M11C3FtkApt+VnP7fDC/GbZxVc7becU?=
 =?us-ascii?Q?9oT90OzVtpNOMrVoYekNg7dT8QFANDljoKUBMj8yiq48z7EB61r+CTNzs15s?=
 =?us-ascii?Q?IZ8nfbAoU5gKSBgcZGrq7xDqMfyFQgZb3mDLjz0qar6evc/0mMnQ1AGzNLgw?=
 =?us-ascii?Q?WEBcwMeRJO01oAXXd0JR0LflR6Ebon+guZ6w4ZtuGbEgNgOOHB+ybnkEVVHz?=
 =?us-ascii?Q?45UiQYt6deT/y+wxBQEUtW4FnSsWZAM/lLBgQ+nqf81a6099edfTjpCDscW1?=
 =?us-ascii?Q?BQ+lCIErQRJfM0+c+WPhUiiX4rG/HPGWZ4uEgs7ehav9da+gOFmZjiLkI7/x?=
 =?us-ascii?Q?yuzS02ccbOGZs1KMI3CBzK12+OLQQR0N8IaAjoxspRUZSSSq5kiEWTXHzRyU?=
 =?us-ascii?Q?3iU2RiOB90H5XjltMNckrXI1Nr9FQKLqPC1KX4MCTDZ/tydh/zScBAruQPGY?=
 =?us-ascii?Q?XBBXU4ZMKTNcewdkZISEkTrnleGC9znnXG0AYkeebHSeqGxlaFna5jsUWKsn?=
 =?us-ascii?Q?aB0jf8FdEm37YdxOGrA3Wq7MLIZdFuEsn0q//Ph9ETAHBLLn8DGpxOF2TKmr?=
 =?us-ascii?Q?v4kHQOxRXH3ylRbg05dXWGR4SW5u0HQNOWroB5ubW4SQQ0evFUSAOZbV1qS6?=
 =?us-ascii?Q?7iCkoqqESHjOVF+71epFpmeu4Sd2dBX5fFZPUMQiuZOHoUg9D3OIROVEAurN?=
 =?us-ascii?Q?Lrxh8PIE1yJvtU+/bGIPk9KMUcJEFOWTocZEvK11eUQCm13fH9wAKe9JTMvb?=
 =?us-ascii?Q?Z2DckaszhJxNfi8LRlghE4ysPhx2MSbeg2uJlYwRHTAnR5WcUrvrkKEeQObI?=
 =?us-ascii?Q?F3/XQg3LrfEkgNDG3+rVwEKnAxsoSZSdldt0Muj1Uxe7iYUwxiLDxI3iVI03?=
 =?us-ascii?Q?hriN3hM/CToG/lPjwvVqPcP27u0YngH81K7cTWjhdzn3phZ6rK7kqQfK9g4s?=
 =?us-ascii?Q?KIi4mMFGaNc5JV9sdkFqwe6DSwQTPPKlCVYt9npXBuZUCgYRiKmwVPVVAjDZ?=
 =?us-ascii?Q?CHzceKknVIgQVMlvoAb/NXjhfBRuXqh5CFxmuyDccv2c+XPK39cCAIjaoXLr?=
 =?us-ascii?Q?NNynjgqcKcC9M1heX7lmVVQgso9N7xWVtEQs1v3ivGVz/16uFhX/EAoq2Mm1?=
 =?us-ascii?Q?LkkrbraycswQd1fRWyYjYOdQSQVTUwsjuADyHmsbWjdhgfO3Y2kz73pUzX3h?=
 =?us-ascii?Q?t8g3Rekblovv7GSRDHpxydpY0so/gvnCcSbMA9huwOdtmcxMuKXQdDjGEmB5?=
 =?us-ascii?Q?UK+lkSsoCe5T3svNQf0TFn9NWOJfSgQENotkV8eZhLbWJ5OTPyLEVr6L+wdP?=
 =?us-ascii?Q?f8q4e8ipMhFkehC/9DwizdG8KzbiAARIGEju4u0qtSYDjlbUqph1TKkDT/q9?=
 =?us-ascii?Q?eNHUmqkBgcwaQcg=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:49:00.3376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c0ba87-defb-46c1-c425-08dd67c6bb7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10418
X-Mailman-Approved-At: Fri, 21 Mar 2025 08:05:31 +0000
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/7] coresight: Clear self hosted claim
	tag on probe
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

On Thu, Mar 20, 2025 at 02:34:09PM +0000, James Clark wrote:
> I've gotten stuck a few times with unusable Coresight after a warm boot
> due to lingering claim tags, especially when testing the Coresight
> panic patchsets.
>
> This change does some tidy ups, adds some debug messages and clears the
> self hosted claim tag on probe. The last two commits are unrelated
> tidyups but they touch some of the same functions so to avoid extra
> conflicts I'm including them here.
>
> This gets as far as fixing the claim tag issue, but there is some other
> state not being cleared on probe that results in the following error.
> This can be fixed up as a later change:
>
>   coresight tmc_etf0: timeout while waiting for TMC to be Ready
>   coresight tmc_etf0: Failed to enable : TMC is not ready
>
> Changes in v3:
> - Collapse rename and locked/unlocked addition commits of
>   coresight_clear_self_claim_tag() so we don't change the name twice.
> - Make coresight_clear_self_claim_tag() a bit more generic by only
>   doing UNLOCK for MMIO devices (although there is no use of this right
>   now)
> - Link to v2: https://lore.kernel.org/r/20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org
>
> Changes in v2:
>  * Revert most of the interface changes, just call
>    coresight_clear_self_claim_tag() directly. This is possible because
>    we're not doing the read first, so it has fewer knock on effects.
>  * Split out the change to add struct cs_access to etm3x
>  * Add another warning for racing with external debugger
>
> --
> 2.34.1
>
> ---
> James Clark (7):
>       coresight: Convert tag clear function to take a struct cs_access
>       coresight: Only check bottom two claim bits
>       coresight: Add claim tag warnings and debug messages
>       coresight: etm3x: Convert raw base pointer to struct coresight access
>       coresight: Clear self hosted claim tag on probe
>       coresight: Remove inlines from static function definitions
>       coresight: Remove extern from function declarations
>
>  drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
>  drivers/hwtracing/coresight/coresight-core.c       | 87 ++++++++++++++--------
>  drivers/hwtracing/coresight/coresight-cti-core.c   |  2 +
>  drivers/hwtracing/coresight/coresight-etb10.c      |  4 +-
>  drivers/hwtracing/coresight/coresight-etm.h        |  6 +-
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 28 +++----
>  .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++-
>  .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  4 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |  1 +
>  drivers/hwtracing/coresight/coresight-platform.c   | 26 +++----
>  drivers/hwtracing/coresight/coresight-priv.h       | 20 ++---
>  drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |  6 +-
>  .../coresight/coresight-syscfg-configfs.c          |  2 +-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++-
>  drivers/hwtracing/coresight/coresight-tmc-etr.c    | 16 ++--
>  drivers/hwtracing/coresight/coresight-trbe.c       | 18 ++---
>  include/linux/coresight.h                          | 40 +++++-----
>  19 files changed, 168 insertions(+), 134 deletions(-)
> ---
> base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
> change-id: 20250317-james-coresight-claim-tags-ae1461f1f5e0
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>

Look good to me

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
