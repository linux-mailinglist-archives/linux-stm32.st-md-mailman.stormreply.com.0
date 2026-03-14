Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TimIFxTltGkfuAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 05:33:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D528B90C
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 05:33:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F9ABC87EDB;
	Sat, 14 Mar 2026 04:33:23 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11021107.outbound.protection.outlook.com [40.107.74.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4145FC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 04:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbGy4t/XKTq7k9GazfZnjB2a0UTQy4Mh2N0jfTEBLpnEUQ4af/qSMlNfsu+t61poW7GFWe9lLfOVGmIpOnfvpkE7wJhRX3qWqRetgQyeXLbmR6oj6FqhtoSmM6kPtWZ7viOnM+YkrfAhlt8OwnPU2JyYWfE9EfVXv5VBtTeXo6fIQolDWdIRW58fPnRkIM+g18IA6IO59ZRAjPqN0XUVlTATpl5fR0q0LlD1p3R0BGXdCV1xENT+k5/eg9kymxU0AYJbZhyOkJLW779a0zzWU1SHtpIigv/S2y6PNfyFMjPcdQA7sA/Hcb6J5NV4vEBQ661gDNfbD8vaau3/HuiVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt6l5l5f8bedU3Nd+YRqBu7yp+ZT/u5xRLV9E/MiwpY=;
 b=zJyV0BBwkU0kp71ooCUeDTAIyZ7/3sG4ygnopVSsT0FgsZL8niSlldjQlKN/8V276Jog8V6n3f1qVaqEnBa/rAF58hx9U+TjMUtV6Juz3/Rc1WdNJkxPOXhZ1Ghj2MEcCbQ1OJmiw7dMYomnrNdGyazTI/VgbKZrahocS7cpJuWH7+D4VBdSQJ31VOY1l7tw+qTA6asAdWIPZiYHqL5zFCYSJiepsbA0VCQTQufdWOYD30N6WUanXCCOZSjnAb/NxTZtMsf7sEe7aoTavtCZO8+T07VQqB9QYCYoVnyErf4Z9Ec7b99n0h9WYkwxpCI3g608KrC29TunBWBemugyPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt6l5l5f8bedU3Nd+YRqBu7yp+ZT/u5xRLV9E/MiwpY=;
 b=iXdgjwwaQxYgiw7B8FmgKaVrug7Qn+C5ZL/r7BTbeHM4LXA0LvjCwWT3saegToCRnIaLIrqDJHF987FKgvIDbK3iI+IzZswhxEAaQj2Oh8jeVXeLTXjwtFtILhV8xNyVzFK7aOfZFTeZp6jw/m4acRyX+tns5j+UTq15C8sRlPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5686.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 04:33:17 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 04:33:16 +0000
Date: Sat, 14 Mar 2026 13:33:14 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
Content-Disposition: inline
In-Reply-To: <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 117befd6-b300-496f-07bb-08de8182cf76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: wBhPz6v9XhyEg9APV0PbwPu0Hgog0VsuiwLQJvjWIFZlkmy8jdUpH5CoaX9ALIQWZQXrtAC47Wh8LS4OJ2a8JF6nGjMATddFqdiq+fDLHGSaKqTvUPd7JKHZlzeH8Vg//PP6vsDDGYxB/AWBpChjrgmO/GAWXKu9mP2a+TyHN3eDRrYWkjHLq3oXJzhL4thb967G77n7++B9R4per46UL0XvGamr/eAH+R6/guzguriIkZ6Yyl4/ktJunClecqm0Z+fz16/lRL5CplTjNGeqg7svT6ujYgNrsYNr1lyb95Rz1QN6vYCbFss8Fe+m2IlPtCJ9tcdEq1WeghmFLUzA34Q30WU9UQH2W7EAJyDvV0exZa66EsQGX7axEDdDh3WacfnwgM/Y9ZR9PtclRZ+Ytv/UdGjJ852H7Ba3MLqjuvug0rmmch33d6wFbT4b61C3b2C9vPaDW/4FesgPK5163asmjLBBBrm5PPD7i6wq3suz3EyMWiowiaoTHAL5S9RQlwKDtF2xIbe+EqvXUMbuh7ibKhG/QQdkgDSWRRA9O89hQ6QqHKp7nl0M2smNZOYJW4dT03NK7hMcmd9Uv6fS3rdCFwbUS0mOlK06Jq7953rmgenkxm4jwTkyo0HzstCIRzM91UnFw5orba0oQeGfJxULRLhhAtABfPNdTXtpylpnEUkzPIVuw+T4Uxh0tJVYu3geme6lbDkvuFU9h0s64KgyEi+vyJk/Z03fFE40QxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GYzknUcMI1HL8nkg4o4Wlt4IQY6UJoMR3ZeGWhwbR97UwKpkRmnc35ILuvK2?=
 =?us-ascii?Q?jDVuYk3cxfeemXG7VNgwtGUljrEkd/IV6v/cZusdAEuUQb59l74/gCTmhvhZ?=
 =?us-ascii?Q?SAf+bxVoORnBPLNB5NLM0/rxIqfxi4wgxX2zr4yJdlEjsYlr5oQmMeL5DhVq?=
 =?us-ascii?Q?pLMoNgX7kJO6geo+h12+AFTM2/XgUXEqNN6gNS2Qk1LbxDhRJaiD1lmCEOwT?=
 =?us-ascii?Q?FjZwvBJTF76md6CsIrfqNyTh81L0LdXpwpMwSoxQry/yR+jks9iWq8xtDFc9?=
 =?us-ascii?Q?/aBjX1E5t+Sy0+k1/OLXU2xF68UusQypd8kjUSIRdCbBcM6GaTcKzDVwWxuW?=
 =?us-ascii?Q?R/+eRhr6ttPBzXj4ORmOqNaf3YapI+zXnlF/NE7M0x5brkK+9uq6L/PBGx+6?=
 =?us-ascii?Q?3xEhJS+LOwUdiPIAqz6nJZGQ0PeMP6vEtA2wtUP1cBqoPMwWysVk4Hg6yRFh?=
 =?us-ascii?Q?/Wa1KRS6oGrBpptqM/w/u5ZImTh/RBRWFRyK0fKrfMKbvTnHhhiv3maKROib?=
 =?us-ascii?Q?h7b1/8J+1/8DERi3y9J+VKMtrpqUN/YSKCOXjwSlxJg59pvNTB2UE30BXerU?=
 =?us-ascii?Q?vdGSzPHts0J5P6u54HJrlWAG6Feitk3tmfoiFSLM73/A1Xv0CViF2R4yzKcQ?=
 =?us-ascii?Q?Y234+aOiR+bIQRp+7ina23iFvboweqP4ZyWJK/dRiQe7CODHz42e/4mD+K5F?=
 =?us-ascii?Q?Dk9t8+nuNmRGHTtLvq0iNjCDHhM27Higj79NoP4pjU0UOhk0Sx6tc+LgfIIq?=
 =?us-ascii?Q?Jfi6B8yo1d+4dEy8DSgpyhYCrXAozKLlx0O2DMASUXzQmKHbD8FlDaSykBld?=
 =?us-ascii?Q?SJKGutO+CW9HoV0P4lUx/vbIyKcz6Mlztt7TUC885mTtKoNC9CFCUt+z3IYk?=
 =?us-ascii?Q?q2kQhmVpto89s6iFApN3WbVTQDZeeoXHdoawUa7//pFDMyM3dje4XteB9bqd?=
 =?us-ascii?Q?Baf+WeI+AnFdzqK2OLlt6YcET9uSgmizfzbo/jzQG1Z1HGrnOL+blWzEt5rC?=
 =?us-ascii?Q?1JnZjGRfPGaE+MqoR654SSgsBS2D3qn2KU+wao9pELNze+8eXLMyHGl55hzu?=
 =?us-ascii?Q?NNZP+/dpcgiSaLQb35ndfeReVUHDmWz5uoFPsKe+EhGhCMsxFYE8F/h0Ipim?=
 =?us-ascii?Q?MJgobvmUCmRT/cIUb4VhyonBMLZh72UQtVLSpayhQX2FQuV3aP+n4r6lpEBn?=
 =?us-ascii?Q?/762MVCcWTje/Su5w+4rnDa/DalMI9Bs7xoL+dVr3APoskwsV4PrZKPZEBfk?=
 =?us-ascii?Q?LRjWqTb+xQcF2icLlLzEkrnNlqV8F1nNPt7MBSKPZEq8Y1A52z1zuZ8TmihA?=
 =?us-ascii?Q?7+mvurcQgIEyj4c1lmFRDE44vs5nUL68ZoatZYQhJ2nrqU+V2dq9EEOx9Rpl?=
 =?us-ascii?Q?pi5qq2dJV7Oa/L0F8apFSgREVgMF9h289MfmcFzS5AgG/CjA6TMVJ7J66Y0c?=
 =?us-ascii?Q?Yq9nLgrc2IozKbJv7sdC3Qh9VW6dFID9rRDIT3VhkuH909b/CJYlIR6vHT9L?=
 =?us-ascii?Q?q5fh0dQcGD+bE03zy2kNqy8dJULbLIQS5aiW+MvRap8gQZlNfmsQvt7hRX4M?=
 =?us-ascii?Q?v9C/zafN5OB51nEp7JVWpAqlow1PqnNf24BHeqFpmMO4QWitItEfCgpCbVEH?=
 =?us-ascii?Q?wZTMTrEi9g35PBI3p/eIGQcZvn1gjeaeeTtpaxENHzGPebrUlxdBdMzuldOB?=
 =?us-ascii?Q?5qmbuKgoMUDdYbGIzUEGaN4RP/HbnQFmizrd72QlNGogqga2GsJ7M1SeqSHG?=
 =?us-ascii?Q?6OqcOqjGtA5nfgipPeoeQDat8oox5VlCxItWhJVcMiU/8ouUFB7F?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 117befd6-b300-496f-07bb-08de8182cf76
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 04:33:16.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvIGl8wXaSAv8XF8Qn9pSc8/wVRucu58oFrKdRQsToXRou08snlwVJto8KmYMOjOpLKl0oEkyGJgGFgQSi+siw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5686
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 robh@kernel.org, jesper.nilsson@axis.com, hayashi.kunihiko@socionext.com,
 jirislaby@kernel.org, magnus.damm@gmail.com, linux-arm-kernel@axis.com,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 18255117159@163.com,
 marek.vasut+renesas@gmail.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, shuah@kernel.org,
 hongxing.zhu@nxp.com, mcoquelin.stm32@gmail.com, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, linux-omap@vger.kernel.org,
 rongqianfeng@vivo.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
 linux-tegra@vger.kernel.org, cassel@kernel.org, linux.amoon@gmail.com,
 jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 3/8] PCI: dwc: Advertise dynamic
 inbound mapping support
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:christian.bruel@foss.st.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@
 vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:cassel@kernel.org,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,renesas.com,collabora.com];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C52D528B90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:59:26PM +0100, Christian Bruel wrote:
