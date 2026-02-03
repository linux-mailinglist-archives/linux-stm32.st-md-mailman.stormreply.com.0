Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCOmJfKmgWmYIQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 08:42:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BDED5CD5
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 08:42:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6ED0C87EC6;
	Tue,  3 Feb 2026 07:42:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4443C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 07:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSyUvZsirIOJ0wQXCEih3QILpvMV3cMYBpG7Xh4H+fi9euDhiQWEFbKbkaCfmlYkNfe0vEp5WxkBooBWu4Lp0QgC8+rqrsBmFQnWkyVJ7jbeoZVTE20IT5Ufcs5nrQ69ahiymN8z3dOiMUzGOhTet0E2mF1lTfQ4H1Qb1cBeonZ7M77PrE33ID+89v0hIeALLvgZH55TscoxSkgKRC1ZVoC2uM/WGArUq1xby7VMAFZ0rpmmIWcaazeN5AOpKKnG1TRtYyZ8hP2rybF3X4wlxVxYTNmOoRzAgPqnQnPlQsCII3mhA4ql5iWAdE/PW/EHpxVyX2HQS+l7FEZW/4i8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjwvWtHAFtaI/Xpqg9QGqz2wBbxFJWLTn36wZzoBzdA=;
 b=gtaT29TYRu+zhvm+fdKitrVVKcGrxrS5ltIueaHegVPAWdHAxbZMrZX5A6OhZiXhZREn97osAtLFF722P7pzxH9NGKEfeGZb71TjrqiROFQMF+RZnk2Sv7gxS5c+CUZiiFTnruBrLQTivTVoQpPXDTKnr/YoW7ZBOCCedv/i6fVcMd8sg7FATs8Htxe36LxM1Rp0JJANm5BttZ8wDByeUz3zl7kZAu/nZX1DPMihVUXJuha1iYvHmOAnlPoxSEIDO3TTeoJSBLKkEY4F56uPTWNLMxC2KFFUW0jt4wHQBlPexdnlk9/1TrBDR4XSn4S2uey97N+UI1UmWezMYrOkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjwvWtHAFtaI/Xpqg9QGqz2wBbxFJWLTn36wZzoBzdA=;
 b=A34NOF/3cxBNUT83bRFp6DGRoxbXZFH5UZN5B9QwWTnkQK2cecN0w4b9spjYsbgthn26oon7oIiGe65AH1BoezLXk9ZIYL402JkZYzjSlknGy7jl0MI17wFir7HryViTQN+R/KJ4vN62YpNExYSzPvUaGG7rgCKGvcROGbiJ7R2jJokriCufoCDa4ASltpWzT5bxYJ+A8prVUZNqloYBqBocy7jbGi9HbPC3KWAWBIQQbWFXjjSUySzgyDjIaD7Ppa/CC4wqAC+1h3DlqQGXuT/6IaHRXnygV3WK/1KWCxOAE4eM6acVmpletswFQLjABYaIUPG+2/aA89KhvgFd+Q==
