Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4AA33332
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 00:10:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF8D5C6DD9A;
	Wed, 12 Feb 2025 23:10:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63950C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 23:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKlngkmdNDJh/yWq7HGn2fmvOj5Lcg9zuALE5GeR1SbG/ktPlBMk+jC07PvIgou7Z8Dk7N8kZrfH08YreAQoNHWDkhCm671M630rMb4a3vpdwo7wlJNDlS+b6RK2mn1+xxgYQdKjq9hzj9b8mZC6p0ZKo2Tn3ZFowIVi8baxVuBaOISc9Oxfn2f8bOb1Xg8+pjbPtRZ5ysVHQgtEE6aubVqzOWkX6173aVqLLldBBN69TjTkZ43ZuCnx5Wwcc6SL2WGngzJKKXgd8Fby3/Mgrcr4N5SIoKZ5Da24czvny6wIGU76Nbaq6JF5KVUuSOVuZYxTPweh6ZcUth/1eI9Ayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ufTQ+UPzzgBestUZjKF4q9YoZVKOh1u7P6OWeSFlI=;
 b=MumjsyksA1eoI118RJCtuNJB4lWSSequsHNQ6auqfp+XxBU+Te+qBMj3pa+LzoES0M8L/yyQMPaDUnF2Kmlu0edMCc+serH8yFH2KJvhED9LzXNvM3xLnKIDSyUWHeACvAa3muRxXNM1E2FjmwZwil+kwn5s9tTe5LI8prDGifoeNjLWTX5MYnoOIbqJBXTE8gqN0WJ6Jl5J1EjNSWNjhkIvGn7ROmWYITp/ZUWZdA++u8V8mzvaQxHU8EHZGMqn58Pjnce0rDbToe0F/RF5s2bwMlv/iKlG7ci/p1NduFokS02raSxi7Snk+P0zvVlAa/apc+bjIHe7OUWS7y2eOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ufTQ+UPzzgBestUZjKF4q9YoZVKOh1u7P6OWeSFlI=;
 b=EDhWvl4J27Hgq3Cx4yEMwh6N3llQMVbcWUt/me0lZWWytHPpyGls7+ypwyws5m3zXzMnuSr4ABK8F1CUGGXoOS2n1TJmHkh2jQt0NxPz+W/SeSR4vhjopyRPpktIDji9LiuOTC1fUAGYHebK0ab1FKzQ+kTP74BkzpQhxbY+y19PcWIoejJaYL6w7fBkrgmM7wuM+05QJ5nY80YoMNm9NY8UAgJZAo/Npf5WbGfhfUbylMUGbCnQVldG8mwNIaIXX6dCg0fu8JWTEvbIHn+dPRyUl5va51RkEvGlr3BXLXtTBX0i7iCIEnek3/2ltYDdOVvz/ig9mrgMuUI7bI6j8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 23:09:55 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 23:09:55 +0000
