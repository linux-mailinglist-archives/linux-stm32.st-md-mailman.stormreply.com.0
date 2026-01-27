Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EYYAIGPeGmqqwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 11:12:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BD92842
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 11:12:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC392C56603;
	Tue, 27 Jan 2026 10:12:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E89D9C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 10:12:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RA6ASX3507708; Tue, 27 Jan 2026 11:10:13 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bxpx3h5ut-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 27 Jan 2026 11:10:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3ZBuLpwhc7eFgrL331pYajVrSy5A1Q3JNo0ugPt4wi0NQKzpeUJE0X2zcSaHjq3JUgtXLTbsLxgSwt5Rg3BGX1N02UqrbVayAvpEA9j0ksYcRBsG28Rs1iJuVaUD5U7wU4pXbz5hktzn2K39TQIJlp0FN+z2czwkC03GOriFAMr95yW2uECO/e+7cArQQwivgO6lgi6CX48Sv2uaLtxbrQxUJdcflYipEiWjEerAY3DoirzAUEIucj7uatSgXy1r7BZoWEfzr/ckA7dymdaF9r3Z/2JxYrd+/EcSReQbuvXUEX/XurK4oYLtQF/E7aslxclT9Hq9ibovUGLZCgTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yqyq1iQ32ttwL7t9fThzHJL2//v/MDew0P25WG3/uiA=;
 b=XOBjleT/49eeforCD9axP8WMiVx7yFw6p/NaNC/3SVy52whMcgQUebiw84q8uYmNZqdxvGONkjHJynRG+MZblRaVRD1kTbEVFlT7YpVWKBqTqS8N91rHYbxM6Y4LtHeaY/9tTgz8LldkG36ftmqKbR7b0V5pzrIrcF0jFIfJ7Br3dpys8PyPm4u3tKb0XmTSxlB0DBUMHvSznPp4g+j37NdFwas7sRb9h/CBcz5eTxtpml5NmjC/8jixlXaQnSjkupcqkfjZa8cPPAQTTzugloU3BhLXVDKulLSI44E9jxzBWhs3QtarLWvk/ujxvBjJrx4HvZeDGpkEDzzSH4l/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yqyq1iQ32ttwL7t9fThzHJL2//v/MDew0P25WG3/uiA=;
 b=jkQMf9v5oMqjjtPccQezOxFHmxNBE81aEce/0cB9wEHekdYIrjonUdLn62fjWLw+A//LEdS+UYnxPk/uqcphmg7yZGmB7KpHE6PlLKnY8QnI5WdnMTdna/bIdmQoJBd4XQEWpJKNeYvbL6T/iEujGJUEr+E53xyWGi2DEUiwlTC2+/8n0AngqOGRORfZkXjCTAFJM0f6LG4P9N8WqPtDhUw/SO1zPPPsAbwtB34SakslxF6uh1l8CzNxjYjmwZHPIW3ForK3wNN+mp/H7RDvCZmpZ0oYnLbNCwdFJ7jAh2oy6O1j5nAhCgf+D/A7Db9MD8QguT3BoslN1DCDMStxMw==
