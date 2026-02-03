Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZLavHwAGgmn3OAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44797DA910
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01658C87ECB;
	Tue,  3 Feb 2026 14:28:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34F5EC87ECC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 14:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4eKW3hwuibSsfqfbspyamQd4GAOzDngkFcaA+e0iSc6dFJ+VPmoLe1zDZ1kcj0SwBj7FbAbPcHdbTaVRZfO8GDXu1iM9egGREFfU/0371H1yf9X21bpFs0MAkJ3UVeQa5LArrSO2Y5yZJxxHFfK0sxLHnsRQ0Bf6eaUE2+P27hjgPgNx5lXWeCqhsrzWtzIy5EnWJFdBWaZN4V3m41Qyfr8mWZbLzQm5CxNEyl0eVlyOdr/LrDEf2X07BwpZAYwAGb5N3011heHM3/hXBIpRwi8qOyxQLBqMHogOvhw1Wz+U7ZWxe7Lzd5g/nCAeKkCquPwJzqLdlxTbTFz4xRsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=miSETTkh5QusaLKQm3Tmwj30wnqJJUF8p4fUMt6/p+YLhAO28joBjZsxw3LnQNbnrFhQLxuFkQmnqweXLiWknv/f82/f8xM6zRADf0gWe10kvQO+rexYV+8PVE+9FddwgVWGBsOBZdqCHzwXZQxp8cMNOpf7V7USbvkFfK9M+2/pfzeuJOIJXVoD+LUVdeVsPjcviqmjohv2jPSi2B+VBfkwcVjDcdAAYpeFthQ3Ep9/AVd5GdWNshb9BpDZig8fmkZyBbmRkeJo3qCOIFiVx6vQmSisMyrIJLwWR7yBKu1BWqHnuGsNxfozRDNtny3+ixfPf+2N9iCKJQJjfC4Umg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=ZRlMDZQdcTuwwwqPP/zPVAxVG5Rm7Dz9FLRAhxCTtMGTXStb1nlMEZdRim1UZ8jXtvKb20/MBkHx3IWZNpKC8kM151frGDnQCmo90T4lnzFtSMGv4eNAEg6f1dkrE2ad28JFw3UGPOpspCwm5Am1uS2EAQVwxZsfSFyMLe4oshd5Dg6u7pNEdiLiCdL778xzSueO/uFg65Y0ZJ/JPd8rZXhOjkJw50sWaSrPLcKAmdBlIsKMgs+LrxEZN4PKQPqbDxijmdDJIzI8nkDhYig7l755M/JQT4UbSohHhKd/jvDZmmZa8PwxPMF0aUSzcnHnXkost1RSx2SSHHhGYrBPfA==
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by DB4PR10MB7495.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 14:28:09 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::8) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:55 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:09 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_uboot_properties-v6-3-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|DB4PR10MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8722c0a1-39c7-4662-8bc9-08de6330743e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0lOV1Z5WHVWN045Z2Z2eXVnYW5kbkNHSVhWNzdvMGpPM0dLNUJXS1p3MGox?=
 =?utf-8?B?RDF3NU5SQ1c0RmZGWVgwS1NUVmwvVDQ0bStmdHZkOXF5L252MDkxalNYWWxl?=
 =?utf-8?B?SWdvSkZZWit0bXFHeWEzRTVhY1V2d0lDdTQ5NDVCc25mTkoxL1VrZEp0cUJN?=
 =?utf-8?B?aTE1N2xuL1BTdnFGN3BXTmhnTGUxMmlsbjIyT1ByM1JNUWNEem5JSmhPS21s?=
 =?utf-8?B?SWdPUzJOSDFRTDBNOEpDWjBnNzgvY2tXRllERDRQZkR4T1hFVG8zdklyTWh3?=
 =?utf-8?B?ZWVlS3ZZQ2l3ajk4a1BGdDF5K29TRUwrZkhWOHp0UDAvZjllYVZZUmI5Qjh1?=
 =?utf-8?B?U3JwRjFOMnlJOFgxMFZ5ZEZiZEl4NjFRdTBSODRlVE1KSXp0STBuT2VFNXlZ?=
 =?utf-8?B?SElnSjNPUEdaa2NTQTc4NkUvNlFmd0VtVkxvV1dEZkFzUEtUMkswenBLaEF3?=
 =?utf-8?B?akgvSTB6NFlaN2hYRk5MK2hUWDA4aEZPdTFpb1huREZNSVVqV3k3QkR4N2l5?=
 =?utf-8?B?LzJHOExQMGVwQVA1SXhQOXUyc2Z4U0E3T3JpR2h4Qy9iT1h3NTlRNE1KTFhp?=
 =?utf-8?B?TFRGRCszamc2Yy9iSVphc01oeVo4STFYVWJPN2V0QklFYVNYWEZaNC9pM2RZ?=
 =?utf-8?B?SWsrRjZOdTVhQWVoQXkrOUR5emEzaGxEUFdyRDFNZEI5VEZvTWkxdkZJblRu?=
 =?utf-8?B?NU9zOWJoTjliVnBkZ3dGblRTeDhISlkyN0t0WjVMQ01OMS9KV20vVGY2cjhZ?=
 =?utf-8?B?TThvS3dKZ1pIQmhCOU1sbGFPdGRqOVYxWU1UeUYveG93QVFYcUY0OTVJOEJV?=
 =?utf-8?B?SGNEdE1HNmJwWktZVlZJcktRM0dpcHhmUll3NkdBNnpjaDExN1ZnZUFuMERi?=
 =?utf-8?B?NzBBSjdGQ1greGx0UXBPRUhxTlBjTkk2SnhYT2oySHE1NGRTS1J6YTdtRjZM?=
 =?utf-8?B?bndFYTM1Q2orejRhWkw3TklMZWZpc2pQMEpOYVllbGw0TzJKa3c5d2hlQ0U0?=
 =?utf-8?B?SFJmSUFycVRCM1dwSDVBZlh5d3hCOWRPWDUyTHhEVDhKby9iWHJEZTFKaHRp?=
 =?utf-8?B?cEtuOHV5dGRCSHIzbUdaWjl4THlNOVU0ZjJqbWRJZjBXTWJKditCa2U5TWpx?=
 =?utf-8?B?YllteHRYMzNDbkwwRDdsN05kKytVZ21pS1dFR08rUnJvYUp0UUl3bys5Tjlj?=
 =?utf-8?B?SVJTYzNWd2pscUNBS21xamlhc3A1TkxFaHJoRU83WjJtOW8vRkZoSW1la1g3?=
 =?utf-8?B?UGVxTjlmV0UzQlpMNXVyK3FSOHRVVmFyN1dlY05ad0Nid2NtU2JXWDl0S2Zy?=
 =?utf-8?B?NXJQdFdJRTBsOVZhN2NvL0l0aFJGTVNoYnlNSzVISjNsV0I2UDdyN0ZpNEJS?=
 =?utf-8?B?K1JuYUpYbDcxTzZKRWZVdTR6c0MvYWxCT3pXdFltYTNZeWVtUHc1ai82dGxC?=
 =?utf-8?B?TUZQNjMzdHlKUUJTWUVSN0I3LzQrNkFvN3Vva1AxWUNpWkV3RFlnMFI2SWsw?=
 =?utf-8?B?TVY0Y2dadHcwaTNWelRXRkpEVVlROHUwR2RoWVVTc2k0SmVRZEIzM3JIK3dO?=
 =?utf-8?B?S2Q4bStFU3pwWU93bGZUVklxNlE0MUVxamdHVFBmOC8veU1wWEZicGwxd1pI?=
 =?utf-8?B?OVVwOCtBaHFqYnl4dy8wcEg5NlB6SE5aOW12MGJJTmhTQko5NnZTd2xlMUtx?=
 =?utf-8?B?bVR4S2hPc3R0c2VncFFNWW1WcEI0OThDT01kNTg2RzNOdEYvUWVRZStmYzZw?=
 =?utf-8?B?cmR1ZXNXcWpPeGhXb0VhbG1kVFpraVZKQlhOZ3FRQjk2cFBjalVxSXZydmdN?=
 =?utf-8?B?dkM5YXB5OWVvdmw5cU5sd2Y4aEZmcGtqSks0R2FkRXY2elU0UXVNclRFbDg3?=
 =?utf-8?B?ZUowYllaSlNqbWM2ajExVHRoVHU4RVpqbXlkN1ZCcVdzRzZ5amJKNzI5TXR6?=
 =?utf-8?B?QW1uT3pPWWlSbnQwa002SGxFQTJOWDZ4RVVsRkNVYlRqeTBnZmEzSkMwTW9F?=
 =?utf-8?B?SENEamh1SVNGd1FRN1NuMkwrN0pKYWU1MHE5K0VWNThzTzg2c3ZVaS8vYlFi?=
 =?utf-8?B?cStKTnozUEJ3QzBWcnU0d21RUDBGS0dQcTRsNUpCRU5xU0UwVEN1cmtjMU5j?=
 =?utf-8?B?Y25JZE9CWnBQTkNlOFRUVk43UWVJOTZ5eDdLRDVpanZNUE12c1d3V1NXSVQ2?=
 =?utf-8?B?ZHd2VE03cW4yRGxiakFQdTVycko1SDJDN1U3YWZ2WXFvZzJINjFTV1prOEhR?=
 =?utf-8?B?dVpnUU4vSzllaEdpRzRWTExFVHRBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dq9eZpyKxVYwhgluyRBZAGefZVWSI5ZpntX3xSQxVzQMgcRB4/8YGYycYeEqpewavB8l6/NAQ0HfW6t6nNR7EEyODy5q9Xt9sNb+lKCMRGq+xN/3u1wGHT0fM8C48RfvYghIXZAMPcsQ7dFUB7dE11IRzHFwJnpSwiFsrb3fHz91uDfkt/rEaOtTw7WLVwU2WHxhOkkOL/5n7tH8d65sZuFzRpmxHVTEz9sKv1Imda6ZUL9elmOjGI8X872bOrDCpHTUlC6XFlI4dN05x+q9jCGwPnw5ZM4juZwuGHby+WhhSSS1g4dqucrn8LMozN56avynWcoJ736z5fTPtj+51jTcGCwJwKmyKTchHFEcpUu1NDswm+4Vsh5kbg9VDZFgSaXNxGeOznJaF6dfhdM2XD1G0uC7pMTf2G9lCvFPaQsmuuw5oGUTPeL45qDzWKoZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:09.2184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8722c0a1-39c7-4662-8bc9-08de6330743e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7495
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 3/7] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics h7 boards
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrick.delaunay@foss.st.com,m:cniedermaier@dh-electronics.com,m:marex@denx.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@dh-electronics.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,dh-electronics.com,denx.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44797DA910
X-Rspamd-Action: no action

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 69 ++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 78d55b77db7c..1b4b9bc5c72d 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -107,6 +107,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
 
 &mac {
@@ -126,6 +179,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -138,6 +203,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index e5e10b0758ee..55674fe05431 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -124,6 +124,59 @@ adc1: adc@0 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
@@ -155,6 +208,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
@@ -169,6 +234,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
index c9dcc680e26d..ef36454808d5 100644
--- a/arch/arm/boot/dts/st/stm32h747i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -104,6 +104,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
 
 &mac {
@@ -123,6 +176,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -136,6 +201,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 56c53e262da7..8dddc70c37a1 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -114,6 +114,15 @@ wlan_pwr: regulator-wlan {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
 };
 
 &dma1 {
@@ -124,6 +133,50 @@ &dma2 {
 	status = "okay";
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
 &mac {
 	status = "disabled";
 	pinctrl-0 = <&ethernet_rmii>;
@@ -141,6 +194,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -196,6 +261,10 @@ partition@0 {
 	};
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
