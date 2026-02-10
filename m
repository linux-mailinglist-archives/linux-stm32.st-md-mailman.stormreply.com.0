Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFsMIZICi2kPPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949211957C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D050AC87EC4;
	Tue, 10 Feb 2026 10:04:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013008.outbound.protection.outlook.com
 [52.101.83.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F32C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/otv8PuXjKxj728a+yNWvwjt5ovFwMQog7+AEJr7GNIcLLtDxIUqxg9pisbqyOFbrO2MKx3BqNGOp/u146S2bmkng+o3Rf4R+rDFikA0wbychpeb/hVGjnPIgzux3+cC73c5fnerRUOJJEugHz3bY2nqdMVcn8EYmRvfRwPOSQ6e8+PeemEP1J4Algjjmd5BRkaF2eoYxCm+9RV0/NH9ooQoa85T7o3nkL7mGnwIL00RkWQId+B0JHcPdQMGU9jRnhL59eU0JPz200Ei2zOmYOGl3likU92xwcPWB/u/RzKqnSrtI3wjLdRLV6zOLxej3otEwNOLe4Z0HtESf3NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=;
 b=u3PQr8gfg1HwCaILO/hnHMYysKj7u6F9zLjCZEo7EaHTZXE77MpfwBF9grq23rBnADlTiGeVF40pMuLpZDYh5v5uV/N28O9of/mF4B8z9RzwWFamFMarQhzxR7l0hdlXFnexwTBlbjBsETYMAeCYeFk00I26xYyombUL8B+mca36IQ/Jmjnqx5oIg1w4IqPP8WQWz8JpPDUk0bbQEt8LoBsuFqC4uEX8QMKnUl9SgGFvrJmpfsmVg852MXK8cCUGLFbQEAkYAYynU8a6Z1MAv8JoOKp64h55GoxB0kqHcvd965rVkRZrcll6l+VR69djb0eqTzjjongfIiz0JrnkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=;
 b=RmA/4Ff6YHJz3ZQdXxDlcLhYOqg/WprfTwVoZTVweK3IqMgZqYNUL2x/gEdj990xkH3JtQiYrW/8b4z8K557TJtqZh5s48rcmZ+oaeDtBwaedFlQz1xJ2VBjSDIdA34h5sZTPJY/Gu5bUoWxRV9qyW2bclgB038qqMi8K/XLawZio/hxJ9nqgA/IrNXmEnSI7JjLu3bQ/A2NjoYw9pOq/Chx8Ml8GVgspXTu5+qxS2p1JfVls2KWr4+NtdZXeeXEzmv/XXfRSXFxP0HRlIbGN6WmVawkn83y5lH46w0KQWTrCKG82086jSXeiqYUQoAqLlAjXEeGgw+9xMjQowYOFg==
Received: from CWLP265CA0392.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::17)
 by DB3PR10MB6907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 10:03:58 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::8d) by CWLP265CA0392.outlook.office365.com
 (2603:10a6:400:1d6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 10:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:58 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:48 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:57 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:04:02 +0100
MIME-Version: 1.0
Message-ID: <20260210-display-v2-9-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|DB3PR10MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: bb48a43e-864e-441c-e210-08de688bb54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0Fka0tFeTY1SlJORFlzcm02enp2b0FwS0Ixam1wbVBXVDZzSDNmYklFc05t?=
 =?utf-8?B?UzhZVzhVTzR6RDhSd2tUbkZBNFZDSjJZUHgxSTFrMWlHZmJUeThoWHVIZ283?=
 =?utf-8?B?Z2pnY055RlhPSFFGU0RCQlRkUktMTDdaVFRKdS80RWRTUVdGWnlHSjI1b09U?=
 =?utf-8?B?WDhkcE40Yy95dnRyR25jYUZxd2ZHdUlsM0tCaWVYV1Jrb2YvaFozeGMxL1BY?=
 =?utf-8?B?cnVaRzBnckxPaFRkZnhadWNLQktnUVpCb25CZDJaQTN6SXd0OHBxeTFDZzY4?=
 =?utf-8?B?Snk1c3VKZ3IySmdrUWQwM2RNaHY0emFVa05RQVVrYUp1SWRCSTRpdi9RZUJo?=
 =?utf-8?B?NFBUaGZtNEpXWU9Wd0dCRDltVFFWUWFMVmtKb0ZEWFFrajh4TG5haG1sbVc4?=
 =?utf-8?B?N1BLd2J4MFh3SEZlZXBtN1pVTXAwazU1QnVWaDJGNjhjc2UxYVFkVFdJQ28w?=
 =?utf-8?B?WENmOWdpWHdEOUdqcVJNdXdxVnNUZWpteDZ6ZGFZM1FuTnZyczdOTjRpQzA5?=
 =?utf-8?B?bXM0cERWVGRKMXFVcWVyaW1KanRRODM4S2RaTzl4aGppNnVVMVlORmVEWVk2?=
 =?utf-8?B?RmxTNDRac1ZpTTJvRHdldnNGUjBqdlZId0cxaDd4K2VJbUVjeTBqdVdKd3NJ?=
 =?utf-8?B?OFdwVDBUMzc2cEJRalVvb2g5dTZsQ2ZwWkFyTkw1eEViczRTMnZ2VTNHbWIw?=
 =?utf-8?B?VDIxZmk1RmFtZ052RTY5SXUzZzltd29paXU2bzgyRzdPNWJrQmhwMG9zRElN?=
 =?utf-8?B?UDU1Z3NraVJodmNXSStlcCt5RUNOKys1MURSNGdZK2VSSlZmM1R5MFBKOVp1?=
 =?utf-8?B?dDd2cVcwYllmdlJHL3FBYVE5UmswcGQraWFOUUpva25MZ3dHR1NJS2x6UXJW?=
 =?utf-8?B?UnFNeXlYWXVwRW5MVUFpd1I0ZkdZSWV2bmkvdFpkZXBKM1BzcXJLd2FUeXR4?=
 =?utf-8?B?NTZZQStTVktPR2cvc3I5STlNZ0xaWnhBUTQrZVcyck0rNG5xZVpFWlJWUk53?=
 =?utf-8?B?VDJuR1A4Y2QxUHFwcUxTNDcrZmVncS9FUXlEa2h0dUQ4T09oeEYwTXFtamc5?=
 =?utf-8?B?SWF2dlJGWmtvTDZPSFRaUmRxQldsQklmQjRPcE5CUnFrdVNhRmtSMXF4Njlp?=
 =?utf-8?B?akYra2Z3ck05Tm1rM2g2d2x4bEJEbndVM21kL2ZkR2haZSthQUs4YUh6cHVs?=
 =?utf-8?B?eWdZQUpDVFB4TUlSa1hMUExDUG51K0N2cW54bnVOd253aExxOFRXb2QrS3F2?=
 =?utf-8?B?NmVqMTIvNzFDLzRJWnJYWWlqVTNuYXU0Q3JrNGxBa2JOS3UxVFh0L25Qc3lk?=
 =?utf-8?B?UlNLREliaGcyaSt0ZkZqWVRnMldHRERUelpsY0l5bkRNZEJPb0cxUUViUW1V?=
 =?utf-8?B?bm5oVTFDbjNRQTRrNUd6TWx5S2FvV3RwdFpVYXczVGJUc2NURUVuYlZ0L0s2?=
 =?utf-8?B?eG1CaU05V1liZm00bmxOaVJXTFdOeitySU9HMXBnb0xXdGtTdm81ODdzRHNI?=
 =?utf-8?B?c3JtU0ZBeGdMcmtzR1lXMmFJQ01VOFdzQXBzSjY0dVR3Z0pnenlIdnpYS2lO?=
 =?utf-8?B?ZHNIOU1zZTdtYnJWM2RaRVBQZUlUZE95cjRwMWpteFhaSWttN1V3R2tqQi92?=
 =?utf-8?B?QlVMOUR4SjlyNVlWbHhvZkIwWDhKdHB0UWFkOGlJUzIrcEZBeVo2U3BiSVRr?=
 =?utf-8?B?ZG5yZzRiYjlLSXdEYm9vSVhGTElISUQzN2h1WDdxSFQwQ0ppeW1waGpuSDNX?=
 =?utf-8?B?Zk1FQVZucG5wbTFQOHVmbUprWlQzMnd4RDNiTXQyVzMveElYckJaSFZIbk9P?=
 =?utf-8?B?SFp0cTlTZmdxZGJQaTFHSXlES2gzU1I0dE9KWlozZ3lXRnJXT1daZGR4M2p5?=
 =?utf-8?B?aGV4d2luZlZnMXVyTWJsNlRjOGZacDVoa2l0YTYxQmlOck1GcHZzNzdrRklW?=
 =?utf-8?B?S1RnRi82a1BzOFBCcjJLMEpTMlpoNjgxaDZSb0RhUWljL081RVNQUW1vNDIy?=
 =?utf-8?B?OThLVVp0dENlcnJhZ1RnODd0QVNmajdmcVRtSENNMnJ5Nm9nNmpSbEV2VUcy?=
 =?utf-8?B?UDVNOHdxUjhzeDhDZE8xOVcxaWNZeVh3RUZrdnltcFp5VTlqMjQyNHV2dW44?=
 =?utf-8?B?aXl0aDZvcUQwSUpWcXR5NkNsMk03UzFZekQ5NENyVG1HUHZjS2l4RitITEFX?=
 =?utf-8?B?RGxBTEg4VXR6MnpPNmdNWFhvanlqZ1lmbnZ5STdPaURwL045Vms2VlphUTI1?=
 =?utf-8?B?Zko0eVBCTG1nTXQyRHZxbWNKcER3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gGwUAb0TbfdzVwlJtnXQpNXFKAvBGGFkF+zCYK9qI2dGpmHL5suGKlesXs1G+XOH0DECMZBJSvh2nmIthbU63c6xooRR3uFHtez42I9mIgldHbS9OxHMoafnf87gDA2YQufeAeGVcwQxO4h0qHYWMIvNo3RNBj0GNX8oXK7r2DcW24wvLvt8ys2pzxoFEt/NVcYxYy8EDzUFTA7TlulukzbcPoUyf4ad0Ixa+tPtr0XqLdp8KDGZGAonicfIklsgN93I8BP+mSA59irw6eV+dUNrUAC3ccNFaXT+0rsX5C8Ua2JPIBH4PEcV1ZiwVRmCgNZeb4WlNTQF2uWLkWCIE9sEIbvlVNNmqvEx40MpGfIrTNA2WAmVKd9vJDqXnG3mppBoZVf5sPcKkh3v9OcC5XDcjyPHFLOcXenvwCbUVDOOOc/+TA8xkpDoELhbEzMW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:58.4005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb48a43e-864e-441c-e210-08de688bb54e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6907
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 9/9] arm64: dts: st: enable display support
 on stm32mp257f-dk board
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:christophe.roullier@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid,0.0.0.1:email,0.0.0.41:email,4.196.180.0:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2949211957C
X-Rspamd-Action: no action

