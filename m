Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RvRfCi7cdGkV+gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D97DD1A
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B61AC87EDF;
	Sat, 24 Jan 2026 14:50:21 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020131.outbound.protection.outlook.com [52.101.228.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6231BC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 14:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCcXaDjVBTvoM2GUnou9CJmsixAvoqsU/qK8ArUivSgA6kRvpctOBUwSSj2YwfbJN1C8Caq9fN9ySCa8evuhSUJM+vIO0+Lj5hJK0ALGrIGT/lhWJxl73Igul7mi2V8zYJFKmULVu++IXVYLnZxh739yX2Ktu3sSytj2yoztzCiKE//Fin6eEIW2SRGQ+Hn89J1cVrZkYqsqWKiEscIwyO6sSmnYbKqjGuleSfe2tj8S1SxitDwmIHm2HJ3hgww/xA7KEZCcl3q2EJtnmHmKAvIzQEVy7JkuT/jGHyvhV9NrPVQjjIkRL+EqrOTZ+i8jAzCTp3AvMfM7+AdVdYlgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRgnrBdv+3IYRbLCZEHVeO3G8GxK+9y8oHoPBQhJ23s=;
 b=R0N7RPR+8qbxfzoWh+sgpkQwxAdVEswSl6IznD4PuhisNfuFVm5xr8lcpLJdBqP6Zx5hGhi2NjwX2n+EtF7Y0MO2rafwqXKH1K370evwNQI3rCKJxskFUvJYLn0PtKEIk1xaJdSYLiimmVHDVdH8/Er238CkleGO2siiEc/qZJFFm5eJNw4cwkh8AhPd/sk6Qw0I4w1Y2w1acB0qTXoaffi/NP3Xn1+uBWI0cr1uZ5iYpa7rxm7osLmihT4QbI3okPZ5G0KgAmUNvTPiFIRjpqk1QWxOQAA9VWhQWnwxpY/dWTVykHjyMLBbdDgUavF+MEOP1J1K3A9bqmdjBrY7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRgnrBdv+3IYRbLCZEHVeO3G8GxK+9y8oHoPBQhJ23s=;
 b=lHC+9UNSUrPwQfLfuI2CjTye97wOXBgOW5jyZTex6j+FYrSgfPdl5TYVF4p3nRAirjfkazTO8MZePzmRYHQM/WmRlUbvGxFsMbBna7ik92TBFjNlV7a6TvxjXy6NtESFiuUzXe0hBqS0E0XwU1GK/aUN6gqP6RXEE/WyK06ELW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:15 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:15 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org, Frank.Li@nxp.com
Date: Sat, 24 Jan 2026 23:50:04 +0900
Message-ID: <20260124145012.2794108-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: TY4PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b698580-b333-4a55-8af2-08de5b57e26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TSArqQxaBkAsYc/xqhkIc2RPGZU32RFU2IGjnniFxA7tUeNplPz9oQsE4f5T?=
 =?us-ascii?Q?bdYoJDAF5eDya1gLKs1L2poiEhm7VQvLHKxqbQvvJiKjA1vTaqRUQbD9bqUg?=
 =?us-ascii?Q?g+PJgS/Ri4V/CrtH9YKdLymqWp5GcHCV4fKxDwrydy4Tih5gBoJ1PhHphs1p?=
 =?us-ascii?Q?RBCgh/1f/tUk6UgM58x0B1QUxByl218d+9gYCRnOalAMlS/wOsLh9SAc7NhO?=
 =?us-ascii?Q?Kca+rx+4vpr4uaa7+0YET+wBbSz024Cwx1TqP5C7UpqlOSgPviAAUU6T6u9L?=
 =?us-ascii?Q?SH0ETN8yx2hEweyg3DkYZ9wSizgSgbZ2a4ghhBKIFiTrnT9jBTcC5FXxV2SB?=
 =?us-ascii?Q?mJvJci4th9xuZhSj/ZAqq+5tAYsI4QonFjY3HjMjPMzi1tUhpug9hZVaJUWd?=
 =?us-ascii?Q?hPXlqj9Br6+TAiwaa+JqXPv6DbHSDEt/tcLu8R+/wI3QTb6sqlWlIjaTJALX?=
 =?us-ascii?Q?LoMHmcqehjwbzoc+/ixnKEooauvJC8AFv2uAh0yFiTtK9MbC9u3Aaddzvhz/?=
 =?us-ascii?Q?2R28YICSHvQGIQiBRYKeh5Z0UvPgrVTO8BiD2uADWUY2FgNiw2VohhDi4xUo?=
 =?us-ascii?Q?KBfZ8gV2TXWR6sg1LCGe3Ts7LjU/CwOSxK9RxNMSx7ZDh3KO4HfiHeeBNjqk?=
 =?us-ascii?Q?JdRmMk0HbF/ePj7w1TJ1GK+YeNSskMyEAfHVRkgpMX0psKNIKQNpNPwGhNpC?=
 =?us-ascii?Q?NPk7ZXNE5aHTwFWBGm0JD8bOB4a7AfKltV7GQKO0n5gy4QQySyLtlQs5+95A?=
 =?us-ascii?Q?mWpjd08H5aNiVWF1HxlLATS9XMZr/lHydJrguQJhU0eN3vl4WnAMzh3f5rlC?=
 =?us-ascii?Q?u/sA6B7eZI7eVEF/HARXbzHMc2kAClFSE1z0aZ/gHMuad+5NK7oZQ1gtVi3y?=
 =?us-ascii?Q?SKrDXFnkax+/OBWDHlxFi+Ccbgj8ZThtkpiH0bGn/EvodO3Udfy9zAPuRBXA?=
 =?us-ascii?Q?FpYhrp2mYxmOU7EOu20/4At8OWyxNc9h79WTNQFO9TIjjokSsuj6ej4nYsE/?=
 =?us-ascii?Q?kGF4L+TsxlryhgS+kQixgLztmL24Q3cy/zXS8uGxkGV7TqCAu4OWtx4Cvv7p?=
 =?us-ascii?Q?OcQo2JYULPmib6xdnmVo+GIo//3cI0O89kaUpYOUAhOA3yn1PZ5Z9iD3hfIE?=
 =?us-ascii?Q?cJmeS0rTZaCPLwNs5abfZPRUl1LdFZa6CH5MNruo0qSCddfUUm09/OE2YaS8?=
 =?us-ascii?Q?lrQGH/mKaIxrIhjBoA06cgue4stCkf5R0ozUi3jfuZEEG2POSKjsY3mbZbxx?=
 =?us-ascii?Q?cCOWMG660QBrqlf+gWtAuz088epHYA6Cx64HYoIuxOgDFGyRothEc+DdnRdG?=
 =?us-ascii?Q?2VCIzmhj/b/TqM13yuj1ujwcS60RjZ1ZlcTgMgTnRzxttYZgDaQ5tW4B9wXL?=
 =?us-ascii?Q?W1iPf/Inri07H0Ue2CwUrWVVO+nzcVOrqQQ33bkN0oafwzJ+IrLwWrMjek5N?=
 =?us-ascii?Q?ycoTyDwdCki7gF43vq362QJBsF2vdplRaya3yuJlxDs/us9gCIW19dO7HUuX?=
 =?us-ascii?Q?rBZEMGLReqAf9VN0vmYfarox3u6fBNcrqhigQ1qMaAj/Q68pzIvDvYQddAPW?=
 =?us-ascii?Q?U1ztcb+pqIp2KD/SchM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L6/mMpx3FkPYoAz5ON7Y1z+4xiYdzb8A+lQ7PpIZNhnL8fgvxE5ErGOUTbAw?=
 =?us-ascii?Q?jqtEdffswXsDXwlxp50q2wr3dxtIKl5xDqXXN80efvtABJ9NvmEy0/l++L5R?=
 =?us-ascii?Q?SGDQDrQo+VkTOW7BMbIpKumkHA4yekQpm9lYSK5lE1Ssw8VgTxuaPL2I5UPT?=
 =?us-ascii?Q?lgURe3Add2xb3yAxX77wKYngP7kWrTjfxJRkJcE6soCKQVdv5NYubYtKlVo9?=
 =?us-ascii?Q?TEaYTIKMH8M/cdSQWNY8EZ50bALAgQhE1EGyEpvXoJVxOkl/cmKBrjCXTYHI?=
 =?us-ascii?Q?jYhaSkIzKGYt2/bc2mj6zQtSZ4XutaRK2DJVs6hH7OVZiKRckGLxPw61Bxfm?=
 =?us-ascii?Q?7RIPV89wJe38hHnkvjwm+siPQO/+h/cE+XsmXYdV3Se4r//WdLV4TuwF4vUJ?=
 =?us-ascii?Q?Y9wmgRg1/IffQmM4L5X0zubA70j7nNo6uFzBYbD1SeTWxtGSVryq/1IGDX5l?=
 =?us-ascii?Q?OtjNqeRhLzXmK73F8M6jDbYwp5sXYb4QY+ocqBw4ODI2X6ROSlnt6d3lCsJ+?=
 =?us-ascii?Q?w6PcGNHGCgWci2Ljqewg8z3Rf459LW5Ji6Ibq1/xAwHEQdmodzhnIKSLNy+p?=
 =?us-ascii?Q?O0vOgXu2A59oPBjqjiB9dFo1Z6537LwZzRHF1901A5KMYRwofy6+fVc0qry6?=
 =?us-ascii?Q?0S5w8M5p11nyHCIEsOFNXfvouPYbwfpcJEArZ8Z7YQH4ZBXs3+UeUmDrMJqk?=
 =?us-ascii?Q?Dm1truvM7VYo6gsLE2Ke9JIPzcjzLfleYIuIQgy8hKgvLio/yWgsgDqhNk+t?=
 =?us-ascii?Q?U7sE52qbRPs06hbmywZufbVfRmyLPshjV2hnN9kcLWwFJaT4gFpkPkw+7jum?=
 =?us-ascii?Q?P5NLrE5XLEvGZ9UWWqxnqMUa/KDKQDJNHoqQDW7xivXrhSXmLfdkP/QEwt72?=
 =?us-ascii?Q?wkjdkj/xmrjxwsD8K6Ff4EZeoO1RXNSU+T0FZ9zqzVSqavpGxVA9CvI+L4Zr?=
 =?us-ascii?Q?gzRTixK6Pb167mIQ9uAbo1SnnvxmyYjmTt5rK0dSSOQ18Dj3pK6f3prht1k+?=
 =?us-ascii?Q?Cp3zi6fZlDiNFh6aLWqcbqjraD2EB64chAimoD14R6RpARAVrMTxggNCw/jc?=
 =?us-ascii?Q?3C2mV/WakEQJXge1FTQSVoS0+b4fgv8dYUQlMps7PCzBKjv91Ejbhylg87i9?=
 =?us-ascii?Q?xfyJb2R+zfaWKG89zeimq1RWuwqRrhslmRbRBlj6y/AEg439jAX8W8Rrjihz?=
 =?us-ascii?Q?J4eRVbSVnnc804KVStK4+RrSVvHqR+reLcX3IQz3ghESE2ned4iKj5syxGqc?=
 =?us-ascii?Q?BUH5/yKE7Ur5R95V28u+zdEaFYw73F8c0V8Sx/sZtiLyu4ZBkuvStHbFOVZo?=
 =?us-ascii?Q?nFnykPQv7xWhe+sbVP5KFcUf3mM7Mksg/i4t09Q4UFoI6ItFU5FTpTz5a4CJ?=
 =?us-ascii?Q?NaWBUD9V0wXFVJfbqebEGvtMUX+bq80wo2n/VZCizJOtBnse9t7vxW3gKPHZ?=
 =?us-ascii?Q?mhq7+gKtJxCpa4xpyIsMW5uv5NOuX7am7RlCogeIfGJUPlRCdPDis5LX83dI?=
 =?us-ascii?Q?b84kfKHH+j1vuyOMC31BSYsTKHBzuHhpWJ/moHtBM4zTXmaT0TkW6x7J0203?=
 =?us-ascii?Q?u/pz6jZb7KF06MLS1mcOijrt8crC+ZVhvQYlgBoPb0vWvASnbU3qbnrgsoIN?=
 =?us-ascii?Q?B4WqhHp21dpmuEtRxLCpKUnBsyxGjnWaEi9aWjNTPZ0zh9jmSaSP+fKIbus2?=
 =?us-ascii?Q?B/GvTMGhxN8JX4JaSfwQuyJOrzMU4pOVP207RRJa78RncjQ3MVfnp9gX5EXi?=
 =?us-ascii?Q?5824qJzBgAwWo7ApacIySM20OGLu+stg7nvb9Jug/MAE4UNdsHRX?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b698580-b333-4a55-8af2-08de5b57e26c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:15.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc8nqa+oApPk2OrplNJMXf+qUsCX52OQ36C9iE7JKpxJgwD0RKln87osRaN+kI4fqNeoKvzJ8RA9yc4tFm/9OQ==
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
Subject: [Linux-stm32] [PATCH v10 0/8] PCI: endpoint: BAR subrange mapping
	support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,valinux.co.jp:mid]