> Hello,
> 
> While testing after this series, I encountered regressions on the STM32MP2,
> which I am unsure how to fix. The failures depend on the order in which the
> tests are run.
> 
> The STM32 ATU has 4 inbound entries. After enumeration, the first 4 ATU
> entries are allocated within ib_window_map.
> 
> On the first run of ./pci_endpoint_test -v BAR3(for example),
> SUBRRANGE_SETUP calls dw_pcie_ep_ib_atu_addr(), which frees only one ATU
> entry (BAR3), because we were in the bar_to_atu case, for the first submap
> but fails to allocate the second submap. So the test FAILs.
> 
> On the second run with a different BAR, SUBRRANGE_SETUP test calls
> dw_pcie_ep_ib_atu_addr() again, freeing the required ATU entry (BAR1) and
> successfully using the second ATU entry (3), which was left unallocated by
> the first test. then now the test PASSes
> 
> Therefore, the first invocation of ./pci_endpoint_test on any BAR always
> fails. Other invocations are fine because the first one has left the missing
> necessary ATU entry free. Whatever initial BAR number is used
> 
> I am unsure how to fix this. Always freeing all BARs before calling
> set_bar() in the epf-test seems overkill, but safe.
> I am also considering modifying dw_pcie_ep_clear_ib_maps() to clear N
> num_submap entries even if ib_atu_indexes was not used yet, since only the
> full BAR is used during the first invocation from bar_to_atu. But the
> question is which ATU entry to select ? BAR+1 ?. This seems empirical.
> 
> I am not bothered by test failures due to an insufficient number of BARs
> (this is already the case for BAR5,6), but the fact that the failures depend
> on the test order is frustrating and show a regression.
> 
> But I'm not satisfied with either of the 2 possible fixes mentioned above.
> 
> Do you have any other thought ?