Enable the following IPs on stm32mp257f-dk in order to get display:
   * LTDC
   * LVDS
   * WSVGA LVDS panel (1024x600)
   * Panel LVDS backlight as GPIO backlight
   * ILI2511 i2c touchscreen

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 4e45562ceb3dabb19eca3340337b364f63508215..b60c13614cfb9207b8b541ee8bde4ae9aab937a8 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -55,6 +55,43 @@ led-blue {
 		};
 	};
 
+	panel_lvds: display {
+		compatible = "edt,etml0700z9ndha", "panel-lvds";
+		enable-gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		backlight = <&panel_lvds_backlight>;
+		power-supply = <&scmi_v3v3>;
+		width-mm = <156>;
+		height-mm = <92>;
+		data-mapping = "vesa-24";
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <54000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <150>;
+			hback-porch = <150>;
+			hsync-len = <21>;
+			vfront-porch = <24>;
+			vback-porch = <24>;
+			vsync-len = <21>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_out0>;
+			};
+		};
+	};
+
+	panel_lvds_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
+
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -100,6 +137,59 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-1 = <&i2c2_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <108>;
+	i2c-scl-falling-time-ns = <12>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpioi 0 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
+};
+
+&ltdc {
+	status = "okay";
+	port {
+		ltdc_ep0_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			lvds_out0: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
