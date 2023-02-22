Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AF69F4BB
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 13:38:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EF8CC6A5FC;
	Wed, 22 Feb 2023 12:38:58 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DD7C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 12:16:10 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8xuqS030215; Wed, 22 Feb 2023 12:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=LOFmSS194eCpOdU7W6mzUc4pQfNBfIhnAmX2MRGjZUs=;
 b=F8iUFL4o4b+hQtqITfdDVYxFrmavdK/VzwQOTXqt/iEimv9tYicTkHHgFEO7UI8chL1i
 mTWRAnfbSfqCIUWwiSfeNYLH/zsKtnJ0/FVUc9GJuzoOvnVQmFWGld+ucWP2127FHnFY
 47eVhkksZ8Jpdvdmv19BfSg9YeM18vlzN89/SO34BwlQQ2u4e5t/2HYleXkljfjzAk0V
 RquI3WLRs92yo6QCJ6HMu/ay5ShuoC/X3SuAftIyQamw0CWgYYcvz31+nWQhOtXUlaME
 gypeU9QkaiM+E3G0tyvIwsO87D/0q3bAXDPbMpygLea23jsxGNQD7Y4Muo04ZmyfHs35 Zw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn3dqqd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:15:50 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MBejip027290; Wed, 22 Feb 2023 12:15:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn46qyfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:15:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGYgj2ssUITM3yeJLwL9KSgW7LndHD7tcQ9sJvE1rZbqG6afZ30tGPGiJ7VUsBscqp5X/Jt7yY7485PLQ9kEY0LnMlcFrpuswvpmRSWGFnG6pOwiWmdmA9RX/7HoTqXuQHtYqwWH1Q6nXfJCKWjeGYZUIZrHx8wOYIBLA5obac1Xy4/hByKBv7QY6ZXL3Pju5v8gJCe80bsIAGeYPyVoCVfrd2g/ji83Sj2qaCbCTXw0RKZqYwW2gQDCpD78z7osMlpcLfRMC+OMUcGfX1OUhYGHl1o+D1qzH7MoPqlgzFwVtOQLb6yO4Bxs+MdsNgJSkd+QqgaWwpzUduimJqtb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOFmSS194eCpOdU7W6mzUc4pQfNBfIhnAmX2MRGjZUs=;
 b=dOc4UCTEy/e3kNoVUY+RNhcC2AYY/7kIKvcnzpAqilYRPS5NGeHGs3f8L+4YO2baL/oN1Ghf9WM21Le1yYQjr6977SM5urJsQfBRrtKxiDg4GKUxUPaTX7jIctMQbtNtYox2EdylJzzG4604gh07JtHkYWsZW/tY7KpEu83fL4ROkygu2Mzac9FGHh6gW22htWZxnsujSKLmSqOOM/YujpDzqby3wqz0ufQ7fHM1j/MWsbNMmKgiX5ge5yViB5kmeXEDgsLI9KOf8WAs5TXcQzcqHysr/3E31/XA24EQvGdU7ZsVXw/MWDlVGYnwSm4UBbyF6FyO3fBlmF4/y58s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOFmSS194eCpOdU7W6mzUc4pQfNBfIhnAmX2MRGjZUs=;
 b=t/0udKaVuLzqaZjZGxFVAKcMJWb9tzFE3CXgIfOChjgPq5756qW+bfQVUqlX5mM+kpThDethBX/eRqPLXsbolpEK+lwAof1v/B+YcqePgJ9pGZrlAIcEQD7ZTs9eD3INRYCyAVPzj3Me2SKynUs9w8DdNvC+Y+pVYnV1vr1qo2c=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by PH8PR10MB6412.namprd10.prod.outlook.com (2603:10b6:510:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Wed, 22 Feb
 2023 12:15:42 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:15:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Date: Wed, 22 Feb 2023 12:14:34 +0000
Message-Id: <20230222121453.91915-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|PH8PR10MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a1696d-9741-4e9d-4878-08db14ce84a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/8Qa4oksuQKqUM4YqZ94tokeejZjAo8F8F27EsVa5O6gva7vbYOIdD31/i39PzCIcpElZVJZU+ZifbIsXtt97J8spx0GGqdJwp+V9rSSDIhyMZaLMRteg4Xw7fglmFbYR9shnFx65rkT9/Dm5MnHxotXbxsfnyQb9dShWiI0QE8+BcIMCtlCxfP34k0vB8YcDg8+Kgh2szQmS1j78GQSvcZw4pBHe+DrMuGd9nS03dKm5odoPNcEsguP/BdZ1PC6YeY5GOLiyLDl2Vdaikk3OrxP8uECUqFk/zlE+XTIPA0bP/m9Sxh5BNZbG6TBwmNKDS910uflcF2R898bdQmroajcWSDZe9QOfK5M5RqBGqBs5EGLIEs0bXVvPWrjHI2N0zSFramJiclKwfdELio6GXBUkhk1bU28hHz+LGiZ1ie9UgkNtp8JVJnjBwtY++U2Oub29EbrhGDVaHFdfAuELKSOjz5h+Ob6xGc2tzuZvmc5+F8z9Dk4QAp46ScLqcQ8w/QfosH92IQnCWIgSk+maEODXHU0VsqLIFEYpkor5fNKZB+FYmG6KUtsMCjJomZoLT7eitv6tjd9VNQ8yOh8c2YCPCL7H1oqfkQnHXG3ZGmQASxHr+pAeP8AbO411t8ArDIunqJDqf3YDudx9b2Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(478600001)(86362001)(54906003)(2616005)(6512007)(4326008)(316002)(6666004)(6486002)(1076003)(6506007)(186003)(44832011)(7416002)(36756003)(5660300002)(8676002)(38100700002)(66556008)(66946007)(41300700001)(66476007)(8936002)(83380400001)(6916009)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMPcc9YXw4Yv3iFdCJFSjMVfSBGXePMyEs1CbNLmnizgwlAPmLMdU36sX570?=
 =?us-ascii?Q?gtNz1gKnUyD2nurehMVG7WVNvs0KigjAlppGH6dO3wuftOyTdj9tykAMAYfc?=
 =?us-ascii?Q?fo9dwPjMbssR+O1DAQcNcqI0U2IriAMDoY+sVVolCsT0dI387obMV1Ck7o4N?=
 =?us-ascii?Q?qF+uPYu0eqsmihFIqtMXQS9m/V2yvgAv7ibffTFYTANOcBO4w811y0IUkF76?=
 =?us-ascii?Q?qZIAKh+AirmeokX4oZHg/M+QIMlEt+XHHuAQzpJgguYDiJnMNN9FNGy3HbsK?=
 =?us-ascii?Q?EiWNHZP0woOqdFNMpxZK8abV+HdrpLOW+GdrzJ8gh1IOdgHxaCF/CYRw4b3q?=
 =?us-ascii?Q?6/ZLP/F4AnYp3FnhK8uvws1LSuqz85Q774B1WxCvcZa9W2Q5AKZbQIhoLHrW?=
 =?us-ascii?Q?VSaxI7BqgdmkVG57aZp4WqB+mwHME0EiSMOvBWHMbokpckuQuim95lWY2Jkx?=
 =?us-ascii?Q?P0zvMjl+nOs1bb6kVF2rlC+Ut2Fja1ehhL0QrLENAvXcDw5sCSmRteiu0Zwf?=
 =?us-ascii?Q?pR7k5jwgsds9hyJoBnGIfgowCOXBCbuc714bYZUutXZl4IFmiP1V8SY54Wff?=
 =?us-ascii?Q?Jr2m/O36AngNICFTuecQ+GjPh3kcokbUku6iKsFlCV0A1xYyalMfVlVgJQox?=
 =?us-ascii?Q?iIiozpT10JN+r3Z6y55wg+cBQz0mIKYIbPzboL35V9NjNdH+bV2HokjBJeb8?=
 =?us-ascii?Q?JcPIsVOtUDYx2TkrMdtd9KUsEdgnQdc/yvFvxBLsFqbZs6iaVxkuorH126je?=
 =?us-ascii?Q?EURO5SXBiq1pZmo8lxUw+f+WBah0u3sdvzV4kLyAKz4STWw4Nu+OBZgBd8Qp?=
 =?us-ascii?Q?Pi37hYi2fy1GjKf1GYvLFfZbXH7RplIxHsI3ESGfShCAqbdoxHsrvt+EMpbW?=
 =?us-ascii?Q?U4ev94mha9tKBm1Ry+jpi0BqOTGh3PT5HIjDrkq+n/XebZagrxrF4qVeBcD3?=
 =?us-ascii?Q?6msrJaEz57zXe0O9mSXyUSgzzILEAy7f8Rk3E1q9yqqpHp3ykzvf5Ubi+/nP?=
 =?us-ascii?Q?HsHKIh0ujjQNElOzAENYaWukVAip2WXSepidX+CSY1H97BNAiyDuN+AiKCBh?=
 =?us-ascii?Q?cr5qCZXfuR3rO48sWJ4P9KgPFLaW8sE3RLGAsRzPslb8LAcVVXjphxrhMdtn?=
 =?us-ascii?Q?K9fDUOcmyS5GJYz1VyiNxNM6B79UKJqGAftA8gMejoGKR44NAlV4rrtjgTUF?=
 =?us-ascii?Q?QOfqpfaDwEygoZee3eg1jbmjvnG6WWe2Hz/p6zDOeB83BpL5oKUR0KUHLX0w?=
 =?us-ascii?Q?j8GIe3jfZAlq+PWZlHycjReWc8V6Z63IfhilwoAKQyRxTOkiRLFO6rvleN/7?=
 =?us-ascii?Q?h8JF2smIWM5E5BQHzfJbLc9rhA+RPAuYJwCc/SXMShafWgC88cKSq7R+H/Oy?=
 =?us-ascii?Q?QBUlqk9JVL54ln4ftOCViqzgUyAkvLVpk84v6qwcxn25xcLN7wrjK9IDkvBB?=
 =?us-ascii?Q?cZI4n/kqpho9+JD7sFkaZfzUvMvOF1kE0qUrXDWXoWWi9r5vd37YhATuD7iG?=
 =?us-ascii?Q?83+ns7E6vutR9fMCrBgFw1chq6861KaAt1t3JziKVGLjYeVeaBEvZrDpJsCl?=
 =?us-ascii?Q?eTztRbOnVqv3jCC6vlAC/sUA4MU4PXrs0WS70VK153gVjDxsbu/ms7ZK+1jY?=
 =?us-ascii?Q?Ou2P/k4vq3RsbBJ23RxG+1Y=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?k78JrPjIZITMoXlXoN+UiX7181Qlj7YvRcrSPmmnXaCjqrgmUN1BPE4HlS/b?=
 =?us-ascii?Q?M1OC1IJEvOGmbajxkJwU6105ow/pgPz1D3+Hf5gn9xQM4ucYKQEu2uBUcBfn?=
 =?us-ascii?Q?t9apbS7HoKEFyR1eOkDMza+GVAjP461lPxcB1jAwF7lIkFsGFT1adVG6UiyA?=
 =?us-ascii?Q?zds4y6f9MTfGLBfmCJZyUKpBcszBc4L8Jjs0HTct/m3C93TKOG8wyjYQWWxV?=
 =?us-ascii?Q?5HirqiO/aVMZfk0qj7desqFqfbCv83E3SDMeBI9TDIhRN1sSY3zWNUAv4E+2?=
 =?us-ascii?Q?tETyyt51VYmOE0WWRqo2He3j8xgpsErnhlkDlvnhDBoxYBkff7ZkjMv49l+H?=
 =?us-ascii?Q?VGgUYZEzFkbssq/3S4OYuiEEjIf6+/jGZSoXh2J8OJyjlFMtAmO3iJW2pFoc?=
 =?us-ascii?Q?nuNHEBS9RMZQhvS7SINg3QXe23EUf6/fRoVgIGijlKUdXSXA2n/V8xkyut3i?=
 =?us-ascii?Q?Y3AdjdZp3Xz6MVPRnz7SV129G6TO77qcrMZj8cWsAnHsSwt5NLev7N2/XOiG?=
 =?us-ascii?Q?Y2hIL/Ngg8bQokyOeHu4iG9pdkx6Cx7HCJuJvQiYNBrdadRuLiTXxwHlL2f5?=
 =?us-ascii?Q?BNM9BRC8BIzAXMsBcbtSFuhLOhpgmcs4kxbHM4gpdN6PvGUdt5wl8Wkrt54Q?=
 =?us-ascii?Q?7S9gB60WAZbannSpJDR1vbLtfvxD8Y8XpIPXY8UPrH0ZrZI9CTvMMYT9YRAN?=
 =?us-ascii?Q?KqZD/N6Y213CAZPPXxxx3Ckc7dVtJSmJ1Iilxb+iYKA3yHkHECQPdkT8sInw?=
 =?us-ascii?Q?JI+Cafbn1zOC8n7z/E3ofij0nN1kl8alckBUSk68lj6zGZhEW45X+cJ7amPA?=
 =?us-ascii?Q?ie1Bjjo8+EXdg8FUNlRC4lbqMrIK4gMqjDMNJmYc0BsVTRwTkDaVolvJTjqi?=
 =?us-ascii?Q?5HvKGdwMqY9mkAUaaNQ7NLhd+ppMDzEMODQPbyTBgQGRyh4eeIm+BGZGrfN8?=
 =?us-ascii?Q?+jkbyF/SErgdHy0Ahapm2/dVLIx0z9d+pyIE68B3nRT0t5OWj849RJrk94d5?=
 =?us-ascii?Q?Ud+VHNI/7MpEb5NnnsGvj/2B3wT93K8YkV/YB8QOiDyuZRwh5r17W0KKBH/W?=
 =?us-ascii?Q?4Zt8jBa3PzQShtTOqjfq/YB+ny7+zw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a1696d-9741-4e9d-4878-08db14ce84a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:15:42.5131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCccGiGcW1bNyPNT5Nr9x/uH3H4cFg5i5A0n5FrdfIcz6CLmzvzx4EiuiRIFog8Cv4YXB8j2CvzfJ32y1BqJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220108
X-Proofpoint-GUID: ANMkTdMrWwB6_TIzYxwTBHmbgQoON9cL
X-Proofpoint-ORIG-GUID: ANMkTdMrWwB6_TIzYxwTBHmbgQoON9cL
X-Mailman-Approved-At: Wed, 22 Feb 2023 12:38:56 +0000
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-modules@vger.kernel.org
Subject: [Linux-stm32] [PATCH 08/27] kbuild,
	clocksource: remove MODULE_LICENSE in non-modules
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

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clocksource/timer-stm32-lp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index db2841d0beb8..4a10fb940de5 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -218,4 +218,3 @@ module_platform_driver(stm32_clkevent_lp_driver);
 
 MODULE_ALIAS("platform:stm32-lptimer-timer");
 MODULE_DESCRIPTION("STMicroelectronics STM32 clockevent low power driver");
-MODULE_LICENSE("GPL v2");
-- 
2.39.1.268.g9de2f9a303

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
