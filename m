Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B3BAC5E7
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 11:55:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6DFFC3F945;
	Tue, 30 Sep 2025 09:55:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85FE6C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 09:55:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U9k42l003259;
 Tue, 30 Sep 2025 11:54:58 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e524b3qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Sep 2025 11:54:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hcca34owKyO1Y15NlyZq0yYp5KQOJCCDhfsgdKjbq6avEntBA78AXBNB7NIbHKQEnFtCXIUKbrU7+cCwf6Os3+B/AiuwEhwQa3AoGXlkR3yvz2MoJ6C/mkqigtsO8g3Ic21nzkN0A2rDrjJBLIZJhelqYba05ix4yOjHGnWfsaBDsGfap66Uu/0I3ukp9u93dVWDMwabJF8exr45wLHd03CLMoOFEqlUMj3P41P4+Zpny48K94EEMNNtTrugbnhpekmhfXS6T/qwMW9y6GesdTL3ywlClKaIQc2PAe3cx9XK2pzSk+5AMcN+0DcC0+MuqjnyxyG2RfsttFx/ogskLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICPQnJcxjTGGYfv6Dy9nKyUegKFelqGY/JtMdJA/fVQ=;
 b=lbXruHfTiYBqzgreGr9jynF05ih2Bgqox+BLmxEo+7CYLn1F124rGbzkj5f7o+q0+biYigkewT7BOu587y0QXXpbp6U+mPaBHHjueZDpvJZbYEoAfhE/TVWJ7/bq5VlDmKlJ7lNjWKPxWbrH7XN/naiXcDDIlUou1fAO1j9Gpz5DOanUI77PNRbbtyeJSJ3ey1Ua+7pLGeD1ABIPjcSnlcq+i2h0+PIAr3r404u21AT+XXUBnSlFSx+mNQc6fzh3TuAaXGTIoatZAxOvgDw/W2EBMWuEPdni0RbyxNa9W1sCZdBGVJD+37WIeRsOzLP6sflYOVwP12pfWzdd2BRmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICPQnJcxjTGGYfv6Dy9nKyUegKFelqGY/JtMdJA/fVQ=;
 b=UxS9X5NQ2+30VaOU/mDyqQhaeIBHlENxzHHG9myAStgCMyCW5fWGqp0mtiGNt+8E3UWj0fG7m55h0915AZxHSXif9GDeAbSw6SYje9Sm0nvm0GY4G1cQx4FCH/ZhxyIHGohXgHV7e6yG4/CZjsNQM5Nu3lEXjRsjAz+YMh2Way/9kCRK/BRTnErh0zDGFLDHkDBQEmoHrXgGSzAKk5lMF0o1xpSpCQr4YZFmhMgI4lAr1n4l2XEhbee2hH6MFCpikMRDC1OCk8bkfpCoXdSIGelJ+E6cjPNT+GJU3DWfZ3tQGufVAdAOwnoaVNnxLYwL9eCqTCZZBESIYdPHL3NE8A==
