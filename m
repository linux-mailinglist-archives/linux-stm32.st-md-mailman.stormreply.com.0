Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B79442942
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 09:21:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60226C5AB60;
	Tue,  2 Nov 2021 08:21:53 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60132.outbound.protection.outlook.com [40.107.6.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C7BBC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 08:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjOwDnh5IoqdP+ern0DvrlqWt6e1OdRqXZDYA4Y7JR5jISpTWl1apsQVFqTDIUv4T6+sKjUGzKBaacgJjJRoFeYYa94cuj134Fl9N2GetIPexBxXSOdmrCGe5r6wZr/YEbboIsMPO2XtNVND+UiCZbDMlcrmOuQxJB15ja0D8OyABMd6XCxwruCPtBY9rIVivhqc6OxmFBLUWFLsVvAHqHQUdpSBL+iuB6Pa0d7MrLRsmgqXr/UsDO57+ZTHxMaX6f9ytE/v/iP2/7jvB1TeUJ1mUcmvFXav2SABOYMpuF66qAC1BGqcfCcGT+tDPkwd/dvwCmn+mNSGaQNfNKdwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fKnpXl1FPJIuZcw32MTszuBGiiaqHetm9ofmK3WJnQ=;
 b=gVqI8hfHGg8pGdVrZkhSsIgVVGzuEeXv0MTd+SOu7m0wt0kYQ2iYmjNfVIRtOmHmrkQGy0zS9aiQKxtZco5YjsvkcSqxYOsTtXQ1iHxY32NhDuuHpshgJRRCKWYY32dtFpea4Iz0cVdmXvBDzIO4bpkRVk7Qn672jCxLKZunrHRG+HY6zQ6pm1vHKjTgE+nyNa43Oon9x0VOq9Y8fvY9RQkIShupJe7hNev+6fO2zMpcnEb5yV/hicL7srLvRbomoOvu9M8xlXXNkZJJBD3vqJWn6BLIpvMAW1zUxdh8ljTV/qMpEJGXc4Ak+fpP1rXePbx5mXUF7SHhKWbdom5tHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fKnpXl1FPJIuZcw32MTszuBGiiaqHetm9ofmK3WJnQ=;
 b=IIB1uFfVtMVNSEHdEn8sI4pClwF5PYZnhhKyFkwMVx0ARJs3ZtY+n5lxp0/BxBYxcK/dHLAAJ1XcrrHkTlo/HYP9vUOvHBWywGOM97sU25dzVrFwZ6wSX3JOTZ32tphT98VQ7yv2WJgS3YAjno23E2M4cGzRCUH4IQ/P1MTF9x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from DBAPR05MB7445.eurprd05.prod.outlook.com (2603:10a6:10:1a0::8)
 by DB6PR05MB3448.eurprd05.prod.outlook.com (2603:10a6:6:1e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 08:21:51 +0000
Received: from DBAPR05MB7445.eurprd05.prod.outlook.com
 ([fe80::90ca:ed3d:a3e5:1651]) by DBAPR05MB7445.eurprd05.prod.outlook.com
 ([fe80::90ca:ed3d:a3e5:1651%3]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 08:21:51 +0000
Date: Tue, 2 Nov 2021 09:21:47 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20211102082147.GA5168@francesco-nb.int.toradex.com>
References: <20211027082155.206449-1-francesco.dolcini@toradex.com>
 <20211101094844.GA4549@francesco-nb.int.toradex.com>
 <YX/Z47ztw8d4uMuQ@google.com>
Content-Disposition: inline
In-Reply-To: <YX/Z47ztw8d4uMuQ@google.com>
X-ClientProxiedBy: GVAP278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::24) To DBAPR05MB7445.eurprd05.prod.outlook.com
 (2603:10a6:10:1a0::8)
MIME-Version: 1.0
Received: from francesco-nb.toradex.int (93.49.2.63) by
 GVAP278CA0014.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:20::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 08:21:50 +0000
Received: by francesco-nb.toradex.int (Postfix, from userid 1000)	id
 E78D610A1001; Tue,  2 Nov 2021 09:21:47 +0100 (CET)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eac204b0-1077-47d5-5db6-08d99dd9d1b0
X-MS-TrafficTypeDiagnostic: DB6PR05MB3448:
X-Microsoft-Antispam-PRVS: <DB6PR05MB34488CDDE8E86F5C6250ADEBE28B9@DB6PR05MB3448.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Olm773pu/Vd4oP/AunivTKiKzAw7XJpKjR62aZWzeh3em5p0vfa3HakDMy+700lnhB0M9uTLzy4Hg2jkYqxhq+l2uFV8qGnyftu1a313mb0WWccl+32jnbGT/CEWGc9NVoIEYh4qu0QOU35Qdvs5d4IU591SviGIi2doKTAB2p5zrLeUReb5HjUcBs1/8e4pz9+qH23bNF/NkoNYa3CZfvjJGOcStON6LQJ8qb8yOHevgk0RtyxIDt50HDFS2KqbwgpvfOM5A9YlSCzQrktFN26iYxhjSzwSTe6fdlQhG9BbCRzrwWfOktxqRunziYKloUHXJ01K4ru/KMiZJsQQlIShlPwajxf1CW5SD7LbyT3CjNqN/ofShNFSZLKS3ezbFjDFvDd+OHqH67E35MMZ3wOrwPpjyCSZQEIxHVq7Oehy3/6K4xCMkh8uLRs1i0UVprXr+b4oFCjnSUXg+rEo/XD0+skJvJTBwSjLMcF1BZEI4H5nNF9Q4dtgyU03EBblJHb0t2qx1EbSLzTpYI+5SjA97T25QSNg4BEAkJQi6y1Gcc4JUm5Um8L/KqaMYRRu9Ll06WpEIzW6UoRKhH1AiAzmH5BXDNHMyNeSX9H7cfs9rxmVBN5FO5ZiOKmDlwDrsmYhdIs7WyMgEFFoelED4hjUnOXRKuBRuiW8xGIYOb053ZGY1PhP8DwmTtrAeWLpfKz15a8evBBvNh/QUflKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBAPR05MB7445.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(5660300002)(508600001)(38100700002)(6916009)(52116002)(42186006)(4326008)(8936002)(66476007)(186003)(38350700002)(4744005)(6266002)(1076003)(66946007)(44832011)(2906002)(86362001)(8676002)(54906003)(66556008)(33656002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WW82GEbrqIX1st4/0hKM8RUY0u01PvJfOdWowfRjjFtIGYOnY+phMFmD2uSS?=
 =?us-ascii?Q?cATUAq8bSgrz+sM6DVXTD1iXi5LC0+2r0FNpU4TsVSWhKKJKequK0t06bYI/?=
 =?us-ascii?Q?AHbwfZLQ2hV7PuiGkN/GdbDB4ojnBO7HE06lpmmrU0gURaqoYIGA8skhd85R?=
 =?us-ascii?Q?/MzUdIJJICFMwYnlT6L50IRrM8R+vjHfNLzv3EPoOnYTl6nGuK5OHV0FVeI4?=
 =?us-ascii?Q?THTNYSyqzXM/ZMIRkMegW9itiUiZIDWQywZrcuQQaIegXiuhZdfQajxKsiWk?=
 =?us-ascii?Q?cgON9kgpdGrKijla4khk+SAPwxlLf8mgW+L2d9/IeyUggSq0DzildrUBuyfk?=
 =?us-ascii?Q?T+cjaUrMbzcApXYRZMRmjynrQljKuSb9T3HIGc9hPMB65uX9hTffKtiMEL1N?=
 =?us-ascii?Q?AwYFkr9z3teM/SjwMeQmJEyqTgX4vpvlXTOcJMsIeL/2xtJT5BsERl2bsfhx?=
 =?us-ascii?Q?98UHIx/cfOoQpqPQZpSnqitiHY6QTRP1gpoQ1usC6Ld6mjesxipVfr3/n7p+?=
 =?us-ascii?Q?9uzzzw9vDQIQPjXFI+PVpyMa0fj0ES1IiLAyAVVYPQJv7Vh/z7m5PgC0A9jd?=
 =?us-ascii?Q?30mEF9/oO8f0ZXNvlCq0D4Sn1Qz1wSZspdt+SytixRjc1B40NmzMLxCfm4VL?=
 =?us-ascii?Q?3Q5cfCEx1c3G19s7MHnuoYg+ku1tTEOOsiwIWAQS+xHJjKKm3cwKT6397tT3?=
 =?us-ascii?Q?tixh/u0oi4mPa0gOUc7ynGNR6VnycSnxQtdOayshBGDous6bn4mJVfOScXR1?=
 =?us-ascii?Q?lPqxgEUblKR0tp8aQNuci1d/QjZE90rJaibvbmYLLWYJgDUhpFAFaGlVnBQu?=
 =?us-ascii?Q?7lpMitjDqv34bzsnSuvTOEAvmVHfxfRnUpjiOWNNf4jTFnsm9KKPTR+6yj2X?=
 =?us-ascii?Q?sVkFlGMuSHF7JK37TbS2iv3Hq4DRbiZt+UOVmtqd6bSoF9imAZvfENYpTvWC?=
 =?us-ascii?Q?J8o7iIIrQCRYO1tph+R8My1nVpaSt2ea8hQuzXk6yglD8RWlea+cG9eWpSJU?=
 =?us-ascii?Q?w4miOmNy/rlxEp9haGpACn7IID1RtWB1zNjGtz+8k0o4eDBz+8Jfl6yF/2wL?=
 =?us-ascii?Q?B3peuv1NFRxomMc9lEnQGIoEvMOkkMdat9RVTBn4AmSMxASjqiTEhsNGfGDn?=
 =?us-ascii?Q?IEe/nD7/6QOIKE78k5tAsr1GD2Giqldv5YBR9/YlRjams1GHI76W6vDfFk8V?=
 =?us-ascii?Q?lvBnUc8B//jiojbB3W4y+tAPn/nezf6RahmfyFVWwysBuyQUf7v5oUAiemH+?=
 =?us-ascii?Q?4XMEeY55NptkXVIO0QVuFHHCW+tQMcFiN8hlmQa4qm4v8OGw9agJnFR3fCih?=
 =?us-ascii?Q?n72YN5hMJZAJ9T6yhPPXWJLqsPkUtYqDoGhthz1X3Ac3FJ2pPzqjcdHonDoK?=
 =?us-ascii?Q?3YUQTDgFPE9drF++8lEZxKqGVptO+gr4aaPluq1dNHRU6ochdYU2k4GUBhv5?=
 =?us-ascii?Q?uLzM1odFwztP3Z+oc+ryMp/8OtboPhlo2HmQ26qKJZYprYJ43IiMcVyAc5OB?=
 =?us-ascii?Q?s4Frb56fQFqmnYl2WdMS14pOh3oENyvdjjfNRwzNqN2bAqw21kiQO2Kve63u?=
 =?us-ascii?Q?bTepmPpI/JjZpQa8UwZvBeeFN3BuCUPg8RNjYhFteqj49x1rcyi/yqEQFVbM?=
 =?us-ascii?Q?1at/LKADQYo8pGXjpUfiMG3e8ymRmThrDCN/lvgt/MXERNOLOcLzmv32jddO?=
 =?us-ascii?Q?UIgEEw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac204b0-1077-47d5-5db6-08d99dd9d1b0
X-MS-Exchange-CrossTenant-AuthSource: DBAPR05MB7445.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 08:21:50.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGuzvVFmMkfFKtGOzVMFFBQR6Od69rPvHwsxEMnG1Waxyse5n6iVveBircfEj/7jDaz8mjFNuxqUJNHHmB0phNYWfGjziGbNukV4R5X1MHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR05MB3448
Cc: marcel.ziswiler@toradex.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling
	sub-functions
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

On Mon, Nov 01, 2021 at 12:13:23PM +0000, Lee Jones wrote:
> On Mon, 01 Nov 2021, Francesco Dolcini wrote:
> > Hello Lee,
> > any chance you could take this one line patch for this merge window?
> 
> For a patch sent 0.5 weeks before the merge-window?  Nope. :)

Hello Lee,
no problem, I thought it was that trivial to not create any worries.
I'll resend it in a while unless you take it before.

Francesco

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