Received: from AS4P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::6)
 by VI0PR10MB8935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:10:08 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::93) by AS4P250CA0001.outlook.office365.com
 (2603:10a6:20b:5df::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 10:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 10:10:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 11:11:43 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 11:10:06 +0100
Message-ID: <22ee4a87-fdc0-42bb-868b-565adbfbc506@foss.st.com>
Date: Tue, 27 Jan 2026 11:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linusw@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
 <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|VI0PR10MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c67cf5-713d-44a0-c8cd-08de5d8c401d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVgyUWVhTnZSSXVzbmxvM2dnTnE0TUVqbFJ2MXhFa0Y2KzFuc21CQkRhakdP?=
 =?utf-8?B?dURkeXE4cWdKa2Q4MnREYXNDZHFBLzFDdlhwdXZqWmFXUmJVOTB3ZHVUdm9H?=
 =?utf-8?B?RkpkM0FWM1E0b0RkTkRrcllYOWh6aElBbWZrNm9wOW93NmxxekZadGo1a0pL?=
 =?utf-8?B?RUt4dm14cGE5eFhJS1kzNkFqMGVKMmxnNEdEeEh4N2E4NE8rT3N0Y0JuVzI4?=
 =?utf-8?B?UEFJYStIMEhvN3ZZVzU3cXdiZkFxMzBXNFIrVlBnd0pCdEllQ3lFdEo1MHZ3?=
 =?utf-8?B?a1F1eGJIOThFdXNFRTIyRk5LNGd6VElGTTFpTHFlL094dkpEUGpxenMwZnFD?=
 =?utf-8?B?SExYOVNib0RwaklraURBdDJvUkorM0JwZEVlMHVtY1NzSFBFUWZ0QTUrTDBN?=
 =?utf-8?B?eFZ0MjU2RjJWRUw2QmJLZDFUVTZSZ0U1MnBreTJJVkVzdmpxbGEyNUdoNm8r?=
 =?utf-8?B?R3NXaFQyejg0Sk1wSlhveVdmdjkxTEt0ZXE5SWVsbk5JRnFRRnRnUkFJQ0ts?=
 =?utf-8?B?QVlJaUh5ZUlvbi93aTRZS1kyNklES0s5OXBybUt5cXh5UFg2T1h6Mld3SVQ5?=
 =?utf-8?B?NlVqOHJTcUtpYVNpVTN2TFdtQXpBSytXN1NGSkNYNENKVDVrclE0YVBFWkp1?=
 =?utf-8?B?bjVYdlNoOWYxOWdZOExJVUxUcGJxOW1zR0FlY1lIaHZ4Njg4V2JULzcwYlU1?=
 =?utf-8?B?U0J1aDlOOG5qMDZvUHdFQWRIdnN4b0E1Q2ovd215N2xVaWUydnZseVd0aUhy?=
 =?utf-8?B?Y2YySk5lamIzZGlXT1pBQTBxRFh6OVdycGF6emJYQzZJWHhXUU9YQmp3UEF5?=
 =?utf-8?B?QVNnZ3EzempJUzhHQXpKSW8waEM5T0ZzZEJ0OU9MZ3Y2ZDVGcWZtMzJaZy9a?=
 =?utf-8?B?ai93ekNyd1VHdi9WUWpoVnJYd2dGQnFHT0VsYjhuVWc4UERaY21BRUJlTllh?=
 =?utf-8?B?Qi8wdk9LcjZZWndHdExVNUhLSThBMEVLcklZVHJBSzRab3RvV1dtTzQxSEd6?=
 =?utf-8?B?MlhWbTJHUGJ4Wi9xSFY2WXlFaFhSOWVaUWFLTFZCWThGbGlDSEtRZk5kQlZn?=
 =?utf-8?B?Qm1iSVhSRkNtWCs2emJWTDl0TGxIRW9LSWhwZTg1c1kvZ1dkTitCSHNESWhO?=
 =?utf-8?B?RW9KMURBaUVwQkRIV0sralBGTlE5aXo1a0I3TUo0S3NOVUtZcHRFTkxUV0VC?=
 =?utf-8?B?Uk9kaWZnMHZkSjVIUjAwN0l6emhING9FaHhrRjdWcFpqMjZYbVNFdUZqWnV4?=
 =?utf-8?B?VGJDQkIwWGdFUXhUakdEdjg4MHN2V3dESnhyUE1kSVVPdnV3bDgyam5vbUpK?=
 =?utf-8?B?TzdxYXRwUk9aQzJTVWxLd3liMnBjWGJWOVU1ZEFVTGs1c1NwZ2dwWmc5V2wy?=
 =?utf-8?B?bi9jMU5MTWhpM2VhMk1TUmVNK1NnZGo2aUVnTjFJTnBvaDRWQktXcERGQ2Rz?=
 =?utf-8?B?RXNhWFQyQ0pZdEFsYkUxWWlmeUtMYlI1ZVluZ1NsTGhsc2xVYlhkSXUvSi9S?=
 =?utf-8?B?OE9LZDFsUk1NbjcvOU8yMW1Gby9yWWgvbkRkWHZQNm9jQ2VhbjNwT091RU5M?=
 =?utf-8?B?bW1zNkNkZmpWeStGTXBmS2tMMi8yYk5XSDd5eGpkTStnaEtFYWhyN3RDZEVr?=
 =?utf-8?B?akRqNExTZmltK0hNMHFkK05qQjcxRzJjRTY1K3V3NTNTcjR0QXNiSFEwVE96?=
 =?utf-8?B?a0ozY1lOUkFiME0yOGt5WFZVYjB5ajBjMG5kUjYxVytyRTJob0pWSHVyQkk5?=
 =?utf-8?B?OTBGSXRrcHZSbVJEeWk0aU13QWI0c0h1UTZVeGh6NWhuUHdrNWZMQ0tqM3I1?=
 =?utf-8?B?QkQrWTB3R2ZDQ01ldzRNcW5nSE5pWXBiY2tLN3ZzRjVlV1p5UCsxMXJBa1hn?=
 =?utf-8?B?MHhhRDFQZ0xJcVNuUFk4c21IemkraTltTWFaYkhtRTk0clo1aDBDbDZXSDE3?=
 =?utf-8?B?UUFvQXVMTDlDaWxadU80NGdtZGJtMGpPWjlpb2VwSmpNci9hMDVqN0dUSUZX?=
 =?utf-8?B?aFpFZkdEajhHYUh6eHpDcTlESE1QSFhpazl6STR0MkZpTkkxTnZYempWTEwv?=
 =?utf-8?B?Q2pteDZjVmF4cllUaTFBZVY1dnE3YlgxSUZxRHZ5UnFpNW9iZGVSUVVKUklM?=
 =?utf-8?B?a0IrTzVKb1hwZ3pEdjQ4WUExU3VYMFV6Si9FU1lGeTRlczB6c0hUMHZvMnEz?=
 =?utf-8?B?S2RDdjM4cnVKNGphT1pya1l2OXVaQ3RVTU5KNkdtcmpzc1YyRkVCS1BUTXcw?=
 =?utf-8?B?a1JGcFp5WkVZcktTc012ZDQ2bU9nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:10:08.4899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c67cf5-713d-44a0-c8cd-08de5d8c401d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8935
X-Proofpoint-ORIG-GUID: JhTE-4rPi-r-BTYwlf0DPFIPNVQrCpfs
X-Proofpoint-GUID: JhTE-4rPi-r-BTYwlf0DPFIPNVQrCpfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4MyBTYWx0ZWRfX+iHGAcGnhajk
 NxCPSG3VrCUvqA2jN7L7sMe72LDzXkYZAD6MWA4HPrdDOBDBZwLtOPwOkB0on2zx4abytaAH2hX
 WFqtvi/48ixwrV5kjmYGMz8qe1Yi7I3XJb0gnQv0O/uI8s2gXx3ccfzv0UDrfbsJpwrpfSAjnca
 npvnwbEitrs7an/z60qEqqT81NjzjrXNvyMLidOeHBUKZKJ+LFA9fB/lop0C4pa6JnpQ+0nvSYL
 Tbt8NAEWwjCCvEPPLgCPfKjv1iZy6kOjG/u6uHrTkO5We/BMjq/IZr3LdIiMfoHscB9m1GlgUY9
 qmm4VfyLlfynF923wEjxqQ/Twl8k/ZEUcH6cqp7OwiL1zuUfa9P0wjOdFQt6m7t4el1KI/M6cKV
 xIvLdx5OZ7LqXvnoAUNqEa5nj4+YfVIIOWuellR/+wv89TqBMp2c5FYfvEHHolgD/s3FSUfudQJ
 MNcQkOjiSXQII8fxhhg==
X-Authority-Analysis: v=2.4 cv=DtxbOW/+ c=1 sm=1 tr=0 ts=69788f05 cx=c_pps
 a=FIEi4Mj/srwWQvrc0Aes9A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=iSxo1258r__8O2mqjbgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270083
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jens.wiklander@linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v5 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,arm.com,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 449BD92842
X-Rspamd-Action: no action

CgpPbiAxLzI3LzI2IDEwOjI0LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIEZyaSwgSmFuIDIz
LCAyMDI2IGF0IDExOjQw4oCvQU0gR2F0aWVuIENoZXZhbGxpZXIKPiA8Z2F0aWVuLmNoZXZhbGxp
ZXJAZm9zcy5zdC5jb20+IHdyb3RlOgo+IAo+PiBBZGQgdGhlIHN0bTMyX2ZpcmV3YWxsX2dldF9n
cmFudF9hbGxfYWNjZXNzKCkgQVBJIHRvIGJlIGFibGUgdG8gZmV0Y2gKPj4gYWxsIGZpcmV3YWxs
IHJlZmVyZW5jZXMgaW4gYW4gYWNjZXNzLWNvbnRyb2xsZXJzIHByb3BlcnR5IGFuZCB0cnkgdG8g
Z3JhbnQKPj4gYWNjZXNzIHRvIGFsbCBvZiB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHYXRp
ZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4gCj4gRXhjZWxs
ZW50LCBqdXN0IHdoYXQgSSB3YW50ZWQuCj4gVGhhbmtzIEdhdGllbiEKPiAKPiBSZXZpZXdlZC1i
eTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+Cj4gCj4gWW91cnMsCj4gTGludXMg
V2FsbGVpagoKWW91IGFyZSB2ZXJ5IHdlbGNvbWUuIEl0IHdhcyBhIG5pY2UgaW1wcm92ZW1lbnQg
c3VnZ2VzdGlvbiBmcm9tIHlvdS4KCkdhdGllbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
