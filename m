Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKeeFasAi2nJPAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:55:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0302119370
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:55:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 557A1C87EC0;
	Tue, 10 Feb 2026 09:55:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8D6BC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 09:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0c8wKstVUqJ6CtQ8YhSthf/2U+WP35zsA4LRmNNujMfTZ5hPBxExsaNgD5Pjjk0YwPd/IR/GEgel2nBeRSdQzXtYNmBk2rxfsvZNvoboPJB3F+Jh1Dew51EMMJbL2cS9OLMDSNDzniZ4Fbrntl9OeYI/+KiQ+5axphyitax+bQa/8qy+avconprL+jQ/2TGgCE6P3U9CCc+cDZuAa6INhtgslI4sYKHOCj0HoyaalHcoEim4cbJRXx7kqdyHLrAPxOoUKE/Ki0mhxKi84YqYvQc8tsUDe7RTTXngBcXs4GMoTztJC/Y1opGvebfqrGmzxamAMGZfsY7LOa16sUjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uwkM0KsGhEaupU65gmEMHgwAyQCXvflIrMhYFriUZs=;
 b=lMCTC9i47IolJyLOIylU3XrINqhoLN7YB48cQTRlDRwH1+PK++kxPkDK+H1+8Q77Ti+gXwzKML3jPX3ElpSoHgPNih/RWUeUuihg1ph+6pBBF+cQv0kMXpOOeU2/naI9GDvrMPqLxr49Ui05TF1m7Cm9N60NplvLyp0V1zGd6RXGv3EyKX5nCAKKojaPMiu6Ax18OpoPxJcAMM7kQSZ+c4g9EIH2NbFX0cwVuVJEP8rR3xN1x8qZ3cQajL6OxFUCDG7YF/toHYlFNPkWsZnk3DGGi9g8IB/CE6abjIhXWGTAjGbQ2DNcsUZSEdOOSC9AcElzviGU08R9eJd1RMvsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uwkM0KsGhEaupU65gmEMHgwAyQCXvflIrMhYFriUZs=;
 b=PV0SBnoobDeB2jgdBbtL8FxMoLeI2DHl9PFv7zRSvluE1clNAXZsZ1fk/4W6OoGmEasCXZcDVCOdxNP1oO7nIfz01bur/QmK5HbiQxUaNBZmg23Gtl2SIYoYetEEEhTScAGedb239pbtro5LdnUofIu/gZO2jIxNch1B/yVsa3Ss1nf8AcGCoEvoH9bpahmLEvcY8OxNR4gAKZ/IUL27JtUoYVnrTb2b4oOYNQtiphJSwUYXGFe02tkFlErOaaMmxx0bWBAgG/LQfSQBrR/MYyh/QHRPXPVqENUmVKsl1J3gGeb9u+2xRXZZ6SbazzdY4VwDlgXranuZKGiWf5VJEw==
