Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aItbFTDcdGkV+gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A117DD26
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54653C8F26F;
	Sat, 24 Jan 2026 14:50:23 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020131.outbound.protection.outlook.com [52.101.228.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8FBC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 14:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjWGhFVMDSB2kBkEXE2VxCbM0CQmvCsPLB0hD9y7p4bd+zFYlB9B2I/NzBquqQBvbh+CTkgiV8BlYiT/HCqZHhxZsRbSRUU/ePyfNw61/dvX1AfTpzrf7RQAXy9XciXf3nRQwIkdQTNA46euT5hWEzCS+RIag4ZvTBiUJJ3H9gK4kLXjnfHrr3oUl0l90k6or3cA+cGiQF3dUqzY366Lr3TUdUbmbfeJgIBxvAL1wgL59IWiVq85ZTemoUbkUrux3LTDvCjEYyjR0UbCHkf+4wKTvoucHQcABoTueTGQGNXTFHaODv4V7KVQKsJ3f8rs5p15pauo+YITEtw+X7yEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chFczwFFvy/TiqkqH263HVf+k+lSlM18M0he4pPOJlA=;
 b=yLxcjLsA71Hx5nClZZOSgW4GAzY/KA8rF8SPIHJ+UZRm7l6za4426D/p4v9heiUSNE5iX+wsS155Fc+kDqZF8kwBwo1BN8cr/odNvtdRXEvfNWOskuGVxPmbotXqDKRb25nZ9nuvK8/lYJgLeUDaPAkXq2dgswhcv+7A7K+OWdi/sr3BGq3bHR0g7Z5egD5tAEA4cP5TkCDiIXJSoljDdkXTrO1rwY+f42DnEu4ZN3MQqt6PNsMQ2w12OnzacKOMzUzYNFwk+oczSsDIYYZ57p3yePK3fCML2YAHvOBgq+nCRIr+zLVtoj0FpXsOUL9PovliMrHWw4bb/vixe0gb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chFczwFFvy/TiqkqH263HVf+k+lSlM18M0he4pPOJlA=;
 b=tcWd1GZ9SND7KkW2vUAesubxRLw+H2wODhavmmxBmljKkGXcFjwJElAVi1/xCyVgpHCGaomlRMV+jYUxdkhSAh2T0rwSp+jPqYfkjs0yJhKXmGHmE7Dp9/3oRmu1gYFjOlOp5wKJ0RpNIb2h0tQp73QWn7aLXR5TYP2f8CUjgIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org, Frank.Li@nxp.com
Date: Sat, 24 Jan 2026 23:50:07 +0900
Message-ID: <20260124145012.2794108-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebe3c14-b081-4e9c-68f0-08de5b57e484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yHbRXkS5HAUm4q+0hUMSdxHNvUCR1WMw8DhS2pcc3RkllCJzkbd3lKDjS6OK?=
 =?us-ascii?Q?2ISOhilBtrmn6n/RvP96o5l85MMKIt6eK/ARjEKoZHMCHGPsKqQyh7c3H8uo?=
 =?us-ascii?Q?rJNh+qbbKSBBRpc6y2bMVr3xZDCAVSTQ975Z97FhD3oqPKS62F0nsBC6Mkij?=
 =?us-ascii?Q?7lWfnr9Tpeom5hblTAfTAnwCvives8A2+podRB7LHkP9b13rQ0+X4jKfG5/7?=
 =?us-ascii?Q?+muLQFlbdBA/hC1u/NX+r8M3jeJUyzKVHWSU9l07wSeSj3/3Pal0UvTsPZIT?=
 =?us-ascii?Q?VQsfmz9Orci/TYQYAfJWkGhejbREznqzeFEn8MRWEK8Jvl0AjS2P0FPxzLcn?=
 =?us-ascii?Q?cba5LHl2HmUdJzC3mY33mR3aUxyf2XM9DY+h7IvBBSurPTA+1h2rP0jShKF3?=
 =?us-ascii?Q?tueo5aqUCMIMfD6nu5b7AJJH9MczVAD0WBQCqCTMvc+xIUJquxgDV2B+5zrG?=
 =?us-ascii?Q?D1PpGuaeBtOZUXuli5AJj32r1sEabpgjZxdgCrdxQJIwk7ML3oxxyOW29GHd?=
 =?us-ascii?Q?D/Rf7X/NTV6jxePcRpUN7feDb/dkKhDQR8FsCoHHq5zgfTRn4E8PyXgg01Wi?=
 =?us-ascii?Q?OFH6nnkRJWL/IeDqQ7skLGoXK7npWSri2laxTPLzkUckzT825hXJW/ccIuDC?=
 =?us-ascii?Q?qsBHZJMen5qg5vvYkLcO5HzY6QJMSONgxNfWHW8Qk1k7C8o95dSKl0xuGXcd?=
 =?us-ascii?Q?M/lwBrurSXCUm/qYGnlI6ndWh2CRYERN05E8RogzpTlXYMU61yViM0FyIlct?=
 =?us-ascii?Q?sd4mErco8iGi2OWir3t9vtBMEklFFytm6mkS5rNY4AGCjvBJ+BbSfrGSO3GV?=
 =?us-ascii?Q?u/4ID3U66KrqfNiwZo9TD8ZQ6dH2oPOuy0Ra755ppq65+C/fxdgAC3MpeGTA?=
 =?us-ascii?Q?nROQm1g6+993WtehBWoyTMyVibZ4dTCqjEmJSl59FtGEpCXY6JzgyBkqXRhC?=
 =?us-ascii?Q?ropjzSXkpXigxEbElFZCLirV+CFXbJfku803+XAB5kPhSDRNi2MeMoYlwO98?=
 =?us-ascii?Q?YqlMO4dA3sOVZeyPdUKJOt+uoUSrprYLXdiD2HgDNPx8nq6Va8W+zd3SEPXf?=
 =?us-ascii?Q?WjAzoR63MbUbl6mv/4MhgE8GR3EKcLkcTqMyx+W028feqc8OMJKXJmSX8uXK?=
 =?us-ascii?Q?jnk5yI1KPQ70VTjAUkhQ9HcF2YUVePp7yko+YhiSXwYNQ6pJNZYErg8wL7UL?=
 =?us-ascii?Q?5uraf2YaPiho3P14fe3K9UM8zMWdbJRFYNRySWtkO52wr3CVa/UJlYWS2j8y?=
 =?us-ascii?Q?k6k9j1okU7iBuGteqmt3qJ5zADeEl0VGOEFlrLXgdTctpXqLRHUU209N8lOj?=
 =?us-ascii?Q?5apb4dN61ToNbAgybt35JSrwjRL60ms6q4Bhyc2oF2GRyx+ZZzPX19tANDiE?=
 =?us-ascii?Q?wHpawm7up83Z8BvSLyMx9jkQRX09h8efLfb8BVKfR9WJyIK7I887GRMn60eq?=
 =?us-ascii?Q?lt2dhKbBTAriZT/AJgLmjB1AwoNQDglR6UJd+a67cnnXT9yf4RHm6mHGob0U?=
 =?us-ascii?Q?PJZFGnfAza9qAtSOZQrlwLaTtZklQonMiJ/LrwmlwZUjEGacIehKVJPgU4qH?=
 =?us-ascii?Q?E+UhZYC9gWTuMkUPCLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vthKXZC/iXgHfBW9Srz/igIWSIgGJAxvEd0yBOKNZXd4gWQRRqJ68IwqvWek?=
 =?us-ascii?Q?xBGZMjCQYidEgKlD1/nKFyHQO8n761EOkjhEfyw4WKDeEK8KFyOXz+JzYqkV?=
 =?us-ascii?Q?fzeQ638xgMJcJP0u7h/AqSEMou0Ghh/lxSXIRosk1YsRMh3afFP81by50CwN?=
 =?us-ascii?Q?i8UEUbuULjGgRrfiiCX2fp7aKbQqMykaZoeHFQXehJp+68AkTs7L1JTOyW/y?=
 =?us-ascii?Q?VQTmLq/LWa/mBAtnqMERMRrNttk+2Y7TyZ47XaKcfHCueSLfUw+kn3YaMpqB?=
 =?us-ascii?Q?NqxFNpZe7LjdYk2lqwOAquccz2QeskA5IpgkPbuvdYieEt4fdfKiVayD1iEC?=
 =?us-ascii?Q?JXw0EcqcvwoldfhQfbBqyb3q5RSAO6p+DSY2eA4NBk9zm/g9mm60rCKqtYiV?=
 =?us-ascii?Q?Lmf2POiGtXUcfDHHZ5EwN6YOqtxyKt/uiUqxfXaaXzQZXHnf95LHmTz+ptl6?=
 =?us-ascii?Q?o9/5AkXks7JFTayqAAr6FJayLhxKw6ziFzPV5PivoCVnvPk7Dw0QU/nWTq5s?=
 =?us-ascii?Q?tkCid3jhTTGfknAfRRrLTIdrbu9AKK6Zsl0I6TZY/FaM3XfEsa3FgnKf4GEd?=
 =?us-ascii?Q?ha7TPGPGQ8l9TTx37y1nFOQY/UyauI6OM1+LVgsOBwDrQ2MDD3Boay2jVyN9?=
 =?us-ascii?Q?PcM2F+tabd7rUyNPXJKZQb5eClFv8YXbYXrSmC6jnPJstBmcrrpUhHVSRSTF?=
 =?us-ascii?Q?ZdogEDtONDh25S8Oyt3mmiV5TIVNLnBOf7kmJqyrxpOzR3RBhOivJ5KMcWOK?=
 =?us-ascii?Q?a9vm76A4QUcyeodq0MAMRrjNxGUmOY8G/U0y9+01ak6riM3ebAiggSSCKzcw?=
 =?us-ascii?Q?4s9Uk9YkPQEUNCT3YGF1Z69FUQnqP/o78nVfhhZ9L3QYr0Y2ZgTtY5iimulr?=
 =?us-ascii?Q?7bX+iEohavnTHfl9FoEdxpan4b7FqXDwC56HcJ7HpTbOwiPgBie0rzkFIDbl?=
 =?us-ascii?Q?gI6cl7jt/Ohh8TLdXTIZ3wvIDPuX6CW6uRmdiR+y56FTLtlucSluoNKkA61O?=
 =?us-ascii?Q?ju/yaoMhKjE0AfSEapP95dLjhQXsqTenRqn+NS2WPcUbK/MlAP02rxxmDxtk?=
 =?us-ascii?Q?aJNbwLzUepbM8SkcdLXs86Rv6UP1EjS0kIjsv/Q/VHVTWknepHr5BTNH/9y7?=
 =?us-ascii?Q?/+qtEnzhMTlFmuKGL+Ibra/PgdRpZL6A0VIF9ofc2KOZnM6xX58AFd2cEquO?=
 =?us-ascii?Q?kSfqgvlx/Ywg5VtU+yXTqS5+MYuHR4s0BsfweBpKnaXaCRgNFAibpCgL3uBI?=
 =?us-ascii?Q?LJTEwyknu3XLzLZayNNdFRmZBtCJeY4r+KJhZXhbzIKZKTgtalQU15hWKNo7?=
 =?us-ascii?Q?Uje4v1HBURvp9B+KkK3IxZ5ZZQPY7ekZjuJtuHODgeIlXbYTEhIiErxNsBb+?=
 =?us-ascii?Q?p8S22gC5H3r8MxbeVE/DwM33HFEFgJEa0dbiVCSdBW9Vts1ZSoDQtutlxz1y?=
 =?us-ascii?Q?VISvl1p99foy/2YbwR258on5B9Uv6gO/aljflXc8JFDi56ij6WmZJ+gaCQ4z?=
 =?us-ascii?Q?9ag/aI4nJFOHg9vaCopxSb3W7X5SV0/9zIXrIQmK4NkpihKtTZa+0qN+pCiX?=
 =?us-ascii?Q?8r+CqoKl74Psf9qxjwAi5Qm+7t9fME1+QzwK/Z34+knvP8XWvHdUvbGusAS4?=
 =?us-ascii?Q?1Ji9CDby5GyzmOpuqDpECHuR38X9c5fwRRgy6JexB7/2jIxguzlaMJ3R/yvV?=
 =?us-ascii?Q?lM6So1K2X4RTKjr531jL7YBoQJPpBCMP/XNNER30oRR8PR3SSLReb9Ch/LAk?=
 =?us-ascii?Q?g+67A8YOHWHWSnn0ooYMBuB4t5wOO0974gHknHrUjDXf1AY5ITBC?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebe3c14-b081-4e9c-68f0-08de5b57e484
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:18.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVVzFdjmvJmFzgFzDihbOjA1tijxaMS2kX1JgamUGhhNrwKSk+8RaDH1SGN+YenrOO4HuBghh/uR+8SFwUIfrQ==
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
Subject: [Linux-stm32] [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound
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
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,
 m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C0A117DD26
X-Rspamd-Action: no action

The DesignWare EP core has supported updating the inbound iATU mapping
for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
called again without a prior pci_epc_clear_bar()) since
commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
inbound map address").

Now that this capability is exposed via the dynamic_inbound_mapping EPC
feature bit, set it for DWC-based EP glue drivers using a common
initializer macro to avoid duplicating the same flag in each driver.

Note that pci-layerscape-ep.c is untouched. It currently constructs the
feature struct dynamically in ls_pcie_ep_init(). Once converted to a
static feature definition, it will use DWC_EPC_COMMON_FEATURES as well.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           | 1 +
 drivers/pci/controller/dwc/pci-imx6.c             | 3 +++
 drivers/pci/controller/dwc/pci-keystone.c         | 1 +
 drivers/pci/controller/dwc/pcie-artpec6.c         | 1 +
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 +
 drivers/pci/controller/dwc/pcie-designware.h      | 3 +++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 ++
 drivers/pci/controller/dwc/pcie-keembay.c         | 1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c        | 1 +
 drivers/pci/controller/dwc/pcie-tegra194.c        | 1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 ++
 13 files changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..d5d26229063f 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -424,6 +424,7 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dra7xx_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index dfe814469993..06f45e009d7d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1388,6 +1388,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features imx8m_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1397,6 +1398,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1417,6 +1419,7 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
 static const struct pci_epc_features imx95_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..20fa4dadb82a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -930,6 +930,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features ks_pcie_am654_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..e994b75986c3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -370,6 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features artpec6_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..8530746ec5cb 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -61,6 +61,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dw_plat_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index c3301b3aedb7..7ca9d0f6b7f2 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -305,6 +305,9 @@
 /* Default eDMA LLP memory size */
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
+/* Common struct pci_epc_feature bits among DWC EP glue drivers */
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+
 struct dw_pcie;
 struct dw_pcie_rp;
 struct dw_pcie_ep;
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 77c4e6a4ddea..03ad8c242366 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -382,6 +382,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -402,6 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..2666a9c3d67e 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -309,6 +309,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features keembay_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..5e990c7a5879 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -820,6 +820,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 }
 
 static const struct pci_epc_features qcom_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..a6912e85e4dd 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -420,6 +420,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..c1944b40ce02 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -70,6 +70,7 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features stm32_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.align = SZ_64K,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06571d806ab3 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1988,6 +1988,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features tegra_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..d52753060970 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -420,6 +420,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
@@ -438,6 +439,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
