Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPvsExwBi2npPAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:57:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E560111942A
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:57:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D85C87EC0;
	Tue, 10 Feb 2026 09:57:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013062.outbound.protection.outlook.com
 [40.107.162.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 699A4C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 09:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFwETrQjs50So2Y25H/gZzDXR47W3mfyEmMoGYa8rpIQefxw7mziMiGaAIqRrZGSNz6sPaRwPvzjxnd6D9oWQfgTHTyEIJ0JyF2tIcaJE5XP+xCK7Wbb8jGDV1Zo9sZ13duus+OEWkO+u7b51/Z1l+z/dHemqv1c2uW4sUy72CgLhZpQ/n7akq7Bu9VpWHYBymiCbeplCbEPcBYhFZefqCzo+QuYUyfcmdrFVjDbA3fkpxFrARtzunSopiCSSTvsReoOYRgG+fytQpsYukGUBrDkhS10AqPGlfAILREKoR6yy7/qnHsqOvMcN4np3bQBeJynJWy99w+eE8e/9QImNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA7W+K6iE+aHdpplggsyxC0DUWZFRhyyFvX4xOhVpoM=;
 b=kjRkAD3wy7dOyjx7ImIl3/ghjDKu85aggOEc+GTFjpk5iSfbZhpzUQnRzlERWQDBgfWNGGcujynu3ZaOeAgmJxWxvOeiEC6Kjl+d3F1kmtPRRgrDKO9Lsv7VSqMyuIFrx1SRjVynHXQ06uCHAIbAWhNKTkAOB+sDL9M5T335guPTdJ0ZPlS5mNrdjfxaIE/ezYMVfc+VEMhtYLCWLqtkHcaFWLgBFqqRigwYtEHHz9aKzan+Dk+LeKCXk0p8cHLC/5+DcsYOdenXrBh6T8GAjRJ3kkDZ6QsXI1/hktkyqXW9PB3GjuCcRyAZySO4sI5iYKGu0hJzP+O4px5mnftqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA7W+K6iE+aHdpplggsyxC0DUWZFRhyyFvX4xOhVpoM=;
 b=QE+Ais6OiyqCk/1sUfgAcMOQsRjyhnj6OkIPh+qY2HqEbU3UewaZyeNbA3C0Ydf2eInqVi9nSGpCgWoPUeGTOKqhdnxqi4deZ9aexdkfaC/p2mrEpVu4FjBhBHzKGEa4xaQOwnn8UWGeggSUGOLQk8jxOl8LH2fe2koeUhY95VSn3AfUSs1qSkia+K9nZ+XCa6lk9uQW+BZ8DLF4rnW/vGeppN8gefht5EsawR2rFjoG2cyCwn4dliKgs/3HyEZJ4Rq0PLLMPWDpZluUw1JmClvSIMPmb0x5Wwd9sTsTZsxhry6kWLaHssQszAhzvD3F3KTBWkH55D4SQP/xPdmjFQ==
Received: from CWLP265CA0444.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::14)
 by DB9PR10MB5234.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 09:57:42 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::5e) by CWLP265CA0444.outlook.office365.com
 (2603:10a6:400:1b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 09:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 09:57:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:59:22 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:57:40 +0100
Message-ID: <8b5aca3a-d9ca-490f-9b05-f2cfd1a8ffa7@foss.st.com>
Date: Tue, 10 Feb 2026 10:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-2-ef0b2b6a7e0a@foss.st.com>
 <cbdea2e7-a419-483f-8d2a-f0d045737feb@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cbdea2e7-a419-483f-8d2a-f0d045737feb@kernel.org>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|DB9PR10MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 589aeeb9-f8e4-4885-9dc5-08de688ad51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlNuMDFYRmhTRUt2MlRXaDVzVGNWS1hOS1QzWUxsU0VuWVBTVENJMVV1M1dO?=
 =?utf-8?B?S3NLQzJ5cG4rU2lQZnM5SG5aT2xHZTRKdWxnZnJRTUFhd2ZwUFF5aUFDb1h2?=
 =?utf-8?B?cG5jVU1RazFsS1UwWFJUWnVtbFpDL1FMMjF1UGNvMC9aK1RTdW5DQjBidk4z?=
 =?utf-8?B?SFM3d2hJNXZ3T2I4a0huL1EzU01YbHY0VEZRanZBTUNvUUxSR29kNktPL0NC?=
 =?utf-8?B?cHRDbHR6NmpIYzRmMDNFbGxpbS9LT0Z1S3V5dzc5WlBRd3BDNkRzUUdLckJp?=
 =?utf-8?B?NDdBcXR4WHNrbHYyUE5GOTVKSEM3aFdhZGhhcmk1VU5PTzVwMlp2djdZb1Ra?=
 =?utf-8?B?bHNTUWMwNTY0bUVZKzIyTGlidU41TFhZUkgxQUw3aDlBVVc1SnphVlpvWGZ2?=
 =?utf-8?B?d2hMTFhiN2I0MUJ4YXdFdlVVUVdRMmF4SkJ1b2tXbTBnbmNuOVNSK05kbmJ4?=
 =?utf-8?B?bkJrRXdtZEtVcURMOGxjMVA5K1pCdXhKT01nMDZJcWEyWENtSm1KM3ZTR1RQ?=
 =?utf-8?B?Q2lOdHYrbkRuZWVHQ0EwWUZYZWg3ZHNrTGRKYzMxRVVkMUFDU1dWR3djZVZZ?=
 =?utf-8?B?UXFmMVlHallRajc4aUwvakVwUFFFb0xhcnBybFNCd3RmQlNBTDFwdUczVUNE?=
 =?utf-8?B?TWJkaWcvODFVR3RmVlUwRGxBdHZ3OElxK2FNMDZvSzdPSGd6NVVJdHVmM0k3?=
 =?utf-8?B?Z3VqdUlMLzJhcTJKTjZ6eCtOL3ZleGhPUmQ1K1NlY1dzMWtTUDdRbWl5WHhF?=
 =?utf-8?B?R0cxaGtWMzR4aVE0SytIMFU2WUlRV0xDZmZyTUE2TlJrWDQzUXJYcmZVZW1W?=
 =?utf-8?B?SnpTanZmYkdVQVplLzJQVy9CbWxHcXZvdDRKVUtnQ1ZlNU12K3lhVVR1SHl6?=
 =?utf-8?B?WjFic0N0ZE41QjdjWW8zTzVMYUtZRitTQkVBQ0tsT1ptdC9UaWxXcGxGSlRX?=
 =?utf-8?B?WjFQdEtWamxjMU0rNFpQUU9oSkM4eG9Uc3RkVGVXWXUzaXZEeTFWU3NxWHFn?=
 =?utf-8?B?UTRUM1AxYjZwYTdMeVRPM29yOFRlaUdzQlBqT0xyVmdwSUE5N3E3YnJ5alhu?=
 =?utf-8?B?bUIzSXREU3RkRm1WUDlhTDl2d2Z6WHZTODRqMWhrNURsRDd1bUxEYW9OR291?=
 =?utf-8?B?RXBKMjgzMStMU2VqMm9GNkZTQmxlVHdTQjlTR1loSUFCT2Q3ZCthdy9Ganlq?=
 =?utf-8?B?aDkxNzZnNFpZYTNFM2t3MXA1T3Bmbk9WUnVZRVBrTGV2Q1IxU3hmTmQvZ0lI?=
 =?utf-8?B?SnJpL0pJOWxyWDRENDNxd3ZOOE1qVHdsVEZrMHJkRWFiQ3dtVUJsWm5yN0t0?=
 =?utf-8?B?WkZYaGhBb00rS2FqVXJGUmZwQldyU1FKaHhScDkvd0VHc1ZqVVlPMldLZUE0?=
 =?utf-8?B?YlVjRkdiTjZKUlhCdUJqRlZQYVdwbnhHOUtoMlVkNVA1dFZLb0ZOK2VXaXpU?=
 =?utf-8?B?QTVVQnF0NjVUMWNnUkZ1OVJxSC9WSkJPckNLcFVPUko0cmFhRkV1akg2WllD?=
 =?utf-8?B?QWRzdEs4VFhyMml6dHkwZHVjNnZvSGNxMlRqcVpZZ0pOUG5JRXN6SEFpTkFH?=
 =?utf-8?B?dTJxdHI3UWx3SEp0ckdlbWxOZlZ6eW9lRG9VckxHWjNjSTBYY2tnYjZoNkFD?=
 =?utf-8?B?R0dMRmpaY21QMU1PSWp2b3NMUEdRWEtEaWFyaDN3Y2huNWxMZ0l4cnFoRzZl?=
 =?utf-8?B?ZUYyR3RyNzJ1QnNmOUNzN3d4Y0VUbkdJemQvZmVkL2N5b0k3SzlhZDVnY2p0?=
 =?utf-8?B?cUhYbVRyMExvbllSZkVDdEZYTmk2bk5MOUpWbW05eEdHU3hoU3QwSkFkYndp?=
 =?utf-8?B?TG83ZWRPMXJsL05UckozZUk0b0VWUUc1MjhSZ2todUdLVWdFMUdaTVJadjdF?=
 =?utf-8?B?QTBzTE0vdS9iVHZTTnQySDVXcEF1QnJkVWxuUTNZc0tLd3BRcVVhWVBuNU5K?=
 =?utf-8?B?c3JqWWhzbExxaFgzYzF6REpFeE5nQ3F3UUFsT29tdzQ5Z0VzRHp3V3FiZlBD?=
 =?utf-8?B?WlkyOFBxOXNWMnRBaGlDenIyeWdEZmd5eFhEYk9NSU1UVzVnZXhiY0htZUNo?=
 =?utf-8?B?clN5M1JLL3M5UXo3Y0pqdnRiRXBiL05lYnNOMEt6TS81cEdEcy8yYUEyTkJj?=
 =?utf-8?B?RDU0QWFZakZ5cUYrazJuc2xCWlVhSHo3M3p5dytXVkt5ZkppVlR4VGdjRFlZ?=
 =?utf-8?B?b2lRNEY0N3JQaTZnQk1ZV1JHRDB2TlFmRDBaRlRuVklrR3FseDZ6blh2WER2?=
 =?utf-8?B?eVlHeGhoaWVMeXQ2L1Z4NUFqU0J3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UW79cTJbtGZ/lt24KSQhjKZVFKI0nBnrg7FsYaAJ8427Z0IJcQ6HuKOsZeUYHURhQyf4AJiSO62hbIBFCWk1zEm7naYtLMQmtyP9Wd4zi01r/TjA9e+CAyp5gqHLjTILFRprWR7vD+Bjui462Hy+E7tpNsErzwmISFTsvtshi2J9axRwGi9tnj3QbLVR3HTqWktGCbCrzzPvlx4ULCwZf/La39hFPvmEB2QshZ1AwKfkjXBWuQi5fjPp471GE4GPdA9gVk01F3PBTOUg3OvT5wIg8JyEgw3x5ko0luqqay5G25jaK5FRnEFL8tsdyCIvNF0JXQKbcqq5D1+FkSOoCeTGPBT6E6P+9xJBMgbl651cBX2pGjyea6vaB6b0aCp8hcqNJWFXN2mRVk51j99qjZfNzCIcsA0L333VK6h+nyID3n0aSCe2enKxzUKNGEkp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:57:42.2696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589aeeb9-f8e4-4885-9dc5-08de688ad51d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5234
Cc: devicetree@vger.kernel.org, Theo
 GOUREAU <theo.goureau-ext@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/7] soc: st: add RISAB dump debug driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:theo.goureau-ext@st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E560111942A
