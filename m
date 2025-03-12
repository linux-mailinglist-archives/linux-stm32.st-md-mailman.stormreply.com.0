Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D6A5E124
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 16:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99D95C78011;
	Wed, 12 Mar 2025 15:54:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B33ACC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 15:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGvneCBBxv11S5ZYACVHOJqLkT3lTLcO4n42xpUtheWbKNEX+McGdaPVHT0gP8ejIDsId2s+QircWFwHXpvi+HzdclWpB1RAghK7rxz4SJiu87Zqes3ZouFIoXRuki0H9XMqL4YQjGSj7Igjpn3h8B+9Ei8WfaumJTYjLn8gPMvAuv9xl3RYMp/MxNRCo38H5fEYLSQX4BL9tdM6AEN/OKxZIrn24OFTWunwfzKFoetM/CwVPvt5mg93ZaDk4AHWZYpUKdm+tgV475pTJR1xUpT/AqfN3l/NtTxCcMMLXGqOOkWpPlGr+zIkQlf+tSTI6hz+//juQxftVDwWLzf8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7lbHjQ+yB0566bZBRkHbYnuaP3ScKwDul/RVOuAoTc=;
 b=qkUrGWBwcgiWdWO4rvSkr/Yr6DGm1mfs/8of4iaoXgD5Dqi1CbSFyH0+UACmVox773U9ZgYuZ5ScgtGbr1e4924XoEqVbTNZ4j/k4mO063jpneaqAjY6+fFrXcosnrMnNZrzBcsD2cB/NKUpQclfZASo1irvpuNvNuRiukuXmukr4EGxFyVgqyI5Gkd2RwmhO577q27uvk7JBS8kiSutJHyrFKJykePSRuWCPANFPu+A85NxYbCfYGG4P3FFLcEqdKzxMltgbrPncTLvwUXli0A0ropGRKQbLDD4y9MrmGFG8QgtzohGERlGycFliiYQYCGvCGJZN+876xHDRpVnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7lbHjQ+yB0566bZBRkHbYnuaP3ScKwDul/RVOuAoTc=;
 b=bqWWbly1JglkwJU5JSbvRhY8xNr02urBgZKSYiJ+6m2F84fURbwGOENSAoOYos/xYxGVOBKiQrtnpKMq7tOYM4DI7dNQeSabRtdYWpLCSB9VNuW31+yUcVQlWflWZHmX84hgL752NyFoWY3tsaUuJaDjJq96OuEfvMz9tjVHrgA6XioB6ppv8FKWsV0TxAo7TNz9zWC1SHGJ+uRW4/od0BPTTZ/r058GN9OSi/tUzzkphm/fEpSrS4Gr2AgzZLtSLZx2VrGJnVay30zhcVYWjlyZk1vWHyneT/8LeAMoSVMVDDVmjeM0RQy0C0FqSNyBYcEA3iH9rVlh7hSwIwPf9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:54:13 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:54:13 +0000
