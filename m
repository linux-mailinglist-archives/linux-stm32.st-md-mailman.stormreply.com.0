Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB5B4FABA
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 14:25:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45E94C3F93A;
	Tue,  9 Sep 2025 12:25:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA9BBC3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 12:25:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589C2C1n014025;
 Tue, 9 Sep 2025 14:25:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 aFYlsmqe+6u85NSQ1cZQmSyL0mQexqOhUzLdavjU4q0=; b=3mILpS2OalH4kWc9
 EJiBaW/FyT7z0ajLFQgMDwcuHWHaxRVQjo6V9NxWf+UcgdTey23+XE+Gej2sZ9gF
 sg69Tn0EL/rdbY/fXz6KXanZS3+cyEoLjhzYm5UvZ1P2IdQiNKSz5Bh2UJN06o6M
 BQVgpUDB/GIoNgChyX9cRO4IYvv2LXVFdL1nxvOrK38Jic7gWxuZvcCj9uy2XiVy
 LUyJwQwypoa1QJvwypfhpYRbJ6686BhQuQHg7ksna6rY4sRbcEdaYPsCCn+cscyV
 Y3qsrEOQwJOUc6CsCRZd94qsi5I3kNpUz+1MlAKltHKJOCEHXn+i9eENqYB1xijD
 48fxoA==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013016.outbound.protection.outlook.com
 [40.107.162.16])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a38391n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 14:25:39 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rALYJ/DJh1k8NeFzGIy9pAGiQdSTZBKLL1JSQmg3L1HCkfcgTYc9ivpZv2Ulq3InzT2iXY8Hp8UCAZ6oLCafC/CXlU9XRbRtfhvQwwd4pP/u4B9wYqIFGtofRfxq1sdC9Pa1C8BLFdvuI30ddCetaQUapdmY46rFWXcz9Q0T2QthnBSP8zKChKJDujW/QAoKXvT5hPoFZuhHAVv+13oafTTnPkpWArwQDSlnUHfWa1miANTsyMKrF0I5VGV271483LvrmKgcGHYprrpAvPGKYLbY4lgNAmjpjHqtbVGUTG7xX9E7Ol9bK+ocOqT0KWJIpgWi+s0PLNBhms7ThfiV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFYlsmqe+6u85NSQ1cZQmSyL0mQexqOhUzLdavjU4q0=;
 b=yoED81H6JSv+ZlUKhh6KW5FwIEygnSad1A/+ohBpOLSJn9M3naOdV71piMvJVVjNloGvn9rb0c9he7uEcCyozLBum+RD2MpVHKWU0I4Xek7fRRt0b0uYfOsvrD89nBoOOyAUEFurnsVYMKgBa6rY0eTqUOrfHxqBsCzj+jnWLZx8hPWoSGWQSBiytd/bFrE4EZqhcmkYgDDnO6UjGNgihbjpFlR+ADALqZ6Ek4kGckRO+woML/hifE4tHxh7LRpoIEHs6GZWDLrtXF/OlZ/UlexcJMyP8/NKnX5PIDK9RmnfaBNKQp/pnPWL4Vr9d2+HOhRncn3wjsqYJAb/0ptedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFYlsmqe+6u85NSQ1cZQmSyL0mQexqOhUzLdavjU4q0=;
 b=EALsRDbICx3V16O4kBoQo5V3xvwsVyna/7sgbArnKNiOk2WyPJHNm8UXclMsshQXFYZpUAg/lpSL+cGANM8KCbb5F2edhgVAyGJYaP3GrNihyoteir+KY9aJ6GC4EWXrj9SAAUQ2JOVKZ86Tjppl6lDusFM28Wo7S17WtegifhA=
