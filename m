Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKFFMhSuiWndAgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 10:51:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13B10DC90
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 10:51:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242CBC36B3E;
	Mon,  9 Feb 2026 09:51:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9E5C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 09:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir2csE89TFmq1UvqOUleItHS4QDKEmIZAqg4IfiyJBlBWpqlOB3a5uWWjcF65tKByZaB9/qvGC8j2Wa98QVAUcMMGvIeDOvq5VVdZGhIODtLeWb4iRwZUlW07PDurph9gyzkUn4Zjxd89qYIarT9NnssDBi3EZoJYzNwURZoWrMAVtz5Oz7tB6wobSPOkedx+hjUSTltMbesbjemE/eVfUUcLRfxyArvbzR1O75ddIefpt0L97rPRRRFq2UNaHd3fcwUNk8gBUTV+E8BmfCiARLOtqa/rpTawiehqKLYxG6WprtKgsRIwAe8/miDtm/8+mQbJNPrcbx1DnTxKvCMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mudINonzp1eCXVwUPChBb7YXOZvuoIe8YvmOVFwdu7A=;
 b=OOalrrOXk7GROB2FzU6z5fKIUViTS8iFBshKXDMmbW/OVotTjlM6hkWEj+4DMa4Vrkcelc7cK1/6YqgbShIDL6oY4O7NFv23aomyui8HMNACKyss5bljX0gyKPEn21msGuuuSDfrIxwTGg3Fhs/26AM46um542j2m9QcQUJ0HPvU9sNLRpeiAvaRBcgGjBMbg+pAp7Tn+YXp32Ebs6yjujLYOU7N2D7YvFBMtXcvEMkG0yjRMjHuaDWUmtExhMxpAP0alL7mOwiD4pDvOHTxQeM1+SxPEB7oZNEM9Y9k+cVZPCMs2Ymvg5n4D7kOd+A6kSGtOMayBWD6K1zRa8yM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mudINonzp1eCXVwUPChBb7YXOZvuoIe8YvmOVFwdu7A=;
 b=GDjV45TBek76VZGwRpq43XT/3Y5IiDsX1gpkA9HdrUhmJRAhfJCYLg0yjecygH8tB3y2Uwt0BLp8mGUr3t5iiWcChqXZ8NRrnsMzB26mzXH09OloXOrYfPZoRqYdgeeHKJOJq54VqRzrPtxgxVL3IB6wh5yEbHzjRYLthkJi4Hn5s6zXeU0+oNGCYNYy5L1M4B96oC+z9E2I5OWWMJFWWxTWfDy+BrM7qtgS+SLUrGaq2X6lGgK5syFIXEaB90uS04pDH6OgEWdms/Zt/QHeMkUX3XYPSzlCrRyXLv2KwsANB1+4+dINjemS5rRldGeBlKzK2QU1rd0lyrUxYBAljQ==