Date: Wed, 12 Mar 2025 17:54:08 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250312155408.3shdw7fx4nr3taar@skbuf>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-12-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-12-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250309104648.3895551-12-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-12-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::7) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAWPR04MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe2d622-cc15-42c7-f43a-08dd617e2290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zUmks0NbUQL+Es1vqJAP7xzR+Kq0oO97vN3izrCBkOuKa4zaYRVFkCP9UJ1p?=
 =?us-ascii?Q?VehuJJDU0l9h/P09M1mhXBthvRA14nhlzhG+aECaOpqvsfLgG08r8IFix/JL?=
 =?us-ascii?Q?LviifkV3PNz+LOd5x+mOZCAUQb8vvlh7ZbcDKLe56xq9wkuf65du3qCAmOlt?=
 =?us-ascii?Q?aYsnb0U4GSrQenDVaP9qlQAs6izDmfkXjH+v/Z1ffgtMA2WjwMlOIDoc2//I?=
 =?us-ascii?Q?8oXwE6d7wCBCDVOhGIh9vjMlxiTlby9zSZIvRycYXSSvizrjiw21zTtZOD4h?=
 =?us-ascii?Q?xYdJgW72k0ByMdBRVTfJ1JQ4oFUWmMm1AGW9N6qbgWxDGueLI6+Iki4hCSP7?=
 =?us-ascii?Q?nqz8K2qWoc+aFajpIyYvqsfXGrSacWVA/FghxDKLT7TFNI+pkuzn5jN3I54l?=
 =?us-ascii?Q?+F9vWQOFNoExluoQLDZKK0YBEj1HU2n8MUmRTVt+bkzoJOC/TXn/ZCZ8KD6S?=
 =?us-ascii?Q?h8BnKjRkDtahkXUSCEqFKcoi8WyB5zOsNAZ1z3GAnW8zJY7ljep2lp2P3TPa?=
 =?us-ascii?Q?l1JEO9+QaDLJ8EAovCBaK1EYBvpGycrR3VbkClBy8k7cKkZ3jcevXnVQn4GH?=
 =?us-ascii?Q?p++Jf3xI5ysfaplh2WPDj5KIfTA2Oo4KhbL4ZRoWKcSYWVOpjBKmxPO2m14d?=
 =?us-ascii?Q?XgUjJPM1cal4jRHxozGUerrmqKce30i2vY3cilfsFfsSXt6y7QqXg/tE4WyS?=
 =?us-ascii?Q?gYvAshkANMOx1VWSRMpE97ep7SvTR98QSPXYBAqiUWjz1OWlHzp36ukpaWxI?=
 =?us-ascii?Q?0gXnFw7FGTGbWZO3Dc+Zc83QNM2jj4aG9G8pTk7CGEMlLk02difTQ3EouPbR?=
 =?us-ascii?Q?Dff+LhH5//Uh3cv60QwrNCBAnwSi/EKzhXUjrIY51RWwJHoObY3cjXYdHEN8?=
 =?us-ascii?Q?k5fehgyLB3GrAEhFEYKvWtCix6wcBz4rjopgzsbW9HaR6nF6ardlaj+MVYnz?=
 =?us-ascii?Q?VkHcvzi3v+JWd/atP1H95yI4KtqmFD8WRxlx9ylCYxYlUIJ+MumXjIecFeo5?=
 =?us-ascii?Q?luLowLeSROEK4yjsc2EYWb2FGplkD7pfJKPZql7h0e2BY87qv4jFqlMHc2F4?=
 =?us-ascii?Q?1wgearW10Lw6eIpEcoYOO9U38emwPWAum+CdJBNWGVgmrj2AmjdHOfHPnKrs?=
 =?us-ascii?Q?p6Kuf7FQLRNAS87sEDNEIGHF2EM4SemAfp+wd+jvcMmLCbXNKFfi9/wiB84V?=
 =?us-ascii?Q?9r7SYYaWqGWwxGRN44usjGMnh7v3ZT420RHhV4MZHan7keAuD3UDhV1jNS2K?=
 =?us-ascii?Q?zaWrjz/m8BQL7JuCtGoevIP62nqnE26yKqwkko4wOc1+DVEHiuqzpnsZH2Vj?=
 =?us-ascii?Q?xU2gwnjhT0ooeQD0zWVi74qdjwPLh3i67qTnJzZdZxu5D5vZxuxdPONbf6I2?=
 =?us-ascii?Q?pKwI+Up2Z36AMy4HmHdnki7peYid?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBfo38bhu71LO0UYY8HYnWi0aI4XiHkSDqaTclfuE96Y+kqo47xMpqAZK4DP?=
 =?us-ascii?Q?4xyvj0u3C2zJIwExV8AAhIf0+jZ+9qjwiM9SDUKWJPNZjdm7MI/1wHl4fyCM?=
 =?us-ascii?Q?u0WCFFt1J8qEONyfGdZV2DnNmkXVxoxYA+RzSbtvnsThNqQmhXQZhgfZ+DEd?=
 =?us-ascii?Q?NI47V6cP1j6kq4sSjWqDXGSk4NIq/kIblDV+s1jFwOW9j+ldY54c3iZgTE/U?=
 =?us-ascii?Q?WMzi+eW9INZdSZMosP8olUTB3okj0R3x6c13pUsxfPwGJIVX5UtqvjM5y6r1?=
 =?us-ascii?Q?EXKxJS85ru/4eeSlAzvno8eJoha0F6DoHcH0UIHjdIbtML3+BbrDDtQtDShD?=
 =?us-ascii?Q?yngLpXf+ELp0W8Bi+toGDRKxafmXGEmkMYjo8Wy6aapD8IsfZ1S6ou4KexFX?=
 =?us-ascii?Q?nmKKd1xQHdC2yMlMlxQNDkZbR70pG5SggTiFE+9IN1g641+aOSM1pqRIZJCQ?=
 =?us-ascii?Q?L4RG4tEnsDTzR+em1PFRqYIIyEosZ23zmLxqPVDfRoL05EaTUMJMsKy1wiyM?=
 =?us-ascii?Q?v5im7pxUf12k8Ax68yDwTsmb9UIlHkmP6ZEXEQ7weLFpCO1B0HOlCuSJ2wA1?=
 =?us-ascii?Q?Dk8a5v1BD4vdytL2lu+N3iRn03/B+uJUFcb/8IjEe5ZJRUYRZOraDJX4jUnL?=
 =?us-ascii?Q?gVmYoBfwBqoeqQ14Sj57hnHP7zNwSoENXCMXHTkYNr1h99cOsrPnwlU8cezx?=
 =?us-ascii?Q?ZsxTRqBFg0Y+mDetLvKA03Q2bS1JiKItlqlcH7h/PqCnJTykZ9K5TsRhiTZq?=
 =?us-ascii?Q?xhGliDmjnVALOV2tj3MF5/uLAnaAzaouNFf1hBbKSRaFElxeAiboOyewOYRI?=
 =?us-ascii?Q?pu/1tTJORIrt8S2VPtEgPOobEZIiJPtgPrN63xElOkB/p3I8lPanp7csvbKe?=
 =?us-ascii?Q?mGWlbS4/B31e8eJ0RCGDqk6oEcvHzexfzYZHRnaKdq7DBQTZNPXf3yiAdRII?=
 =?us-ascii?Q?H8zIM2iZmQrsy8D9/SPh1cadH50zh8o7fQPwwr0kTsBLNcFZFLDEhpELw4E+?=
 =?us-ascii?Q?3Qr324Zcp+wMGFxYBbFyiaSbujZ7bzDzYDSKbDnTphskzEzJRmdOZH40sxcx?=
 =?us-ascii?Q?yRX4z6rCyCloVK/MAfj3wMuWasVaEAYVU4kejri/KwbGt4JXoncq2k9iUbvp?=
 =?us-ascii?Q?Ng7aDT0Zl9xubP2llQlzhj919jxi3lL9XOBn9ehsVChquos67fDBX3CooHs0?=
 =?us-ascii?Q?qOVUNGBjg+/si74DI4Nd+vgHx1ZG4UuUfM6umlHed36pjSeQOa5Dil+dRcWF?=
 =?us-ascii?Q?IQ0Z36P8IcgM03ueAZfvI0o0Aymkvk1czeDwEQWDcZ30QSrqULgGcGqVXkK7?=
 =?us-ascii?Q?WCN+mSg82q70BxEXpA+9LVIZCvD1KVMCSL84DLP/uKjJM0ocn6OutkT+tcyt?=
 =?us-ascii?Q?LW9FLGa7xS3jFqEX+uYXYkz3J0X6bD8EBMZjREPewR4YhVGkanh1k0PlUCMq?=
 =?us-ascii?Q?KfFD3VtvV+UiNBedvYD4tAQjy/Aq4CuWZBWuulQXDitdShP9Sf/c0zyiPusg?=
 =?us-ascii?Q?vNbf0frQFFsrHr2EbkY11oB49c+b8TT2RWBKa4a4hFitM82NNNDrRkW7FqmO?=
 =?us-ascii?Q?LSbtzBiOe01dOQ7fK2eJjbXZdZlDHw8ym5ozB20vx5P53iBF8fq98AjpBY0k?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe2d622-cc15-42c7-f43a-08dd617e2290
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:54:13.2031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obVZd+JlsQ60/p8noRByBPiCmO8hGxmzQ3UNfDdLO9kr78dMzPGQrzOeHDxPQeV+UbQ182lMyQcW+VZiC3b9Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v9 11/14] igc: add support to set
 tx-min-frag-size
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

On Sun, Mar 09, 2025 at 06:46:45AM -0400, Faizal Rahim wrote:
> Add support for setting tx-min-frag-size via the set_mm callback in igc.
> If the requested value is unsupported, round it up to the smallest
> supported i226 size (64, 128, 192, 256) and send a netlink message to
> inform the user.
> 
> Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
