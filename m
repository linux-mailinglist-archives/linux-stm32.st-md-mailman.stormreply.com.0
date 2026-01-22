Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL78IZfkcWk+MgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B1636A6
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6F7CC87EDF;
	Thu, 22 Jan 2026 08:49:26 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020089.outbound.protection.outlook.com [52.101.228.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58F4DC57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1sP3dJLa0h1arfq0ELB4If+GX8aUY42k7w2Zp6CXJIV953lTX8CA1bwZ2zbt4cGtzJDaBJ7sbMgBDTjfNN9r7s2VzGoriPONOy5h8eTAvt9LaPou/SaTvHUA/nr7r+f5FnQXMSW82gLHOiNMQ+clinnC1fwKyCM2Azrx6xjGxV01rtestbOaxFky5r8G6Wyp+/JLi/whJhYbjBYqsu+nmkZwdZtOYdTmABE1MuPJRpx9sad7Z7HJimx7Qq7DhXyYzlma8CzTyEhK8bMb6Hn4GDQ1913o203yQa/VTyI6g6aMqaXpX54l3dY90xfyRPqHbAGvC3e0ocRx/juZSxP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0uWRQJgrr/mn7ukUehNnF0+ydfVB8O5P9W0yQZdlgA=;
 b=VRHYNnGPmYhoseo9T9p++p4SyZODcNXP72rWvElxMgMrGcuFzreIB3JzWwDIga0T2lu5wA9yaDS2+TC5YhMZHGPcs13vGMdFOtcu8hTVOrnGmRs4M2ou+GiG5QCgIhAvg0nxiQsjbG14FDAelZuF0fpyzThxTVDIuuxraQe00YalyXCEWingS/pKcd6Ai0e8ZkKSE3+OHmvgaTUnt83Ziw6Yf5Y4PbR0lf4r0hXJSXyotDwxmn5P7VkAYFhx0US/4dyewh8UM+KVUVOpSIsMWseCptLPpDH75AJ45/OjIfMZoWWdB4KGT36BSkxWo9NwRZkIGseEFLN8gK6B+DgC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0uWRQJgrr/mn7ukUehNnF0+ydfVB8O5P9W0yQZdlgA=;
 b=g+shrSySwnxm2pJeZqyAQmMtpbSEAxPL98ZYD2eNI6YkFdi+iUAnuEU70im5n3kZL3nZKnNAvhACzFXraSsKmZlqrqunhSnzHGRN2UGK4Q3GYNMtuWIyO2Ow7T4bNOAlDzvRbPwEMfx1hw3OqYZL0IdB9U04qIJYIrjdh7+qHuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6581.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:06 +0900
Message-ID: <20260122084909.2390865-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4PR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5459aa-2742-4498-4fb5-08de59932168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SoWHHMhHA0T90CR4Lt6NB8gPF9yizgVCezyUrobQcND5k4aS+FeF4u9MkWoW?=
 =?us-ascii?Q?MS+fIo+plfZpJAh7fVKH5X7GpFrj/omMQ5vwTb4PLJEqOra4zT02UCTYsuDz?=
 =?us-ascii?Q?4W7PUQR2q7gX/yIxKlmciI8q2lJaT4BNxsQaxaJTR/MOcs6ZdLdtDMDneRLj?=
 =?us-ascii?Q?mlFp8CveMDXt3T/8ze7ggI8CEEt/dBhtrbGh6nLuShpZ19Af7tGpcfX8VGzG?=
 =?us-ascii?Q?CWooX4bZNJRmS5VB3zrMV/8Y/PJ6iRKXeDlfySkHLyoww4mVHIQzaRdzqDtn?=
 =?us-ascii?Q?rRXGgrCvM057iwqUxpD/GqPdDC4aEA+oNm0DJAXCjBrf3EF2rH1Mm2uT8bpU?=
 =?us-ascii?Q?8BIfdln2SWM7Fw6TCjHjW20vszG6DQzQmAha9BS5EMKwQc9hIKxK4EKjsP+h?=
 =?us-ascii?Q?GCpjsd7Mr7vMSKQTu/94XucWfD2rH05vUaaBrG5qSN22ftyBew2Uef70m70p?=
 =?us-ascii?Q?fWPVTddo+CEThbDUBZVOjjyjDIlc5DtM0xL/cnY6BjaRXRxnqpZA1QATBnsQ?=
 =?us-ascii?Q?kyhfkSslZ++s/I2+mYL5Fa+lwYXw1C+iAzxsmMOXzbBBC75ZlL7jm6iRoiC7?=
 =?us-ascii?Q?4qY7GJQMnI7WzvAKibnzM9j5V3MeLm3z4zPlJxEO5hkYtgrwqXjA2/pF2jYY?=
 =?us-ascii?Q?LVHuhogzhqbMYOagUTy3okQJZykGdB3iEctPHMPyxMxGdCg+P+2Tm8si6EnZ?=
 =?us-ascii?Q?15smukh74GvkZl5pmEiVTbc3UpBZ6vs6wZFbCMxE9U4LCyiGqOQVdPjJYPGP?=
 =?us-ascii?Q?yWB1vYSZ1FAPX/OlLrzzmpETIvMH/OUrWdpg13TebsEY2emtKyqmj9jcJY+W?=
 =?us-ascii?Q?CMFT4KIukxQHwtbGi7W7GiMLdW4D8LX5kM1c/xzbRClqd3aOLmFwLcZfzRMc?=
 =?us-ascii?Q?K3mimF4F3eSq8jzIF5X26DlqH5FQWLFzIZo4ti2ahUAJkNaWtCjWSWRf5fK0?=
 =?us-ascii?Q?S47ll+6KQq/hHnwkV1OD/ybLmTPYe61MvwKS2/STx2LJ3TNb9QxSklz7lMdC?=
 =?us-ascii?Q?LwfaHpegGxEqcJdhvIvb53+Yp12Kg74h9Q7v5FCxzROAp56MUcfXRv1hqzFw?=
 =?us-ascii?Q?P2A6iapIBgrVi0WUjosajsvlQvQKkTFYZ2tCGypXjcKrLT+Nf9stG0pk43sM?=
 =?us-ascii?Q?Z2c8RqZ82p7mjVeGDv54EZwIwC+KXwiNQViwdqs+whghtjzEKvKkPQURSAJA?=
 =?us-ascii?Q?2jGTKPYvI/tmZ9bKnGbERlMsB9McKB4Qo2yP/x67QCSQtEEj1MQYg+scmskL?=
 =?us-ascii?Q?FhmSCHJ89pq61l0SHDtX7kVvOd3LNvttrnluGZ9lbqemntzGpE1a01qIQir5?=
 =?us-ascii?Q?eu2aJk2RcAMCv1I8mY1QuQZZuY8drKlFkDQ5xaXGs85B4GAE/6cKE6Lb6GG8?=
 =?us-ascii?Q?rUPRXxrKMoLAV4CukekI6jmw69CiAjMlorXdVp9l3SRehnfTshHpX3whm9Sn?=
 =?us-ascii?Q?nw0A4NCkwUH7cCasBj4Y5k5lnEVSUyRjWfv2x/bLDAxKDkWrTlA7mEfVKqFr?=
 =?us-ascii?Q?BHyvrJzg2S6MWxuadqLuvzC6Plk+F0V0YR0YBI2BotEm2M9io3ZYq2N28iLo?=
 =?us-ascii?Q?5zo21LI3Of8wJNRwnb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKgyZR9LV72CkUGE/0U2wSZl5yleLNgundOBb3OihjCU6kSc1YEkQmbf2fm7?=
 =?us-ascii?Q?HJ5vrHJd78ghupzHkEyzUynRrOLY2rOg+/q+5/LBnz+Lg1qNSBr0FaJDQekI?=
 =?us-ascii?Q?cTWKImt8xn6xvDYtoLBmmer8aZEZuoTJAhVQUrfYZ8bcAGU/ql16nMUkn8+c?=
 =?us-ascii?Q?xAVgWmUqHWbX5XC/8KWY1u2rQNXdQXleDqRGxTtola4ngtI0GZkKbLfkhN/f?=
 =?us-ascii?Q?QkxVznbOPiMIdg8k4WIGiuqPbRNHHx4nlh84AsstQ7TrZM6GKneGab+nhgF8?=
 =?us-ascii?Q?Ib86tGH/d8VpnRghnYu0WwEx9/PEaEy1UZEOCFS8Wj5W/1LiAyVZPAoD5Jhf?=
 =?us-ascii?Q?k3CRm538SAXabZP8kB+HVz8tokjmbU245cCfIKPaUu394Ym8V/aQcR6OVjkH?=
 =?us-ascii?Q?ku2wNm9WTdZH1g4Si6jGPwkJa41U2xHXKiJ19kLFY8d9PQSJoIIPF7Z3TA7C?=
 =?us-ascii?Q?135piow7r+jXwYHGffKu6uYCyAldfRzkumTLvg59KjwYt1QW7dULkkh3H95A?=
 =?us-ascii?Q?CrTGiCgz6A5OnNWkpYONVfSLsMfKcvDT6wlYXD9PAxRxAoO+mrKufJjcls5d?=
 =?us-ascii?Q?mOyYAjvuPXJAtRV7RSMowmH5s/Dq5JU8D5cu0VzVVOMysrO89YsVCu4pdDwu?=
 =?us-ascii?Q?o6l2njUo2QyGCm/ljhfy+7m3whaB4aKd0iq6srPqaamCSCpavqfCxLRtbUCv?=
 =?us-ascii?Q?KoTFhAkq347Z3gDu+2JjGIXFRodguI9dkFa4Tzsn19AVx/5LCpkDNjC43uM5?=
 =?us-ascii?Q?ALYmDjd4VLKs2xiWzXtMXrjUbEtM+uwk1mLU9f21tyinCQwy3I9OgoGCeOAs?=
 =?us-ascii?Q?KLmL87vd+yiEZNZj+XwELtZCPdq0l7YJBXpNsHD7qgNsU6QXfibxCPFK3QRU?=
 =?us-ascii?Q?yU2qcH/nQvcQMWmMDLLiAgoV7ewcEUabLC8hhACNUYeL5XDBbfVyC+7o2yfb?=
 =?us-ascii?Q?Q9jn95yiM1cHBpz+kxVcVcgH6/0NI9KB+1Z7h9DVVPAEDQYPHqwKeAN7mO5O?=
 =?us-ascii?Q?whbh2fcF7AJysyW9fuTcnHlMtH2L4can5+Usfpa1QkOEMJZ5i9gUq/IMAKli?=
 =?us-ascii?Q?w39YNTm2oQzTLl4MqTdMBh8/48f4N2mhZXi79LgGVd4IED0qmA1UwbZ+OjJF?=
 =?us-ascii?Q?robHiHgdYrbTrt/IToC/o5EDmRaHPA24NOW7ekPNceIiyGOZ2zkqGAPUBtdY?=
 =?us-ascii?Q?6demMfJhPmWbOsC+2kEG8Rnw8m0lH1UC3qLb6uUkDopkDggzke5PK71FxHnm?=
 =?us-ascii?Q?XAsCLTOqX65dB6dgt7SXFuy/tKutW4mHCwDtyk1zjmkVl/h+Qdf3ikD2JfDX?=
 =?us-ascii?Q?P7DJwchz+HsVc2ksC4rf55usf/U1bUmY2jvadKETlhXwtIfDmoXRFaTts0SC?=
 =?us-ascii?Q?AZJV56ECgLSuXCgvZ1UiA0ZaCf91X3QUH08sIzQNWZIYbnGPGbJ8RCZ0hhAX?=
 =?us-ascii?Q?17JhWA7/m5eqQofZKBTCfS3TqNeAM2qt6ey9IgVcFXZgQheSHLB1XQ1eEAql?=
 =?us-ascii?Q?u3rEHgFkYZi4cx0d+m3KPMIYWkWAndmv9be9+4tkHmLhOP5ZYRBku6x4ihRG?=
 =?us-ascii?Q?lqvKYVrqce7L6mwjNvjlsqbJxL7PWdg228aBjYCDCpSwzfL2ZhW9Kmev4FC5?=
 =?us-ascii?Q?SJ8ErRcOG4WIze6CLAXfL00SPfNdMecarldrzCPvOvXBcdQkn07h2XLVXRCR?=
 =?us-ascii?Q?pM7ZH6ls/OejKKBHE7xjEqPOk53QUzSTgMw6fXYST9COzIxfDBL8tss9xC/I?=
 =?us-ascii?Q?l/fFSnkaTM/BZWoVHg1jwEC8MFMvse59cYCPK+XwBo9sufK5HM+8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5459aa-2742-4498-4fb5-08de59932168
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:18.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ma2oWhJ7zULN3v80x82QY8G2J3IW3uTQv0lYT8tW0TVmcDJduGl6p0KmgpEYEwwmehgU4+8T7YrUtMesRLIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6581
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com, Frank.Li@nxp.com,
 christian.bruel@foss.st.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 srikanth.thokala@intel.com, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, marek.vasut+renesas@gmail.com,
 hongxing.zhu@nxp.com, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, minghuan.Lian@nxp.com, linux.amoon@gmail.com,
 linuxppc-dev@lists.ozlabs.org, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: [Linux-stm32] [PATCH v9 2/5] PCI: endpoint: Add BAR subrange
	mapping support
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:Frank.Li@nxp.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,
 m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,rock-chips.com,nxp.com,foss.st.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,kernel.org,intel.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,pengutronix.de,vivo.com,lists.ozlabs.org,renesas.com,collabora.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 721B1636A6
X-Rspamd-Action: no action

Some endpoint platforms have only a small number of usable BARs. At the
same time, EPF drivers (e.g. vNTB) may need multiple independent inbound
regions (control/scratchpad, one or more memory windows, and optionally
MSI or other feature-related regions). Subrange mapping allows these to
share a single BAR without consuming additional BARs that may not be
available, or forcing a fragile layout by aggressively packing into a
single contiguous memory range.

Extend the PCI endpoint core to support mapping subranges within a BAR.
Add an optional 'submap' field in struct pci_epf_bar so an endpoint
function driver can request inbound mappings that fully cover the BAR.

Introduce a new EPC feature bit, subrange_mapping, and reject submap
requests from pci_epc_set_bar() unless the controller advertises both
subrange_mapping and dynamic_inbound_mapping features.

The submap array describes the complete BAR layout (no overlaps and no
gaps are allowed to avoid exposing untranslated address ranges). This
provides the generic infrastructure needed to map multiple logical
regions into a single BAR at different offsets, without assuming a
controller-specific inbound address translation mechanism.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  8 ++++++++
 include/linux/pci-epc.h             |  4 ++++
 include/linux/pci-epf.h             | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..068155819c57 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,14 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->num_submap && !epf_bar->submap)