Hi Christian,

Thanks for the report/analysis and sorry for the inconvenience.

If I understand it correctly, I think pci_epf_test_bar_subrange_setup() should
simply roll back to the original BAR mapping when subrange setup fails.

In other words, if there are not enough free inbound regions for the subrange
test, the test should fail consistently and without leaving any side effect
behind. At the moment, it seems the failed setup leaves the BAR in a different
state (i.e. cleared), which then affects subsequent runs. That looks like a bug
in pci_epf_test_bar_subrange_setup().

If I understood the problem correctly, would something like the patch below
address it? My expectation is that the subrange mapping test would then fail
consistently on platforms that do not have enough free IB iATU regions.

[---8<---]
From 039548c87a5c7a038ac562272447c4620a4c1ad2 Mon Sep 17 00:00:00 2001
From: Koichiro Den <den@valinux.co.jp>
Date: Sat, 14 Mar 2026 12:58:04 +0900
Subject: [PATCH] PCI: endpoint: pci-epf-test: Roll back BAR mapping when
 subrange setup fails

When the BAR subrange mapping test on DWC-based platforms fails due to
insufficient free inbound iATU regions,
pci_epf_test_bar_subrange_setup() returns an error (-ENOSPC) but does
not restore the original BAR mapping. This causes subsequent test runs
become confusing, since the failure leaves a room for the next subrange
mapping test to pass.

Fix this by restoring the original BAR mapping when preparation of the
subrange mapping fails.

Fixes: 6c5e6101423b ("PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support")
Reported-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 582938b7b4f1..0e5958088b8f 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -891,12 +891,15 @@ static void pci_epf_test_bar_subrange_setup(struct pci_epf_test *epf_test,

        ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, bar);
        if (ret) {
                dev_err(&epf->dev, "pci_epc_set_bar() failed: %d\n", ret);
                bar->submap = old_submap;
                bar->num_submap = old_nsub;
+               if (pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, bar))
+                       dev_warn(&epf->dev, "failed to roll back\n");
+
                kfree(submap);
                goto err;
        }
        kfree(old_submap);

        /*
--
2.51.0

[---8<---]

I'd appreciate it if you could test this. Or, if I'm still missing the point of
your report, please let me know.

Best regards,
Koichiro

> 
> thank you
> 
> Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
