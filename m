Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMnBFzTcdGkq+gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6927DD6F
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08203C8F273;
	Sat, 24 Jan 2026 14:50:28 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11020085.outbound.protection.outlook.com [52.101.229.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FEFAC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 14:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsN8TxlnU69cD/aqhHAeQye35/ZXLhael4e5Ep78TyGFKx13HhEX0nh8e4xAPr0xfO0jOjReqpDsk8H35bRcmL3KJx3cxaO1CWZsMNZYHtx9CwgAFiJujLbcE8f1V9+sm+TcWo9zCNtuansu8TDM0uFOd7hZHZzXyut8nLXD56x1zI2DvjK9RxciPHfzhangtEdzuN5rnokntqiC+egYuHV8hG0uihGkYd9Olx/1cEVXoa7Jw6wSLILzefIrUuSnVfr2ClH1ITF63UZLOUEWlaewX1b9rh/nzAWS+zl+z2o5NATyTKdE/92gRw53BT0TBN2gZ6r81GuNg5i4J+43Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqv5b0rVdZWl6jWcBfaeDRjqb8MGukLgkiwYCtOwdTg=;
 b=DjLGqhwwgRcRfqNaDbvSymLnt8f1mBgYFUCQ+P9lAfgV0O/5Pt4y3W5Irn7rH1TNR1/DEDBGbOc1OOXpTWRhbw6sesv3OhGZ+Rij2Fv5IOwPoDaMF8TG5pNxXvfKtKbw4LyHzinzNtvuWC2FLr6xgBpJDk8Kz3Z1J6HCFthCwaJ0SVGg2p5bDkyaEDcFCxy0/Y/4AgHuvr8fbe2sC6QT9joyLrdkJSyYepUiawKuR9SU8s5uHti6pSrrM1w78NbbCR3jnjWgkkCSnmURD62g5vXtyNrWvTkHQyIbPAY26h1oWgukd3TULw1jruX9y/I7w7JDBRpxdRAkfVAbLDNSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqv5b0rVdZWl6jWcBfaeDRjqb8MGukLgkiwYCtOwdTg=;
 b=r19aWuLIzV/tn7R3YG2/357ivXX0mFbenCWDi3j88ckgStKVpelWcZfpydlg+RGgY+vnJjhD+XIQluTgeTdubQtWRSD9NNdrYo6tO8wS4/IFqXlhpnvTjoLgn7OiqCai+iNDKsWpbPUrawp29mIhFut40Jkn1N+0U+ijKGuXwCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:23 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org, Frank.Li@nxp.com
Date: Sat, 24 Jan 2026 23:50:12 +0900
Message-ID: <20260124145012.2794108-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4416be-1f8d-4d82-b0f2-08de5b57e710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D/9mAJI4CnQC5Gq25UmNk5YJBIodjoH9QEpSGpABl159m2FfHi+2aE8mdp11?=
 =?us-ascii?Q?hiqMA1Z8MkBq6VH5QkcBbd3+B0s0UgUkY9qM4P8cwEeZyJHabTV0XLia4/EY?=
 =?us-ascii?Q?ORR4u06IEX1Nom298JTVL+zzn5VjdoZQgokH3UGGED6+LmPTCkSuf+NTEHXg?=
 =?us-ascii?Q?VTKKyt1t1roU93HfLsCQ9pbRaNvDum4ppD3S/s4qcXnU3nz7ugs90lcNdyrU?=
 =?us-ascii?Q?S0JjRvq7wq6G6PBuVUg+8Xi0oiStwK1DciGIdiNZO9TD2+Oe0zM/jxEl/nxH?=
 =?us-ascii?Q?gZMhlBc9NV1mxH9Cb/+2T7QQFyGNaK22W6sFT+TUezXrj5xzohH08tHO1Zpt?=
 =?us-ascii?Q?Iyw9RG9QtjzowCc9+xzUx85LcjWz1e6RYcb3iKdkgd/91ywDigkyP9b4O98/?=
 =?us-ascii?Q?1A03F7sB3JZ/yIuwtWOvZZLKlml4VXsc3mHXFv1z7unckXxUQ29vGjmLIOUO?=
 =?us-ascii?Q?5V0meYTiX/sDe7KqFRxPa9G6qhBzAETj+5H2hkgDI4/uaqnv6smw9djoyXei?=
 =?us-ascii?Q?bfkcj/yHJT/YRRFqGm7E6UN9wUOfa8ehOAkC+7voihI3c0GQ92YTT8ifByUa?=
 =?us-ascii?Q?Vkx+P4Gafa6MyCxnJybvj0NI7A1CNAeVafLtSTs4nYIdTQ7JFxs0OKlQmczj?=
 =?us-ascii?Q?Kb9lfs/aoXnluhequ/iqKhc8ubxxsMd1VHEz0QaElEKPni+rRO+654LEOl7P?=
 =?us-ascii?Q?7C2MGQJyAdF8jaKPq58oCjdIn8tfK83xGYo2VrXWrvCRQ/xtGcP3EnHDbNLS?=
 =?us-ascii?Q?+rGsveKBuO4hL4sp0BwQjOEx8AOBu0McNuPAx7rKT7kOOcFzFari9ZMs6M0h?=
 =?us-ascii?Q?7dzl/KQ1J5tFKD6fD1j22fyeKYy7rBikOfiON65B4Yq5k9fQuYJIF1guOwKd?=
 =?us-ascii?Q?kc3FQcQ9wIve0vhANTxIPeW2mIa/Jktj2ZZuu8/OoDaumdR453JqHQyOUZ0r?=
 =?us-ascii?Q?3JOb+tD+HZ6/oTDqSvdT5QLYcqG1seo16a1ZP9UY4V7ocjUWYtf8H1pJVykr?=
 =?us-ascii?Q?3pENXTuLeH5hwvFXos8O5qKqY8ppKCwMSlAOuQasABFswtZXz2hDVuqf3TIY?=
 =?us-ascii?Q?eGYJB5CRvan22uTXjeIc+aoCfjtXTYbCPnUPGGEtP7JRVJdJ1d28zqUeKpZ2?=
 =?us-ascii?Q?F1joYa5ScI7cmC1Vul4AXDH+oX0wnLEN/O67ZRpQwVOWfK4Bczo9+Rwc45Qq?=
 =?us-ascii?Q?KIyNY5JCIgh69cqbLVREsF0hdcfS8cNLtsOXb4zF6oIQICG3xSh+0/0tMtM2?=
 =?us-ascii?Q?yaENM06P/sgvfI25G4r91QhHg8iW9k9FeMuSTKOPv6JrZZyh8z+X7wRoiwAh?=
 =?us-ascii?Q?HOuA29YZs+7o1bXg9EKomonpggie4+Tm5nA4KyDCbl/XEt3gtpsS9fIbSddz?=
 =?us-ascii?Q?AI5WjSfxNDhyWBUxn+p1IbKxvmmd90T/4+c5f9UlYstgfF9Bgk8RyOeOJ/2M?=
 =?us-ascii?Q?wdKm0L/tbtuRpurSUNEaend0oLLprjInHNHSZh+cP/sHYBZitIqCtbMLOz+R?=
 =?us-ascii?Q?ccRgz8e0ZMNFBrRqI67fNlteyAp5xi9GD0IG+1kWeuvs3UisaUjqy02PaS2v?=
 =?us-ascii?Q?me+QvZddGVKerLn8aGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0TsZzlqHD5XzEP07kVA8GU3hqisVAKu7xeA6H7JdpSPhKe1VBlobH82vjmQ?=
 =?us-ascii?Q?9vdwl3iYyyAG3+R9vWW9YXcBeM6d1Tu1jakM4w6IhdvSedUTjH8sC800eKwq?=
 =?us-ascii?Q?o9TMvbSxXweQrESI6UAdK2G891qTYABRN8nfeH3rkAKMLsa31p/qooVvi29B?=
 =?us-ascii?Q?ouVsEByyU2ehHADKnASbCbDQIywPqj3KU0fKP9n7uGaR5m2fLnEi7Q/5ZwpB?=
 =?us-ascii?Q?6Ip4gNrOYiBE4kA3bSQ+VIn0l8KQYI9s4h/XY9iAu/bc/KkVvrFAGxo7VJ7j?=
 =?us-ascii?Q?r+Ovgfw0g+E5mpwCE7ZzsOK8ByG6QL96TxtJwvD78//esonZYNrhuGVtbHmP?=
 =?us-ascii?Q?HbMmeCiy9/ZYVzPHXmoJCoZS4gbaVyQx7XF22QbC02vCNVUiQzR9kTEMaLKj?=
 =?us-ascii?Q?2zBg9pGNDuFLZvoWQ+IFCc9fCVDFPD9oCECkpQEpmhQKKrBtost8LXWe/yWU?=
 =?us-ascii?Q?isNG28MfI28RyhP2/SyuZLlBeV+XJByQCcEcT3qxiYOI25zcAeFX2YSuXBQz?=
 =?us-ascii?Q?ByMzbuNMcNgEEZgWr4MLev5P2ba77YX95vxYLtGB13qb7D12XLUg+iaIvP77?=
 =?us-ascii?Q?Xx4eCl0E2/bjzIyCYU+vQZs07JEypisoQZ+/mtcEEYUVm57BzKvG0WT4GO1g?=
 =?us-ascii?Q?TQ55A8UO7BmeVyAmcDmHFbs15/Lm5st14UhyOrcCoFfyP/lLgY6VTZ8Evk0P?=
 =?us-ascii?Q?WLlXtPuZIaVP3G3ZAaFrwogESZn11ckrkSE1O+PVTkZ0suThcDKlWnUFJ/tM?=
 =?us-ascii?Q?gA/xWH+1Mz5xSrbvi6PZmzxf91L3MkQ89pN9tp7FRZy4TgqB0LTebtVWkLE3?=
 =?us-ascii?Q?uW+r+VMqVZ22hQy1dEiue8t7Hdn1Lt6nrLVt9YfUJsCpYApi+zulAoa+++LI?=
 =?us-ascii?Q?f0ueRa52z2aIWOigHJ1H9nY2qSQWDJz2FzhwUiEHBGUFybga1VUlGWOPpevt?=
 =?us-ascii?Q?hjToF7pLLOBEM1eCavSxTQjqkdT2KhG4BZHVwTXLYxbrS9c7vN3RU0hoFVHa?=
 =?us-ascii?Q?UyT+zPZ3kSJtCXLUJV0munK+kjFHZALo9upI4gX7ZhZb3PcM5XweNLgCldv2?=
 =?us-ascii?Q?CQkW1VFel4gIVoHpW7v1xZ4ZS461mCyaLWc2MLQbrbC8yubaW5pK3HyrmJql?=
 =?us-ascii?Q?xRSHoPF+awtSmKaApmVjVCjrJK6VjV7W77a2zX19W25y8vZTTFQTS9tAjT6C?=
 =?us-ascii?Q?/1hn3mGFnzzLpkFrtAZW7w75WdyZwOSv5ibWWJg2U8tIx6MNaHfjFmxJ+jHo?=
 =?us-ascii?Q?gOSWFZIi8tFSh7YJfh2WM2d4YMPDrzsZQzhXV/+HbxNh9XIJ0TtHPUrdOrCK?=
 =?us-ascii?Q?NXfyMnR3cvqiRVlhwHHnuKOb26PQbTBi19aNDw2SwTu9Jq7k8XJD8RB5wdDs?=
 =?us-ascii?Q?mj+qGQlTNOVNpycij0GPocCuKb+JABQCHWqcgg4iqYIYHHn/+UVnXNAeyPyb?=
 =?us-ascii?Q?tyw0cXTeCqfNX4C7gqsA0mRWdfhwUY8jir6WdNiNjVSI9Cg6fAy+Myx0iJNY?=
 =?us-ascii?Q?aCaXZvWrgJTCR9HthT+zLFZgVfQp0cFoR4S+cjvyXSR3YHO3RKvUvC5Kd9Dr?=
 =?us-ascii?Q?ukonoUlP1CleXrxKwGt3qcrQ9TeCEUoHCdIXNcZYR3W9VP9/HWWizMRHADZ+?=
 =?us-ascii?Q?+wvTb2I5QTvNZqnCCUcuoKiGXP16SWye/WcfwKiakmS9ywENNeJcTUoD4EuS?=
 =?us-ascii?Q?ZDuDqqkjUkW558lcPvU10C0dxTJmWeWOByqqi0XtkhY4tvCbBNAsTheTJKV7?=
 =?us-ascii?Q?kPGlhs1ioGZ1fDhOIp6SXgosZsI7z2u6RkZiIiJjEUfs7LhPDan8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4416be-1f8d-4d82-b0f2-08de5b57e710
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:23.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zOcbRiPmWjcKICTMDKjpSACieen+aDvYfGA0/5VcbJl+deWnrGdEvlmGrulOdMUCj4oFxcJduM4TfpD6LF4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com,
 christian.bruel@foss.st.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 srikanth.thokala@intel.com, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, marek.vasut+renesas@gmail.com,
 shuah@kernel.org, hongxing.zhu@nxp.com, kernel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, rongqianfeng@vivo.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, minghuan.Lian@nxp.com,
 linux.amoon@gmail.com, linuxppc-dev@lists.ozlabs.org,
 yoshihiro.shimoda.uh@renesas.com, linux-kernel@vger.kernel.org,
 vidyas@nvidia.com, linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: [Linux-stm32] [PATCH v10 8/8] selftests: pci_endpoint: Add BAR
	subrange mapping test case
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,
 m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,rock-chips.com,foss.st.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,kernel.org,intel.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,nxp.com,pengutronix.de,vivo.com,lists.ozlabs.org,renesas.com,collabora.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 4B6927DD6F
X-Rspamd-Action: no action

Add BAR_SUBRANGE_TEST to the pci_endpoint kselftest suite.

The test uses the PCITEST_BAR_SUBRANGE ioctl and will skip when the
chosen BAR is disabled (-ENODATA), when the endpoint/controller does not
support subrange mapping (-EOPNOTSUPP), or when the BAR is reserved for
the test register space (-EBUSY).

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../selftests/pci_endpoint/pci_endpoint_test.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
index 23aac6f97061..eecb776c33af 100644
--- a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
+++ b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
@@ -70,6 +70,23 @@ TEST_F(pci_ep_bar, BAR_TEST)
 	EXPECT_FALSE(ret) TH_LOG("Test failed for BAR%d", variant->barno);
 }
 
+TEST_F(pci_ep_bar, BAR_SUBRANGE_TEST)
+{
+	int ret;
+
+	pci_ep_ioctl(PCITEST_SET_IRQTYPE, PCITEST_IRQ_TYPE_AUTO);
+	ASSERT_EQ(0, ret) TH_LOG("Can't set AUTO IRQ type");
+
+	pci_ep_ioctl(PCITEST_BAR_SUBRANGE, variant->barno);
+	if (ret == -ENODATA)
+		SKIP(return, "BAR is disabled");
+	if (ret == -EBUSY)
+		SKIP(return, "BAR is test register space");
+	if (ret == -EOPNOTSUPP)
+		SKIP(return, "Subrange map is not supported");
+	EXPECT_FALSE(ret) TH_LOG("Test failed for BAR%d", variant->barno);
+}
+
 FIXTURE(pci_ep_basic)
 {
 	int fd;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
