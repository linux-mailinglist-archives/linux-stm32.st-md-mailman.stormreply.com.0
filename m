Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD30D208BF
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:29:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B9FC8F273;
	Wed, 14 Jan 2026 17:29:49 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11021116.outbound.protection.outlook.com [40.107.74.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 591C3C8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8nFelAaF71fO+iZWkDyjc02Pmuxa9OQyqyWdtksjHJyIGYVYZCifCuBPMxGkHRAwxWnHt+Pyxf2AVJbyNniY4u7kqQpCh5w8xKKXrPzZSBU6g7U0/45XFwmrTbxlHOH1V9QJJjYfQGbyyVr4clOuxcKU0yTdZe2FRpA5CMnKK4ISzqCkQqFVLYliH+gz2yDgMcADBtT9xwRu70GzD2IBUBkPmkAHxX4D9D0DJ7+XonJBakYzpsL5O57VjrwMVRTKpwS/lDiR73sEZJ50Dr/ehtTNvIG+Qldhh1ZiJY9D8zS61SOOEGuLp+393xebUYre0EC0oCdNowAK1lWSnozNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B00qWTvDFKEF/V78cwgYX4qYDQ6bTraGwIdgGtyrMqY=;
 b=Vrw4BJdP73uZimLWqOJCJ530R1Xyn06rpYG5SSHP++1ohfSYlJcztCWtdUJ2EhEB7l29i5J6fioTwuy6cA/RGKCb74ZJlKWFUJV2dI8GKs2OXb3aGVXufyhrLDoIzx2qAHR3LGTRRXhY7yA01U8s8h4w8E+Ae3f0D2Nffrgm5eEAJPHPT53hA98WD081TEjtmURgz1xPqBfWWxLBa8zagWBV9fZDDCrrdlcQ3djH/g7mBxyZMnF3CkWeosZddE7fd0meW0goYgVxATiH2yH/BBrWiwXLeBd4Pn1lej0FIyc7zgEK0ukq041JXhjdiJUYgcc5zEhLgpk/mwnL2SRpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B00qWTvDFKEF/V78cwgYX4qYDQ6bTraGwIdgGtyrMqY=;
 b=bC64zsItLETHHHtdZcuNq+VBK2/mDKQiEZ1IQ/fpve6BM+Uk4VqxzVHKTJKfsqkXVIZ4H1rphfvIJTNMQjoGoTF9JH6pNxQVBTAwgW1YHmDLfWyx5RZaJoeOUko2swS4vMFrrxrSVouwAxlysYsCbbshg8E4ABO7u+/+bA1r78I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5544.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:280::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 17:29:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 17:29:42 +0000
Date: Thu, 15 Jan 2026 02:29:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Message-ID: <karx7k6lkem22dwyon2veqwvhko6e5jgzsk6bfhuymyzbdohqs@cqmsmclsgqnj>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
 <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
 <aWdyR4Xkh2_ZgOf8@fedora>
Content-Disposition: inline
In-Reply-To: <aWdyR4Xkh2_ZgOf8@fedora>
X-ClientProxiedBy: TY4P301CA0080.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f71753-cf7b-4e5c-26a4-08de539280ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T56Ngj/qJFEG/+sGL74RKCUwwVJadBVM2y2u9dvDSxKWQY2FFb0D1qL2kgbg?=
 =?us-ascii?Q?WJ0H8WnkB3UbOiHCH0erJoCKS1lVvyF08nZaClzX3xXsrZxXTudS+AQOjp14?=
 =?us-ascii?Q?/koK8RD3bxVtMQB131xNbzAlaMetvsz4g8IcfroYCQoOWpP6drRlgusLgroC?=
 =?us-ascii?Q?Khhs+S5eufd8xbW6bWnYGP7jiXy8+S8FLOjcm835jC6pvusVfVNTEFaKXDjC?=
 =?us-ascii?Q?Sv3bzpob++jVpGzyndMVUfcl+3tx8cYWrswyY7qhGmZ1bL9KpgW6LP8tZ7Vg?=
 =?us-ascii?Q?h9qUgkKSCUanXd3mLwaE5h5IqifvXmsEj7vZHkTEpd1fm7fUB6eXWIpLkfdl?=
 =?us-ascii?Q?zf0bf9RsiY1XEtVYclMMZtVEtjlQwCMJv1iuoMJildD2gLND+4t5YbEt94GB?=
 =?us-ascii?Q?f6pXex6ChYOQ3BEKJ0000laIusbEzRfSLjkGlbFVr1tWJPgQIRY9dLXt554L?=
 =?us-ascii?Q?0spC0SBhJjClYTaLiQpmSV8AFjfcmHyTWZD+sUtByxiixhKZxTWsaIkSZid7?=
 =?us-ascii?Q?PCLeuD/xodUzwewMtkY2KNADkt6QH2zt2H0eks3ygRvmN7b71G7E7+/XGCTO?=
 =?us-ascii?Q?bUoVd+eOWKfzgyXnl42L0aAk+JEy6TC5gJZe4amo/+B6RUqkvgO+rzjgbZIs?=
 =?us-ascii?Q?hGM5B8KE6N8qZrKXFtRTfXq1ZuvpSMQxEiD4S0FOkOG0w0vEZ+Ez6m2c1ll1?=
 =?us-ascii?Q?Sap4Rf5fB0tmwf1HExuwW0+8ZuuhT1aPYhiOjishbCj7CAh9zPm+kkNMd4I/?=
 =?us-ascii?Q?nKXz+YG35V8geIEEqBAMFhOpy0Dctzo+FnNLeNYUCL5KXwNje9REU1csuamY?=
 =?us-ascii?Q?dls+92bS9xpAn+CF+CmJEEevPIXKdZgXAz5GlcqSgB0YKhJ3hhFZz64cLyFz?=
 =?us-ascii?Q?nrWV/+Orrqgj3qWVhaENCfflHJM9P4tOtCTTs1EcUEV9ZsmffwMgnOLqQibF?=
 =?us-ascii?Q?ic/boy7y+JY2oeGbLuFZDcKMcfQ9o1skRi7DxG3jX1fShhZTmHGNTNM9vE75?=
 =?us-ascii?Q?lWMb00q1ZbKYO221LQGwOIVXayS6+a4kWm3uLoz7XEg8JJLpF0m5B1fmCtax?=
 =?us-ascii?Q?ffLTBkS1XFokf1cVUGj5y4+krlRfwl1uXgwW8iaUVDmxqFMsKI1tg7vKrsCF?=
 =?us-ascii?Q?RK92JqcsFMZ2MlhSKmaWPRVZhQ4WhFldnxVgIkA+w5JQMQsd/SU8s2ueJL/0?=
 =?us-ascii?Q?QyffR9p5NBAXKbOds5VoOM+yB4Spmn58pgNjH6UhH05C+CKozjetryxAZseJ?=
 =?us-ascii?Q?wwRpk9cTQDtzJhaI8Dj4M3TfQEl1lnlNlK3h0adNp4YErYUZmou9Z6qa88L3?=
 =?us-ascii?Q?Lb8gN3ptMsVdDUbCwscXQa0JCS5D6MfZSiRM39kIPKjFfBLCHd9MQf1gJ1qi?=
 =?us-ascii?Q?i38YOrlIs0FwuySZLEuU3VZLVO2bH9JankVgwndsvgVeRJ12UzjeMghV7yzY?=
 =?us-ascii?Q?XUW2myQSWEvAYBDkLxKQnzMiERSl6c4VZAjRPQoqDWuwGYIcngAFCVfZHdDF?=
 =?us-ascii?Q?RRkhGxGruxz++Rk7fdXcShbZgAfw90tZ1LkGyPLcZyqLDXtew9XJrDSroYsO?=
 =?us-ascii?Q?A8TIZXGw2eZbHscXPGiTf/2Igvq1Kx/bfcWGY2uyKFoRexebimHNzV5KBjMk?=
 =?us-ascii?Q?B6E3qeBI/H8uAkwCesPgg8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(27256017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bfJAoykAqqyrZQ9TiyOOAAUDb87Y/5BCPEKUj0Pn62TWbgf3oV5Pw34gpdet?=
 =?us-ascii?Q?M+9467zQ6/kfX9KAwozVV/v21O+FNO+UqbZJ2LlfaiNK1+4VvIdm4mh4mJ8/?=
 =?us-ascii?Q?NHxitnG94BjWnBKablJaacPUZGm35wq1S9YIy1p+vAG8v0dSHaZqec3Kk3IX?=
 =?us-ascii?Q?iwpGdFGowAdo6FDX7IUqXoJg6AGbPYRil0We5DNbhJGsHc41DCGiOsTG1eji?=
 =?us-ascii?Q?LIfUg/voc+Gn3at3A9/nzRfyrOQSIldd9CCfY5EvmJNG/EF37626ZUXAD88h?=
 =?us-ascii?Q?ydQ8b48SN+P1O3QTpg8nPar3n4uEBQ6qUFQ7Pk7LU71N15wdhAoXmskMNM6V?=
 =?us-ascii?Q?2tlPljZDtZaE59F9+rZaWTiRGCulkqmaU2raYQjfpg1FA+o2gElQZb6imjgF?=
 =?us-ascii?Q?II/8L9T5RKhGskfkABeecjNttP7bXar+YHgN2rQFWARq4cRIUxhfN+N0S0Uf?=
 =?us-ascii?Q?RHSGmq8uwxQfJdIidDqQhK8IQEZFM2fLmAXsk4tm4T5tWhelJUsgeW6W5tVX?=
 =?us-ascii?Q?wbsts7jxxp54wIO87oeGCVJH6wXBNSjr4c6GSts6s7fRvbOn3YqVWxc3Yldd?=
 =?us-ascii?Q?3A/PYu6WbDz2OpYbSjspBUCX3l1Q9tcP/B+S+6s3glR8Ahl90jsPJ6WElpjP?=
 =?us-ascii?Q?999Kqv+DUhIPDsTYblgUqkOn4UGQaduiYPDrrnKcbAZSqbse4SPjAEKtfAc2?=
 =?us-ascii?Q?8kU0jAx+TiHDGOBJTVadE3Rrf10mD1MBGeJiDL+9lLIQGeRFAl/tR9yyxBIq?=
 =?us-ascii?Q?+hTQCWv08LytJ0DKcPzQdDmN4J/tbUFLLi5XFJAHpG15RUwgWCAUWDNycpMx?=
 =?us-ascii?Q?xviTDOHd4OG+oBFgdAqhkBXFGpUk2wCuZ0N7zlaKrViCVCwdiyFBsxJQDDdP?=
 =?us-ascii?Q?FDjk8L55dYlNMAeKzcq74EQoTxhi/4HnwhmZofTSYI9BlSEQX+4EexcH2XzG?=
 =?us-ascii?Q?uUYsGQrlNYsuaNxBfNuhLgC+p2GXSK/PICQt9Sd+nhFEhD+xSCEMObsSo/xC?=
 =?us-ascii?Q?Q/ckmkXwfuRQ7Lu1badoioZObZ18upOktyFm7u9kiUcqa1xrcCTLaW1wG2SM?=
 =?us-ascii?Q?iyrADk8UMXZvx1dhg2I5fhE0MenRFsFUpSRFcvsg6TuIxTFlWPAxEh4z4pE+?=
 =?us-ascii?Q?PRmVTba1DfOWUfCO1LfZe0qWRZZYDqjOLDqXYa3Ud9FKg5rWEkjNDh23HWRL?=
 =?us-ascii?Q?W194yU3CLpiQrr9EPeLwhKxaI9OU2SgtEAaSnsnEKk9JFv75ya1K+oEpjxdW?=
 =?us-ascii?Q?KixKwNyqkRf3I6Y2bfsajPXFA0ucIBcXYxv/fQXuoiv3YTtRClLVjSyP9fi1?=
 =?us-ascii?Q?EaTv5Bp3wBhJBPf9uwc11w0uHwUFh3pzipb6L1dLdf6dPOpx7EGLZAHQTZEK?=
 =?us-ascii?Q?pwL5b/jxVD2nIOczaEh/+Uo3o0OiNa9CYnegoGaxcxM9oQBhsoWx01uNK0dt?=
 =?us-ascii?Q?LHgAwAyAaqKgXDAmhnlV/QLbavcq98Ujg+fJKY4nQevzECn+Vic0zT59g1J8?=
 =?us-ascii?Q?IBfiLuEittC1jxF9MG5lk24PQGCUMblG6IuNah4EbVntrxGwST5bcfTxeEia?=
 =?us-ascii?Q?ImL6g/UPQqKpQRAKayHjdTpsbAvk6A5PY5jg075eE1QTMXykkAldupTwNXJC?=
 =?us-ascii?Q?iYL8s16IhWJfHhTSnADdpJQya1RuZLxEBFb2oUoz0SQjgShZ8+8Iecx+Ww8l?=
 =?us-ascii?Q?Mob66hY/SSBMQssSOaUrAA0iXa7G49Tzx4gAoBNJhbG+52RpjzSyuwbjQEca?=
 =?us-ascii?Q?DH3Z38h2U5ieaQivgqGq6KyYtGTPQpUnhiI/azrYI/GXhk1OqILD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f71753-cf7b-4e5c-26a4-08de539280ea
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:29:42.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n998RUZ6pDPOxK4s2fUXCoNzxAai5NOkt0iP4VeqaTS8ye9yooGELxmn53l092jYoA12NDXDFvp5JOpPu44aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5544
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange
 inbound mapping via Address Match Mode iATU
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

On Wed, Jan 14, 2026 at 11:39:03AM +0100, Niklas Cassel wrote:
> On Wed, Jan 14, 2026 at 12:54:37PM +0900, Koichiro Den wrote:
> > I realized that I missed one case in v7.
> > 
> > I think dw_pcie_ep_clear_ib_maps() should also be called from
> > dw_pcie_ep_ib_atu_bar() to tear down any existing inbound mappings for the
> > same BAR before re-programming it in BAR Match Mode.
> > 
> > This matters when updating inbound mappings for a BAR without resetting the
> > BAR in between. There are four possible transition patterns, and pattern #4
> > below was overlooked:
> > 
> >   1. BAR Match Mode -> BAR Match Mode
> >      As the current implementation does, the mapping is simply updated
> >      (with the same atu index)
> > 
> >   2. BAR Match Mode -> Address Match Mode
> >      This patch series already ensures the old BAR Match mapping is
> >      torn down before reprogramming.
> > 
> >   3. Address Match Mode -> Address Match Mode
> >      Likewise, existing Address Match mappings are cleared first.
> > 
> >   4. Address Match Mode  -> BAR Match Mode
> >      This case was not handled. The change below adds the missing
> >      teardown so that stale Address Match mappings do not remain active.
> > 
> >      --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> >      +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> >      @@ -148,9 +148,12 @@ static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> >              u32 free_win;
> >              struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> >      
> >      -       if (!ep->bar_to_atu[bar])
> >      +       if (!ep->bar_to_atu[bar]) {
> >      +               /* Tear down existing mappings before (re)programming. */
> >      +               dw_pcie_ep_clear_ib_maps(ep, bar);
> >      +
> >                      free_win = find_first_zero_bit(ep->ib_window_map,
> >                                                    pci->num_ib_windows);
> >      -       else
> >      +       } else
> >                      free_win = ep->bar_to_atu[bar] - 1;
> 
> If one of the branches has braces, both branches should have braces:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
> 
> 
> > 
> > Unless there are objections, I'll include this fix in v8.
> 
> Isn't it easier/cleaner if we call dw_pcie_ep_clear_ib_maps() in
> dw_pcie_ep_set_bar(), rather than calling it in both dw_pcie_ep_ib_atu_addr()
> and dw_pcie_ep_ib_atu_bar() ?
> 
> dw_pcie_ep_set_bar() knows the condition if we are dynamically reprogramming
> a BAR or not, and all the four cases are when dynamically reprogramming a BAR.
> 
> I.e. instead of adding additional code to dw_pcie_ep_ib_atu_bar(), we do
> something like:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index b2ea2c2c986f..63ae5471fe13 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -318,9 +318,6 @@ static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
>                 return -EINVAL;
>         }
>  
> -       /* Tear down any existing mappings before (re)programming. */
> -       dw_pcie_ep_clear_ib_maps(ep, bar);
> -
>         for (i = 0; i < epf_bar->num_submap; i++) {
>                 off = submap[i].offset;
>                 size = submap[i].size;
> @@ -571,6 +568,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>                     ep->epf_bar[bar]->flags != flags)
>                         return -EINVAL;
>  
> +               if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
> +                       dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>                 /*
>                  * When dynamically changing a BAR, skip writing the BAR reg, as
>                  * that would clear the BAR's PCI address assigned by the host.
> 

For pattern #2 and #3 (ie. either mode -> Address Match Mode), the v7 code
withholds the dw_pcie_ep_clear_ib_maps() call unless the submap validation
passes. The above patch differs slightly in that sense, but I agree it
looks much simpler. I don't think the difference matters much, since
pci_epc_set_bar() with an invalid submap should already indicate that
something has gone wrong (most likely a bug in the API call site). So I
think I'll go with your suggestion.

Thanks!
Koichiro

> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