Received: from DU7P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::21)
 by AM0PR10MB3140.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 07:42:37 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::47) by DU7P251CA0008.outlook.office365.com
 (2603:10a6:10:551::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 07:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 07:42:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 08:44:22 +0100
Received: from [10.252.26.182] (10.252.26.182) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 08:42:35 +0100
Message-ID: <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
Date: Tue, 3 Feb 2026 08:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
Content-Language: en-US
In-Reply-To: <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
X-Originating-IP: [10.252.26.182]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AM0PR10MB3140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe294ef-2333-4df3-8e7c-08de62f7ccf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlovdUp4aVdVOUQ1YmpzZHBBWnJFdlVUOEgwSHVocTRtMnNIWDV4S1YzK0tF?=
 =?utf-8?B?N081UUI0NGpqL1BBSXZYL01JRStwdFM5cWJVSC9DQ05IeDFncDRsQUplR0c0?=
 =?utf-8?B?ZCsyT1g5QWVsZGdRODR5N24wM3hvQmhDNENCbFNWVS9zSkdzT1NHSlZjZnN0?=
 =?utf-8?B?YUJWK3ViOXBvZGJESjdWSnM0ajlVRGZ3cFRTRUNvdXJ0ajV0dWNTRUd5bEFJ?=
 =?utf-8?B?cUJNZVErTm5Rb0t0aGpGODZSQjJBYmJxSk9MVHFXVWg2ZVBpOW9PYkNGbDBR?=
 =?utf-8?B?T3N5Uzc1a0ZpSWJkeUVFaFVhZExxZ3d1VDVrbUZFU3hZYjRCTzRzdDZSeTA5?=
 =?utf-8?B?eitFM3JIQ0dUeEJqcXBJSXF6SDhhS0lSa1BHRS9wb0tHdS84RHlPM2VTR3I2?=
 =?utf-8?B?NjdQdXZhd2R5cHRJZkJXNTlYbEQ5Zm5LaXNuMm1WK2xHNGwzdkJsU0lGbFkz?=
 =?utf-8?B?RjVnQWh3UGRVSU9BZlhZU0thblo0anJ6Z0xsZDhPWkNYMkRBcGtZQnl0cVkv?=
 =?utf-8?B?M0R5VnpEK1NYSXpMZDYrWVhra1BTelAvQ2dKSzlvM053N1lIOExLWit3TGNY?=
 =?utf-8?B?U3l5OXdrczNoNTNkQVJGSndQUnhsbmxXQ2tkd2hMZHJvMytSa3hOcUJML3l6?=
 =?utf-8?B?dDh0SG1TVjh4MS9xZnY1aUIzQTdKWUZDWVhlQlFOSnRjdWdnV1J2djZBZnZj?=
 =?utf-8?B?YlVPSUxCSHd2ZXY5WHhrQ1FndW12aUYvUXlPS0FzUWJnMkJuNHRRRFRXMGtX?=
 =?utf-8?B?VmplR2JlU016ajFSNTlHeml6QnJwWncwVVl1ZGlWRDBLd1kzQS9rWUlEZk5V?=
 =?utf-8?B?U3d4RGxSTU1INktUczlyVVN6VzlrdzFMSUpjM1FaNEJzT2pIZVlWVkpmVXpv?=
 =?utf-8?B?dXJ3cjd3M0RENFYvS3JSREI2bFAwcGZkZ2owa0tTZnk2ZEZ6dlVFTjlEZ1BU?=
 =?utf-8?B?Y1paWEpxMGlkTDR6aXJwOVV1alYrV2hJMnpGOUMweGsyalB6Vmw1NU9lQUth?=
 =?utf-8?B?WEFYUm9vakZSK3ZZMTR3eUtsWHRISXVQMTlRbThDelVmU2xIc3JLdFpDTjhN?=
 =?utf-8?B?WXpvTWsya2pKbnVxMmFJS0RwemVFVzZVRjk5QlRiTit0cGVzNFNqVzY2OHlL?=
 =?utf-8?B?cWl2dnZ2cXVlQ3dYZEZIcmdJVWdKZlh0U1hlM1ptWWh2cGYwYWlYL2J1Q3NP?=
 =?utf-8?B?Qm5GZURWelRuTHpEdU1RUmExOG0yeG9nek45dVNHQUxFWkVpNlhiTFVXMlNZ?=
 =?utf-8?B?bWo1NUZRdlR3ZzNtd1d1Y2hEMGo4MlNCY0ord3J4SmpKcktwdDRxQk1NbEtO?=
 =?utf-8?B?R0owbFlGZUxaNm5vYlAyVmpxdUJwU3pYQkNxWEVIckJUNGRQWnQyNDBDRjlL?=
 =?utf-8?B?akIyMnRrQnNrY0NGNHpPTFExc0g5RFljekhHdE5Jb1BkVWZyTnlFTVA4Kys3?=
 =?utf-8?B?RWIvUDVkdUZRMUd6Q0VRZlF4dWtWUFZ5dnd5M1luWE9qOTh2VVlIWHFpbUIz?=
 =?utf-8?B?N1IxZWlybTlzaEdkWXFJT0ZKZGNhM0FYNjh6TWxBTm0zejZCYkFMa01ZMUU3?=
 =?utf-8?B?dlBROEIvZ3FHMnlGU1VCL1hSNXd3MjdlU2RPdjdCZ2JVUWlZdi9VZCtLcEpz?=
 =?utf-8?B?SnVZOGwwMHBuUHBUMUJINzZQaU1aYXIwSkQ3eUplenBKZ2dSUWVVd2lkZXRV?=
 =?utf-8?B?Yy9yMFhkL3AzRGRNL2lTSFRRc2YxVFZXcUMvMWJTL2xDWHRmQ0Riam1TT0tp?=
 =?utf-8?B?dnNwNnZKcUg0enZqd1BkWHBJQldMZ3ZLMFhDZi9RaUVqWFY3ZThoMWdxZ3k4?=
 =?utf-8?B?SVJVZEZLd0F1U0R3clhGUmk1V0I4TjdNUHNlc1N3c21UVUFRMWY0enNmL21E?=
 =?utf-8?B?aGllQ3VZTldhRkNBZWVjQkhtOFVqMDBKRmVSMTBhSWFLZjZ1bHdzams1Q2Zt?=
 =?utf-8?B?Z3E2ZXd3dTdtZXpRb21qSkI0V1prU0hnb1JhbUJZc0RNZUl4UmJYQmJ2cDFi?=
 =?utf-8?B?YmFsVmpnSGRLbDBoYjJhTVhzaHlXbEE4MzJyTlRIYVVnbHdJWGs1bWkyNmZZ?=
 =?utf-8?B?MWNGOEloMEZLVjJGb2dpVnd0blh2VloyeFViTkpQc1I0K1ZXK0VJaEx3bDB3?=
 =?utf-8?B?US9ib1dCa3gwWWxSck1WY3R3SHhnTmVXZVpxaEdkLzB4NE45NDd1M0cwU0Ft?=
 =?utf-8?Q?aBLzhkOYIv9QmaKYw9Lt908=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 16a9bVpkzU7nUJWL2LepSini/6xwA2OdpnKgIKL6IYQ2n6sfp9vSWGnBqCxw8+zjkb5X3XnZCWwsDHf5M3G4vQdbJRtzs8Qwg9z+JREUwo2X0XXJug2rMDxbEg5KidwQCiP8xxVOOPpJd5wSHDjNYSNf+Ucceexi0p/wCC00wG0UgaWjv2wyQ5rntoJl5NmfKiseYY1t3ScNG+F4ILSuTRxhZGfTf5itUbAuq5F40ZvFntwcIJcgjipsAHngsXXVbM+q48FDG7qL4lga8+/Ylc7J8p3v5XLRZFGP543P6ZVmOg8tqJYlnLP/ymdvc6oUxJ6BSJzQ/V7tW8ha4rg2mYQnAAVr9crjzXdmFwPxGsLFR/adySnEJhxKLs+KEo9QPclC+5jJT0D3g5bgFNdI/1xO3ROwVcYdNUMkmE/siuSRjBU7dF9UN7mt6w8/rpfB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 07:42:36.7104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe294ef-2333-4df3-8e7c-08de62f7ccf5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3140
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bootlin.com:url,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.353];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16BDED5CD5
X-Rspamd-Action: no action