Received: from AS4P192CA0039.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::20)
 by AM0PR10MB3330.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 09:54:56 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::d5) by AS4P192CA0039.outlook.office365.com
 (2603:10a6:20b:658::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 09:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 09:54:54 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 11:52:37 +0200
Received: from [10.252.12.194] (10.252.12.194) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 11:54:53 +0200
Message-ID: <9852fdbf-c4bc-4087-a5c4-e65c3fefb724@foss.st.com>
Date: Tue, 30 Sep 2025 11:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
 <20250924-b4-rcc-upstream-v8-2-b32d46f71a38@gmail.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-2-b32d46f71a38@gmail.com>
X-Originating-IP: [10.252.12.194]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|AM0PR10MB3330:EE_
X-MS-Office365-Filtering-Correlation-Id: 66dd6a06-e27a-46b9-3693-08de0007684c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUJJZXRiR0paWGl2SFMzOFJZLyttNXpsL0JjdnRQQTZxQUZ2K05oQ0JuSUIx?=
 =?utf-8?B?NjZPTEg5c0g5QjcxeWF6Sm1xM29oU2RGdGRXVUxUbW5nTVQ5dU5iSG5PNlIx?=
 =?utf-8?B?Y3RVeUxyWEJlU2tsdUZ5VnpleUEwUDNVK0dCcU9HZ3dBdTZ6T0oxZ1M0RWRQ?=
 =?utf-8?B?M1dnbWd5anRkZlB0UW1tS3V2bE1TTWJ3cU5EblZvajc5RisxRVpsR3lYYndE?=
 =?utf-8?B?cndoM2hnNFRrbDFhR3crOTJhM05kWjlXaytmeWVSRDROLzZxbFFta245WEhE?=
 =?utf-8?B?bHpmenIzT1RabW5KZlBxR0lONkcyMDJLNEw3US9PaWJ0UUxFd1RDZ2c4ZHY1?=
 =?utf-8?B?UHFteU9TSnAxVlpsREQ3V28xekNiYnVtSDdwQjVJcGdaNmZ3UnM0bURMSWpQ?=
 =?utf-8?B?WjVJeEJMY0pTdGIya1ZDME5nMFprd285eDRqMWJjQUUvK09reVdtbFBKeVZC?=
 =?utf-8?B?SjlubmtjT2NIeUluRCtrUlA4M1dIREIzMmE4bm5EdlQ3YzVrSmhrQkNCaXo3?=
 =?utf-8?B?dWhLdCt0S0hXNFI4V3pFMSs5V21RVlFaNGJvK1pGOVVmR2NENHFoRVdNc0hT?=
 =?utf-8?B?Zm9zR09uWno1aUQ0SDBqRUN2NlE4SS9BZk1lSHFyV1h1NFZpUzkzUmNjSUhx?=
 =?utf-8?B?UGdFVE1ZS3NnOXR0bVJVdlZlelJicE9wSHdNMm02QklmVUw0NUdIMGJNNzVV?=
 =?utf-8?B?VHc5cTV3Sjh2QTZsRWxmQndEVVF0MUZ6ek0rWGJHeFdxSFBBbW12elpxZ28v?=
 =?utf-8?B?aW1nYzlZWS9xOFlRQ0krbVhMTVluajRKZk5neEdJNjlNaHlIVlI3ejM3Y0xC?=
 =?utf-8?B?dWI3RjRaZG16Z3lxYzJ6ME1mYXFXSDlIaFUzMGp1LzRzc0ZyMllJUTJZYUNj?=
 =?utf-8?B?dWxlR3pTMy9vdDJ3Z0VoU1BrVkMrWFB0QjRhYWRCWkNKQzIzOVBCR2xSVWJo?=
 =?utf-8?B?anFzOHBPSVdTV005UkxpUk1UTnNLOHJBTGF4aGpwZDNUS1JwbGVGcTc4eTdj?=
 =?utf-8?B?MmtLbXZBbExVNklzSEdYQkY1Q0VtNFpMakpzaHlhaWxXMGFoenRjTkN0dnda?=
 =?utf-8?B?NGlxR3Q1Q3M3eGZVUW01Q1d1T09ubSt3eXVCNXBGVmM1SFh2MjRNOVZ1L0tE?=
 =?utf-8?B?MGZtNHZRQmZJZ3JudEZtWWpUSGZhTzBTaUoyNGVDOU1ZZzJJZ1RMOFFkSEts?=
 =?utf-8?B?Y0kvc2tNaWxJZjVTaVZoSFFmMEwzMWkwYW9MM2F4c2VVeDc3NnRTc0FtYjJq?=
 =?utf-8?B?MlBrRWlnTDRIOXBibVdMaTBCRzVvOVkyNVJJeTZydG91amVCRS80N3YxUWhk?=
 =?utf-8?B?MGVvTDZLdWxqSWQwYzFPbkR0NUQ5dmxsQnpVM29PWVNYckJsemdTMXhBSnR3?=
 =?utf-8?B?YzgydzJrazdzS1IwQ2pISjFyS0JhTnM4NU5VQ1ZKV1I4MUtxek1BbHNKcTlk?=
 =?utf-8?B?NzJnVnBvVEo3K2pBeGZ2WEtRUXNzcDViMEVPYXJVUkp1d1FYS3BoYVpkWklE?=
 =?utf-8?B?RTlCMGRJY0tFWTBoRjlwYVVHTXk5NHdZR1N0ZUMrOUNZbkQ5cS83L3hNNUYw?=
 =?utf-8?B?a0JKTC9rVEtyT2t3VXRYUzNPU0RZTVdPbG5QZHR0aW9ycjhGQitxRTNHQ3FG?=
 =?utf-8?B?ektiVGkvTkg1ZmlnMnphNGgvQXFqN0R4UXRUcngrd0FsU085eEY3M2s2MEoy?=
 =?utf-8?B?RWhNRC8rL2M5UTRJakpHS3JlL1U3dHVsdEJJdkc5c2VKV0hRdXR5dEJGUDZQ?=
 =?utf-8?B?U1B4ckd1TExIOVJHQ3dnYVZqSk9oVTY1M2pZS3RGdDlWWmVjbUcrRHFvWFNs?=
 =?utf-8?B?TFVkTm5saG9BeGRZaytLQTVLc2tDdDc5TVNEODEzNE5jL3VoNlV1ZnlWa0Q2?=
 =?utf-8?B?V0F3SVNYZTFqRVM1MnBJSjFoY0cwVlV5RFYwRFd4SUo1ZnUvMDZlMXl5N3pl?=
 =?utf-8?B?QUU5MEVySVRjKzdVOFVPdEg1empQZk9yZXMvRzY4Y2t0ZHZVN1BxNmZxbWRn?=
 =?utf-8?B?RmhtRjJyMG1WVnd0RUdEYVpub1NtSURmZVdQRlFqamcvdzhkdmFQOStWZlI4?=
 =?utf-8?B?Mmk4dHZwSXV1Y0IyaW9BVktXVnNNckEzd0JoTGg2ckxRemx2aTRCQlg0NHdm?=
 =?utf-8?Q?wo7E=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 09:54:54.6934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66dd6a06-e27a-46b9-3693-08de0007684c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3330
X-Authority-Analysis: v=2.4 cv=HqN72kTS c=1 sm=1 tr=0 ts=68dba8f2 cx=c_pps
 a=+6CRCh6JdYl0EMJOUlbVVg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=0JIAMnr-4CwA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=aT3F-kPXq-byaCpL_MkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: y0PRR6viJRZ3lNQUqc1dBD8BWsxuqxMX
X-Proofpoint-ORIG-GUID: y0PRR6viJRZ3lNQUqc1dBD8BWsxuqxMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDIxNiBTYWx0ZWRfXxAJBZ1D5DvHh
 8HisLaVf/eXv++wUuyJ6Enz5/fjXquk9Wk+VWGlAmpTLZazzAJp0tM8CRSTQehaxSEoCxjBfRRP
 ILffaiOwfScDU9MyQyZQTCVCUb0yF3hkBtJ7Ar/PvSFZIVLcm8q7ENrdpCKA8gnpTf+iAA0438Z
 3QP6rELqdcpNEvbbpDEhuJhzKn6i0XOQFRkZe9q8BWSLLQ2gQotZnvwAikbbigzs2vZFmMmGNwz
 L2vnQHspa/RQkECOXk39ysclSgVf8x63JKDXnT+HeETwx9/YW+F+eVYb73gi2Xr/MRJufw0rjQ0
 Kfj7Y2ZxvEOkYBY/fmGt/7Rgb89oc3gntObC4SRJq73U4fpLi8NIEACW7oUbwZzQJ2IGQmUb1fK
 xE2q7EKAjK9upMU0VcV41HkGjBB9Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260216
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/3] clk: stm32mp25: add firewall
	grant_access ops
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