Date: Thu, 13 Feb 2025 01:09:51 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250212230951.2lx7fba6avurmgls@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-2-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250210070207.2615418-2-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR09CA0098.eurprd09.prod.outlook.com
 (2603:10a6:803:78::21) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1aa7b5-79d4-41e2-508f-08dd4bba5cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/VbmTTswx1grzUsbL4w4FNmjYeduuirTcNDWJaFSYaEfRQUpVd8u7xSeNe0K?=
 =?us-ascii?Q?48iadAOqfqJfmxUwP/ehBKX0wEoSCmkI+TTUUpSazVovVr72vluBEra6ay7Z?=
 =?us-ascii?Q?wo5cDtL4lhSxf7/iVclxYk6zQgTc88YVKw68dvrLAhzkDkmzvFwZGvCNHlAI?=
 =?us-ascii?Q?xAu7ZuH0X357r4w9mwK+HPfHNFMV+g5W0AGYjC+BvS62ieMiPGPTEYkIIT0R?=
 =?us-ascii?Q?/+S+h2zfMRjHBeAKJOGt5uYw+mjLAxnA7pmYmZ+us1cRrTY6nxAjsFTV6XIQ?=
 =?us-ascii?Q?fdnAr0j73Hx9ZGRMnXiN0kbgxj4ehgvxvGSJuDlHUyeseKSxXqZXX0BpAoyW?=
 =?us-ascii?Q?UbeUcTLnAGrf7+sqgp3u0py6RInl919YjI+FhGG9iWwlt57pRdUFpu/gXWMP?=
 =?us-ascii?Q?h4zjNknLfl1LjsLDTL9uKhpUNJb2QEoFg60NrQGTQQkaLze7/c4HUpgnyFta?=
 =?us-ascii?Q?tRxAIln5eiKm4IA3o+mQ3m7LeELRj4EMEY6ZwHoNSE9BcD02mR2jpl76XLus?=
 =?us-ascii?Q?vd8ZOHuU/XK1RTRopyiT71GI0JvGxseclxGt0Cu4YjVv4t4L1CstTNYIMHIT?=
 =?us-ascii?Q?utCriQ3Q4ZZt2p1cAij4e0mxIZL9SsV7LZfBu2DnVxGKEUbpKUFLdOI1vRCx?=
 =?us-ascii?Q?xuscBgY+QCs/q0UJrjJ2/UMMaWm3umqScYVDXwwvOha6kBhxAMCcqaNUezvK?=
 =?us-ascii?Q?8bn734kHVdeVP77FWbK1LS4M2qslxA7DmxDnHsUTlpE5fFBcva8vvDaCGGoq?=
 =?us-ascii?Q?gpUj/08Fu7qEbrop4NqObPfx3Soa8Ir8kJMN0ouX9SMrLH6QZ7MQloLTeO6u?=
 =?us-ascii?Q?9OW91GMyTwzm1sYPS9+3cINLnYwMZossLBKBiCQcOnYgf1OKzgYljy78Ey7U?=
 =?us-ascii?Q?ZbpdfpHrW8nrzOBTiaBBML0sxw0NLA3D5BE6z2w6mlrDc2LOpYSi5ilNwrxs?=
 =?us-ascii?Q?K9tFjH9cvhVnWyVUmSJ4aq4mu6jYwIC6cqKcS0jxHfoqBoPK0jbho/FLuxLP?=
 =?us-ascii?Q?3hnM92Dlyj+yLAgVFmxt8gwPZuL9JVrRdKOlHv6pZOHuIq+8wQsfyvDmxWCF?=
 =?us-ascii?Q?9fNyAEcNcm6rCsgsViTs6yZCy1JEkOWeeeBWENfLepRM13OlBqWHiKHszU8w?=
 =?us-ascii?Q?5U8HcBK9pgeIfh+qnDUniIPwVTYNnPU0T1sukNKXitBH8tFt4hMgedsK9qaS?=
 =?us-ascii?Q?tLJxX4h/qcvMsBrkYtvfTgr9F8AfYyKPmb8cdpdLB2jrsbqoe1/e5FPz5ANe?=
 =?us-ascii?Q?KKz8kqQ7e/MgrbCMweoytujZL1mgmxxqdcVpSQVlJykhUnpjhgG1oX9dR7l4?=
 =?us-ascii?Q?RITOmSV3dEpsuj+RQWLNmkG3UIet846iPC89IiK9SH5mZhfdOYy80qbYmtzX?=
 =?us-ascii?Q?HzcUp6DQhlAjPP1rbhKRI7RC73sB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/uXpMvc55azn4LvZiYHOHDuW04DH1UyJA6zjl5s06dbW8OX8MEVAA7Seo+5?=
 =?us-ascii?Q?y8Rbr0sR01mwhSfkbnhdCfBuCMfYt0x8sI1XazUgygiLELc3NBBnIb3qJqzl?=
 =?us-ascii?Q?Qgi/vePsO1nu/BoIQBS2dn+nA+0jJSknDkshPw5XEu9zWffrDlZRy7kypuMg?=
 =?us-ascii?Q?FCORfBch3fRLiIOEfLZYLaI7cHWNnQNBaTWEPA5zdko46XOR05akTitpxL56?=
 =?us-ascii?Q?eVPcINFkjktyZY0qoBNIEd2bgKe8srj7Umx3lqY4+cP0fSbKCaoP4pvkal1z?=
 =?us-ascii?Q?IFopVNJUrtbGq35TBvUTU4FvwihmXK5D+NtMfR+dUqqU7bGCK9KAiOM8aBkZ?=
 =?us-ascii?Q?EwQD1mTA8BHn/hFwZmpyz0n1+llxOpuZtv0lRcWPqGqj39NHhcBP8DFMgE/x?=
 =?us-ascii?Q?x2XjZ1BxJGJ0gP6G4rIr4zF4BVHnIcZ1ECdaahYPM15/eOkEKPmxsKrYdPyn?=
 =?us-ascii?Q?6PGsHcdXUDBVFBK90VKP6W+DQrkCvH+b2OUilz5ETdCNC0bFNbliMB70RxUa?=
 =?us-ascii?Q?HhTeWEb66kf6kC6UVEGevj7K9uZxZMdVXq/prHamRdNIAFi78eM+RrB0//jH?=
 =?us-ascii?Q?xZwKw4D1qxN8ZtcpUZOFIV4z0pD/AOHzWzIOGPwVcWfJUMT++zaWYe5TLXD5?=
 =?us-ascii?Q?Ssknpm0ztWl5OqY6yKc9pFFYct1TJ9Apuu3a/BF96ZtR+RbxQ8hAWiXprDsS?=
 =?us-ascii?Q?/6L+MW5JHNY/rIkF07CLhvmx4syIZyWdXMHkerDyROr6iMqvwvgrQe9RHxk6?=
 =?us-ascii?Q?NmlI9H1FmEJsgRz3w5f1MA0fWPeGc7fG8pgtFpY91SFX5M3MZZbDB9bF6mBq?=
 =?us-ascii?Q?r/KeZXVFD5d9+5n9G3UtPBfCE4DNS4qLm7mam7U+i93PWiMzaclJ++IUyIYM?=
 =?us-ascii?Q?AFEUQXAn6mRHOf54L5lKzIvoKzrNfFqlFubD5ZANiRT8iaQsI0lPOxiaojjo?=
 =?us-ascii?Q?KgS03PWQ3GivUD6HAKAbsAAS7FczProQuc0uNJsugmXZDI3IWTgJTKlbtqO5?=
 =?us-ascii?Q?aesbocI3MR5bUoDScD8So9EzHLHkxNVoFlbrOKfuWVcsfniWktaj+NW8dgwP?=
 =?us-ascii?Q?iYNVPMzVu8lSRpL3QhWAyyqk054Oa1QA3T0t6loDKl61N2XFy4E+qxh+usTL?=
 =?us-ascii?Q?OXFpZk6p36HHe3n3HGbhdsj0vYa/Vd2ZNENfUxuBDmPUtBRhzlRCwD65Rqmn?=
 =?us-ascii?Q?YWw4DNcFwB7+ov191omWaxD6olkHrf5Fl1LepQMWHRBuf6j4PvXVtHJUiQ/8?=
 =?us-ascii?Q?Fd8e8uwWUO6gusMn/Gb69ippvcHDlsqRi/Tly04XCCZE8SyjUNsYya+e+uC8?=
 =?us-ascii?Q?2oSkOe4/S92b9Pqb/XAbBdS2C3SXyBKIVdteFX6IIH6aSGl45Ptp6UU0ihSP?=
 =?us-ascii?Q?2Ug1usYPFHCHdng5Ukh0dgiIrQTtBeXOkKOf14cb5t7SdV6wu7l6U104htSl?=
 =?us-ascii?Q?OiURj1Du7EGppNM1Wq/BK2nZGRhFiyi/+VvdCqQsrqF6u0uaQBZpDlW2VZQn?=
 =?us-ascii?Q?sI8myPcq+4i/gEbyQCEQRW2l4w+AbnajFQ38GpeyDHXQ0RVohxupky8yYQ1I?=
 =?us-ascii?Q?6CILFs8mzMU+RPJ+yOpCs2bTr3Pw2EOJQfSklyhU0xfS93riDLtjyWwaqK5e?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1aa7b5-79d4-41e2-508f-08dd4bba5cbd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 23:09:55.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhM67HiNf4vrlXJrqZcsgT9iezgfER7q52NTJPqQXn2KVQRxtYFk0T0atQh2XqwMDW8XG1RohkINZSlpnc4T+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Mon, Feb 10, 2025 at 02:01:59AM -0500, Faizal Rahim wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> It appears that stmmac is not the only hardware which requires a
