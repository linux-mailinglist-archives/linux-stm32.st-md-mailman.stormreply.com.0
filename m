Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPOBI/4FgmmYNgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CBDA900
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DF0C87EC9;
	Tue,  3 Feb 2026 14:28:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F04DCC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 14:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lrlo2Ec7vuUdYMHSPDyjZVzJFfoE49AgTvKnRT6+SbX0LZrpZuK7T/oF5Bd8HgDfGiq9wUcUSCJTYLdXv2tI3t4vktWLgmVWxggyXUqlJN/FS9R2hrVFhwwGwJbErVty9HdyMxKod0ttLiiIugW3z7HobOWYCrXgJQLm/ll7clgDj/nFEh9Yrzv4wFN9d77et7pKRf7NNNmV8ugs63GkMxnF23sTlHRqF3JCzJDSHBWsBuQOU8QYpCgPaamE26b4y/8abwAS1V4TDPJIV64nHchaJjz8TRCcuWJh7cPJsj17i1vFipZ7RqoSF5JQV7rSYvc2yKdcoVYDL/FJUdHEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flCeBaxZ0YHggqVNW0nQvXh+u3KAB4lYfVSoLV8G4pw=;
 b=MgoW7LOZ1dglsfI0BpyMafJr6xbxCA2eV/dltc3KGHG3IrWLb8Jv84aXQbLo3x1GuuuRKJ+FZJsip8KZ/UkHw2Elzo7VckH+FiH2XZnVWHyQJRUu7uCC1d1o07gZ+FQrtTlAwN6dDKG6OqW7Nfq18rWQZq3w/37GcsDEGyVeaIbvhwm4x5yvf6gmiejTVOIXxAJFgPZkIZXB5vL0RWtwNPp+vQ4U+m/TalGE/+fN7HfnX2IkJe9Pz2c0WXF0EPKpYBwUnvQoEAEuDOLJunugHS9oQdMfGyL2OA3BYg0ee2ybOARxvC10jUlEVNiX7USqQO+LMxLuI+bigWLT+qGMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flCeBaxZ0YHggqVNW0nQvXh+u3KAB4lYfVSoLV8G4pw=;
 b=dQgkYAvLWGC/mEoGSc4K2yilBUjTxvAcEJpY3vebNmK21qY3ZDys2GXdp6zlL4pNWfRLu7VgaXpJqj7gmhyOXMIQyyNgsgZ1NEdupunirhKgOBFm2joKMI/dPsNqC11hlP/c8aW/ztsZ0MTMok30TCC/H8l+hEkQIjaVxgPSmLKytOmbUACkoHvNMKrbef2pknAChMxzOOrtSdsGZGk8pBn06Nocd1QuDUctWEnwET5WcTBS5iSS1VPLmxoke6NX1oYHsvVo4H847O4e+gdE0GwzMHn8HhCFgakU319lYRhxRrUgec+kIbA3j21iPCLV0SV5oEueP/P4ObdJLsQpxQ==