Received: from DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) by DB9PR10MB6665.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 09:51:10 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::2c) by DUZPR01CA0176.outlook.office365.com
 (2603:10a6:10:4b3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 09:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:51:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 10:52:59 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 10:51:08 +0100
Message-ID: <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
Date: Mon, 9 Feb 2026 10:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DB9PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: ed237a67-ade2-4aad-b2c2-08de67c0c0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU95ZFUwYjd1elpvNjBXU202aU52Nmp3Y2I3UkhFVlJYU1ZuS3JSck42VTVQ?=
 =?utf-8?B?S0d5ZUpVVmptSjJEa1BWUUdtcEFEK3NGb2FubUQ1cElJWkt6K2g4bjhpTk4w?=
 =?utf-8?B?K1lJb2lwYU85VmE0dTVVdmxWcnk2cHFzb3IwSFlRcTVaVmFuYXNYenVRaHly?=
 =?utf-8?B?MFYrWkV5M2c5V0FCSGZDMEFCVkNMNXJ3R0Fhc1pTZFM2NUVUUWNadVQvZzJw?=
 =?utf-8?B?SkhlcWhMZU9VQjJYeFNKaElYSUhVNklIRWhRWTRhd2lTTDNEY0ticVhrVkpq?=
 =?utf-8?B?SktNbm5WQnd0NkYrSFJ1S0hIb0U4YXJwQ0luSDlpbmdpTmdkZ0VEdm9HcFhO?=
 =?utf-8?B?V1ZOUGl4V1I3V2gzay82eXlLRjVqdFp2N0todTV1Qkw1QWF3VGsxOVkrRUlL?=
 =?utf-8?B?MjErTm5Hck4rTkJSSGg3WFpQUWJJU2FGREJYa1hyY2xGblFlMXhNcTRqWXJa?=
 =?utf-8?B?L0VrbmRnVUJOWHVHZDhNR1BnS0pGL0YrWjJkRzc0RHNoTkQxRWxrcWE5dE5Z?=
 =?utf-8?B?WHFtekIxK2U4eFRZNFFjM3QyS3J3K05vbnQzWGVMamEzMGZVZkNoUFhZUlN0?=
 =?utf-8?B?U3F4OXdVYmpVeW90Tm1oMHlvSUM1MW92cUpxc1ducW02RWZLMG9HRE04bkl5?=
 =?utf-8?B?NFNoWE13R3BkSEVPMHdmbk5KczhGNWZWUUhyQldhYjZzTkY2eHRCU01vLzNJ?=
 =?utf-8?B?VUZGRDV4RlcvUmRlRTdLbGJUWFdScnV5RU52ZDBqNjlta2o0U2dSVXVTRmdI?=
 =?utf-8?B?N3ZQSmkxd3BhaFBTbmFFN2duMzMzeFFpeEZreUJCNkIvUHMyNjZ3K2RZdG80?=
 =?utf-8?B?RGZpRTMxM09pWFpMaG9PN0o4Q1llT1ZTbFlNakJwOXRYNGc2S3JRMFpXMWd1?=
 =?utf-8?B?eWdkc3JsaTE1cXRUMk94ZVR1UGNyNEdza2RCR1dSS1Y2amtYR2k5anNJbWhW?=
 =?utf-8?B?R2ROMXRULzFhazFCTTYyaE8xSjZOb3oxZmFveVRLQ1lKZXR6a2IzNWtIZUdD?=
 =?utf-8?B?aVEwZTNFWEtocHFveHkyc3ljTFpuS2RGVTFzQ0lpZkdHVFVjQUZ4Q29HbmNq?=
 =?utf-8?B?Y09nU1Q0R1Jqa3Bqb1UyMFVTUlhFcTRybzZwKzM4NytkWnlpZ1NtUkhIdk9C?=
 =?utf-8?B?S3IzY1ZMdGJOWFc5Y3AvWGtoZDFuUnFiaThrL25mWElpOTZzTVJUb0JFUjcx?=
 =?utf-8?B?Q2YvcW9JeGp1ZGVvZWxIRmFUVEUxby9UTGFsUHQxOFZXTkRFQ251bURHY2Qy?=
 =?utf-8?B?VjV5WUV6WEhqRFA5eHFZWjJad0pxclNSVW5rNStGMTdzRWoyQk9UM0dMVlk3?=
 =?utf-8?B?cERzaHJmbXJ6NTJzMUI2Z1h5ZUlDZVFxYzdCT3RTWUF6NDYveVN5RG5GaEpi?=
 =?utf-8?B?Z0ZXbDdveENYVjVoTVNodVZVU1pva2NtNmVtMWlOQnBpbjBzVDEyb25yOFhQ?=
 =?utf-8?B?amcraVE0NWN5WmR0bFp6ckZkT1lDZzZlZ3pTWmlkeXA5ZDdKdEIydkZmUmhX?=
 =?utf-8?B?RzNQcVkrRE9BRmpRUzd1emhLUDlZWE9QOVhXRXZ5Wkg4MnlvY0txSjdldXRn?=
 =?utf-8?B?ZU1EYVZWUUNRZ2lxSWR3MzcxRTlpNGMxVE5LRFE0MFZLNVBJUDRVdE1YMGJF?=
 =?utf-8?B?bitIc2d2OEkvVjhlWnRIVnhlZEl3SVdHN2drM2FGSDcyU0ZIUXM2N2x0MkRO?=
 =?utf-8?B?c3ZRRk9FZXZtMytVSGJEZEhVeHhkc1NldjhnbEFOUlk1Z3NtZzlEQmZ6Z2l2?=
 =?utf-8?B?NWxad3haa1lWTnZacll1Y1JaSUsxMUVacWdZaDJDTEJtTXBIQ1Blek41dWtF?=
 =?utf-8?B?V2dmd0E2WmloL040ZHlOUkpESWF5dWFDRWtRT3Q2QmZUODhmWmVzb3JZNFpG?=
 =?utf-8?B?a0lQc3hSNVAyd00zUzNsNm52VVBNb0ZwMnZzMnR5UGxRc2dhdGlTaXBGSHAy?=
 =?utf-8?B?T1ZubW9DekRQNWFoSzBmaDdIWEZYZGt5QXY3ZzRQV1lJTUEwVWZaakRkNEVB?=
 =?utf-8?B?eEJ6WTBqcEtKeExrd3QxaHlpOUJKMklLVkQ3UENKdTA3QkRPNEpxVUMrTC83?=
 =?utf-8?B?d1RPaEhWcE04T1djTVhXazRNYWpvcjhhcmNYUEFFMmVpWW1Ia0lDaldBUXdr?=
 =?utf-8?B?azdvLy9va1B4eTZ0M3ZNRlJpN3VKcEpzb0NlVHJIM2Mxa0o2elVKVHhmR2Nr?=
 =?utf-8?B?RnkxSWpibE5nYlZYMk82ZmhOUERsNTNVUkpVR2o2d3hGRWhxTWY0dzdJSk5N?=
 =?utf-8?B?VGFERnRXWTBwQUZYNWRndzB1ZXd3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mTOGKraCQUVi6g9dib2AaYgrw+xDG76eVSf/fzk2EtAJBolyGlwA309Ys/29AG6iXKXIUUJuRQUvl1wGB0L74MXdxyCJYcxJDe6DHpfC7eDgR1N19z/+rZKF0zV2c8WvJEiWEWgyiNRi1uO5dqmwzcNHdABRhXgv6bjzvl2lpCIlyHxVawemMFUUjnIlSV7UG4KKVKkNz/y9XHW++fsglLfj7QcTR10dCBH7NYUQ3JIGCMHAeXiq77DhZ32BWVBJKgO5L/ZJBTW00Ic8bGWCCjtdQ/b2+NRBR9uT06PpfTvgBXcBJzCkkqFlz/7w1HnyqbIUJw7y/P2nOvfe/TQyHbuQIXgZmbzB6AmA7V1Y1tXTXRNpQGMcKxsEVEuUTcGIvHKoAWeQM+xUhUZvu6z5psHls3scPzkwlnI5M6b5fsXSFpfy+h8X0+x6W70ma0CT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:51:09.6646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed237a67-ade2-4aad-b2c2-08de67c0c0b5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6665
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] remoteproc: core: support fixed
 device index from DT aliases
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
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:afd@ti.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email,nxp.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[4.135.171.0:email];
	NEURAL_HAM(-0.00)[-0.736];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D13B10DC90
