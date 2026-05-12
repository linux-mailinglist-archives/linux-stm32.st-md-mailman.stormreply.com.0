Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGpGOc48BGqsGAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC685300D3
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CA5AC8F292;
	Wed, 13 May 2026 08:56:46 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011022.outbound.protection.outlook.com
 [40.93.194.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30783C8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 17:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqNcPd9k3oy4oJEJz38SX7iB6gcrG0XqeP3EvnzzxRHxkwQjAye2ZdcM1leXOJHwt3sNkGoF/F7dUiubM0dYvdXhQ/ecF76LFTAZh63prhi34fLvfO9kZZpwh1Q239kztAp6YIZF4rEV7FnYE9E4gk00pi9/5RNL5bBXXUzqcFjL3Dt4oXMV0ful2bd8JAhXH3daKEjvdvDD52DYDsgwn3+vHgDHL5UHmijliZuMDt+CDQ7Gb0QeyMWwyIUTySyGbXeaQc0G3h54V68zVXTkN4mc7bIC3ipBH9I/GuVwTsbXiX7a1Iid+PJV/btWCQzpLI0YuGQT2v4yJ7qnoSZcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=HT7naAsgG5G+WknTUR071zXKebOL1Ulu8frc23roogfsgrZg8BS+E6vkkAGcj4td5w012ieVr7GXprXABecvcocDCCOGEbYwVp6vEkpWDNfsSw+9+a4gJstgMKiPr1MriWRrFIU1Zr2ILaNXeeks4YS//CIHHqW0/5iHrh7n7Ct4oFL9z5G43/zxvcKgwp5v3+ejSnL8t+FKCxrw10wJzjkz5bQrs3eyDv8haVWcPwPK7bUZXTKJEGOAbGXgRjuG5/OM+W2YDH1SkBzheWjilVyh5ZVZ06wb2wHcQuMS9uJHTwTA/BwpQPr6+mNBiNNZagxbs6uD+El2PTg5/cv4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=qu1pNOWciw+wRz8jBcHEjoUSf0IOJjZj/0fHoukohZX1vDhqWWERQyzEPURkUhhaBvfuhUrSi7oZPSXVaDr8WDRiASAsC4t72s6Mlx3DzA0XfzLLld7nTwUGaNtT6xTirKgbLBo5x4sU9sV1Ck+mvLwGK22xtVUhvsOtLN326Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 17:15:04 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:15:04 +0000
Message-ID: <986f9f97-e990-4a61-bd25-d32f6cdea325@amd.com>
Date: Tue, 12 May 2026 10:15:01 -0700
User-Agent: Mozilla Thunderbird
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-2-ben.levinsky@amd.com>
 <bd083464-a5a2-4994-ad88-ddf42d2c765e@foss.st.com>
 <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kUdizuQVqc09KA0KefFz7G1t49sTZJScKOrTzJo3Qns+nG4FLOeXKSGzE0JXByv8Ef4Y0XSVv7LEb6jpKMnNGNcjqUMy575Nus0Ue/JyP5JqxzmR9mvxlaLoX/dIO6ILrSVNFJCorqwsqhQiVTjoVSvgaojw3cfyAF08Gu7h+Yd1N6CNNyBwlYl13T1PTHlVQLDuPKfMfW/DZkjTQiH5b7ySLj9jOKiUl/iQeqSl966gu/xC/zs8RvCGP9LQtQ6JWgaNyUOrNbeslhzzCwovRoEyVkSfD9gdmdIYEmrpT7zKNdl0MPLth0VuCPPYuzlSe/zF6RrtPvkASNV0B3YdtFL6vQ9TqjhLBZPAZxQ3VMxlMFnTr9sDSXxsXkn/HF2aiibLEIHLg0K4G5Cal9Ju+8eJBAB12/ZD9afL5K7GwGjJJsiC6cMPy65U1pNktuZ3hUuRjk3cVJWWxTbZS1GMa8mfthkl7OvGGE6c+Ovg7/blE6zRMlKku2it2Nhj/0oFrx1YpbE2/A+KdZgd3xDfZGEl2w366RQj2/c/MOF1sUqVg/NqbXO8f0qrCUPQrVEF4V4IqELDcWBUKxpu0LdWOXYUD98PKYg0QpGiuZ8m78HJlpedjv/HslYdVXuytSL8s2IIrzujuSC8k0A6Feg+JoxauGA7VmXM1Z5YwvuxG7EU4ZQLz05M+CGQC7SZn8sH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6448.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1hrNVRRdzd5Q3grRWhENTVCMGJ6REhsa0NycmhoaGpBZWpJMjRUYTM1OExt?=
 =?utf-8?B?NFl5VFk3NFdHclpJK0p2b1dRK01FWE1KYnFDVFBIRFlhSFY5QlA0bHN1NDU5?=
 =?utf-8?B?RzBBU0tscWFMSFdEOXpQNHF6N29RWnFOVTY0SFdpSUFpRVo4Z1VmNDdoakEx?=
 =?utf-8?B?c29BV2oyUVgvRjlqL0pmM3J4WnR5eWVYRk14NW4vbXdJbzdSN3UzaFNjVjFZ?=
 =?utf-8?B?anUrL1VPcmJrTXV4ekpQakxnNmc5bWJjQWlGQVptV1F3WUl3d3FuLzdWLzNX?=
 =?utf-8?B?cEhqbnJNelloTDdFbGZTSGhYSzRyaUhyL29uL01MS1BEeFR3V2Mya1dUd25i?=
 =?utf-8?B?RExkbVRWM1VOKzNRMmsvMHNKVDJ0dzNMMHJESDc0U2NuTzBBck5jY21wNFdT?=
 =?utf-8?B?QkxJNWVFUmhvdmNsQjB5Q3lHdnV0UHpUdnVLUnVhZzNKcDM0Vk1NeVNJVmFa?=
 =?utf-8?B?cm4wVjdOMU5Ja3hPdyt2RXZHTmNPUmRudXVCSEt1R3IyRUlIV2NGaFl5bERZ?=
 =?utf-8?B?TVJOMkF4MFp1OUttYWNXQ3NSMXd1Vm9mekJ3dzh5Ync4amI1WHBmWUFKQ1ZP?=
 =?utf-8?B?UkVPQ3BadnpIZ1FpdlJDTGE4Z1BGVUdSMHZ1ZU5qTjczRUFFKzF1N1gydnZr?=
 =?utf-8?B?Ni84N2NOeEhPQ2x6cVRtbnBadHp2QjVJQWZNdGQvMzV4aWh3NFFjcElFOGdl?=
 =?utf-8?B?VE5NbldzQXMzK1NYRGxISERHV0dzSkJnWDFSV0NDUVhxQ1VQTzVnSmp1anU1?=
 =?utf-8?B?bGl4MzhKK3lvRGdhMkh1SDlPR1FWSk1xaGZwQ0lYa0VPREgvZ0JjL2R4RFFR?=
 =?utf-8?B?dm15aXJSaUp1S2RwMUNSckQ3Tm9KRWlhblBnek16S2tTQ2xrWDdDVG9OZWpu?=
 =?utf-8?B?enIxQlF6QXc1WmRGRDRxbEQvYTdTMjZsRmhHWU5TaDZza1JXY0pTSzhON3lV?=
 =?utf-8?B?ZXovRitWUzFBZWRma3hNRHNYNHUyendWeTZYWTJ2Y2VUUitFZHFtbVNjeEtJ?=
 =?utf-8?B?MHphUDRVYVhzYzBFaVRZSmFmNVRvQzJDRVFqUUtDbkJQOXl5VzRCNjR3RE5X?=
 =?utf-8?B?cUZNOWUxTENtVkd0eDRrZHBkRU1oMytXbG5menN4ejh1NVFzYkVuZmJCMWJP?=
 =?utf-8?B?YXlIVGpqdjVPWVBDMU43N1F2ZmxaWXR2ZjJxUGlpYjc0dVd1bWQwWXRDTEFZ?=
 =?utf-8?B?ampRRkQ3RUJDMFF6T1JwdXVPVDFxdSt1d2F5VDJoajhiTGRESVlhL0hwd3VD?=
 =?utf-8?B?b1R6NUJKdFRveWViWnJwYXIzQmRNZW1uWVEwcTJzTllYQ21Tb29UN1hrc0Rw?=
 =?utf-8?B?cTlxQ0Fnd3kveTlxV0luUGRwUnRzSlhRS05uWW1STkZzTzJWTU44NVI5c1JP?=
 =?utf-8?B?ZktkUXI2SXo5bE5HMFZnWDJ5a0NKU2V4YjA1VU4xYkVpM0RoM0RmYVB6SmZi?=
 =?utf-8?B?a1M0SE5QVWJ1N3U0QXZRV3dhb1NyQlIvLzNkU3Jjdjg2TmhOclVmT1lXVzVh?=
 =?utf-8?B?VUwveDVjZExzL091ejF0ekgvZVZkcVAva2p6TkVKZ0FZZkNDSUVkUmJQNzNz?=
 =?utf-8?B?RDhhRnFiRmgxY2EzRmhVbHVrZEZkREIxRE1iWlFTQ2tMUzU0TjZBT3RLQ3Q1?=
 =?utf-8?B?OE5VT3lNQVQ1Q2VJZ0hTQytBUldRQVZEZ1BvYlF4T2lybUdFWkVIUS9kSTJV?=
 =?utf-8?B?dCtDQUhGMGh6S3cyaHFSdnE2V0dYL2Rhd2RRUXA1WlRXVy9LSUp3UTZHUVQ0?=
 =?utf-8?B?VG5wRkRjSk8xcyswK1luWHdNMkhEQlF5Z3RPQ0lJRngvVlZ4OG8xVUVoRzNP?=
 =?utf-8?B?OVFPaU51cTEyVlJPUm1KeVRYWHJleGh3d1RRNVducTUxUUlNSk9MRStSaWV3?=
 =?utf-8?B?YW5JclFRaGM5NTUxL29QRUEzT01qTWJySFRnWVFHMW4yUHkyZnZmMHNHcWJR?=
 =?utf-8?B?czd3YkVWUTZSK1ppM3VBWUVHdjVnMzhsbW9nOUNKdmN1OE1DSFZQRmJZcFNQ?=
 =?utf-8?B?cXprQjdWZGswMFc5OU5oY2ZQZWQ4U3p5ek11UkZLYlROQlRUUDd4YkE4ZklJ?=
 =?utf-8?B?bGxuUGhIM3pTV2M5dW5OUVFaQVg2REk2MHJGK0pxcFg4enN5bHI0VnZseXFR?=
 =?utf-8?B?aklMdklSZXhsWkJKNDQ5RkJHQUVMeE5nSE9oRjVPdzhkVVUxbHZ0VmVrWk8v?=
 =?utf-8?B?LzE1dUwvYjdJYjMyUVNSN0xNQVJBRDVNOGl4SGt2YUNZdjkyNGc5QnpzdXo2?=
 =?utf-8?B?aHY0Z1JZWm0zcUpPMS92QzFLd0l6WUE0VVdibnlzSkZ1THJ5akFiVzg1VzEy?=
 =?utf-8?B?TnBKOElsRUVUTS9KNE1BUjhXTFBDVVY4Uk1sa0kzYmZMR1NYakRUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:15:04.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FguomXZaUmeL2pVsbvhw3ESKKszKE8w4HIgjLA80KwhY/xsT8iqSg/X1Qe8S4lyUeyyl3Wpjz8rKv8mIyAQ+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
X-Mailman-Approved-At: Wed, 13 May 2026 08:56:45 +0000
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "Shah,
 Tanmay" <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/4] remoteproc: add common wc-ioremap
	carveout callbacks
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 7AC685300D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:geert@glider.be,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blevinsk@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[blevinsk@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,amd.com,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.876];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

CkhpIEFybmF1ZCwgR2VlcnQsCgpTZWUgbXkgcmVwbGllcyBiZWxvdwoKT24gNS8xMi8yNiAxMDow
MyBBTSwgTGV2aW5za3ksIEJlbiB3cm90ZToKPiBBTUQgR2VuZXJhbAo+IAo+IAo+IAo+IAo+ICpG
cm9tOiAqQXJuYXVkIFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4KPiAq
RGF0ZTogKlR1ZXNkYXksIE1heSAxMiwgMjAyNiBhdCAyOjQ14oCvQU0KPiAqVG86ICpMZXZpbnNr
eSwgQmVuIDxiZW4ubGV2aW5za3lAYW1kLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAKPiA8YW5kZXJz
c29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8u
b3JnPjsgbGludXgtIAo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW1vdGVw
cm9jQHZnZXIua2VybmVsLm9yZz4KPiAqQ2M6ICpGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT47
IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IAo+IFBlbmd1dHJvbml4IEtl
cm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIAo+IDxmZXN0
ZXZhbUBnbWFpbC5jb20+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPjsgTWFnbnVzIERhbW0gCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPjsgTWF4aW1lIAo+IENvcXVlbGluIDxt
Y29xdWVsaW4uc3RtMzJAZ21haWwuY29tPjsgQWxleGFuZHJlIFRvcmd1ZSAKPiA8YWxleGFuZHJl
LnRvcmd1ZUBmb3NzLnN0LmNvbT47IGlteEBsaXN0cy5saW51eC5kZXYgPGlteEBsaXN0cy5saW51
eC5kZXY+OyAKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IAo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1yZW5lc2FzLSAKPiBz
b2NAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBs
aW51eC1zdG0zMkBzdC1tZC0gCj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSA8bGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbT47IFNoYWgsIFRhbm1heSAKPiA8dGFubWF5LnNo
YWhAYW1kLmNvbT4KPiAqU3ViamVjdDogKlJlOiBbUEFUQ0ggMS80XSByZW1vdGVwcm9jOiBhZGQg
Y29tbW9uIHdjLWlvcmVtYXAgY2FydmVvdXQgY2FsbGJhY2tzCj4gCj4gCj4gCj4gT24gNS8xMS8y
NiAyMzoxOCwgQmVuIExldmluc2t5IHdyb3RlOgo+ICA+IFNldmVyYWwgcmVtb3RlcHJvYyBkcml2
ZXJzIG9wZW4tY29kZSB0aGUgc2FtZSBpb3JlbWFwX3djKCkgYW5kCj4gID4gaW91bm1hcCgpIGNh
bGxiYWNrcyBmb3IgY2FydmVvdXQgbWFwcGluZ3MuIEFkZCBzdWJzeXN0ZW0tcHJpdmF0ZQo+ICA+
IGhlbHBlcnMgaW4gcmVtb3RlcHJvY19pbnRlcm5hbC5oIHNvIHRob3NlIGRyaXZlcnMgY2FuIHNo
YXJlIHRoZSBzYW1lCj4gID4gaW1wbGVtZW50YXRpb24uCj4gID4KPiAgPiBTaWduZWQtb2ZmLWJ5
OiBCZW4gTGV2aW5za3kgPGJlbi5sZXZpbnNreUBhbWQuY29tPgo+ICA+IC0tLQo+ICA+ICAgZHJp
dmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfaW50ZXJuYWwuaCB8IDI2ICsrKysrKysrKysrKysr
KysrKysrKysrLQo+ICA+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAgPgo+ICA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY19pbnRlcm5hbC5oIGIvZHJpdmVycy9yZW1vdGVwcm9jLyAKPiByZW1vdGVwcm9jX2ludGVy
bmFsLmgKPiAgPiBpbmRleCAwYTVlMTU3NDRiMWQuLjM3MjRhNDdhOTc0OCAxMDA2NDQKPiAgPiAt
LS0gYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19pbnRlcm5hbC5oCj4gID4gKysrIGIv
ZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfaW50ZXJuYWwuaAo+ICA+IEBAIC0xMiw4ICsx
Miw5IEBACj4gID4gICAjaWZuZGVmIFJFTU9URVBST0NfSU5URVJOQUxfSAo+ICA+ICAgI2RlZmlu
ZSBSRU1PVEVQUk9DX0lOVEVSTkFMX0gKPiAgPgo+ICA+IC0jaW5jbHVkZSA8bGludXgvaXJxcmV0
dXJuLmg+Cj4gID4gICAjaW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4KPiAgPiArI2luY2x1ZGUg
PGxpbnV4L2lvLmg+Cj4gID4gKyNpbmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4KPiAgPgo+ICA+
ICAgc3RydWN0IHJwcm9jOwo+ICA+Cj4gID4gQEAgLTEyMiw2ICsxMjMsMjkgQEAgcnByb2NfZmlu
ZF9jYXJ2ZW91dF9ieV9uYW1lKHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IAo+IGNoYXIgKm5h
bWUsIC4uLik7Cj4gID4gICB2b2lkIHJwcm9jX2FkZF9ydmRldihzdHJ1Y3QgcnByb2MgKnJwcm9j
LCBzdHJ1Y3QgcnByb2NfdmRldiAqcnZkZXYpOwo+ICA+ICAgdm9pZCBycHJvY19yZW1vdmVfcnZk
ZXYoc3RydWN0IHJwcm9jX3ZkZXYgKnJ2ZGV2KTsKPiAgPgo+ICA+ICtzdGF0aWMgaW5saW5lIGlu
dCBycHJvY19tZW1fZW50cnlfaW9yZW1hcF93YyhzdHJ1Y3QgcnByb2MgKnJwcm9jLAo+ICA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnByb2NfbWVt
X2VudHJ5ICptZW0pCj4gID4gK3sKPiAgPiArICAgICB2b2lkIF9faW9tZW0gKnZhOwo+ICA+ICsK
PiAgPiArICAgICB2YSA9IGlvcmVtYXBfd2MobWVtLT5kbWEsIG1lbS0+bGVuKTsKPiAgPiArICAg
ICBpZiAoIXZhKQo+ICA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gCj4gQ291bGQg
eW91IGFkZCBlcnJvciBtZXNzYWdlIGhlcmUgdG8gaGVscCBmb3IgZGVidWcKPiAKPiArICAgICAg
ICAgICAgICAgZGV2X2VycihkZXYsICJVbmFibGUgdG8gbWFwIG1lbW9yeSByZWdpb246ICVwYSsl
enhcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgJm1lbS0+ZG1hLCBtZW0tPmxlbik7Cj4g
ID4gKwo+ICA+ICsgICAgIG1lbS0+dmEgPSAoX19mb3JjZSB2b2lkICopdmE7Cj4gID4gKyAgICAg
bWVtLT5pc19pb21lbSA9IHRydWU7CgpIaSBHZWVydCwKClRoYW5rcyBmb3IgdGhlIHJldmlldyBh
bmQgdGhlIFJldmlld2VkLWJ5IGZvciA0LzQuCgpIZXJlIHRoZXJlIGlzIGEgcmVhbCBiZWhhdmlv
cmFsIGltcGFjdCBmcm9tIG5vdCBzZXR0aW5nIG1lbS0+aXNfaW9tZW0gZm9yIGNhcnZlb3V0cyBi
YWNrZWQgYnkgaW9yZW1hcF93YygpLiBJbiB0aGF0IGNhc2UgcnByb2NfZGFfdG9fdmEoKSByZXBv
cnRzIHRoZSByZWdpb24gYXMgbm9ybWFsIG1lbW9yeSwgc28gdGhlIEVMRiBsb2FkIGFuZApjb3Jl
ZHVtcCBwYXRocyBjYW4gZW5kIHVwIHVzaW5nIG1lbWNweS9tZW1zZXQvbWVtY3B5X2Zyb21pbyBp
bmNvcnJlY3RseSBpbnN0ZWFkIG9mIHRoZSBpbyBhY2Nlc3NvcnMuCgpHaXZlbiBBcm5hdWQncyBm
ZWVkYmFjaywgSSdsbCBzcGxpdCB0aGF0IG91dCBmcm9tIHRoZSBoZWxwZXIgY2xlYW51cCBhbmQg
ZXhwbGFpbiBpdCBleHBsaWNpdGx5IGluIGEgc2VwYXJhdGUgcGF0Y2ggaW4gdjIuCgpUaGFua3Ms
CkJlbgoKPiAKPiBISGVyZSwgeW91IHNldCBtZW0tPmlzX2lvbWVtLCBidXQgdGhpcyBpcyBub3Qg
ZG9uZSBpbiBwbGF0Zm9ybSBkcml2ZXJzLgo+IAo+IEl0IHNlZW1zIGJldHRlciB0byBhZGQgdGhp
cyBpbiBhIHNlcGFyYXRlIGNvbW1pdCBhZnRlciBwYXRjaCAyLzQsIHdpdGgKPiBhbiBleHBsYW5h
dGlvbiBvZiB3aHkgaXQgbmVlZHMgdG8gYmUgc2V0Lgo+IAo+IFJlZ2FyZHMsCj4gQXJuYXVkCgpI
aSBBcm5hdWQsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpBZ3JlZWQgb24gYm90aCBwb2ludHMu
IEknbGwgYWRkIHRoZSBtaXNzaW5nIG1hcC1mYWlsdXJlIGVycm9yIG1lc3NhZ2UgaW4gdjIuCgpG
b3IgbWVtLT5pc19pb21lbSwgSSBhZ3JlZSBpdCBzaG91bGQgbm90IGJlIGZvbGRlZCBpbnRvIHRo
aXMgY2xlYW51cCBwYXRjaCB3aXRob3V0IGl0cyBvd24ganVzdGlmaWNhdGlvbi4gSSdsbCBrZWVw
IHRoZSBoZWxwZXIgY29udmVyc2lvbiBiZWhhdmlvci1uZXV0cmFsIGhlcmUgYW5kIHNwbGl0Cml0
IGludG8gYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIGFuIGV4cGxhbmF0aW9uIG9mIHRoZSBpbXBhY3Qg
b24gdGhlIHJlbW90ZXByb2MgbG9hZC9jb3JlZHVtcCBwYXRocy4KClRoYW5rcywKQmVuCgo+IAo+
ICA+ICsKPiAgPiArICAgICByZXR1cm4gMDsKPiAgPiArfQo+ICA+ICsKPiAgPiArc3RhdGljIGlu
bGluZSBpbnQgcnByb2NfbWVtX2VudHJ5X2lvdW5tYXAoc3RydWN0IHJwcm9jICpycHJvYywKPiAg
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJwcm9jX21l
bV9lbnRyeSAqbWVtKQo+ICA+ICt7Cj4gID4gKyAgICAgaW91bm1hcCgoX19mb3JjZSBfX2lvbWVt
IHZvaWQgKiltZW0tPnZhKTsKPiAgPiArCj4gID4gKyAgICAgcmV0dXJuIDA7Cj4gID4gK30KPiAg
PiArCj4gID4gICBzdGF0aWMgaW5saW5lIGludCBycHJvY19wcmVwYXJlX2RldmljZShzdHJ1Y3Qg
cnByb2MgKnJwcm9jKQo+ICA+ICAgewo+ICA+ICAgICAgICBpZiAocnByb2MtPm9wcy0+cHJlcGFy
ZSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