Received: from DUZPR01CA0354.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::6) by AM7PR10MB3779.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:178::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:25:30 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::a2) by DUZPR01CA0354.outlook.office365.com
 (2603:10a6:10:4b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 12:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 12:25:30 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 9 Sep
 2025 14:18:20 +0200
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 9 Sep
 2025 14:25:28 +0200
Message-ID: <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
Date: Tue, 9 Sep 2025 14:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|AM7PR10MB3779:EE_
X-MS-Office365-Filtering-Correlation-Id: 8101f005-b32e-435d-1155-08ddef9bf742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlhVMUE1RVVuK2tJYTVyUFR6Sm9NKyt4RXlQQ2sxR3c1RG81T2ZWOVZBNnRO?=
 =?utf-8?B?dGNQbFhMdHhyRU5PTEhNSmpIUWZDNzlteE1CM0R3RFQ2QmNReUIrNDdlbkRj?=
 =?utf-8?B?TFhCcmk4dG5sQ1oyOGhtNHl2bE1ZbDBoanNEdlRmeFNrRldPaERHb1BseXE2?=
 =?utf-8?B?VTd2L0RWdnpXc2VCcFRncjhDbDBISnJMcDBxWnFQeDBuZEV6RmxvRnFjQ3dk?=
 =?utf-8?B?QzZIckRkNk83cTcwMHF4V2NzUC9SL0pJTW91VUlXYTNlbmlwWTVHbjZsK2lT?=
 =?utf-8?B?bUJnVkR1cVBZOTlNTFVxbzllSkJBaWZjdjFUWnpqSzloNWpPSWgyWDFkanFS?=
 =?utf-8?B?ZkRkMXpEdjNzRFRSaDJBV1g0YUlFRkNWb2VDbmVLY3dZWDFIRVluMmp0RVFl?=
 =?utf-8?B?T2JOcGhORXJFSi9pbUhNWkhqanlTVzNMcjBMTHkyN3plUmVJaGt0OVU0Z08x?=
 =?utf-8?B?cVEwdE9qZUh6NGs3aFk2aXJJS3l5U2ExR1FIZklXRDRIbm54eTZyb25qNXB0?=
 =?utf-8?B?OTlFbTE3YVV0TFJFL0FwbDkxVnJQRkc4czM1U1dQWHZFNGZvcHNXYzY0SVFC?=
 =?utf-8?B?QWpWZ3FYWW8wTzhvRm5WRzB3WUFDcmxSU3NKQUZmSGJRQ2hOUTVRUHF3dlY4?=
 =?utf-8?B?azExZS9DNGZwMy95TWtpZ1c4bnFQa1JiaExXQkV1L25IazhjSEJvMXZJK3JN?=
 =?utf-8?B?QTFlT3FTd2xlNmdQaHdsYnJkVGhWN1N4ekVPcDhEZi9ra1pGbW1EbXdvTnpa?=
 =?utf-8?B?VVVlRFJNR1g3T2NpSXlWWjQ4a1d4Q1R5Ty9tSTJzanllNFhQeFhCeUJJQjFR?=
 =?utf-8?B?ME1sV0UyWUJJeHQyQmlac3hPSHZ1NExVNWJkRUFyYTN3elkwTDF4cWQ3QVpV?=
 =?utf-8?B?bFhrR21vdThqR2JOQVNsdWkybnZETThBcmo1dFBnenRzSDhsak1aWThZUlpn?=
 =?utf-8?B?NHZSWVV4U0ZuRVRGVEljdkR5ZTRnaTU4cGZvbFlmbm54N1AvcEZPaXlSVEVh?=
 =?utf-8?B?NGFUMWJYOFdZRFRuU2VVRjB4RDF6YU1MaEV3Um9sbE5LQ2NFdWlTSlBTNERk?=
 =?utf-8?B?RVZxalNhbkpidDNSOExpZlkzWjcrbFZpWVBSa01mdVQwWXQrdXl6N2xXRlNu?=
 =?utf-8?B?N3lMc3JZWUZnTDE1S2xwdFk1QnZ0NEVuTDdBWVl2N0RJQ0JnV0JraE5SVHJx?=
 =?utf-8?B?WlAxajVOUE1RcUJvaUhubGJPcWlQUG9odWFic0x5cDZES3ZxMGRIL2Q1YUJz?=
 =?utf-8?B?VDVTQWpzNlA1aEg0WVNNZTE5aloxM3RiaDlJWjdlTlFGOTN6cHdsaFF1WkxB?=
 =?utf-8?B?SjAzY3hoU2NoZWRmeWVhNTQrMnN2THdHVmE4Q3Z4Q0gyajlIQkp6SVIySm1F?=
 =?utf-8?B?a0E5bEpyc21TaDl5eUdGOTVDdUlYeThOOVp5NEFJRVIvUVlUWWxRWDlJNmho?=
 =?utf-8?B?UUVvU3hxQkNUWUc4R2V3eE5wNENEVmNIWUFTZENqeVBZaWZQT2JIUXk2ZGVk?=
 =?utf-8?B?Q3U0ajNyR2xNTEF6bTAybU5PdDRhUWFIcEc0RXpEb2tCbUlucmEwblpla1g3?=
 =?utf-8?B?M09vdUVYTEFYNGFTZG1YczFmdVpON3ZmdmJBdDlMcUdJdzJ2eVRFMUZ5VTVs?=
 =?utf-8?B?NkxMRFJpYXgzeU43dDdNWUZET01zRmhndVFQWVlIc013dkhGV1htbnlrekVO?=
 =?utf-8?B?SUQ5SFMrL1pBOUoxUGFTdmprdjBwMGhpVk5leENiNG4xZkVKVjlGck9vSmxY?=
 =?utf-8?B?REw2eDdhRm1PU04rSUlmRlBjTnptVjFJQUNFNUc3TldvN3NWR1VESExwYTFX?=
 =?utf-8?B?YmlLSnpwSmpQZEk1RVpuSEdlQ1lheGFkdldNY0xndFpWQXVzQ21rdVIrRmMy?=
 =?utf-8?B?UnY2cFNTU0hzQWhzY2pCTXBSYThuWG05OUdobVFpcGtSdTYvaDVFeDFQTy9T?=
 =?utf-8?B?Rk9yTjd5RC9YYVhwN0JvUjNPZ0plZjhFUnhTaktNMVRoUUpwUk1jdURDZG9L?=
 =?utf-8?B?NmNEMjZRczI1dGFWNmZQZUFiWVlZVk9SRDFwOGRXai9oUnVqVmtuamVSL0Jz?=
 =?utf-8?B?WkRJTVFxN2FEdHlmcDZkZkhabHQvWnVYaXRnUT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:25:30.2899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8101f005-b32e-435d-1155-08ddef9bf742
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3779
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfXxp1BTVx8TN30
 ie6/OxZuxcOIt4+NpzcGZciNK635mGxQdjJwdzwG7kKVrBgKqfhNOotXZXJowz7y5e44TH9tniA
 KeffLad9gwNZOzEJqtszz0fZ9r7pPgqiJSFS55LMmNjSEETRPOTHZe8qWccTQd9qAvBtd9XhnEq
 7OIPBrw2X/A6DDvlafrM91mbK/GJUrw2rEmSlxz/Gcox0Yx7Cpa1Gu8Yrkp+8lw9o4FIgJVv7+M
 c4WvqlgKl3ERdPVMdNkRzdOMlPr0MrPasVlT8IdObOVgquox+isBzMUbJNVKJ7SCzOAR+/KvFpA
 xEcklRxpG4yTahymSw2/JFd7Olzqgh8UmDnZSek1FQ8iQCkjqf/og94Kzi03OMUuN+OM4lFxiQ8
 ZvaqynYr
X-Proofpoint-GUID: 05B7j8d6oYHp14w3Z4fjDkMuLGwblaEB
X-Proofpoint-ORIG-GUID: 05B7j8d6oYHp14w3Z4fjDkMuLGwblaEB
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68c01cc3 cx=c_pps
 a=2vZtlp7YgANTt9DAkY0oBA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=YYNlyAMbr1-TTnqoXNcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/20] bus: firewall: move
 stm32_firewall header file in include folder
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