X-Rspamd-Action: no action

CgpPbiAyLzUvMjYgMjE6MDcsIEFuZHJldyBEYXZpcyB3cm90ZToKPiBPbiAyLzUvMjYgMTE6NTgg
QU0sIEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+PiBPbiAyLzQvMjYgMTU6
NTcsIEFuZHJldyBEYXZpcyB3cm90ZToKPj4+IE9uIDIvNC8yNiA0OjUyIEFNLCBBcm5hdWQgUG91
bGlxdWVuIHdyb3RlOgo+Pj4+IE9uIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSByZW1vdGUgcHJvY2Vz
c29ycywgdGhlIHJlbW90ZXByb2MgZGV2aWNlCj4+Pj4gZW51bWVyYXRpb24gaXMgbm90IHN0YWJs
ZSBhcyBpdCBkZXBlbmRzIG9uIHRoZSBwcm9iZSBvcmRlcmluZy4KPj4+PiBBcyBhIHJlc3VsdCwg
dGhlIC9zeXMvY2xhc3MvcmVtb3RlcHJvYy9yZW1vdGVwcm9jPHg+IGVudHJpZXMgZG8gbm90Cj4+
Pj4gYWx3YXlzIHJlZmVyIHRvIHRoZSBzYW1lIHJlbW90ZSBwcm9jZXNzb3IgaW5zdGFuY2UsIHdo
aWNoIGNvbXBsaWNhdGVzCj4+Pj4gdXNlcnNwYWNlIGFwcGxpY2F0aW9ucy4KPj4+Pgo+Pj4KPj4+
IFdoaWxlIEkgd2lsbCBhZ3JlZSBpdCBpcyBzbGlnaHRseSBtb3JlIGNvbXBsaWNhdGVkIGluIHVz
ZXJzcGFjZSB0byAKPj4+IGxvb2t1cAo+Pj4gdGhlIGRldmljZSBieSBuYW1lIHN0cmluZyByYXRo
ZXIgdGhhbiBieSBzb21lIHN0YXRpYyBudW1iZXIsIHRoZXJlIAo+Pj4gc2VlbXMgdG8KPj4+IGJl
IGEgZ29vZCByZWFzb24gZm9yIG5vdCBkb2luZyB0aGlzIGFsc28uCj4+Pgo+Pj4gTXVjaCBsaWtl
IG5ldHdvcmsgaW50ZXJmYWNlcyB3aGVyZSB0aGUgL2Rldi9ldGg8eD4gY2FuIGNoYW5nZSBlYWNo
IAo+Pj4gYm9vdCBhbmQKPj4+IGF0dGVtcHRzIHRvIG1ha2UgdGhhdCBzdGF0aWMgZnJvbSBrZXJu
ZWwgaGFzIGJlZW4gdHVybmVkIGRvd246IGhhdmluZyAKPj4+IHN0YXRpYwo+Pj4gaW5kZXhlcyBk
b2Vzbid0IG1ha2UgdXNlcnNwYWNlIHNvZnR3YXJlIGFueSBtb3JlIHBvcnRhYmxlLgo+Pj4KPj4+
IFNheSB5b3UgbG9jayB5b3VyIE0zMyBjb3JlIHRvIHJwcm9jPDE+IG9uIG9uZSBTb0MsIGl0IGRv
ZXNuJ3QgbWVhbiAKPj4+IHlvdXIgbmV4dAo+Pj4gU29DIHdpbGwgaGF2ZSB0aGUgc2FtZSBycHJv
YyBvcmRlciwgb3IgZXZlbiBoYXZlIGEgTTMzIGF0IGFsbC4gU28geW91IAo+Pj4gc3RpbGwKPj4+
IG5lZWQgeW91ciB1c2Vyc3BhY2UgY29kZSB0byBsb29rdXAgYW5kIGNoZWNrIHRoZSBuYW1lLCBv
dGhlcndpc2UgeW91IAo+Pj4gbWFrZQo+Pj4gYmFkIGFzc3VtcHRpb25zLiBOb3QgaGF2aW5nIHN0
YXRpYyBJRHMgZm9yY2VzIHNvZnR3YXJlIHRvIGRvIHRoZSBjb3JyZWN0Cj4+PiB0aGluZyBoZXJl
Lgo+Pgo+PiBUaGF0IHdhcyBhbHNvIG15IGluaXRpYWwgYXBwcm9hY2gsIGJ1dCBpdCBpcyBkaWZm
aWN1bHQgdG8gaW1wb3NlIG9uIAo+PiBvdXIgY3VzdG9tZXJzIHdobyBoYXZlIGxlZ2FjeSBhcHBs
aWNhdGlvbnMsIGVzcGVjaWFsbHkgc2luY2UgdGhleSBhcmUgCj4+IGFjY3VzdG9tZWQgdG8gdXNp
bmcgZml4ZWQgaW5kZXhlcyB3aXRoIG90aGVyIGZyYW1ld29yayBBQklzLgo+Pgo+Pj4KPj4+IFRo
ZSBvbmx5IHZhbGlkIHJlYXNvbiBJIGNhbiB0aGluayB1cCBpcyBtYXliZSB0aGlzIG1ha2VzIGJv
YXJkIHNwZWNpZmljCj4+PiBkb2N1bWVudGF0aW9uIGVhc2llci4gT25lIGNhbiBzYXk6Cj4+Pgo+
Pj4gIk9uIHRoZSBTVE0zMk1QMjU3Ri1ESywgY2hlY2sgdGhhdCB0aGUgTTMzIGhhcyBib290ZWQg
YnkgcnVubmluZwo+Pj4gYGNhdCAvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzMvc3Rh
dHVzYCIKPj4+Cj4+PiB3aXRob3V0IGhhdmluZyB0byBmaXJzdCBmaW5kIHRoZSByaWdodCBudW1i
ZXIgYnkgY2hlY2tpbmcgZWFjaAo+Pj4gYHJlbW90ZXByb2M8eD4vbmFtZWAuIEJ1dCB3b3VsZG4n
dCBhZGRpbmcgc29tZXRoaW5nIGxpa2UgYSBuYW1lZAo+Pj4gc3lzZnMgZGlyIHN5c2xpbmtzIHdv
cmsgZXZlbiBiZXR0ZXI/Cj4+Pgo+Pj4gYGNhdCAvc3lzL2NsYXNzL3JlbW90ZXByb2MvbTMzQDc2
MDAwMDAwL3N0YXR1c2AKPj4KPj4gVGhlIG9ubHkgYmVuZWZpdCBJIGNhbiBzZWUgaW4gY2hlY2tp
bmcgL3N5cy9jbGFzcy9yZW1vdGVwcm9jLzxuYW1lPi8gCj4+IHN0YXR1cyBpbnN0ZWFkIG9mIC9z
eXMvY2xhc3MvcmVtb3RlcHJvYy9yZW1vdGVwcm9jPHg+L25hbWUgaXMgdG8gYXZvaWQgCj4+IGl0
ZXJhdGluZyBvdmVyIGRldmljZXMgYnkgbmFtZS4gSG93ZXZlciwgaW4gYm90aCBjYXNlcywgdGhl
IAo+PiBhcHBsaWNhdGlvbiBzdGlsbCBuZWVkcyB0byBrbm93IHRoZSByZW1vdGUgcHJvY2Vzc29y
IG5hbWUsIHdoaWNoIGlzIAo+PiBwbGF0Zm9ybS1kZXBlbmRlbnQgYW5kIHVzdWFsbHkgZGVmaW5l
ZCBieSB0aGUgZGV2aWNlIHRyZWUuCj4+Cj4+IEF0IHRoZSBlbmQsIHVzaW5nIGFuIGluZGV4IGhl
cmUgaXMgc2ltcGx5IGFuIG9wdGlvbmFsIGFsdGVybmF0aXZlIHRvIAo+PiB0aGUgbmFtZSwgYXMg
c2VlbiBpbiBvdGhlciBmcmFtZXdvcmsgaW1wbGVtZW50YXRpb25zLgo+Pgo+IAo+IFllcywgYm90
aCBuYW1lIGFuZCBudW1iZXIgYmFzZWQgaW5kZXhpbmcgd2lsbCBiZSBwbGF0Zm9ybS1kZXBlbmRl
bnQsIGJ1dAo+IHRoZXkgYXJlIG5vdCBwdXJlbHkgZXF1aXZhbGVudC4gVGhlIHRoaW5nIEkgd2Fu
dCB0byBhdm9pZCBhYm91dCBudW1iZXIgCj4gYmFzZWQKPiBsb29rdXAgaXMgaW4gZG9jdW1lbnRh
dGlvbi4gSSBzZWUgZG9jcyBhbHJlYWR5IHRoYXQgc2F5IHNvbWV0aGluZyBsaWtlCj4gCj4+IFRv
IHN0YXJ0IHRoZSBSNUYgY29yZSBydW4gdGhpcyBjb21tYW5kOgo+PiBlY2hvIHN0YXJ0ID4gL3N5
cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2MyL3N0YXRlCj4gCj4gQW5kIGZvbGtzIChvciBM
TE1zIGJlaW5nIHRyYWluZWQgb24gdGhlIGRvY3MpIG1pZ2h0IGFzc3VtZSB0aGlzIGlzIGluCj4g
YW55IHdheSBhIHBvcnRhYmxlIHRoaW5nIHRvIGRvLiBXaGljaCB3ZSBrbm93IGl0IGlzIG5vdCwg
dGhlIG51bWJlciBtaWdodAo+IGNoYW5nZSBldmVuIGJldHdlZW4gdHdvIHBsYXRmb3JtcyBmcm9t
IHRoZSBzYW1lIHZlbmRvci4gV2hlcmUgYXMgaWYgdGhlCj4gaW5zdHJ1Y3Rpb25zIHNhaWQ6Cj4g
Cj4+IGVjaG8gc3RhcnQgPiAvc3lzL2NsYXNzL3JlbW90ZXByb2MvNzgwMDAwMDAucjVmL3N0YXRl
CgoKRm9yIHRoZSB0aW1lIGJlaW5nLCB0aGlzIGFwcHJvYWNoIGRvZXMgbm90IGFsaWduIHdpdGgg
b3RoZXIgL3N5cy9jbGFzcy8KZGVjbGFyYXRpb25zLCB3aGljaCBhcmUgaW5kZXgtYmFzZWQuIFlv
dSB3b3VsZCBhbHNvIG5lZWQgdG8gZHVwbGljYXRlIHRoZQpyZW1vdGVwcm9jIGRldmljZSBmb3Ig
bGVnYWN5IHN1cHBvcnQgKGUuZy4sIAovc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzAK
YW5kIC9zeXMvY2xhc3MvcmVtb3RlcHJvYy83ODAwMDAwMC5yNWYpLgoKSG93ZXZlciwgaWYgeW91
IHdhbnQgdG8gcHJvbW90ZSB0aGlzIGFwcHJvYWNoLCBmZWVsIGZyZWUgdG8gcHJvcG9zZSBhIHBh
dGNoCnNlcmllcy4gRnJvbSBteSBwZXJzcGVjdGl2ZSwgdGhlIGluZGV4IG1lY2hhbmlzbSBjb21i
aW5lZCB3aXRoIERUIGFsaWFzZXMKc2VlbXMgbGlrZSBhIGJldHRlciBjb21wcm9taXNlLgoKPiAK
PiBJdCBiZWNvbWVzIGltbWVkaWF0ZWx5IG9idmlvdXMgdGhpcyBpcyB2YWxpZCBvbmx5IGZvciBh
IGdpdmVuIHBsYXRmb3JtLgo+IAo+IFRoZSBvdGhlciB0aGluZyBJIHdhbnQgdG8gYXZvaWQgaXMg
dGhlIGV2ZXItZ3Jvd2luZyBhbGlhcyBsaXN0cyBpbiBEVC4KCkZvciBteSB1bmRlcnN0YW5kaW5n
LCBpcyB0aGlzIG9ubHkgeW91ciBleHBlY3RhdGlvbiwgb3IgaXMgaXQgYSBnZW5lcmFsIApkaXJl
Y3Rpb24gcmVjb21tZW5kZWQgYnkgdGhlIExpbnV4IG1haW50YWluZXJzPwoKPiBDb3VsZCBiZSBk
b25lIHdpdGhvdXQgaGF2aW5nIHRvIGFkZCBhIGxpc3Qgb2YgYWxpYXNlcyB0byBldmVyeSBEVC4g
SXMKPiB0aGVyZSBubyBvdGhlciBoZXVyaXN0aWMgdGhhdCB3ZSBjb3VsZCB1c2UgdG8gcHJvZHVj
ZSBhbiBzdGF0aWMgb3JkZXJpbmc/CgpPdGhlciBhbHRlcm5hdGl2ZXMgSSBjYW4gc2VlIGFyZToK
LSB1c2Ugb2YgdGhlIHJlZyBwcm9wZXJ0eTogd2hvdWxkIGJyZWFrIGxlZ2FjeS4KLSBhZGQgYSBu
ZXcgcHJvYyBub2RlIHByb3BlcnR5OiB3b3VsZCBkbyB0aGUgc2FtZSB0aGFuIHRoZQogICBleGlz
dGluZyBhbGlhcy4KClJlZ2FyZHMsCkFybmF1ZAoKPiAKPiBBbmRyZXcKPiAKPj4gUmVnYXJkcywK
Pj4gQXJuYXVkCj4+Cj4+Pgo+Pj4gKGFuZCB5ZXMgSSBrbm93IHNvbWVvbmUgaGVyZSBhdCBUSSBk
aWQgdGhpcyBhbGlhcyBuYW1pbmcgZm9yIG91cgo+Pj4ga2V5c3RvbmUgcGxhdGZvcm1zLCBidXQg
aWYgbm90IGZvciBwb3NzaWJsZSBiYWNrd2FyZHMgY29tcGF0IGJyZWFrcwo+Pj4gSSdkIGxvdmUg
dG8gcmVtb3ZlIHRoYXQgb25lIGFsc28pCj4+Pgo+Pj4gQW5kcmV3Cj4+Pgo+Pj4+IEluc3BpcmVk
IGJ5IHRoZSBTUEkgaW1wbGVtZW50YXRpb24sIHRoaXMgY29tbWl0IGFsbG93cyBib2FyZC1zcGVj
aWZpYwo+Pj4+IG51bWJlcmluZyB0byBiZSBkZWZpbmVkIGluIGRldmljZSB0cmVlIHdoaWxlIHN0
aWxsIHN1cHBvcnRpbmcgCj4+Pj4gZHluYW1pY2FsbHkKPj4+PiByZWdpc3RlcmVkIHJlbW90ZSBw
cm9jZXNzb3JzLgo+Pj4+Cj4+Pj4gRm9yIGluc3RhbmNlLCBvbiBTVE0zMk1QMjUgU29jIHRoaXMg
Y2FuIGJlIHVzZWQgYnkgZGVmaW5pbmc6Cj4+Pj4KPj4+PiDCoMKgwqDCoCBhbGlhc2VzIHsKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHJwcm9jMCA9ICZtMzNfcnByb2M7Cj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoCBycHJvYzEgPSAmbTBfcnByb2M7Cj4+Pj4gwqDCoMKgwqAgfTsKPj4+Pgo+Pj4+IFdoZW4g
YSAicnByb2M8eD4iIERUIGFsaWFzIGlzIHByZXNlbnQsIHVzZSBpdCB0byBhc3NpZ24gYSBmaXhl
ZAo+Pj4+ICIvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzx4PiIgZW50cnkuCj4+Pj4g
SWYgbm8gcmVtb3RlcHJvYyBhbGlhcyBpcyBkZWZpbmVkLCBrZWVwIHRoZSBsZWdhY3kgaW5kZXgg
YWxsb2NhdGlvbi4KPj4+PiBJZiBvbmx5IHNvbWUgcmVtb3RlcHJvYyBpbnN0YW5jZXMgaGF2ZSBh
biBhbGlhcywgYWxsb2NhdGUgZHluYW1pYwo+Pj4+IGluZGV4IHN0YXJ0aW5nIGFmdGVyIHRoZSBo
aWdoZXN0IGFsaWFzIGluZGV4IGRlY2xhcmVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJu
YXVkIFBvdWxpcXVlbiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4KPj4+PiBUZXN0ZWQt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+Pj4+IC0tLQo+Pj4+IFYzOgo+Pj4+IC0g
Zml4IGRvdWJsZSBzcGFjZSB0eXBvCj4+Pj4gLSBhZGQgUGVuZyBGYW4ncyBUZXN0ZWQtYnkKPj4+
Pgo+Pj4+IFYyOgo+Pj4+IC0gSW50cm9kdWNlcyBycHJvY19nZXRfaW5kZXggYmFzZWQgb24gTWF0
aGlldSBQb2lyaWVyJ3Mgc3VnZ2VzdGlvbi4KPj4+PiDCoMKgIEFuIHVwZGF0ZSBjb21wYXJlZCB0
byBNYXRoaWV1J3MgdmVyc2lvbiBpcyB0aGF0IHRoZSBjYWxsIHRvCj4+Pj4gwqDCoCBpZGFfYWxs
b2NfcmFuZ2UgaXMgcmV0YWluZWQgaWYgYW4gYWxpYXMgaXMgZm91bmQgZm9yIHRoZSByZW1vdGUg
Cj4+Pj4gZGV2aWNlLAo+Pj4+IMKgwqAgdG8gYmFsYW5jZSB3aXRoIGlkYV9mcmVlKCkuCj4+Pj4g
LSBSZW5hbWUgRFQgYWxpYXMgc3RlbSBmcm9tICJyZW1vdGVwcm9jIiB0byAicnByb2MiIHRvIGJl
IGNvbnNpc3RlbnQgCj4+Pj4gd2l0aAo+Pj4+IMKgwqAga2V5dG9uZSBkcml2ZXIuCj4+Pj4gLS0t
Cj4+Pj4gwqAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jIHwgNDAgKysrKysr
KysrKysrKysrKysrKysrKysrIAo+Pj4+ICsrLS0KPj4+PiDCoCBpbmNsdWRlL2xpbnV4L3JlbW90
ZXByb2MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+Pj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMgYi9kcml2ZXJzLyAKPj4+
PiByZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCj4+Pj4gaW5kZXggYWFkYTI3ODBiMzQzLi40
YTAyODE0YzVkMDQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXBy
b2NfY29yZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5j
Cj4+Pj4gQEAgLTI0MzMsNiArMjQzMyw0MyBAQCBzdGF0aWMgaW50IHJwcm9jX2FsbG9jX29wcyhz
dHJ1Y3QgcnByb2MgCj4+Pj4gKnJwcm9jLCBjb25zdCBzdHJ1Y3QgcnByb2Nfb3BzICpvcHMpCj4+
Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiDCoCB9Cj4+Pj4gKy8qKgo+Pj4+ICsgKiBycHJv
Y19nZXRfaW5kZXggLSBhc3NpZ24gYSB1bmlxdWUgZGV2aWNlIGluZGV4IGZvciBhIHJlbW90ZSAK
Pj4+PiBwcm9jZXNzb3IKPj4+PiArICogQGRldjogZGV2aWNlIGFzc29jaWF0ZWQgd2l0aCB0aGUg
cmVtb3RlIHByb2Nlc3Nvcgo+Pj4+ICsgKgo+Pj4+ICsgKiBMb29rIGZvciBhIHN0YXRpYyBpbmRl
eCBjb21pbmcgZnJvbSB0aGUgInJwcm9jIiBEVCBhbGlhcwo+Pj4+ICsgKiAoZS5nLiAicnByb2Mw
IikuIElmIG5vbmUgaXMgZm91bmQsIHN0YXJ0IGFsbG9jYXRpbmcKPj4+PiArICogZHluYW1pYyBJ
RHMgYWZ0ZXIgdGhlIGhpZ2hlc3QgYWxpYXMgaW4gdXNlLgo+Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1
cm46IGEgbm9uLW5lZ2F0aXZlIGluZGV4IG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3Ig
Cj4+Pj4gY29kZSBvbiBmYWlsdXJlLgo+Pj4+ICsgKi8KPj4+PiArc3RhdGljIGludCBycHJvY19n
ZXRfaW5kZXgoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBpbnQgaW5k
ZXg7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogTm8gRFQgdG8gZGVhbCB3aXRoICovCj4+Pj4gK8Kg
wqDCoCBpZiAoIWRldi0+b2Zfbm9kZSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBsZWdhY3k7
Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogU2VlIGlmIGFuIGFsaWFzIGhhcyBiZWVuIGFzc2lnbmVk
IHRvIHRoaXMgcmVtb3RlcHJvYyAqLwo+Pj4+ICvCoMKgwqAgaW5kZXggPSBvZl9hbGlhc19nZXRf
aWQoZGV2LT5vZl9ub2RlLCBSUFJPQ19BTElBUyk7Cj4+Pj4gK8KgwqDCoCBpZiAoaW5kZXggPj0g
MCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlkYV9hbGxvY19yYW5nZSgmcnByb2NfZGV2
X2luZGV4LCBpbmRleCwgaW5kZXgsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+Pj4+ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKg
wqAgKiBObyBhbGlhcyBoYXMgYmVlbiBhc3NpZ25lZCB0byB0aGlzIHJlbW90ZXByb2MgZGV2aWNl
LiBTZWUgaWYgCj4+Pj4gYW55Cj4+Pj4gK8KgwqDCoMKgICogInJwcm9jIiBhbGlhc2VzIGhhdmUg
YmVlbiBhc3NpZ25lZCBhbmQgc3RhcnQgYWxsb2NhdGluZyBhZnRlcgo+Pj4+ICvCoMKgwqDCoCAq
IHRoZSBoaWdoZXN0IG9uZSBpZiBpdCBpcyB0aGUgY2FzZS4KPj4+PiArwqDCoMKgwqAgKi8KPj4+
PiArwqDCoMKgIGluZGV4ID0gb2ZfYWxpYXNfZ2V0X2hpZ2hlc3RfaWQoUlBST0NfQUxJQVMpOwo+
Pj4+ICvCoMKgwqAgaWYgKGluZGV4ID49IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBp
ZGFfYWxsb2NfcmFuZ2UoJnJwcm9jX2Rldl9pbmRleCwgaW5kZXggKyAxLCB+MCwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+
Pj4gKwo+Pj4+ICtsZWdhY3k6Cj4+Pj4gK8KgwqDCoCByZXR1cm4gaWRhX2FsbG9jKCZycHJvY19k
ZXZfaW5kZXgsIEdGUF9LRVJORUwpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+IMKgIC8qKgo+Pj4+IMKg
wqAgKiBycHJvY19hbGxvYygpIC0gYWxsb2NhdGUgYSByZW1vdGUgcHJvY2Vzc29yIGhhbmRsZQo+
Pj4+IMKgwqAgKiBAZGV2OiB0aGUgdW5kZXJseWluZyBkZXZpY2UKPj4+PiBAQCAtMjQ4MSw4ICsy
NTE4LDcgQEAgc3RydWN0IHJwcm9jICpycHJvY19hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIAo+
Pj4+IGNvbnN0IGNoYXIgKm5hbWUsCj4+Pj4gwqDCoMKgwqDCoCBycHJvYy0+ZGV2LmRyaXZlcl9k
YXRhID0gcnByb2M7Cj4+Pj4gwqDCoMKgwqDCoCBpZHJfaW5pdCgmcnByb2MtPm5vdGlmeWlkcyk7
Cj4+Pj4gLcKgwqDCoCAvKiBBc3NpZ24gYSB1bmlxdWUgZGV2aWNlIGluZGV4IGFuZCBuYW1lICov
Cj4+Pj4gLcKgwqDCoCBycHJvYy0+aW5kZXggPSBpZGFfYWxsb2MoJnJwcm9jX2Rldl9pbmRleCwg
R0ZQX0tFUk5FTCk7Cj4+Pj4gK8KgwqDCoCBycHJvYy0+aW5kZXggPSBycHJvY19nZXRfaW5kZXgo
ZGV2KTsKPj4+PiDCoMKgwqDCoMKgIGlmIChycHJvYy0+aW5kZXggPCAwKSB7Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiaWRhX2FsbG9jIGZhaWxlZDogJWRcbiIsIHJwcm9j
LT5pbmRleCk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcHV0X2RldmljZTsKPj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmggYi9pbmNsdWRlL2xpbnV4L3Jl
bW90ZXByb2MuaAo+Pj4+IGluZGV4IGI0Nzk1Njk4ZDhjMi4uM2ZlYjI0NTZlY2M0IDEwMDY0NAo+
Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvcmVtb3RlcHJvYy5oCj4+Pj4gKysrIGIvaW5jbHVkZS9s
aW51eC9yZW1vdGVwcm9jLmgKPj4+PiBAQCAtNTAzLDYgKzUwMyw5IEBAIGVudW0gcnByb2NfZmVh
dHVyZXMgewo+Pj4+IMKgwqDCoMKgwqAgUlBST0NfTUFYX0ZFQVRVUkVTLAo+Pj4+IMKgIH07Cj4+
Pj4gKyAvKiBkZXZpY2UgdHJlZSByZW1vdGVwcm9jIEFsaWFzIHN0ZW0gKi8KPj4+PiArICNkZWZp
bmUgUlBST0NfQUxJQVMgInJwcm9jIgo+Pj4+ICsKPj4+PiDCoCAvKioKPj4+PiDCoMKgICogc3Ry
dWN0IHJwcm9jIC0gcmVwcmVzZW50cyBhIHBoeXNpY2FsIHJlbW90ZSBwcm9jZXNzb3IgZGV2aWNl
Cj4+Pj4gwqDCoCAqIEBub2RlOiBsaXN0IG5vZGUgb2YgdGhpcyBycHJvYyBvYmplY3QKPj4+Cj4+
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