Received: from DU2P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::28)
 by PA1PR10MB8476.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 09:55:46 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::82) by DU2P250CA0023.outlook.office365.com
 (2603:10a6:10:231::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 09:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 10 Feb 2026 09:55:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:57:36 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:55:45 +0100
Message-ID: <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
Date: Tue, 10 Feb 2026 10:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|PA1PR10MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: bae70064-8359-40a6-68f6-08de688a9011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjhockZRNlptUFVGM2ZldHFUN25IaUplNTJYUU1NRWpXUDhzRVdmT09seDdz?=
 =?utf-8?B?R09BNSs2L296T0d0QTAxRS9GOUdUc0FRdzlpaEtLVTh5TDFlcXd1MHBzMHVu?=
 =?utf-8?B?emhibUkrSy9YU3Y0TTdFRHlnS2VsTDVoQ21aWkI3Q2l3MU5aSkJVb3NEWlpa?=
 =?utf-8?B?dkhuYlBITXN6cWhWR1VsTWtHeEpFMk93RjdNcTZuUU9uRWg2bEZ5M2tGSnU5?=
 =?utf-8?B?K010cWdUK3JDV3gxOC9pckthYVB6VEZmNjRESnowWkFJUXc4TlVRSDNldEN0?=
 =?utf-8?B?cnFyYUhYN2wwMWZ1VkxJeUtmbU8rUVRpeitKc1Vzd2w5SUMrUTl2b2MxaTk2?=
 =?utf-8?B?aHlHSVdUd1BxS1NLdGZLQXNFNFJydjdabHE3RUVNV2RId3hHQmxlSHNJcEdO?=
 =?utf-8?B?Zy9oeG5XL3ZmQU9YdlIzUzBLV3JOejhGdWg4MlV5WC9JTmI1RE5MeXl3d2tv?=
 =?utf-8?B?Mng4Q2psUnhpMUlwZGpYK3lvMUlVWjJCVWYwM1RKVXM1UnFITXREblpIN0xy?=
 =?utf-8?B?T20ya1pOeGkwTG01bHFkZ2JpU2hPOUgyQmhmNlBEc1BtKzVLRlplNmVPSHFr?=
 =?utf-8?B?R2tCeEs0aFVlMXB2ZmxjM3ZwMHFjMlBvTUx6M1dwTUNkY2cvaS9rSWE2SE1r?=
 =?utf-8?B?ejZqM2RiYllvMmxiWStKYVNpY0ViTXYyV1A0TW1rTFRSNDBLZzlzZVRUdmNK?=
 =?utf-8?B?Lys2Ylc0YjlHR0xSa0gxcGhKWjJTU285TkkvWWxWcEh2SFJkNUh6YXpiTkRk?=
 =?utf-8?B?ZWg1Y0JEOE1BUzBFajRjYjVVbERtOUptRlo2Vkd1Wk1uR2pOdmxQMzV5bTlT?=
 =?utf-8?B?ZGNodzdKQnRKM2txS2VweFdPakx1OWJNYTkzMW0rQmxTbGZnbGFrdzVtTzY1?=
 =?utf-8?B?cU9INkFFb01ObGJ6UVdYNkVlTWNOOU5MZFVXN3gzcUxXb3JwdzZqdWxvSU8x?=
 =?utf-8?B?TFJlLzA5RTFGbmVQZUlYRk9sZ2RsaTJJbFZPUlV6R0svU1V1eVloQ3RqS1hQ?=
 =?utf-8?B?dHRubzJSZ000TExyM3FFNU0rOHZMQWg5SytmKzlpSmZMTHIwdk9MNy9aRTdk?=
 =?utf-8?B?Y2xwS3l2NFB6NjlNVUVxb0I5aEtDRnA1OWxIQTdMN0VxVzRMbFp1eGVMKzh3?=
 =?utf-8?B?Z3VqU01NYUYwa1RZcXBKKy85b3N6ekIrVCtySUNGbFg3RGgySG9aOTMyVEJM?=
 =?utf-8?B?dnExWWM0OE1KdTBaaGhXampoSWJGdTAvblZzQkV0OTJndFpSZkE0RnZseU40?=
 =?utf-8?B?MldhRnBFSWwwVkxEMVR0aTNGdTQ4bG4zNGlLSDd3clpUUDJOeVVyMFAreU5N?=
 =?utf-8?B?UWhIUUozMit4MFR1WkJLNVhSQlI2MHNDVTJEQXppMWdvbUZOQmdLUVZxcnNy?=
 =?utf-8?B?NG51ZVE5dU5YeDV3dG5vRGhncTJXR21nOUhLZmVNd1NUVy9nR0tldEZ6Mk0w?=
 =?utf-8?B?SmJDbnQwSGhwTnJDVzA5eHBQckJiSUNiUEEyek14T0FyREcyMFpna0xvN285?=
 =?utf-8?B?d1J4aC8rSVpPWnNGUytjMm9lNVd6d2FycGdmOHJYdUtjNnRtQTN0T1ZDQkV4?=
 =?utf-8?B?akdmZldFdHIzb0NTRCt5UGdWRThETVREMXBrMHU2TjQvNlB3SWxwSjJzU3gv?=
 =?utf-8?B?ZmErMEpkeTVpSkRXcWJmbGJibkJYTkk0SStUejNLV2dxR1BGMTZNTzI5VmJz?=
 =?utf-8?B?eE9kU2l3V1ZOWlUyWHd6ZDBUSzh6Q1ozWFBPSlFTem5zc0MyWGNYZ0hnSnBH?=
 =?utf-8?B?VXBiZGZFYytlVmxCK1ZMNkcwQVJYaUFhWmFMQmVkbXNNdVU0VVNYMDFVZU50?=
 =?utf-8?B?OWJ3MVpVMldoYWMza2ZaYitRY0tWczdKNkFPdmI5am5YaFZEM3JFM3U3TUNK?=
 =?utf-8?B?cklEZVNmejFYcHRNeE4yTjArdnFFVGptTHVQbXI0ZnVua2ZJUTJ4dGZ6UVRG?=
 =?utf-8?B?NFpmQkpvYmpWaE5sN0hQYm03QUdPVUl3MUpUN1pCUnR1T2I4UUh1WWljWjV3?=
 =?utf-8?B?VEVpVXB5ak1nZmk4RW8rc2ZaNGRCbFlNNm1XL2hxeG1Pc2lXYlZacTVGcnU4?=
 =?utf-8?B?Skx1NG9zSlVUK0tHMEFNRWVINFh6MmRDRVRjSHJWbWNlUFhRb09FZ2w5a0lm?=
 =?utf-8?B?N3hIK1Bud1g1bi80TndueFZVcnNacTlTV1Rhb3U0dzZkWnBWa056NXhGWkF4?=
 =?utf-8?B?cUFJZlJhaEpVdVptRzNkcTJnOE0vZStBblVNbytCKzYzK2N6bVVvcjI5ajB1?=
 =?utf-8?Q?xag0RAcXX2DLDZqiwB2nkszj+VxWaYBG3q5dOLKeNk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 63kLOq1UgZ3aWZWkA0cBJrDpTGHUZfsdjbb+JGP/6dmEpYRczHjofI3JKXHBm+usVzq4iiTlPKYq1faN0mOu1ovoCsIXwGwfGQZkVjxm4o1N6D25ydPSBZpwwUIPbTnzolcl7bKdEx2H0F+mGISkfMm292aGTE7aGGpn8KsKEpq653hR4bX6b1lbfiEWDDvpyycsExm7ZVMI7R+s3NmgXQdko5EuSvN1WWd1WOiTvEdBhbrH9CP/0KpKrW12xYpGWT0f0ja5Nb1t9eFYdzmH0E8wX4z5z6SL8MLF2CVFFyAuSwyDn8rizufuwocgQGdY8+4pjkHv3f4BODI+Is27YcDG8tYi5qZsGuQ/jD3ErFedZCLr5PehBTycuxLAESVAyGG8yUc9MMwtGS3bHU/VM9nNaeC4xi4W+wRHvnH9U9OIZMtvqVZori+Pd87AlZZ3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:55:46.3853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae70064-8359-40a6-68f6-08de688a9011
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8476
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: soc: st: document the
 RISAB firewall peripheral
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0302119370
X-Rspamd-Action: no action



On 2/10/26 08:57, Krzysztof Kozlowski wrote:
> On 09/02/2026 15:59, Gatien Chevallier wrote:
>> Add documentation on the RISAB peripheral that is a memory firewall on
> 
> What is RISAB? It's in capitals, so some sort of acronym?
> 

I'll add a small description as well in the commit message to justify
the acronym.

>> the stm32mp2x platforms.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   .../bindings/soc/st/st,stm32mp25-risab.yaml        | 74 ++++++++++++++++++++++
> 
> soc is not a dumping ground. Find suitable subsystem for it.
> 

Considering the RISAB filters bus accesses, I guess its place
is next to the RIFSC in drivers/bus. Plus, all stm32 firewalls
would be located at the same spot.

> 
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
>> new file mode 100644
>> index 000000000000..d05a683c594d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/st/st,stm32mp25-risab.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation peripheral unit for address space protection
>> +       (block-based)
> 
> So maybe here would be RISAB explanation... Use proper capital lettes in
> the title (e.g. AP or Chicago style, I don't think we do any preference
> or consistency, especially that most of us including myself don't even
> know the difference).
> 

It is the non-acronym version. Very well, I will change that for V2.

>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description:
>> +  The RIF (resource isolation framework) is a comprehensive set of hardware
>> +  blocks designed to enforce and manage isolation of STM32 hardware resources,
>> +  like memory and peripherals. The RISAB peripheral is part of the RIF and is
>> +  used to protect internal RAMs by applying access rights per RISAB fixed-size
>> +  page. Through RISAB registers, a trusted domain, or the domain to whom the
>> +  page configuration has been delegated, assigns memory pages to one or more
>> +  security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-risab
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: RISAB bus clock
>> +
>> +  memory-region:
>> +    minItems: 1
>> +    maxItems: 32
>> +    description:
>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>> +      by the trusted domain of at least a RISAB page size.
>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>> +      can be represented by one or more pages.
>> +
>> +  st,mem-map:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: Memory address range covered by the RISAB.
>> +    items:
>> +      - description: Memory range base address
>> +      - description: Memory range size
> 
> Why do you need this property if you have memory-region already? This
> also should be part of <reg>, although this mixing with memory-region is
> anyway confusing.
> 

The RISAB is a memory firewall peripheral covering internal RAMs. It is
possible to configure multiple memory regions within these RAMs (done by
the Trusted Domain) with security, privilege and compartment isolation.
This peripheral allow 4kBytes page granularity. Each page can hold
different access rights, with 32 pages at most (hence the maxItems: 32).
That is some information that can be added to the documentation.

Moreover, when a region is delegated to a non-secure privileged
component, this component can configure the privilege level necessary to
access the region.

This property gives me the opportunity to get the memory range covered
by the RISAB. "reg" here is used to access the actual RISAB registers
holding the configuration.

>> +
>> +  st,srwiad:
>> +    description:
>> +      When set, the trusted domain configures the RISAB to allow secure
>> +      read/write data accesses to non-secure blocks and pages. Secure execute
>> +      remains illegal.
>> +    type: boolean
> 
> Shouldn't this be a property of given block from memory-regions, not
> entire RISAB?
> 

It is a global setting for the whole RISAB (in RISAB_CR register) so I
think it's fine keeping it at RISAB level.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - st,mem-map
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +
>> +    risab1: risab@420f0000 {
> 
> Drop unused label.
> 

Ack

Thanks,
Gatien

>> +        compatible = "st,stm32mp25-risab";
>> +        reg = <0x420f0000 0x1000>;
>> +        clocks = <&rcc CK_ICN_LS_MCU>;
>> +        st,mem-map = <0xa000000 0x20000>;
>> +        st,srwiad;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e08767323763..b9a1276e94a9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25092,6 +25092,11 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
>>   F:	Documentation/devicetree/bindings/dma/stm32/
>>   F:	drivers/dma/stm32/
>>   
>> +STM32 SoC FIREWALL DRIVERS
> 
> s/SoC/SOC/
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