CgpPbiA5LzkvMjUgMTI6MTIsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBGcm9tOiBDbMOp
bWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4gCj4gT3RoZXIg
ZHJpdmVyIHRoYW4gcmlmc2MgYW5kIGV0enBjIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwgb3BzLCBz
dWNoIGFzCj4gcmNjLgo+IEluIG9yZGVyIGZvciB0aGVtIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSBv
cHMgYW5kIHR5cGUgb2YgdGhpcyBmcmFtZXdvcmssCj4gd2UgbmVlZCB0byBnZXQgdGhlIGBzdG0z
Ml9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFp
bC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jICAgICAgICAgICAgICAg
ICAgICAgICB8IDMgKy0tCj4gICBkcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5jICAgICAgICAg
ICAgICAgICAgICB8IDMgKy0tCj4gICBkcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jICAgICAgICAg
ICAgICAgICAgICAgICB8IDMgKy0tCj4gICB7ZHJpdmVycyA9PiBpbmNsdWRlL2xpbnV4fS9idXMv
c3RtMzJfZmlyZXdhbGwuaCB8IDAKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9ldHpw
Yy5jIGIvZHJpdmVycy9idXMvc3RtMzJfZXR6cGMuYwo+IGluZGV4IDdmYzBmMTY5NjBiZS4uNDkx
OGExNGU1MDdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKPiArKysg
Yi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCj4gQEAgLTUsNiArNSw3IEBACj4gICAKPiAgICNp
bmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KPiBAQCAtMTYsOCArMTcsNiBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gICAKPiAtI2luY2x1ZGUg
InN0bTMyX2ZpcmV3YWxsLmgiCj4gLQo+ICAgLyoKPiAgICAqIEVUWlBDIHJlZ2lzdGVycwo+ICAg
ICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMgYi9kcml2ZXJz
L2J1cy9zdG0zMl9maXJld2FsbC5jCj4gaW5kZXggMmZjOTc2MWRhZGVjLi5lZjQ5ODgwNTRiNDQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYwo+ICsrKyBiL2RyaXZl
cnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKPiBAQCAtNSw2ICs1LDcgQEAKPiAgIAo+ICAgI2luY2x1
ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+ICsjaW5j
bHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvYnVz
L3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+IEBAIC0xOCw4ICsxOSw2IEBACj4gICAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICAKPiAtI2lu
Y2x1ZGUgInN0bTMyX2ZpcmV3YWxsLmgiCj4gLQo+ICAgLyogQ29ycmVzcG9uZHMgdG8gU1RNMzJf
RklSRVdBTExfTUFYX0VYVFJBX0FSR1MgKyBmaXJld2FsbCBJRCAqLwo+ICAgI2RlZmluZSBTVE0z
Ml9GSVJFV0FMTF9NQVhfQVJHUwkJKFNUTTMyX0ZJUkVXQUxMX01BWF9FWFRSQV9BUkdTICsgMSkK
PiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jIGIvZHJpdmVycy9i
dXMvc3RtMzJfcmlmc2MuYwo+IGluZGV4IDRjZjFiNjAwMTRiNy4uNjQzZGRkMGE1ZjU0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMKPiArKysgYi9kcml2ZXJzL2J1cy9z
dG0zMl9yaWZzYy5jCj4gQEAgLTUsNiArNSw3IEBACj4gICAKPiAgICNpbmNsdWRlIDxsaW51eC9i
aXRmaWVsZC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L2J1cy9zdG0zMl9maXJld2FsbC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAg
I2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiBAQCAt
MTYsOCArMTcsNiBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAg
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gICAKPiAtI2luY2x1ZGUgInN0bTMyX2ZpcmV3YWxs
LmgiCj4gLQo+ICAgLyoKPiAgICAqIFJJRlNDIG9mZnNldCByZWdpc3Rlcgo+ICAgICovCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmggYi9pbmNsdWRlL2xpbnV4L2J1
cy9zdG0zMl9maXJld2FsbC5oCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20g
ZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuaAo+IHJlbmFtZSB0byBpbmNsdWRlL2xpbnV4L2J1
cy9zdG0zMl9maXJld2FsbC5oCj4gCgpIaSBDbMOpbWVudCwKClRoYW5rIHlvdSBmb3Iga2VlcGlu
ZyB1cCB0aGUgd29yayBvbiB0aGlzIHNlcmllcy4KCkFzIHRoZSBmaXJld2FsbCBoZWFkZXIgaXMg
bW92ZWQgdG8gYSBkZWRpY2F0ZWQgZmlyZXdhbGwgZGlyZWN0b3J5LAptYXliZSBpdCB3b3VsZCBi
ZSBjb2hlcmVudCB0byBjcmVhdGUgdGhlIHNhbWUga2luZCBvZiBkaXJlY3RvcnkKZm9yIHRoZSBz
b3VyY2VzIGFzIG5vbi1idXNlcyBkcml2ZXJzIHVzZSBpdC4gSSBjYW4gdGVzdCBpdCBvbiBteQpz
aWRlIGlmIHlvdSdyZSB3aWxsaW5nIHRvIG1ha2UgdGhlIGNoYW5nZS4KClNvcnJ5IGZvciB0aGUg
bGF0ZSBjb21tZW50LgoKQ2hlZXJzLApHYXRpZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