CkhlbGxvIFJvYiwgU3VtaXQsCgpKdXN0IGEgZ2VudGxlIHJlbWluZGVyLiBDb3VsZCB5b3UgcGxl
YXNlIHByb3ZpZGUgeW91ciBhZHZpY2Ugb3IgYSAKY29uY2x1c2lvbiBvbiB0aGUgZGlyZWN0aW9u
IHdlIHNob3VsZCB0YWtlIGZvciB0aGUgRFQgZGVjbGFyYXRpb24/IEkgCm5lZWQgeW91ciBpbnB1
dCB0byBiZSBhYmxlIHRvIG1vdmUgZm9yd2FyZC4KClRoYW5rcyBhbmQgcmVnYXJkcywKQXJuYXVk
CgpPbiAxLzEzLzI2IDEwOjIwLCBBcm5hdWQgUE9VTElRVUVOIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IE9uIDEvNS8yNiAwODozNywgU3VtaXQgR2FyZyB3cm90ZToKPj4gT24gRnJpLCBKYW4gMDIsIDIw
MjYgYXQgMDQ6MTc6MjdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBUdWUsIERl
YyAzMCwgMjAyNSBhdCA1OjEw4oCvQU0gU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BrZXJuZWwub3Jn
PiAKPj4+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMDU6MjU6MzBQ
TSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgRGVjIDE3LCAyMDI1IGF0
IDA0OjM5OjEyUE0gKzAxMDAsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4+Pj4+PiBBZGQgYSBk
ZXZpY2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgVEVFLWJhc2VkIHJlbW90ZSBwcm9jZXNzb3IgY29u
dHJvbAo+Pj4+Pj4gc2VydmljZSBpbXBsZW1lbnRlZCBhcyBhbiBPUC1URUUgVHJ1c3RlZCBBcHBs
aWNhdGlvbiBpZGVudGlmaWVkIGJ5Cj4+Pj4+PiBVVUlEIDgwYTRjMjc1LTBhNDctNDkwNS04Mjg1
LTE0ODZhOTc3MWEwOC4KPj4+Pj4+Cj4+Pj4+PiBUaGUgVEVFIHNlcnZpY2Ugbm9kZSBpcyBhIGNo
aWxkIG9mIHRoZSAibGluYXJvLG9wdGVlLXR6IiBmaXJtd2FyZSAKPj4+Pj4+IG5vZGUgYW5kCj4+
Pj4+PiBhY3RzIGFzIGEgY29udGFpbmVyIGZvciByZW1vdGVwcm9jIGRldmljZXMgdGhhdCBhcmUg
Y29udHJvbGxlZCB2aWEgCj4+Pj4+PiBURUUuCj4+Pj4+Cj4+Pj4+IElzIHRoaXMgZ2VuZXJpYyBm
b3IgYW55IHJlbW90ZXByb2MgZGV2aWNlIG9yIGp1c3QgU1QncyByZW1vdGVwcm9jLiAKPj4+Pj4g
TG9va3MKPj4+Pj4gbGlrZSB0aGUgbGF0dGVyIHRvIG1lLgo+Pj4+Cj4+Pj4gVGhhdCdzIHRydWUs
IHRoZSBEVCBkZXNjcmlwdGlvbiBvZiB0aGUgcmVtb3RlcHJvYyBzdWJub2RlIGlzIHZlcnkKPj4+
PiBzcGVjaWZpYyB0byB0aGUgdmVuZG9yIHdoaWNoIGluIHRoaXMgY2FzZSBpcyBTVC4KPj4+Pgo+
Pj4+Pgo+Pj4+Pj4gSW4gYWRkaXRpb24sIHRoZSAibGluYXJvLG9wdGVlLXR6IiBiaW5kaW5nIGlz
IHVwZGF0ZWQgdG8gc3BlY2lmeSB0aGUKPj4+Pj4+ICcjYWRkcmVzcy1jZWxscycgYW5kICcjc2l6
ZS1jZWxscycgdmFsdWVzIHVzZWQgZm9yIGNoaWxkIFRFRSBzZXJ2aWNlCj4+Pj4+PiBub2Rlcy4K
Pj4+Pj4KPj4+Pj4gSSdtIHByZXR0eSBzdXJlIEkgYWxyZWFkeSByZWplY3RlZCBwZXIgc2Vydmlj
ZS9hcHAgY2hpbGQgbm9kZXMgZm9yCj4+Pj4+IE9QLVRFRSB3aGVuIGl0cyBiaW5kaW5nIHdhcyBz
dWJtaXR0ZWQuCj4+Pj4KPj4+PiBUaGF0IHdhcyB0aGUgcmVhc29uIHRvIGhhdmUgZGlzY292ZXJh
YmxlIFRFRSBidXMgaW4gZmlyc3QgcGxhY2UgYW5kIEkKPj4+PiBoYXZlIGJlZW4gbW90aXZhdGlu
ZyBwZW9wbGUgdG8gZHluYW1pY2FsbHkgZGlzY292ZXIgZmlybXdhcmUgcHJvcGVydGllcwo+Pj4+
IHJhdGhlciB0aGFuIGhhcmRjb2RpbmcgaW4gdGhlIERULgo+Pj4+Cj4+Pj4+IElmIHdlIGRvIG5l
ZWQgc29tZXRoaW5nIGluIERUCj4+Pj4+IHRvIGRlZmluZSBzb21lIHJlc291cmNlcywgdGhlbiBj
YW4ndCB3ZSBoYXZlIHNvbWUgc29ydCBvZgo+Pj4+PiBzdGFuZGFyZC9jb21tb24gY29tbXVuaWNh
dGlvbnMgY2hhbm5lbD8gSSBkb24ndCBjYXJlIHRvIHNlZSBzb21lIAo+Pj4+PiBzb3J0IG9mCj4+
Pj4+IGZyZWUtZm9yLWFsbCB3aGVyZSB3ZSBoYXZlIGV2ZXJ5IHZlbmRvciBkb2luZyB0aGVpciBv
d24gdGhpbmcuIE9QLVRFRQo+Pj4+PiBuZWVkcyB0byBzdGFuZGFyaXplIHRoaXMuCj4+Pj4KPj4+
PiBJIHN1cHBvc2UgdGhpcyByZXF1aXJlcyBhIHdpZGVyIHNjb3BlIHdvcmsgYXMgeW91IGNhbiBz
ZWUgdGhlIERUIAo+Pj4+IHJlc291cmNlCj4+Pj4gZGVwZW5kZW5jZSBmcm9tIGhlcmUgWzFdLiBC
eSBzdGFuZGFyZGl6ZSBjb21tdW5pY2F0aW9uIGNoYW5uZWwsIGRvIHlvdQo+Pj4+IG1lYW4gdG8g
c2F5IGlmIGFkZGluZyBhbiBhbHRlcm5hdGl2ZSBiYWNrZW5kIHRvIGZ3bm9kZSBmb3IgVEVFIGlu
Cj4+Pj4gcGFyYWxsZWwgdG8gRFQsIEFDUEkgb3Igc3dub2RlIGlzIHRoZSB3YXkgdG8gZ28gZm9y
IGRpc2NvdmVyaW5nIGZ3Cj4+Pj4gcHJvcGVydGllcz8KPj4+Cj4+PiBObywgbm90IGF0IGFsbC4K
Pj4+Cj4+Pj4gT3IgZG8geW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb24gaGVyZT8KPj4+Cj4+
PiBXaGF0IEkgbWVhbiBpcyB3aHkgZG9lc24ndCB0aGUgVEVFIGRlZmluZSB0aGUgY29tbXVuaWNh
dGlvbiBjaGFubmVsCj4+PiAobWFpbGJveCtzaG1lbSBhbmQgbm90aWZpY2F0aW9uIGludGVycnVw
dCkgcmF0aGVyIHRoYW4gZWFjaCBURUUgYXBwPwo+Pgo+PiBUaGUgc3luY2hyb25vdXMgY29tbXVu
aWNhdGlvbiBjaGFubmVsIGlzIGFscmVhZHkgdGhlcmUgZm9yIGVhY2ggVEVFIGFwcAo+PiBiYXNl
ZCBvbiAoaW52b2tlIGNvbW1hbmRzICsgVEVFIHNoYXJlZCBtZW1vcnkpLiBPUC1URUUgZG9lcyBz
dXBwb3J0Cj4+IG5vdGlmaWNhdGlvbiBpbnRlcnJ1cHRzIHRvbyBidXQgdGhvc2UgaGF2ZW4ndCBi
ZWVuIGV4cG9zZWQgdG8gVEVFIGNsaWVudAo+PiBkcml2ZXJzIHlldC4gSSBzdXBwb3NlIHRoaXMg
cmVtb3RlcHJvYyB1c2UtY2FzZSBjYW4gYmUgYSBnb29kIGV4YW1wbGUgdG8KPj4gZXhwb3NlIHRo
YXQgYXMgYSBnZW5lcmljIFRFRSBub3RpZmljYXRpb24gaW50ZXJmYWNlIHRvby4KPiAKPiBJbiB0
aGUgU1RNMzJNUCBzZXJpZXMsIHRoZSBtYWlsYm94ZXMgYW5kIHNoYXJlZCBSQU0gYXJlIHVzZWQg
Zm9yIFJQTXNnIAo+IGNvbW11bmljYXRpb24gYmV0d2VlbiBMaW51eCBhbmQgdGhlIHJlbW90ZSBw
cm9jZXNzb3IuIE15IGNvbmNlcm4gaXMgdGhhdCAKPiB1c2luZyBub3RpZmljYXRpb24gaW4gT1At
VEVFIGNvdWxkIGltcGFjdCBwZXJmb3JtYW5jZSBieSBpbnRyb2R1Y2luZyAKPiBsYXRlbmN5LiBB
ZGRpdGlvbmFsbHksIHRoaXMgbWlnaHQgcmVxdWlyZSBhIERNQSBhbGxvY2F0b3IgaW4gT1AtVEVF
IHRvIAo+IG1hbmFnZSB0aGUgc2hhcmVkIG1lbW9yeS4gT25lIFJQTXNnIHZpcnRpbyByZXF1aXJl
cyB0aGUgZGVjbGFyYXRpb24gb2YgCj4gYXQgbGVhc3QgdGhyZWUgY2FydmVvdXRzLiBNYW5hZ2lu
ZyB0aGVzZSBhcyBtZW1vcnkgcmVnaW9ucyBpbiBPUC1URUUgCj4gd291bGQgYmUgY29tcGxleCAo
ZHVlIHRvIGxpbWl0ZWQgbnVtYmVyIG9mIG1lbW9yeSBhcmVhIGRlY2xhcmF0aW9uIG9uIAo+IFNU
TTMyTVAyKS4KPj4KPj4+Cj4+PiBNb3JlIGdlbmVyYWxseSwgaXMgaGF2aW5nIFRFRSBhcHBzIGRl
cGVuZGluZyBvbiByYW5kb20gRFQgcmVzb3VyY2VzCj4+PiByZWFsbHkgYSBib3ggd2Ugd2FudCB0
byBvcGVuPyBJcyB0aGUgbmV4dCB0aGluZyBnb2luZyB0byBiZSBhIFRFRQo+Pj4gY2xvY2svcmVz
ZXQvZ3Bpby9wb3dlciBwcm92aWRlcj8gV2hlcmUgZG8gd2UgZHJhdyB0aGUgbGluZT8KPj4KPj4g
VGhpcyBpcyByZWFsbHkgYSBoYXJkIGxpbmUgdG8gZHJhdyBzaW5jZSBzaWxpY29uL09FTSB2ZW5k
b3JzIGJhc2VkIG9uIAo+PiB0aGVpcgo+PiBoYXJkd2FyZSBzZWN1cml0eSBhcmNoaXRlY3R1cmUg
cGFydGl0aW9uIHZhcmlvdXMgcmVzb3VyY2VzIGFtb25nIFRFRSBhbmQKPj4gdGhlIExpbnV4IHdv
cmxkLiBBbmQgb25lIGdlbmVyYWwgcHJpbmNpcGxlIHdlIHRyeSB0byBmb2xsb3cgZm9yIHRoZSBU
RUUKPj4gaXMgdG8ga2VlcCBpdCdzIFRydXN0ZWQgQ29tcHV0aW5nIEJhc2UgKFRDQikgdG8gYSBt
aW5pbWFsIHRvby4KPj4KPj4gSU1ITywgaWYgdGhlIHRocmVhdCBtb2RlbCBpcyB3ZWxsIHVuZGVy
c3Rvb2QgdGhlbiB3ZSBzaG91bGQgYWxsb3cgZm9yCj4+IHRoaXMgaGV0cm9nZW5vdXMgcGFydGl0
aW9uaW5nIG9mIHN5c3RlbSByZXNvdXJjZXMuCj4gCj4gSGVyZSBhcmUgc29tZSBhZGRpdGlvbmFs
IHJlc291cmNlcyB3ZSBuZWVkIHRvIG1hbmFnZSB0aGUgcmVtb3RlIAo+IHByb2Nlc3Nvciwgd2hp
Y2ggc2VlbSBjb21wbGV4IHRvIGhhbmRsZSB3aXRob3V0IERldmljZSBUcmVlIChEVCk6Cj4gCj4g
LSBDbG9ja3M6IE9uIFNUTTMyTVAsIHdlIG1hbmFnZSBjbG9ja3MgdGhyb3VnaCB0aGUgT1AtVEVF
IFNDTUkgc2VydmljZQo+ICDCoCBbMV0uIFRoZSBTQ01JIE9QLVRFRSBjbG9jay9yZXNldCBzZXJ2
aWNlIGFscmVhZHkgZXhpc3RzIGFuZCBzaG91bGQgYmUKPiAgwqAgcmV1c2VkLgo+IC0gUG93ZXIg
ZG9tYWlucwo+IC0gUmVtb3RlcHJvYyBXYXRjaGRvZyBpbnRlcnJ1cHQ6IENhbm5vdCBiZSBjYXVn
aHQgYnkgT1AtVEVFIG9uCj4gIMKgIHN0bTMybXAxNS4KPiAtIEdyYWNlZnVsIHNodXRkb3duIG9m
IHRoZSByZW1vdGUgcHJvY2Vzc29yOiBUaGlzIGludm9sdmVzIHNlbmRpbmcgYQo+ICDCoCBtYWls
Ym94IG5vdGlmaWNhdGlvbiB0byByZXF1ZXN0IHNodXRkb3duIGFuZCB3YWl0aW5nIHVwIHRvIDUw
MCBtcyBmb3IKPiAgwqAgdGhlIHJlbW90ZXByb2MgdG8gZGVpbml0aWFsaXplIGl0cyByZXNvdXJj
ZXMuIFdhaXRpbmcgdGhpcyBsb25nIGluIHRoZQo+ICDCoCBzZWN1cmUgY29udGV4dCBzZWVtcyBp
bmVmZmljaWVudC4KPiAtIGNvbXBhdGliaWxpdHkgd2l0aCBzb21lIGNvbWluZyBJUEMgbWVjaGFu
aXNtczogU3VjaCBhcyBycG1zZ19JMkMgb3IKPiAgwqAgdmlydGlvLW1zZyBtaWdodCByZXF1aXJl
IHJlbW90ZXByb2Mgc3Vibm9kZSBkZXNjcmlwdGlvbnMgaW4gdGhlCj4gIMKgIGZ1dHVyZS4KPiAK
PiBJZiB0aGUgcHJvcG9zZWQgdG9wb2xvZ3kgZG9lcyBub3QgZ2FpbiBjb25zZW5zdXMsIHdoYXQg
YWJvdXQgYW4gCj4gYWx0ZXJuYXRpdmUgYXBwcm9hY2ggdGhhdCBtYW5hZ2VzIHRoZSByZW1vdGVw
cm9jIFRFRSBzaW1pbGFybHkgdG8gU0NNSSwgCj4gYnkgaW50cm9kdWNpbmcgYSByZW1vdGVwcm9j
LWJhY2tlbmQgd2l0aCB0aGUgcHJvYyBJRCBhcyBhIHBhcmFtZXRlcj8KPiAKPiAKPiAmZmlybXdh
cmUgewo+ICDCoMKgwqAgb3B0ZWU6IG9wdGVlIHsKPiAgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJsaW5hcm8sb3B0ZWUtdHoiOwo+ICDCoMKgwqDCoMKgwqDCoCBtZXRob2QgPSAic21jIjsK
PiAgwqDCoMKgwqDCoMKgwqAgc3Byb2M6IHNwcm9jIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gIjgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCI7Cj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gIMKgwqDCoMKg
wqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+ICDCoMKgwqDCoMKgwqDCoCB9Owo+ICDCoMKgwqAg
fTsKPiB9Owo+IAo+IHJwcm9jMTogbTMzQDAgewo+ICDCoCBbLi4uXQo+IAo+ICDCoCByZW1vdGVw
cm9jLWJhY2tlbmQgPSA8ICZzcHJvYyAwPgo+IH07Cj4gCj4gCj4gcnByb2MyOiBtMEAwIHsKPiAg
wqAgWy4uLl0KPiAKPiAgwqAgcmVtb3RlcHJvYy1iYWNrZW5kID0gPCAmc3Byb2MgMT4KPiB9Owo+
IAo+IAo+IFsxXWh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjQvc291cmNl
L2RyaXZlcnMvY2xrL2Nsay1zY21pLmMKPiAKPiBUaGFua3MsCj4gQXJuYXVkCj4gCj4+Cj4+IC1T
dW1pdAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Cj4gTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQo+IGh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
