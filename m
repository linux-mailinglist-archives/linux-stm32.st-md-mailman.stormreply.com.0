Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOsMOUHer2kzdAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:02:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E1247D56
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:02:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51105C8F269;
	Tue, 10 Mar 2026 09:02:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011023.outbound.protection.outlook.com
 [40.107.130.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B50C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOEBDf1karVss/wl0UnqNqU7t70nc0AzLNOS/Op0h7R7kfYqj2vHugYjbre63/kjq34sZwbagJGHgWHrcJk3pYsAkLOU/GsFR3Qo+3Er/+MiD7QkdJFLGtUdlg5cVjE0bAdvu/CpSuFm5eNjS4miuTqho9/5cK060HLa1QiY9ZoGGLf5wqGoZh2h+Jb/r4X+13+ZMBytyDKcj12gA4IHWbh+2RWXOaAgbrpYj0zLdu4qSXtnxuFDRHJ3ophTepWnUaHUF7SA7YpeF9jK2FZg6jtQhxkA7Fe76m6pSNGIQwrtjjugeFVvXLhhpd6Xwjzl3xPWYrq7okt+h6u5vJXkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/svA6IGRLKASuUEwjnwPJ0miVfqOkKMn0p/AqU9+mg=;
 b=RyWRwIw/y9c/e5wL/0zVIXw9uQg09p7sMBG92CTs9M3pvo1+k1fmIpKPO8YXmpNUifcOdrUsihXlhhq+mlIa0Miy2t4SOaBDTcrYRSaCPY6nmkuPlNtoLlnhhPElRF+7ON/mrpENZS95smDHI1YyWgT8HnOGOMBZ5FSLpfHFhxdcAZgVKuX3S6QO27se4j6X84o7DWjPkaCiXHJP7Dj1Q+6K1PxcM2B65GMdovERFreWRGZtAcxFBcDM9qO5DZrPhi52q4M+8b3r+tHBZMMnabNKwXSoYVwhtDq8a8CmSA7GPb2+zyC3NeTNJzh+3npPTUWEfBT8O/+w/EBIjXCDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/svA6IGRLKASuUEwjnwPJ0miVfqOkKMn0p/AqU9+mg=;
 b=dy45BwoxuPhiYzgOWSARtLUuCxvJMTybv7raExfCP/9Bpsk1uupRLAY3UfHwx7oUpyjQQ6u5rJkE+bawldJ8uyo5lsmalTM1zHPfAhzLjlUn+NQzEVj9uisc5cpHkT16pRs6H502+EXcP9hkl1jZuEAPQzi+swyDoNnGTgkCIFGT64MjH/ptSwrZ32Pt1nZsl5f4brXqCssFrx80UlgB6ua8U3ZDm3IY+jMLCbMBIt2NYF68lh5a3CrpnLA4AdIrw4L1IH1UoPzzUVo0zfzxul02yuvJh4VTl2UmOcB2CkiL964SbV4uT/F4DQsVm+XrBCW6Tl0Cc+6fIlPcrQUJyA==
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by PAVPR10MB7467.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2f6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:02:45 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::a8) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:02:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:58 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:02:43 +0100
Message-ID: <188cdc72-f35d-457b-b9b2-3bca4d25a527@foss.st.com>
Date: Tue, 10 Mar 2026 10:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Gatien
 Chevallier" <gatien.chevallier@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|PAVPR10MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cad05c-e224-417e-6f68-08de7e83cb2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: sWW5/zD/oIxo0PDgUObdPIrpknaeuvEsc/Mr8ejdGftnHHGEJ8plFNuL6BMExdl66p6MjzHCt4HMlxwETSTCfqt5HAe4bLDgcWeFu+SB949T6DF38fAYAN4F0XZ90WZsRt5sgQBskKtRfTqoWAvVtNdfMDiyaUnAys0HypCqlNihv4EEvewNbndePBaCEYFs8oave5dvwN0ecNNnvsM5+/poLi7MY7TPeOOcjbVp5iKDL+V+2hlsTjjGNX8QFcp1fvWkZA7CMG87xmv493H9uKNKLBHnSVeqMaCtubsiLLfXH5E5yIis1smf+hQKnXJcwRME8WEu/Ewiqj3wwIuG976hZKTubF5sF4esC9ncedwnNM/yBeEHlqxwLQMtb9edV73SU5M7oeATLi08ZXWk59+LsVM+duO2w9Bj5Cn/SrtoRm9VeUp4DIw9+R0iVbLVLF5UANM37fV4Zoj5ue8R+MkS9V3xdRrFmLyCCIYmk09bw7tDdx0xx5c2x2T02bDf2Z2dPUDzksITECBP16PvJqwNX5guNAwLh7E+OfaNth7KRiy2aeap9nPzmgs1ASIulsrNJdoGsIOAw15Z7p6RtWStOiWZPVjqVou6f4FhI8/+a7Yhs9pizPwp0glUIiLwr5SCO6IBa3ZSX66H0pSUMFHEthtqhuVVmoNz087QE7xxKttV7wEGMdEQsmVLO3q6KrzQ6oh3frsHcV8/ZLmI81ggxkN3OZoPvl0+JbwjJEnYGjfwjnyFGVAVjax2s6WC+jUFtD+a0bCb2E1XgkXYU+2DFGjXCfoMk4ETj0EEICw=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1DvJqWgQzX8jidzaTpbzctnDsoFAKfvobc9OPAsCqGELkZzpeXKv+zTKh7XduWmQu45fEGESkxOo+5VkKUbo+29wSsS9d8dw/1Uo7yvZkMRpWGFbAgtfJilDjYUPbhw5XzOV230Zyp7TnQLlp1nsRqfKeBQd5MZqkkwG6Jqb+xHtqGOKKqjpXKggdsFSPt7QvWzj1sSm+Jrqt/iLhlHQfe/TYw2mRPTW9M18z4rvYzYnL/tLLHx4X9iDcgWatsfjhf+OZM7ETcN+Coc2HCR/dSV1vET9m/toZOZuYUwy4FcjX5rTgIluc3cVnxbVUQvA3UGTApP1RlBaY4mKFXx3Bh+B7iWFc9ysCxr+5FWBaAdY8CvaUqfX4NDp72lJ4gJal4D0eKVZRgM0LSijhuajsGI+LmxO0jz4Dcm7ZIrhutqDWOcLSpuCjVLNtwPL+JJM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:02:44.6641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cad05c-e224-417e-6f68-08de7e83cb2c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7467
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8] bus: firewall: move stm32_firewall
 header file in include folder
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
X-Rspamd-Queue-Id: 872E1247D56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:legoffic.clement@gmail.com,m:gatien.chevallier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:clement.legoffic@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MAILSPIKE_FAIL(0.00)[52.209.6.89:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

RGVhciBDbMOpbWVudAoKT24gMi8xMC8yNiAyMDowNSwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3Rl
Ogo+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNv
bT4KPiAKPiBPdGhlciBkcml2ZXIgdGhhbiBSSUZTQyBhbmQgRVRaUEMgY2FuIGltcGxlbWVudCBm
aXJld2FsbCBvcHMsIHN1Y2ggYXMKPiBSQ0MuCj4gSW4gb3JkZXIgZm9yIHRoZW0gdG8gaGF2ZSBh
Y2Nlc3MgdG8gdGhlIG9wcyBhbmQgdHlwZSBvZiB0aGlzIGZyYW1ld29yaywKPiB3ZSBuZWVkIHRv
IGdldCB0aGUgYHN0bTMyX2ZpcmV3YWxsLmhgIGZpbGUgaW4gdGhlIGluY2x1ZGUvIGZvbGRlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNA
Zm9zcy5zdC5jb20+Cj4gQWNrZWQtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFs
bGllckBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxl
Z29mZmljLmNsZW1lbnRAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjg6Cj4gLSBSZWJh
c2Ugb24gdjYuMTkuMAo+IC0gVXNlIHVwcGVyY2FzZSBmb3IgcGVyaXBoZXJhbCBuYW1lIGluIGNv
bW1pdCBtZXNzYWdlLgo+IC0gTGluayB0byB2NzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDkxNi1iNC1maXJld2FsbC11cHN0cmVhbS12Ny0xLTYwMzhjZjFlNjFkOEBnbWFpbC5jb20K
PiAKPiBUaGUgdjcgaXMgYSBzdWJzZXQgb2YgdGhlIHY2IGFuZCBvdGhlciBwcmlvciB2ZXJzaW9u
cywgc3BsaXRlZCB0byBzaW1wbGlmeQo+IHRoZSByZXZpZXcgYW5kIG1lcmdpbmcgcHJvY2Vzcy4K
PiAKPiBDaGFuZ2VzIGluIHY3Ogo+IC0gTm9uZQo+IC0gTGluayB0byB2NjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA5LWI0LWRkcnBlcmZtLXVwc3RyZWFtLXY2LTEtY2UwODJj
YzgwMWI1QGdtYWlsLmNvbS8KPiAtLS0KPiAgIGRyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxs
LmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIGRyaXZlcnMvYnVzL3N0bTMyX3JpZnNj
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIHtkcml2ZXJzID0+IGluY2x1ZGUv
bGludXh9L2J1cy9zdG0zMl9maXJld2FsbC5oIHwgMAo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpS
ZWdhcmRzCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