> software-driven verification state machine for the MAC Merge layer.
> 
> While on the one hand it's good to encourage hardware implementations,
> on the other hand it's quite difficult to tolerate multiple drivers
> implementing independently fairly non-trivial logic.
> 
> Extract the hardware-independent logic from stmmac into library code and
> put it in ethtool. Name the state structure "mmsv" for MAC Merge
> Software Verification. Let this expose an operations structure for
> executing the hardware stuff: sync hardware with the tx_active boolean
> (result of verification process), enable/disable the pMAC, send mPackets,
> notify library of external events (reception of mPackets), as well as
> link state changes.
> 
> Note that it is assumed that the external events are received in hardirq
> context. If they are not, it is probably a good idea to disable hardirqs
> when calling ethtool_mmsv_event_handle(), because the library does not
> do so.
> 
> Also, the MM software verification process has no business with the
> tx_min_frag_size, that is all the driver's to handle.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Co-developed-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +---
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++-----------
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
>  include/linux/ethtool.h                       |  61 +++++
>  net/ethtool/mm.c                              | 222 ++++++++++++++++++
>  7 files changed, 327 insertions(+), 200 deletions(-)

So I'm not exactly sure how this is supposed to work, but this is moving
a non-negligible portion of code from stmmac_fpe.c which has Furong Xu's
copyright, to ethtool/mm.c which doesn't. That being said, commit
8d43e99a5a03 ("net: stmmac: refactor FPE verification process") which
added that logic said that it was co-developed together with me (NXP),
and I clearly remember both of us contributing to it. So, how about
expanding NXP's current 2022-2023 copyright in ethtool/mm.c to
2022-2025 (date of commit 8d43e99a5a03 plus date of this patch), and
also copy Furong's copyright 2024 line?

