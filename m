Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFWmLwRKc2mHuQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:14:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEE741C1
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:14:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15BCEC8F264;
	Fri, 23 Jan 2026 10:14:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCADEC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 10:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkuQcVD+jrrT7S8lr67XmO+/SL6XSgV1lZNo+Gq8gPDTs70ach+AQhmZzONiOr89qZQ5cYsBjzehg/ftQ5WZXsoRMdUeM9YiL447zLd2rEuoutuFC/AfHiDhImsSbQUm0gNEDPzgKyp7brTEOnlvvmwOJh0Ddba6CgAbeKuQECVL16sElRwGYCLn6mMa5W4od0E1RtbzyrqTxgD6pRt+G06PHobFw8mvWwdKalfsNR46ohF56V9SO/8JbgPMMRY0UfPKhSleyBFuVof3WGVb1ghye1oGklCXndqQxIfQIWd1Uo9aU1vlUNLnPDJ/qtzAGP0XEUVG3M1Ov7cW9hULwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vztEXZgLuFMZzQdH6REOvr7/N82B/oV2IH8pAdK5I0=;
 b=ohpST5qdrpA0dReJFnjCKgt933alSznc9cl4EJATlQgjbSeSuhnx3v4LNTVcXfeTrrnRp/QzhZ8oz8cZe5daymg+5k0A81rTiQLYfs+jg/H8P8h9SjkZ/yy9/gH6gxSofqmBzneeh6AyKppQ7LwK8CBH+mRHJzfzUU55+IF5chjn4q8S6RI34u6THdX2x4nldo4jYW4OLrmILX5YyCmEVRziV8oOSK/k3ff4zeefcuusroyscSwOJji2Qpyo+1uActusUs9OTBUKLoPGNICOYt+Omk5Q8Oq5MRR/Ogqep4Zq9tzUO9GflBvfpZWuRsqtQu5rg/2GtsVkO6YkssoUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com; 
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vztEXZgLuFMZzQdH6REOvr7/N82B/oV2IH8pAdK5I0=;
 b=MhwGzFSQo2ppwGXqBPor68wKhrZwv0DUnS9dkQisYqItHzKAvK53d61zGCDuE3jg+HNeisKIXLcOkD9JVRYMioefdeTEQ2TppT1jgvjaXMdTeqoo03azxlbhjapYC6oMCLF3hGIhNeD3IBos4LEgZQ5P4Qf9PAAV9/yVt45vdNf5Bm7nivoPdNSxF6GXo8YhAwJCPD14peqRTq90sEJEPFPd533NzIqhq5fBCAHEvFHnIKMJtwXdptkhdIPXKjFvz5Z1+IIbh4ucQAmhMF0ipaDpsIp0P8HWbfMSrn4curUAM8Z5sUJG9/W2JAcphe92sGEcVM+6Pr7Yt5pWQ+9TQA==
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by DB8PR10MB3130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:f9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 10:14:22 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::8c) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:22 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:36 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:05 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:04 +0100
MIME-Version: 1.0
Message-ID: <20260123-upstream_uboot_properties-v5-2-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|DB8PR10MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 969e1a59-b172-4b17-9992-08de5a682de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEF0Ym5iRlBNRmZhVjMzNnhEY0tvUy90UWFUOC9vUU93ait0NkxKZkxWM2JU?=
 =?utf-8?B?S0pUdU9sMTZ0OW1TeEtQbDN0MVhuTFdMbjdKYTBoS04ySHMyVThNWnNzSWJL?=
 =?utf-8?B?ekE4a1MvaENBVGUxL0ZSQnJ6Z3IwTkV4Mm9NR2pmS0poWXovTUROS0hQZkVF?=
 =?utf-8?B?N21HVmpLTlhxVDBvZDZSYVcxOEpZb1AzbEtsTHRjNWZQZWVRTUlYVkdIQnN3?=
 =?utf-8?B?L25pYzd2akV5TTlad2FvbHRpeHJ6bHJUcE1ITXBBZytzWHBMSllxRDR5SmtK?=
 =?utf-8?B?MjJZOVVvV25YOXNxQmk1N29RQUxGUi9YMWZ0MFZ1RGU5TGNvRm9XeVBWbmlq?=
 =?utf-8?B?a09JTHhFcTBLM2NyeE5xTm04MlI3ck9yWVJZU0Jka0V0R0RWQXowNld5RnlQ?=
 =?utf-8?B?djExMklhcGw4dzBZakhMRVB6Zmwvd0R3eVEvbno3QlQ0OHIzMEtRT0J5WUF6?=
 =?utf-8?B?UHh3YVl1bnc5aDM1Z0paMm1mMFphc09xaE5IWDhweElWN3ZmOG1QQTU4ayti?=
 =?utf-8?B?QVZpWFRJY2tSVGFLQlgxdTVUeXJ4cCs5RnBJckdBMk5NZmhFekoxTlE3eFAx?=
 =?utf-8?B?UGxVWk9uVW1YRUFiVHN6SWRLSlA3M1c1L29rdHU1NGkybHNCeGFxMVBTNXk0?=
 =?utf-8?B?RmZySy9iZ3dEeUFmM09aZ3puRFhJMkVmeTdlbkVUNldJVFVJV1pSa29JWURW?=
 =?utf-8?B?UlNNSFVmNHdVdUg0cGN3YTRwK2IxVzdIeSt6RjBZUGZHellyOGIyczJjYUFN?=
 =?utf-8?B?NmcyUjRJYm5qdlA3Wk5qcGw2KzQrRVA2Kyt3TU5kN3pQOEJIU2ZGdHBHckFS?=
 =?utf-8?B?L21CWnV4aFF5Q1Z6dC92emp6YWc1cytxWU10SDVHQndrNGg3ZmM2MjVoaHNX?=
 =?utf-8?B?MlVHQ241UEFFcjJ3TW1YZzNvSVllUDZzcEVkUmI2NFA5WmZPNXNxUzlFeDVH?=
 =?utf-8?B?aE9aV1AwWlRaU1JYTlRtem15N2ZRSmd1dEhYeXlCSHFLSUdsUTRreDVCUU1S?=
 =?utf-8?B?ZEtDYzE4ZWk0c3oxM05FeDYrS091cXpxQkFNMVhWZ3phQUU1SnFFa2owbXIy?=
 =?utf-8?B?dUJsd1FiVlc2TTluS0VKaVBXbXRpOVNFc2F5blNmT2MwU0l4eTdzcjFFUU9H?=
 =?utf-8?B?dU43V3lQbitaN05qZUdEdFF6RWc0ZC82L2t3akhhR0xwMGcwblZSR1A2VXdK?=
 =?utf-8?B?ZmFZZWwzSWtrSDhTRkppWXZxa25XSzhKQTZkYVRCQVVXbDJ3NitGUkZ1WWdB?=
 =?utf-8?B?b1Y3REx0bGdBU1JZeDd5YXhKWkdEVWNpQ1c1WW9OWlQxZlhpRUdHRTdYQVZK?=
 =?utf-8?B?ZVpMUFVycGp4ZkhFeldQeDAraWlhbmlhTng4N1JkMDNkNGlUZWlRNXdmMTBE?=
 =?utf-8?B?bHBjRkJYTDBpSkloLzU3b3lpaG4wT29tN2VtZ0tXNS92UVZqL0VhVm1SZjgv?=
 =?utf-8?B?MVpPdjVqRDdYeDMrTFh2eitCRUJrbDVVejY3Y2RYWmlnTjFKSldsRU15MWVH?=
 =?utf-8?B?b2xwTUN2clEvUWVtdGI3S2ZYelh0cjdoWFduZ2k0eHVpdWxwa0p3U3g2eXMy?=
 =?utf-8?B?MXg0aTJoZzhFVzZZTnBBcFYwL2hxWE1TNE1NL0RBeEZVUHFHaTduYzcrbklt?=
 =?utf-8?B?SCtEUnJncVRmcWZ6Sng1eDFSSm94MDRqOHFsN0VGOVpRdWlhV2JQWXd1RVF2?=
 =?utf-8?B?TmNVVXF1NWZmYjl6dkJQczhOaXR2ZW5zRGl1Y3ZsYmpCR3haY29mZ29HbmZB?=
 =?utf-8?B?OGIzYUVsVm9MLzhWRkpsZE1xYlQzWlhabDByTnhpTUJRcjhhejFMZ2Vnemdz?=
 =?utf-8?B?NVY1RUNTdUVQK3BiMTBuOWw1RUhOMFIzaG45YldGSlNhaUhXQWZUcVZpQ1Js?=
 =?utf-8?B?dWFSSld1R1A5Qzh3QjYwYjdnMnM2V2UwOHZvRFlNTzdDbDhZRzVSd3JackpC?=
 =?utf-8?B?T1VOaXVZZ1h1ZDdMckFNN2d5WWEvVER5Uk91endlejlwbXhuMmZqYUxRRnNJ?=
 =?utf-8?B?cXd5TXZYcVVlaVJMNVVBSFYwVnJoTHoxdEJ1RVZvY2o4UTBKeGJSS09KQWVQ?=
 =?utf-8?B?WDFrL1lwUFhIZGZTRzRvZlJEVWdJeFJkTG5HdTlEeklrNU5sTnJmU0VpbzhC?=
 =?utf-8?B?ZE5KQkZvbGlhT25ON1JidFVBay9aVGQ2TGNNNkpxVEFwMWlhWmZld2xlVGpn?=
 =?utf-8?B?dktGMGcwa0Y3MjNBa1VGN21DOU9OTzdoSlJLRU5yWXQweWlFZ1ZSWlpuUFNG?=
 =?utf-8?B?YkFUMG9abC8xRTd5Rmg0TExnYUV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: o8eMUe+RvmSmqS3giCgPmHQyvYr2216Gz6yyKcA0h//ZJrFp1poJnkQ+t5MxGfjmM3HfNC0gM/4Msk6MM8NR1iFpqIYy64xC1JLFCuJXwbVWmqCckzxP7VjRFZb4Vcaj3LWGJAUx/maCgGlrAl1FkqLjaS9qqEBwCr/viSrItNjesn0IaymfkG0upZTYFp1zVQ+IJhF+VJFBBmdGsZ1MYSOvwKcNGZF6mfsDNIjJunz9HUvwdykPgVMj7lV1xVOopV/0P9i1MatVuwoTTgsozhtF46i7pLT0F7MvvsDMrgf2SCK67pVfdNZBoaNFUpxDDKm7SvqN0Fg/Lb2mR9hwARa3/3UN0yBI8hw9GiDiHM5D3Yln9rCfShLpGPSw6B4S+bNEhOz3T8DmefpAmZ30QnMt2ClcbojLy7DIJ1fYgqaGn5xoTXyobjU2elzm7lwxyo2xNyzNYkslY8slg/GiBMajbBIze+v4l6F313i1mUkUrgOF9CKDudjqM9gJzB3sWZmWZgT2tt9iNQGUPHJTD/OHnlLT2smoiy7g8ZQiRFrawSfkNHu69gVEe//tF3uItalTybhtSEGcxHvqWrghksY2ewOIidHu2uhe//elrACNGIu07JkBL3Gtg4n8TECpqi0AAf5C61dVpij/neZg8tC2zPQXNjz/X5c9lLSKiqMVoHdgwESHnU/8jOPLZ3TMa2SqKmEZcrEnyFXGRPT3lA==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:22.5431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 969e1a59-b172-4b17-9992-08de5a682de9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3130
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 2/6] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics f7 boards
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrick.delaunay@foss.st.com,m:cniedermaier@dh-electronics.com,m:marex@denx.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@dh-electronics.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,dh-electronics.com,denx.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,st-md-mailman.stormreply.com:rdns,2.98.90.0:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BAEE741C1
X-Rspamd-Action: no action

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32746g-eval.dts  | 10 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts | 75 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi      |  2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts | 76 ++++++++++++++++++++++++++++++--
 4 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index e9ac37b6eca0..26c5796a81fb 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -213,6 +213,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index b57dbdce2f40..ed0facce5841 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -140,6 +140,51 @@ panel_in_rgb: endpoint {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &i2c1 {
@@ -169,6 +214,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -178,6 +224,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&soc {
+	bootph-all;
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&vcc_3v3>;
@@ -193,6 +255,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -204,9 +267,21 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+
+&usart1_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..1fede5bdc347 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -75,7 +75,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 		};
 	};
 
-	soc {
+	soc: soc {
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 535cfdc4681c..b3a9e31f1da6 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -116,10 +116,6 @@ vcc_3v3: vcc-3v3 {
 	};
 };
 
-&rcc {
-	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
-};
-
 &cec {
 	pinctrl-0 = <&cec_pins_a>;
 	pinctrl-names = "default";
@@ -128,11 +124,13 @@ &cec {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
 };
 
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -169,6 +167,50 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -178,6 +220,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -187,6 +230,19 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -207,6 +263,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -218,9 +275,20 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+&usart1_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
