Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC60A9D642
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Apr 2025 01:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A561C78F64;
	Fri, 25 Apr 2025 23:34:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C18FBC78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 23:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuwHNV1uUmwVXQF5dd35QnJUXxefUAn6971/5y86aufgfDCIHRremjJD2lBQ4+PshkAmqaEFqD7NytcehX2fXx5FvXN8FYSKCgCSUP7AsAgXqKVLsX3HcIoyhdnVvkS+CiPIq/4iF7ywjDKSy6DsZO82Fo88XcmEGjmtBKxjFKK8xD3ieZPBhtSxQMVtNLlSacjNP1Ge4MUmJ7fEh7avHI6kuooOAQC7PNvOOk0ZOdDxrzwW5dEK9foSrHF1JqKhd8wJP2Qh0JIcDGdVE4PniKX9aQqhjCTgFBsMYq8sXILyUk+7DfB18T4sL6P+2+TrUCmV8UErdDkr2Qy1qPkk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MruZsTjdJWCRbMLmMTwHHX2eHcUKLOU3RmfWqq6dggY=;
 b=CEDgITo/1XRxJM0nYqY+WhVVOw5JY9vb14mA9Ey5cCzjpiBdHVt+uLDDz6I3C+dSu776zXSbkr+qCboaCRkGYJhdAR0vFVdwtNqIHo969GJfK16vHxd5rEDAKv6553OhN52ZXW4COjdV5UWMJhcKP8ogaLpdyBcB6hvSMlz6T5lpS9YY6zZLrD941+ih506u2eys4Qf4OGh8rKV2PzAhRduq+EMenXfvKYEhR7dwuJch7jvD3Kyu3PQ3r/fLZ8sWspeM9/HfZFYrKogWYeRWKSxq8I+eJBKf2oR75tMkuK03eHjM4Un8spiOSvIi0EiQPgLw/RXYpQfgg1ddbUUZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MruZsTjdJWCRbMLmMTwHHX2eHcUKLOU3RmfWqq6dggY=;
 b=gwSsehUMVygSkPFrcu9vmtES/sWh/nd9o07r8+7DmimZ8x9OWyZMZrVtqF2ma1w4SN34ObZNnQuMFBE9DNGBRBRNQ01IwTOWPW1bpyDi19u4dC+vHIaTxXNQRzsUNPvixRm4AcIVAe2H5WA9LtAdLNG6tISZTb2bXQbk4iCbzNKt4zDyXBz7Zo8Bek7V61TDaDEX1TZHXqOuac02TA/gCiVQ+sSxz5MoLxCC5+/+VdFbFfloWCdLkC31fC0CrIQu6NYNkNR8dTeILevqHGgLfQ4bGpGv2a65aiIwAp3jKesiMCh3PuTJrSmLVdU5bfjgU63c/+N7b2phYAP8xC7uEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PA4PR04MB7984.eurprd04.prod.outlook.com (2603:10a6:102:ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 23:34:52 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 23:34:52 +0000
Message-ID: <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
Date: Sat, 26 Apr 2025 02:34:49 +0300
User-Agent: Mozilla Thunderbird
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
X-ClientProxiedBy: AS4P189CA0065.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::8) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PA4PR04MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 90595e85-58d1-491a-5967-08dd8451c6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3VDSXVKM0l1cURXcEFqSFF3UzVhdE1WYzUyTWZhb1pnajc2RXkxQThuamhj?=
 =?utf-8?B?VDJ0ZXZUbnIyWEZWNld0WExqeGVUcEk1K2NNalRYYnhuUmNrcU9sM2tSYW1I?=
 =?utf-8?B?OXB3NlRrSW9pRjFoeGQrcG9WZTd1WUxaRHBUVzA3NkNLd1NOZUwrZE0xTVlX?=
 =?utf-8?B?cmlWZlVwZ3lNYzF5RENzc2tEdnRFWFBpVDVYU0o5MUYraVJLdWtsYk9EWG5n?=
 =?utf-8?B?V2VhU2s5ZElLb2FmZTlYd3ZrRkN1VCtXczUyN2ZIUHl6bTA4YTBCTk4vQmhI?=
 =?utf-8?B?Z2xTdVZvQ0c0bVZybzFYTFZYejVwK2hNVm9MdFpyUVF5TDZQeVI0TTk1cHNT?=
 =?utf-8?B?OHJyWU5mb2g2NFRlRjkzNFdYMmVuTnB6VDFzRzBOdTYxSDBmbEUvWXljdldC?=
 =?utf-8?B?RWpCL3VlelRSU3RhNGVPTjFqcUtEMEhBc1h6aU5RL2oyRUQ0ZkI2dC9pQjQz?=
 =?utf-8?B?c2JacGpSeUczZkhIMk9lZVVxVWt6d0ZpbjBySWdPbUpnTURlSjRHTlFabXBs?=
 =?utf-8?B?YXk2M21CTkRveU1HNzNWdE5nUko4V1M0YTZMenRzV0FhaFp1cWZGUDRqdDdF?=
 =?utf-8?B?em8ydGFtbDJkMXZGUUdOZHZKc3FQanlacjRVRXdPU0xWbGs0TGdsdHg0c2JM?=
 =?utf-8?B?NUJzUm91NUNaOWVZOVhGeCtWMUZzK2NLOTl4L21vY3RwOFNGSkF4bGdJT0FV?=
 =?utf-8?B?bEk4Y0IrUXJ1eEVQbER1NERzS0RsVjBwODdwcExFR2twM0lCdDRQSFZNZWp0?=
 =?utf-8?B?bGFCbUZPRzMvVzRqbk43RUhVZVFFSG9TRkNUdFRNZkIzREpnbmRWMjI2Y0VY?=
 =?utf-8?B?S0svVDE2SXAvdTJqWklNOWJTdnc0Z0gvQVdsTmlxeXpIZzQrblBvUDlOS2k5?=
 =?utf-8?B?N3MyM25WVHJwTjR2UkcwdFkwTS9HbFhJMHpQRThUK0s2Q2UvcXlWWkZSeUdx?=
 =?utf-8?B?eGltMlAzSGYvdzY0eHc0amluVnhMMjdMK1o1TE1mN1FQL05qZjFSVjF5SzhU?=
 =?utf-8?B?QTdSeDJWbS9UWFRxRUsxdjlYSkxPYmQ1K0FXMVRXYTN0ajFRZEZlYU5iNEtU?=
 =?utf-8?B?UlBlWHhlNHJucHJqVjBTM01QTXFzTmdieDlxWWlzWkI2MnVGTWowZW5pZGdY?=
 =?utf-8?B?eEZUNjl0WTVOUnZLalE1UURqcGZnZkdOcm9DOW1CTHBXTU5KZjhUY3hSNDho?=
 =?utf-8?B?NS92YXJLTVNOVlhBTElGNjVrYUI1YzVrUld1Z1VYZzJWa2xzZlRrVCs4Q0tY?=
 =?utf-8?B?VG9IYm5idm5jZ2I0YjhoUzFvZXVBeGF1WFlXQStaTDVnZC9xOWN4WVNraTNl?=
 =?utf-8?B?NUhXY0JHaHIyRjJyQTM0encyS1lrbnFlWTFzMWJ2bEJrb3BUS2tvRnhTNlVm?=
 =?utf-8?B?UVN2N3NCaHBROHhFZzdTSjd4eU9WU1F4NmV4dnJqRlMxRVdmb0I1dDFtVjNK?=
 =?utf-8?B?OFhjZ3F4d0Ixb09aeHcrVlpTY1UzQ0VPNzF2cjgvdlZUR1BobDQwcXRzUHpa?=
 =?utf-8?B?UUg3Nno5SlkzeVorU0RpVVNpeXBLZXZrRlh4OGxIVnJpbmFlc1QxbEE2bmdN?=
 =?utf-8?B?WHBEUjN0Y3E5dndxa1Q1MlEvN3U0MUVBMnhZb2x1d2phaHVudjJ4aGdiUjRa?=
 =?utf-8?B?MFVJVEQzNVJ1R0JVV0FjcUtZb0FSdlJqWUJSYkowZ3hzdVZBc1Fqb2t3Q2hy?=
 =?utf-8?B?aW9JZS9iZHZDRkpFQWpvU0FSZGUzVkEwSDRqWVFXcDZuM3VWVFdrYXd3cjA1?=
 =?utf-8?B?ekpDSXBJL2dXci9GalRiVGordCtmTlFIV3NhZ0xIcHJ3STFqUjlDdkU1eVpt?=
 =?utf-8?Q?oadHW9T8ReTySsMbRYn0siRoHx2/OKlEheebI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blhyVC9iV1c0Ulk3NUx3STRrVktzV2xsZ3ZrYTRuOEw3MjU0cWxOUG5td3d4?=
 =?utf-8?B?dHZ5TTBUVnkrTWUzUGdQc2NRbmtEd3J1OExhRFRHVlM3Q0RnN3JVSlRUMGZX?=
 =?utf-8?B?Y25OWXRaZXJkWTYxMGh2WEdMQmhmVENHQzhBRDBVOWRjelNObUJFbHpIUENZ?=
 =?utf-8?B?T0lyVW9tdEgrUnFGR0NmYzVwT0daQzh4TUthWXdNem1YZUVXMzk1SUZqUVdj?=
 =?utf-8?B?RCtGdldqMDlTd3pydnl2SU04b1R1RTRvaS91SkNzbGFxa2EwamptZ1Erdlla?=
 =?utf-8?B?cE5XM3dnN0JOWnVoYjMrNXdORUFYWEk3WUI3V0U3ekQ1WDZjVWxYZDRZRDZq?=
 =?utf-8?B?ODJjRHYzbmp1MEt0K2JEWVZIdlNtSkZzYTFRd3UwTXh5eVJvQnhYclE4VWxs?=
 =?utf-8?B?YUZ4TCtxU2Vnd0p2ZHRLcXBMb0ZZamIxdmg5ZjdkZ1lRckVuVEFjRXo2Y2JU?=
 =?utf-8?B?T3ZVVDkrUnVydXlFUXNseUV3VEhTSDNRQnROZ2FZQVBjSUEyMThJQlBzeXgy?=
 =?utf-8?B?Z2FSOVNoa1ZpaFFkTGNzZzI2YjhlWGtRQUc2cUN5MEdWdUU5aSs4eUZhMmF0?=
 =?utf-8?B?L3dURVAycFdQQjdCTks0TWJKWURxYkNLd3RyVVZyTHFqYnBLTXd3OGhuYmx3?=
 =?utf-8?B?ZXM1TFlLYUFPV1hTcU5ScVdlNHF5eEVjZUNJVkFmbTVnOTBvczRpOU0xVDFw?=
 =?utf-8?B?czd5Nk5hUThkSFAvT1U4QUxZdzBQQjZiZVZyOVFaQXNWQndFNkErWm5GajA3?=
 =?utf-8?B?YkwrLy9ZRXdIVW4zVXozbDdvUWt5cVhVUmkzMGF2ejgxSXBkaEtvcnFTTmV2?=
 =?utf-8?B?QjYwWXZ3ZGJzVXZaTW04VWlsbnRhYngwVG8wVTcrd2Q3Uy9sM2tLaWFGWmIv?=
 =?utf-8?B?TzVFcUxsVTVkT1FvMEhpc3BoV0pxQnJpZ1VPemV2dG9zM0lKY0o5WHpNTUE0?=
 =?utf-8?B?V3NVZnl4NDNXQVdnSm91L2pjaDJ1cjFYRXF3ZENtTW5BZkpuRU1xbE9FL2pP?=
 =?utf-8?B?d1NhU0lkM0g3WjVGYkN3d09RVUxwNnh0aitmY1ltMFN1SVAvcXJvZ1d2QXJU?=
 =?utf-8?B?L3JveFg5UFZXalB0aEhMcmhwUVQ3aUVlTk5kSTVreGxvWnpSTHh3YkxudFV3?=
 =?utf-8?B?eHZPeHBGU1BWang3RHJJOGRGQVFXUUdpVnFrVkl6RnVTMm5oVnNjNjhyazJy?=
 =?utf-8?B?STlEZlVlVjdVM2Nud3I0bFNQY1NsZFl2ekZ6bGV1alNud1RwZjh6OGViN2hN?=
 =?utf-8?B?WTRCUFBOWWlhWTVVeEJJbTlKaG1KT0NWWjk2cHdVcGlHUDRmS2tCMzYwNGhD?=
 =?utf-8?B?N3hsamlFaHJFSnZkUDVOWHgwc20reERMMU9HbWVLSCszL1BwTGMvUSt5dlNn?=
 =?utf-8?B?Ny9NS0ROc2QwL2VCQm9PUlpQSENCWTVHZEVlNzI0Yjl5RklSSjNMYnJqYjM3?=
 =?utf-8?B?MEhlYmJReG1kL29JUlhDQlRxUzhDZ2RzLzBaS0VOcGgxby9zQzhTTHRybEhP?=
 =?utf-8?B?SDE0YjJ0MTlMK3lRN3ZaMTFkaXJQMzlNQVA3U3dSWDExNEZHMGZCTUxJMWV6?=
 =?utf-8?B?ZzZWTDhXak9iaGtHbUFVRHAxdEsrL0dRelVjRlA5SExiamNVNVdtTjcwd08x?=
 =?utf-8?B?Q00rdlBUL0FhUnN2L1V5WWtvK25ER0dzdmpNektIOEp0NTdtYzByU243NDZX?=
 =?utf-8?B?ODFmU3NtelNTNXpCUnBPb3RxR2REMUF0VWxxYjM0cHMyTDljY242YmxNOE5M?=
 =?utf-8?B?QzdERkEwN244R2V1YU5VR0ZtTkxRUkpiU1UyUE0wZjU2QndTZGV4QUVtdFBF?=
 =?utf-8?B?MFpPYTgzeHd3MmJQUlZDK3BJRTJjU01lblF3Z0o0N01YVGVzWjRSOTBCR2VX?=
 =?utf-8?B?b1dDZkE4RzJ6TWpMSGh3NHVQK3JJNUtwdk5YTXc4dnVVWVZOYTlYR251UGhz?=
 =?utf-8?B?Wms0WVJKN3J5ZTBpV3JJNjR1bXltbzZmYkpWWFNPREJzVlZENzc1VmVVWlQ4?=
 =?utf-8?B?NEJ6ZFFvVW5qbFkyK3lpTkJvZGxVbEhmSUFCa0ZFL0lzTWlFNUs3ckxyN2NO?=
 =?utf-8?B?Y3BObEtFbDZxQnZ6Qm9sWi9CREswYzczMjRPK0Q2K1F6TWtOZ25vbFI0RDBy?=
 =?utf-8?Q?jKkld3rtN98hmPRFGhMb+W9Bf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90595e85-58d1-491a-5967-08dd8451c6b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 23:34:51.9729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtF/z/AQ1cpIjtTozMHR+rM0NxbBHZHphaRZ70OEmoNeglf4eLid7zUyDMFQ5iTpeql7N7ix8lok8Xgym1bAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7984