> @@ -710,6 +714,63 @@ struct ethtool_mm_stats {
>  	u64 MACMergeHoldCount;
>  };
>  
> +enum ethtool_mmsv_event {
> +	ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET,
> +	ETHTOOL_MMSV_LD_SENT_VERIFY_MPACKET,
> +	ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET,
> +};
> +
> +/* MAC Merge verification mPacket type */
> +enum ethtool_mpacket {
> +	ETHTOOL_MPACKET_VERIFY,
> +	ETHTOOL_MPACKET_RESPONSE,
> +};
> +
> +struct ethtool_mmsv;
> +
> +struct ethtool_mmsv_ops {

Since these are driver-facing API, how about a kernel-doc? The content
is subject to further review comments, of course.

/**
 * struct ethtool_mmsv_ops - Operations for MAC Merge Software Verification
 * @configure_tx: Driver callback for the event where the preemptible TX
 *		  becomes active or inactive. Preemptible traffic
 *		  classes must be committed to hardware only while
 *		  preemptible TX is active.
 * @configure_pmac: Driver callback for the event where the pMAC state
 *		    changes as result of an administrative setting
 *		    (ethtool) or a call to ethtool_mmsv_link_state_handle().
 * @send_mpacket: Driver-provided method for sending a Verify or a Response
 *		  mPacket.
 */

> +	void (*configure_tx)(struct ethtool_mmsv *mmsv, bool tx_active);
> +	void (*configure_pmac)(struct ethtool_mmsv *mmsv, bool pmac_enabled);
> +	void (*send_mpacket)(struct ethtool_mmsv *mmsv, enum ethtool_mpacket mpacket);
> +};
> +
> +/**
> + * struct ethtool_mmsv - MAC Merge Software Verification
> + * @ops: operations for MAC Merge Software Verification
> + * @dev: pointer to net_device structure
> + * @lock: serialize access to MAC Merge state between
> + *	  ethtool requests and link state updates.
> + * @status: current verification FSM state
> + * @verify_timer: timer for verification in local TX direction
> + * @verify_enabled: indicates if verification is enabled
> + * @verify_retries: number of retries for verification
> + * @pmac_enabled: indicates if the preemptible MAC is enabled
> + * @verify_time: time for verification in milliseconds
> + * @tx_enabled: indicates if transmission is enabled
> + */
> +struct ethtool_mmsv {
> +	const struct ethtool_mmsv_ops *ops;
> +	struct net_device *dev;
> +	spinlock_t lock;
> +	enum ethtool_mm_verify_status status;
> +	struct timer_list verify_timer;
> +	bool verify_enabled;
> +	int verify_retries;
> +	bool pmac_enabled;
> +	u32 verify_time;
> +	bool tx_enabled;
> +};
> +