Ck9uIDkvMjQvMjUgMTE6NDQsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBGcm9tOiBDbMOp
bWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4KPiBPbiBTVE0z
Mk1QMjUsIHRoZSBSQ0MgcGVyaXBoZXJhbCBtYW5hZ2VzIHRoZSBzZWN1cmUgbGV2ZWwgb2YgcmVz
b3VyY2VzCj4gdGhhdCBhcmUgdXNlZCBieSBvdGhlciBkZXZpY2VzIHN1Y2ggYXMgY2xvY2tzLgo+
IERlY2xhcmUgdGhpcyBwZXJpcGhlcmFsIGFzIGEgZmlyZXdhbGwgY29udHJvbGxlci4KPgo+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1l
bnRAZ21haWwuY29tPgo+IC0tLQoKSGkgQ2zDqW1lbnQsCgpZb3UgY2FuIGFkZAoKUmV2aWV3ZWQt
Ynk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KCk1h
bnkgVGhhbmtzIQoKCj4gICBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMgfCA0MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMy
bXAyNS5jCj4gaW5kZXggNTJmMGU4YTEyOTI2Li5hZjRiYzA2ZDcwM2EgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jCj4gKysrIGIvZHJpdmVycy9jbGsvc3Rt
MzIvY2xrLXN0bTMybXAyNS5jCj4gQEAgLTQsOCArNCwxMCBAQAo+ICAgICogQXV0aG9yOiBHYWJy
aWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+IGZvciBTVE1pY3Jv
ZWxlY3Ryb25pY3MuCj4gICAgKi8KPiAgIAo+ICsjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2Zp
cmV3YWxsLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5o
Pgo+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgo+ICsjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiAgICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiAgIAo+IEBAIC0xNjAyLDYgKzE2MDQsMTEgQEAgc3RhdGljIGlu
dCBzdG0zMl9yY2NfZ2V0X2FjY2Vzcyh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBpbmRleCkKPiAg
IAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IHN0bTMybXAyNV9yY2NfZ3JhbnRf
YWNjZXNzKHN0cnVjdCBzdG0zMl9maXJld2FsbF9jb250cm9sbGVyICpjdHJsLCB1MzIgZmlyZXdh
bGxfaWQpCj4gK3sKPiArCXJldHVybiBzdG0zMl9yY2NfZ2V0X2FjY2VzcyhjdHJsLT5tbWlvLCBm
aXJld2FsbF9pZCk7Cj4gK30KPiArCj4gICBzdGF0aWMgaW50IHN0bTMybXAyNV9jaGVja19zZWN1
cml0eShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB2b2lkIF9faW9tZW0gKmJhc2UsCj4gICAJCQkJ
ICAgIGNvbnN0IHN0cnVjdCBjbG9ja19jb25maWcgKmNmZykKPiAgIHsKPiBAQCAtMTk3MCw2ICsx
OTc3LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJtcDI1X21hdGNoX2RhdGEpOwo+
ICAgCj4gICBzdGF0aWMgaW50IHN0bTMybXAyNV9yY2NfY2xvY2tzX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICB7Cj4gKwlzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGxfY29udHJv
bGxlciAqcmNjX2NvbnRyb2xsZXI7Cj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKPiAgIAl2b2lkIF9faW9tZW0gKmJhc2U7Cj4gICAJaW50IHJldDsKPiBAQCAtMTk4Miw3ICsx
OTkwLDM2IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDI1X3JjY19jbG9ja3NfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlpZiAocmV0KQo+ICAgCQlyZXR1cm4gcmV0Owo+ICAg
Cj4gLQlyZXR1cm4gc3RtMzJfcmNjX2luaXQoZGV2LCBzdG0zMm1wMjVfbWF0Y2hfZGF0YSwgYmFz
ZSk7Cj4gKwlyZXQgPSBzdG0zMl9yY2NfaW5pdChkZXYsIHN0bTMybXAyNV9tYXRjaF9kYXRhLCBi
YXNlKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyY2NfY29udHJvbGxl
ciA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJjY19jb250cm9sbGVyKSwgR0ZQ
X0tFUk5FTCk7Cj4gKwlpZiAoIXJjY19jb250cm9sbGVyKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+
ICsKPiArCXJjY19jb250cm9sbGVyLT5kZXYgPSBkZXY7Cj4gKwlyY2NfY29udHJvbGxlci0+bW1p
byA9IGJhc2U7Cj4gKwlyY2NfY29udHJvbGxlci0+bmFtZSA9IGRldl9kcml2ZXJfc3RyaW5nKGRl
dik7Cj4gKwlyY2NfY29udHJvbGxlci0+dHlwZSA9IFNUTTMyX1BFUklQSEVSQUxfRklSRVdBTEw7
Cj4gKwlyY2NfY29udHJvbGxlci0+Z3JhbnRfYWNjZXNzID0gc3RtMzJtcDI1X3JjY19ncmFudF9h
Y2Nlc3M7Cj4gKwo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcmNjX2NvbnRyb2xsZXIp
Owo+ICsKPiArCXJldCA9IHN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xsZXJfcmVnaXN0ZXIocmNjX2Nv
bnRyb2xsZXIpOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoZGV2LCAiQ291bGRuJ3QgcmVn
aXN0ZXIgYXMgYSBmaXJld2FsbCBjb250cm9sbGVyOiAlZFxuIiwgcmV0KTsKPiArCQlyZXR1cm4g
cmV0Owo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzdG0z
Mm1wMjVfcmNjX2Nsb2Nrc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAr
ewo+ICsJc3RydWN0IHN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xsZXIgKnJjY19jb250cm9sbGVyID0g
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gKwo+ICsJc3RtMzJfZmlyZXdhbGxfY29udHJv
bGxlcl91bnJlZ2lzdGVyKHJjY19jb250cm9sbGVyKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJtcDI1X3JjY19jbG9ja3NfZHJpdmVyID0gewo+IEBA
IC0xOTkxLDYgKzIwMjgsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMm1w
MjVfcmNjX2Nsb2Nrc19kcml2ZXIgPSB7Cj4gICAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMybXAy
NV9tYXRjaF9kYXRhLAo+ICAgCX0sCj4gICAJLnByb2JlID0gc3RtMzJtcDI1X3JjY19jbG9ja3Nf
cHJvYmUsCj4gKwkucmVtb3ZlID0gc3RtMzJtcDI1X3JjY19jbG9ja3NfcmVtb3ZlLAo+ICAgfTsK
PiAgIAo+ICAgc3RhdGljIGludCBfX2luaXQgc3RtMzJtcDI1X2Nsb2Nrc19pbml0KHZvaWQpCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