+		return -EINVAL;
+
+	if (epf_bar->num_submap &&
+	    !(epc_features->dynamic_inbound_mapping &&
+	      epc_features->subrange_mapping))
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4c8516756c56..c021c7af175f 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -227,6 +227,9 @@ struct pci_epc_bar_desc {
  *                           inbound mappings for an already configured BAR
  *                           (i.e. allow calling pci_epc_set_bar() again
  *                           without first calling pci_epc_clear_bar())
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR. This feature depends on @dynamic_inbound_mapping
+ *                    feature.
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -236,6 +239,7 @@ struct pci_epc_bar_desc {
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
 	unsigned int	dynamic_inbound_mapping : 1;
+	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 48f68c4dcfa5..7737a7c03260 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -110,6 +110,22 @@ struct pci_epf_driver {
 
 #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
+/**
+ * struct pci_epf_bar_submap - BAR subrange for inbound mapping
+ * @phys_addr: target physical/DMA address for this subrange
+ * @size: the size of the subrange to be mapped
+ *
+ * When pci_epf_bar.num_submap is >0, pci_epf_bar.submap describes the
+ * complete BAR layout. This allows an EPC driver to program multiple
+ * inbound translation windows for a single BAR when supported by the
+ * controller. The array order defines the BAR layout (submap[0] at offset
+ * 0, and each immediately follows the previous one).
+ */
+struct pci_epf_bar_submap {
+	dma_addr_t	phys_addr;
+	size_t		size;
+};
+
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
  * @phys_addr: physical address that should be mapped to the BAR
@@ -119,6 +135,9 @@ struct pci_epf_driver {
  *            requirement
  * @barno: BAR number
  * @flags: flags that are set for the BAR
+ * @num_submap: number of entries in @submap
+ * @submap: array of subrange descriptors allocated by the caller. See
+ *          struct pci_epf_bar_submap for the semantics in detail.
  */
 struct pci_epf_bar {
 	dma_addr_t	phys_addr;
@@ -127,6 +146,10 @@ struct pci_epf_bar {
 	size_t		mem_size;
 	enum pci_barno	barno;
 	int		flags;
+
+	/* Optional sub-range mapping */
+	unsigned int	num_submap;
+	struct pci_epf_bar_submap	*submap;
 };
 
 /**
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