/**
 * ethtool_mmsv_stop() - Stop MAC Merge Software Verification
 * @mmsv: MAC Merge Software Verification state
 *
 * Drivers should call this method in a state where the hardware is
 * about to lose state, like ndo_stop() or suspend(), and turning off
 * MAC Merge features would be superfluous. Otherwise, prefer
 * ethtool_mmsv_link_state_handle() with up=false.
 */
> +void ethtool_mmsv_stop(struct ethtool_mmsv *mmsv);

/**
 * ethtool_mmsv_link_state_handle() - Inform MAC Merge Software Verification
 *				      of link state changes
 * @mmsv: MAC Merge Software Verification state
 * @up: True if device carrier is up and able to pass verification packets
 *
 * Calling context is expected to be from a thread, interrupts enabled.
 */
> +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up);

/**
 * ethtool_mmsv_event_handle() - Inform MAC Merge Software Verification
 *				 of interrupt-based events
 * @mmsv: MAC Merge Software Verification state
 * @event: Event which took place (packet transmission or reception)
 *
 * Calling context expects to have interrupts disabled.
 */
> +void ethtool_mmsv_event_handle(struct ethtool_mmsv *mmsv,
> +			       enum ethtool_mmsv_event event);

/**
 * ethtool_mmsv_get_mm() - get_mm() hook for MAC Merge Software Verification
 * @mmsv: MAC Merge Software Verification state
 * @state: see struct ethtool_mm_state
 *
 * Drivers are expected to call this from their ethtool_ops :: get_mm()
 * method.
 */
> +void ethtool_mmsv_get_mm(struct ethtool_mmsv *mmsv,
> +			 struct ethtool_mm_state *state);

/**
 * ethtool_mmsv_set_mm() - set_mm() hook for MAC Merge Software Verification
 * @mmsv: MAC Merge Software Verification state
 * @state: see struct ethtool_mm_state
 *
 * Drivers are expected to call this from their ethtool_ops :: set_mm()
 * method.
 */
> +void ethtool_mmsv_set_mm(struct ethtool_mmsv *mmsv, struct ethtool_mm_cfg *cfg);

/**
 * ethtool_mmsv_init() - Initialize MAC Merge Software Verification state
 * @mmsv: MAC Merge Software Verification state
 * @dev: Pointer to network interface
 * @ops: Methods for implementing the generic functionality
 *
 * The MAC Merge Software Verification is a timer- and event-based state
 * machine intended for network interfaces which lack a hardware-based
 * TX verification process (as per IEEE 802.3 clause 99.4.3). The timer
 * is managed by the core code, whereas events are supplied by the
 * driver explicitly calling one of the other API functions.
 */
> +void ethtool_mmsv_init(struct ethtool_mmsv *mmsv, struct net_device *dev,
> +		       const struct ethtool_mmsv_ops *ops);
> +
>  /**
>   * struct ethtool_rxfh_param - RXFH (RSS) parameters
>   * @hfunc: Defines the current RSS hash function used by HW (or to be set to).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