Received: from AM0P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::25)
 by GV1PR10MB6516.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:28:08 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::b8) by AM0P190CA0015.outlook.office365.com
 (2603:10a6:208:190::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 14:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:45 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:06 +0100
Message-ID: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPYFgmkC/43OzWrDMAzA8VcpPs9F8mfS095jjBI78upD62C7Y
 aPk3ecWBhkdYce/QD/pxgrlSIUddjeWaY4lpksL87Jj/jRcPojHsTUTIDQiCn6dSs00nI9Xl1I
 9TjlNlGsjuBCqAwdOOfSs7U+ZQvx82G/vrU+x1JS/HqdmvE//o87IgYPDHqW0CCRfQyplX+rep
 zO7u7NYW2rLEs2StlMhGNMNBM+W/LEMIHRblmyWR9ePKghP3fhsqbXVb1mqWVYTGKOtN/DHX3p
 lCbll6WZpNLYX/aiHoH9by7J8A4hnGcz0AQAA
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|GV1PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cedbf6-b5d1-4252-f159-08de63307362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZEc0ZoYUNmdHhUV0FId256dExhbUwxd2w3SmpzVHR6TnRheThLZEU3N1M3?=
 =?utf-8?B?T1dyQ3FCQUdPQThsdFg4Zm1UV2lGekpObkJOYUM0VEU2Y2Jad3AvY1B0Tllz?=
 =?utf-8?B?dnllWWRxQ2F0UzM3STFEY3liUS84bzJOeTI4TjAzMXFKa0NwV1FWcXBDdzNk?=
 =?utf-8?B?cVJrblhaNHd3RVpqQXllc1p1YkxYbFVaV09lekpPWDExTWRTMTkzeG1ZM0dI?=
 =?utf-8?B?ajVzMFVnM3NNaXgzS0pEU0lFMUlJaXk5V1MrWjFmRGZqak5PTjYvdldoL0Vx?=
 =?utf-8?B?dGJyYmR3OUtaQmtCbzRXMUkrTmM3aTRVSjR6YTdsc2lrZStUMzAycHBROUw5?=
 =?utf-8?B?UUxiOFlUblB1YjRucEV0SGUyNWNzL0k2MnpsQ2YzdXlabVhkOXdXZ1RXRmJx?=
 =?utf-8?B?TXJxRGVFOEZObDA4cVR0QlBrQmZxWUJuZlZvcVJEaUw0Umc4S2dzZk15M2Jm?=
 =?utf-8?B?MXhScHRhTU1jVUw2Y1l5U2tKRTZnQ2JkQndvWG0yZG5kQlYyLzRBdkN5WnpS?=
 =?utf-8?B?dmlENW11UzUrbkY4b3RFMUxCVERNK0loM1hEVHFpZ2ZDd3NTaHNzTktxRVVa?=
 =?utf-8?B?K1BBMktGS1U4dnJiOWFCVStrR3hDK0dsczFOUGhqSEdPUmMxUlpVamVTQzZN?=
 =?utf-8?B?aU9Ua1cvaEZuYmEzQ1hLS0dmVERIRUltSkVSeUVvWGN0VlA0YlUxSzJxWWpQ?=
 =?utf-8?B?aHBabmlHalVlU2w2YVUzUjhvcExpazJ4ZzllcFduQ2hicGl1eGdoUlVkUVZ2?=
 =?utf-8?B?Wkl3d1MrSFROV1BCNWNScHg2NFZnVFd1R2gwVUpBaFk3VitKcHdEblBVNDVZ?=
 =?utf-8?B?cnhzMnpZYjFqSTFhYVBlSzJ2dTNpYk8vbXNFSTRpY0VoOG1YRDNRQ0VoNjVi?=
 =?utf-8?B?d0JFMzhERGtDRHRFQUNVcEdVZUIxb0xFM0FHdXJJQjBTNUordmJGQnZkZm43?=
 =?utf-8?B?NkRyOUl1aTlxMWVLdjNDc2NaeC9tbVA3MHFJMktWeGhZd2NBbW1YaEdkNGZj?=
 =?utf-8?B?eVo0L3lDRkVGYXJIM2RWZTNjS0xnZXBnVVFVOGFoRzZ0VEtyTnJUcExLb1hR?=
 =?utf-8?B?V29UQ1hyc2F4TU4wNXFhVEpkb09Zdm5RSmt0RVA0eFVGZGJlQjdZZDFRWmF0?=
 =?utf-8?B?T255bk9ScHRyVEx2ODZpa2poTDJHYUlsQ1h6RGd6SC9vaCttSHdpM1dJRjA1?=
 =?utf-8?B?Qzl0THgrTFVSSGtmbTcxWUN3Um51MzFSMlBWVjRHaDVNQm1KTWZEejJQL2Zi?=
 =?utf-8?B?VGFzeFdweDIyOXJ6TlFiMGR1ZnVieldQR01Ma1FpaXR3UVNXTkpDcUl0T2lt?=
 =?utf-8?B?UFlxbHh5TFI3VHY2R1ZrTUMrWXo1OG9JcXJPOUpQSktobWF4QjFQamxDaEVi?=
 =?utf-8?B?TzR5U1dONGhoNjcxYVlzU0haQ1BKajVEdlRybzI3WDl5a2tnWWVGM0VVKzh2?=
 =?utf-8?B?UFJDNXBUM3plNUhTaWRpWU0zR0VmTnM1N3ZwK2dCb2xuVmNPUDRwTDJrM0hL?=
 =?utf-8?B?emFnRkdTcDZsSVpOeDQ1VEh4d2l1UUtkVzk3Uk9zTEx6YlZFUGdBT3poOE4w?=
 =?utf-8?B?TUxCS3ZqOE1kOUJYY2YvTkhBd3NqMk1tUjUvZlZBUzJza1d5TWNVVmI2czhE?=
 =?utf-8?B?NjZiSU9vcHBFLzVEQStwS3V1TmZBQU5hY1QzSGpNNnFZTE1JRHJrengzQTFY?=
 =?utf-8?B?MTdaMnBpUlJaemw1cEd6d3BtWkxzbU9VcU55QWFpcVovS2c0NFk3anBHL0hu?=
 =?utf-8?B?VGxadG9WQzdXQ09nNEtYYlU0cmdVU0FINzlRUEsxNWY2dmxSdHVrUWNWQmRV?=
 =?utf-8?B?NXVra2dOTkNUYUNjQWZZVDY0U2ZCNlBqclhta0JNT3FOK1Q5RXVWQ0JmU3BS?=
 =?utf-8?B?bGZsL2JMeDBlL2Q1bCtJTjdmUUYvcUdtUG44aG9KVHFjUjMrMVZpaVJxdm9w?=
 =?utf-8?B?Vnc4bC9BdjJvOFdFbHRYZHNnZ2VDb3RhMnZNTzlqdG5kVHNLYkVhVjZ0YUpH?=
 =?utf-8?B?enJDSG5TTFBQRTVrRWg4TWEzZEtPZmtvMmN6SHJTOHVlb2lmdFFUSVYxcHVu?=
 =?utf-8?B?TVBmUzVRSmZ3KzdGbUkvblZxdi80Z2ozS3lQUEluaUh3WWoxZi9KdlRsditj?=
 =?utf-8?B?d0IwQ1lQVjM0ZHhSN2dKQkdiNFU3dmQrdkI3MzV4SUdaenhSZXpBTGdJSWZN?=
 =?utf-8?B?dVlHMFVBMUo2TkdVV05IZlhWbHBtaFRka09qeURiNnljcmMrWnpJTUltZTJQ?=
 =?utf-8?Q?tiEOUmvVEFNbTfBoI6zGv7sDYX9THQCHn+Rr8JIVzI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S4Wraueg/YMw30uBusFowZZm1exxJzdg4ESTFjyFcc6dwUHo0ZN2BX930jQZ+qVEJW3IQdVBiwmMmlSyeBZjHdTpG/vwPCtG3/rgOBfle4E8tt3v438V9b/mfjs1/fH8KF8Dlep4AhvGHMBmQGY2qImon2CYP6kjJabyGlhI5eHNV13+7+koZCSRaoSnBCj8cEzedZj+8KLb5/MxTDFaxe5bqSKa7D4x9QP1Wr/XOu1izCAqSIAW6qAJEfzVcbo2nWvOoFx/xoE3V0x9+B9tPdBYMkhM8n2Vq19stJQV/9JR1vMNDFHNTUs0R93G+RW3OFzLkT9KpANqxh/sGpddz8yX2GoNFgwSQZy0OOuPwKCN9POItucaGgZzuRrN3AENvV9QGSv8EmtHRljOE7ydDccjsKJKUwiWkzR0HDkpEaXLEanHZhaCq3oyVOZ2E8ra
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:07.7825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cedbf6-b5d1-4252-f159-08de63307362
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6516
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/7] Add boot phase tags for
	STMicroelectronics boards
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid];
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
X-Rspamd-Queue-Id: 0F1CBDA900
X-Rspamd-Action: no action

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v6:
- Add bootph-all property in syscfg node of stm32mp215f-dk.dtsi.
- Split patch 4 in 2 parts, first part for reordering nodes, second part
  for adding bootph-all property.