X-Rspamd-Queue-Id: 802D97DD1A
X-Rspamd-Action: no action

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

Note: This series is a spin-off from a larger RFC series:
      https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
      The first user is the pci-endpoint-test, and the real user will
      likely be epf-vntb for Remote eDMA-backed NTB transport, demonstrated
      in that RFC series.


Motivation
==========

(This section is identical to my earlier explanation at:
https://lore.kernel.org/linux-pci/waapztvy6jyjqtfcoo3rbgvagi4z3p5afw6x2acgf5bxatcui6@nkodhtqqtetr)

The motivation for BAR subrange mapping is that some EP platforms
effectively have only two practically usable BARs, while needing multiple
logically independent inbound mapping.

For example, on Renesas R-Car Gen4 Spider, 64-bit BAR0 and BAR2 are the
only practically usable BARs, since BAR4 is only 256 bytes. epf-vntb
already needs two separate regions (config+spad and MW1 for the
data-plane), leaving no spare BAR. Adding ntb_msi requires yet another MW,
which simply does not fit unless an existing BAR is further divided.

In theory, some vNTB regions (e.g. config+spad and dynamically allocated
memory-backed MWs) could be tightly packed into a single physically
contiguous BAR region to barely make it work. However, it immediately makes
features mutually exclusive (e.g. ntb_msi / ntb_edma cannot coexist), and
the layout becomes extremely fragile.

Similarly, for remote eDMA-backed NTB transport, the host needs separate
inbound access to the eDMA register block and the LL regions, which are
distinct local address ranges. Without subrange mapping, the only choice is
unnatural layout (e.g. dedicating one BAR entirely to eDMA register block,
and another one to everything else that can be packed into a single locally
contiguous memory region), even when this is barely possible.

So while some cases might be made to work by aggressive packing, they are
already at the limit on platforms such as R-Car Spider. BAR subrange
mapping allows these features to be implemented in a straightforward,
loosely-coupled, and extensible way on platforms with severely constrained
BAR resources.


Patch layout
============

- Patch 1/8 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 2/8 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 3/8 advertises dynamic inbound mapping support via
  DWC_EPC_COMMON_FEATURES for all DWC-based glue drivers.

- Patch 4/8 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support via DWC_EPC_COMMON_FEATURES.

- Patch 5/8 updates a documentation for pci_epc_set_bar().

- Patch 6/8 extends pci-epf-test to support BAR subrange setup/teardown
  commands and advertise CAP_SUBRANGE_MAPPING when supported by the EPC.

- Patch 7/8 adds a BAR subrange mapping test to pci_endpoint_test and
  introduces a new uapi ioctl (PCITEST_BAR_SUBRANGE).

- Patch 8/8 adds BAR_SUBRANGE_TEST to the pci_endpoint kselftest suite.


Kernel base
===========

- repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
- branch: controller/dwc
- commit: 0ecd890e3cf5 ("PCI: dwc: Rename dw_pcie_rp::has_msi_ctrl to
                         dw_pcie_rp::use_imsi_rx for clarity")


Tested on
=========

I tested the new BAR_SUBRANGE_TEST on R-Car Spider boards and verified that
it passes on BAR2. It requires the following unmerged patch as a
prerequisite though:
https://lore.kernel.org/all/20251023072217.901888-1-den@valinux.co.jp/


Changelog
=========

* v9->v10 changes:
  - Added a safeguard in dw_pcie_ep_set_bar() to ensure that
    dw_pcie_ep_ib_atu_addr() is only called when updating an already
    configured BAR with matching size and flags.
  - Added BAR_SUBRANGE_TEST coverage via pci_endpoint_test and kselftest.
  - Fixed the commit message for Patch 4/8 (dropped the line "subranges are
    sorted in ascending order by offset").

* v8->v9 changes:
  - Dropped now meaningless source code comments, which should have been
    removed in v8 (feedback from Frank).
  - Added motivation text to the cover letter and to Patch 2/5 and Patch
    4/5.
  - Rebased onto the latest controller/dwc branch (see "Kernel base"
    section above).

* v7->v8 changes:
  - Drop the explicit submap offset and use_submap fields. The submap
    array order now defines BAR offsets (gapless decomposition). Commit
    messages and source code documentations are adjusted accordingly.
  - Drop the no-longer-needed dw_pcie_ib_map and add ib_atu_indexes field
    to track iatu indexes used for teardown.
  - Move inbound mapping teardown into dw_pcie_ep_set_bar() to cover all
    BAR transition cases.
  - Centralize feature bit advertisement via DWC_EPC_COMMON_FEATURES.
  - Added a (epf_bar->num_submap && !epf_bar->submap) check in
    pci_epc_set_bar().
  - Note that some Reviewed-by tags are dropped, as the changes need to be
    re-reviewed.

* v6->v7 changes:
  - Added missing check of dynamic_inbound_mapping feature bit in
    pci_epc_set_bar() when use_submap is set true.
  - Addressed the remaining review comments from Niklas (patch reordering,
    splitting, and source code comment/documentation refinements).

* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v9: https://lore.kernel.org/all/20260122084909.2390865-1-den@valinux.co.jp/
v8: https://lore.kernel.org/all/20260115084928.55701-1-den@valinux.co.jp/
v7: https://lore.kernel.org/all/20260113162719.3710268-1-den@valinux.co.jp/
v6: https://lore.kernel.org/all/20260113023715.3463724-1-den@valinux.co.jp/
v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (8):
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Advertise dynamic inbound mapping support
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
  PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
  misc: pci_endpoint_test: Add BAR subrange mapping test case
  selftests: pci_endpoint: Add BAR subrange mapping test case

 Documentation/PCI/endpoint/pci-endpoint.rst   |  24 ++
 drivers/misc/pci_endpoint_test.c              | 203 ++++++++++++++++-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   1 +
 drivers/pci/controller/dwc/pci-imx6.c         |   3 +
 drivers/pci/controller/dwc/pci-keystone.c     |   1 +
 drivers/pci/controller/dwc/pcie-artpec6.c     |   1 +
 .../pci/controller/dwc/pcie-designware-ep.c   | 212 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   2 +
 drivers/pci/controller/dwc/pcie-keembay.c     |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |   1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |   2 +
 drivers/pci/endpoint/functions/pci-epf-test.c | 172 +++++++++++++-
 drivers/pci/endpoint/pci-epc-core.c           |   8 +
 include/linux/pci-epc.h                       |   9 +
 include/linux/pci-epf.h                       |  23 ++
 include/uapi/linux/pcitest.h                  |   1 +
 .../pci_endpoint/pci_endpoint_test.c          |  17 ++
 22 files changed, 681 insertions(+), 12 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