X-Rspamd-Action: no action



On 2/10/26 08:50, Krzysztof Kozlowski wrote:
> On 09/02/2026 15:59, Gatien Chevallier wrote:
>> +
>> +static int stm32_risab_register_debugfs(struct risab_pdata *pdata)
>> +{
>> +	struct dentry *root = NULL;
>> +
>> +	root = debugfs_lookup("stm32_firewall", NULL);
>> +	if (!root)
>> +		root = debugfs_create_dir("stm32_firewall", NULL);
>> +
>> +	if (IS_ERR(root))
>> +		return PTR_ERR(root);
>> +
>> +	pdata->dbg_entry = debugfs_create_file(dev_name(pdata->dev), 0444,
>> +					       root, pdata, &stm32_risab_conf_dump_fops);
> 
> soc drivers should not have any user-space interfaces. This was
> requested by Arnd many times in the past, nothing new, including about
> debugfs. Otherwise it opens cans of worms, because soc platform
> maintainer can dump here whatever the subsystem rejected.
> 
> Find suitable subsystem and get its approval for such debugfs entry.
> 
> Your commit msg is so vague it is another reason this is not mergeable.
> Explains nothing about the feature, nothing about the risk or impact on
> the system when user does (while (1); read stm32_risab_conf_dump_fops).
> 
> Not mentioning that it does not explain WHY do we want this driver in
> the first place...
> 
> Best regards,
> Krzysztof

My bad, I did not know that and only checked in the directory to see
that there were other debugfs entries in it.

You're right, it's too vague, I will develop the commit message in V2.

Best regards,
Gatien

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