- Rebase on top of stm32-dt-for-v6.20-1.
- Link to v5: https://lore.kernel.org/r/20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com

Changes in v5:
- Initial implementation allows to factorize and add bootph-* properties in a limited number of DT files.
  After internal discussion with Alexandre, choice has been done to add bootph-* properties only
  in board DT files instead of SoCs/pinctrl/boards DT files.This impacts a greater number of DT boards files.
- Link to v4: https://lore.kernel.org/r/20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com

Changes in v4:
- Remove useless nodes in stm32mp15-scmi.dtsi
- Link to v3: https://lore.kernel.org/r/20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com

Changes in v3:
- Remove duplicate bootph-all property in ltdc node
- Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com

Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (7):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Sort uart nodes by alphabetical order in stm32mp13xx-dhcor-som.dtsi
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts            |  80 ++++++++++
 arch/arm/boot/dts/st/stm32746g-eval.dts            |  10 ++
 arch/arm/boot/dts/st/stm32f429-disco.dts           |  80 ++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts           |  72 +++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts           |  75 +++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi                |   2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts           |  76 ++++++++-
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |  69 +++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |  69 +++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |  69 +++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts         |  69 +++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  21 +++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            | 101 ++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi    | 145 ++++++++++++++---
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |  19 +++
 .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |   1 +
 .../dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts  |  25 +++
 .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  26 ++++
 .../boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    | 100 ++++++++++++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  27 ++++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  27 ++++
 .../boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  97 ++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |  19 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           | 151 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  38 +++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |   1 +
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  | 119 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-odyssey.dts       |  21 +++
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |   5 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    | 172 +++++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  55 +++++++
 .../boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    | 157 +++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi   |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          | 122 +++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |  29 ++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  95 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          | 103 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 105 +++++++++++++
 51 files changed, 2549 insertions(+), 37 deletions(-)
---
base-commit: 1636348aab60830a1bc58a55916b218ce18712b5
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