Cc: imx@lists.linux.dev, "Shah, Tanmay" <tanmay.shah@amd.com>,
 linux-remoteproc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 "Andrew F. Davis" <afd@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gTWF0aGlldSwgUm9iLAoKSSd2ZSB0ZXN0ZWQgaW14X2RzcF9ycHJvYyBhbmQgaXQgZmFp
bHMgd2l0aDoKClvCoMKgIDM5Ljc0Mzc3MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5n
IHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIApmZmZmZmZmZmZmZmZmZmVhCi4uLgpbwqDCoCAz
OS44MDUwNzhdIEhhcmR3YXJlIG5hbWU6IE5YUCBpLk1YOE1QbHVzIEVWSyBib2FyZCAoRFQpClvC
oMKgIDM5LjgxMDM5MF0gcHN0YXRlOiAwMDAwMDAwNSAobnpjdiBkYWlmIC1QQU4gLVVBTyAtVENP
IC1ESVQgLVNTQlMgCkJUWVBFPS0tKQpbwqDCoCAzOS44MTczNTNdIHBjIDogX19waV9tZW1zZXRf
Z2VuZXJpYysweDUwLzB4MTg4ClvCoMKgIDM5LjgyMTg5Ml0gbHIgOiBpbXhfZHNwX3Jwcm9jX3By
ZXBhcmUrMHgzYTQvMHhlYTQgW2lteF9kc3BfcnByb2NdClvCoMKgIDM5LjgyODA3OV0gc3AgOiBm
ZmZmODAwMDg1M2RiYjEwClvCoMKgIDM5LjgzMTM5Nl0geDI5OiBmZmZmODAwMDg1M2RiYjkwIHgy
ODogMDAwMDAwMDA5MjQwMDAwMCB4Mjc6IApmZmZmODAwMDdhMzZkM2Q4ClvCoMKgIDM5LjgzODU0
MF0geDI2OiBmZmZmMDAwMGQwYTVlNDEwIHgyNTogZmZmZjgwMDA3YTM2ZDNmMCB4MjQ6IAowMDAw
MDAwMDAwMDAwMDA0ClvCoMKgIDM5Ljg0NTY4NV0geDIzOiBmZmZmMDAwMGQ1NDE0ODgwIHgyMjog
ZmZmZjAwMDBkNWUxZGNlOCB4MjE6IAowMDAwMDAwMDAwMDAwMDAwClvCoMKgIDM5Ljg1MjgyN10g
eDIwOiBmZmZmMDAwMGQ1ZTFkYjk4IHgxOTogZmZmZjAwMDBkNTQxNGI4MCB4MTg6IAowMDAwMDAw
MGZmZmZmZmZmClvCoMKgIDM5Ljg1OTk3MF0geDE3OiAyMDJjNjU2YzY5Njg3NzIwIHgxNjogM2Uy
MDc0NzU2ZjY1NzY3MiB4MTU6IApmZmZmODAwMDgxZjhkMDUwClvCoMKgIDM5Ljg2NzExNF0geDE0
OiBmZmZmMDAwMGRiNTg0NjgwIHgxMzogMDAwMDAwMDAwMDAwMDAwMyB4MTI6IAowMDAwN2ZmZmEz
MzMwMDAwClvCoMKgIDM5Ljg3NDI1N10geDExOiAwMDAwMDAwMDAwMDAwMDA0IHgxMDogMDAwMDAw
MDAwMDAwMGFiMCB4OSA6IAowMDAwMDAwMDAwMDAwMDAwClvCoMKgIDM5Ljg4MTQwMF0geDggOiBm
ZmZmZmZmZmZmZmZmZmVhIHg3IDogMDAwMDAwMDAwMDAwMDAwMCB4NiA6IAowMDAwMDAwMDAwMDAw
MDNmClvCoMKgIDM5Ljg4ODU0Nl0geDUgOiAwMDAwMDAwMDAwMDAwMDQwIHg0IDogMDAwMDAwMDAw
MDAwMDAwNiB4MyA6IAowMDAwMDAwMDAwMDAwMDA0ClvCoMKgIDM5Ljg5NTY4OV0geDIgOiAwMDAw
MDAwMDAwMDA4MDAwIHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6IApmZmZmZmZmZmZmZmZmZmVh
ClvCoMKgIDM5LjkwMjgzN10gQ2FsbCB0cmFjZToKW8KgwqAgMzkuOTA1Mjg0XcKgIF9fcGlfbWVt
c2V0X2dlbmVyaWMrMHg1MC8weDE4OCAoUCkKW8KgwqAgMzkuOTA5ODIxXcKgIHJwcm9jX2Jvb3Qr
MHgyYzAvMHg1MjQKW8KgwqAgMzkuOTEzMzE3XcKgIHN0YXRlX3N0b3JlKzB4NDAvMHgxMDAKW8Kg
wqAgMzkuOTE2ODEyXcKgIGRldl9hdHRyX3N0b3JlKzB4MTgvMHgyYwpbwqDCoCAzOS45MjA0Nzhd
wqAgc3lzZnNfa2Zfd3JpdGUrMHg3Yy8weDk0ClvCoMKgIDM5LjkyNDE0Nl3CoCBrZXJuZnNfZm9w
X3dyaXRlX2l0ZXIrMHgxMjAvMHgxZTgKW8KgwqAgMzkuOTI4NTk4XcKgIHZmc193cml0ZSsweDI0
NC8weDM3YwpbwqDCoCAzOS45MzIwMDhdwqAga3N5c193cml0ZSsweDcwLzB4MTEwClvCoMKgIDM5
LjkzNTQxM13CoCBfX2FybTY0X3N5c193cml0ZSsweDFjLzB4MjgKW8KgwqAgMzkuOTM5MzQyXcKg
IGludm9rZV9zeXNjYWxsKzB4NDgvMHgxMDQKW8KgwqAgMzkuOTQzMDk0XcKgIGVsMF9zdmNfY29t
bW9uLmNvbnN0cHJvcC4wKzB4YzAvMHhlMApbwqDCoCAzOS45NDc4MDVdwqAgZG9fZWwwX3N2Yysw
eDFjLzB4MjgKW8KgwqAgMzkuOTUxMTIzXcKgIGVsMF9zdmMrMHgzMC8weGNjClvCoMKgIDM5Ljk1
NDE4OF3CoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEwYy8weDEzOApbwqDCoCAzOS45NTg1NDld
wqAgZWwwdF82NF9zeW5jKzB4MTk4LzB4MTljClvCoMKgIDM5Ljk2MjIyMl0gQ29kZTogZDY1ZjAz
YzAgY2IwODAzZTQgZjI0MDBjODQgNTQwMDAwODAgKGE5MDAxZDA3KQpbwqDCoCAzOS45NjgzMTdd
IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQoKVGhlIHByb2JsZW0gc2VlbXMg
dG8gYmUgd2hlbiBjb21wdXRpbmcgYGNwdV9hZGRyID0gCmRldm1faW9yZW1hcF9yZXNvdXJjZV93
YyhkZXYsICZyZXMpO2AsIGluIHBhdGNoIDQuCkluIGBfX2Rldm1faW9yZW1hcF9yZXNvdXJjZWAg
KHNlZSBbMV0pLCBpdCdzIGV4cGVjdGluZyB0aGUgcmVzb3VyY2UgdHlwZSAKdG8gYmUgYElPUkVT
T1VSQ0VfTUVNYCwgd2hpY2ggaXMgbm90IHRoZSBjYXNlIGhlcmUgKGF0IGxlYXN0IHRoZSBmbGFn
cyAKYXJlIG5vd2hlcmUgc2V0IGZvciB0aGlzKS4KCkEgcXVpY2sgZml4IHdvdWxkIGJlIHRvIGxl
dCB0aGUgYGNwdV9hZGRyYCBiZSBjYWxjdWxhdGVkIGFzIGJlZm9yZTogCmBjcHVfYWRkciA9IGRl
dm1faW9yZW1hcF93YyhkZXYsIHJlcy5zdGFydCwgcmVzb3VyY2Vfc2l6ZSgmcmVzKSk7YC4KClRo
YW5rcywKSXVsaWEKClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNC4z
L3NvdXJjZS9saWIvZGV2cmVzLmMjTDEzNAoKT24gNC8yNC8yMDI1IDU6MTQgUE0sIE1hdGhpZXUg
UG9pcmllciB3cm90ZToKPiBBcm5hdWQsIERhbmllbCwgSXVsaWFuYSwgQW5kcmV3IGFuZCBUYW5t
YXkgLSBwbGVhc2UgdGVzdCB0aGlzIHBhdGNoc2V0Cj4gb24gdGhlIHBsYXRmb3JtcyB5b3UgYXJl
IHdvcmtpbmcgb24uCj4KPiBUaGFua3MsCj4gTWF0aGlldQo+Cj4gT24gV2VkLCAyMyBBcHIgMjAy
NSBhdCAxMzo0MiwgUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
IFdoaWxlIHRoZXJlJ3MgYSBjb21tb24gZnVuY3Rpb24gdG8gcGFyc2UgIm1lbW9yeS1yZWdpb24i
IHByb3BlcnRpZXMgZm9yCj4+IERNQSBwb29sIHJlZ2lvbnMsIHRoZXJlJ3Mgbm90IGFueXRoaW5n
IGZvciBkcml2ZXIgcHJpdmF0ZSByZWdpb25zLiBBcyBhCj4+IHJlc3VsdCwgZHJpdmVycyBoYXZl
IHJlc29ydGVkIHRvIHBhcnNpbmcgIm1lbW9yeS1yZWdpb24iIHByb3BlcnRpZXMKPj4gdGhlbXNl
bHZlcyByZXBlYXRpbmcgdGhlIHNhbWUgcGF0dGVybiBvdmVyIGFuZCBvdmVyLiBUbyBmaXggdGhp
cywgdGhpcwo+PiBzZXJpZXMgYWRkcyAyIGZ1bmN0aW9ucyB0byBoYW5kbGUgdGhvc2UgY2FzZXM6
Cj4+IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UoKSBhbmQgb2ZfcmVzZXJ2ZWRf
bWVtX3JlZ2lvbl9jb3VudCgpLgo+Pgo+PiBJJ3ZlIGNvbnZlcnRlZCB0aGUgd2hvbGUgdHJlZSwg
YnV0IGp1c3QgaW5jbHVkaW5nIHJlbW90ZXByb2MgaGVyZSBhcwo+PiBpdCBoYXMgdGhlIG1vc3Qg
Y2FzZXMuIEkgaW50ZW5kIHRvIGFwcGx5IHRoZSBmaXJzdCAzIHBhdGNoZXMgZm9yIDYuMTYKPj4g
c28gdGhlIGRyaXZlciBjb252ZXJzaW9ucyBjYW4gYmUgYXBwbGllZCBmb3IgNi4xNy4KPj4KPj4g
QSBnaXQgdHJlZSB3aXRoIGFsbCB0aGUgZHJpdmVycyBjb252ZXJ0ZWQgaXMgaGVyZVsxXS4KPj4K
Pj4gdjI6Cj4+IC0gRml4IG9mX2RtYV9zZXRfcmVzdHJpY3RlZF9idWZmZXIoKSB0byBtYWludGFp
biBiZWhhdmlvciBvbiB3YXJuaW5nIG1zZwo+PiAtIEV4cG9ydCBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2Vfd2MoKQo+PiAtIFJld29yayBoYW5kbGluZyBvZiByZXNvdXJjZSBuYW1lIHRvIGRyb3AgdW5p
dC1hZGRyZXNzIGZyb20gbmFtZSBhcyBpdAo+PiAgICB3YXMgYmVmb3JlLgo+PiAtIExpbmsgdG8g
djE6Cj4+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDMxNzIzMjQyNi45NTIx
ODgtMS1yb2JoQGtlcm5lbC5vcmcKPj4KPj4gWzFdIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdCBkdC9tZW1vcnktcmVnaW9uCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IC0t
LQo+PiBSb2IgSGVycmluZyAoQXJtKSAoNCk6Cj4+ICAgICAgICBvZjogcmVzZXJ2ZWRfbWVtOiBB
ZGQgZnVuY3Rpb25zIHRvIHBhcnNlICJtZW1vcnktcmVnaW9uIgo+PiAgICAgICAgb2Y6IFNpbXBs
aWZ5IG9mX2RtYV9zZXRfcmVzdHJpY3RlZF9idWZmZXIoKSB0byB1c2Ugb2ZfZm9yX2VhY2hfcGhh
bmRsZSgpCj4+ICAgICAgICBkZXZyZXM6IEV4cG9ydCBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vfd2Mo
KQo+PiAgICAgICAgcmVtb3RlcHJvYzogVXNlIG9mX3Jlc2VydmVkX21lbV9yZWdpb25fKiBmdW5j
dGlvbnMgZm9yICJtZW1vcnktcmVnaW9uIgo+Pgo+PiAgIGRyaXZlcnMvb2YvZGV2aWNlLmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgMzEgKysrKystLS0tLS0tCj4+ICAgZHJpdmVycy9vZi9vZl9y
ZXNlcnZlZF9tZW0uYyAgICAgICAgICAgICAgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+ICAgZHJpdmVycy9yZW1vdGVwcm9jL2lteF9kc3BfcnByb2MuYyAgICAgICAgfCA0
NSArKysrKysrLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyAg
ICAgICAgICAgIHwgNjggKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL3Jl
bW90ZXByb2MvcWNvbV9xNnY1X2Fkc3AuYyAgICAgICB8IDI0ICsrKystLS0tLS0KPj4gICBkcml2
ZXJzL3JlbW90ZXByb2MvcWNvbV9xNnY1X21zcy5jICAgICAgICB8IDYwICsrKysrKysrLS0tLS0t
LS0tLS0tLS0tCj4+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3Fjb21fcTZ2NV9wYXMuYyAgICAgICAg
fCA2OSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9x
Y29tX3E2djVfd2Nzcy5jICAgICAgIHwgMjUgKysrKy0tLS0tLQo+PiAgIGRyaXZlcnMvcmVtb3Rl
cHJvYy9xY29tX3djbnNzLmMgICAgICAgICAgIHwgMjMgKysrKy0tLS0tCj4+ICAgZHJpdmVycy9y
ZW1vdGVwcm9jL3JjYXJfcnByb2MuYyAgICAgICAgICAgfCAzNiArKysrKystLS0tLS0tLQo+PiAg
IGRyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMgICAgICAgIHwgNDEgKysrKysrKyst
LS0tLS0tLQo+PiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jICAgICAgICAgIHwg
NDQgKysrKysrKystLS0tLS0tLS0KPj4gICBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNfZHNwX3Jl
bW90ZXByb2MuYyB8IDI4ICsrKysrLS0tLS0tCj4+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3RpX2sz
X200X3JlbW90ZXByb2MuYyAgfCAyOCArKysrKy0tLS0tLQo+PiAgIGRyaXZlcnMvcmVtb3RlcHJv
Yy90aV9rM19yNV9yZW1vdGVwcm9jLmMgIHwgMjggKysrKystLS0tLS0KPj4gICBkcml2ZXJzL3Jl
bW90ZXByb2MveGxueF9yNV9yZW1vdGVwcm9jLmMgICB8IDUxICsrKysrKysrLS0tLS0tLS0tLS0t
Cj4+ICAgaW5jbHVkZS9saW51eC9vZl9yZXNlcnZlZF9tZW0uaCAgICAgICAgICAgfCAyNiArKysr
KysrKysrCj4+ICAgbGliL2RldnJlcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4+ICAgMTggZmlsZXMgY2hhbmdlZCwgMzM5IGluc2VydGlvbnMoKyksIDM2OSBkZWxldGlv
bnMoLSkKPj4gLS0tCj4+IGJhc2UtY29tbWl0OiAwYWYyZjZiZTFiNDI4MTM4NWI2MThjYjg2YWQ5
NDZlZGVkMDg5YWM4Cj4+IGNoYW5nZS1pZDogMjAyNTA0MjMtZHQtbWVtb3J5LXJlZ2lvbi12Mi1h
MmIxNWNhYWNjNjMKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiAtLQo+PiBSb2IgSGVycmluZyAoQXJt
KSA8cm9iaEBrZXJuZWwub3JnPgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
