Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF8E99C3AC
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD46CC78035;
	Mon, 14 Oct 2024 08:42:53 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6CEC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 14:32:41 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499Dfmvj030873;
 Wed, 9 Oct 2024 14:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=2lDuO5UY9Anp/5LG1O
 v6PAPu35ofnxeUr7EgSPtM1gw=; b=etBYyOkj0SctZT8qAwlwml3Uro+3nYpud/
 v07qmSrdk5XrT+DQ5nZfZMMTJFK/PqsU3s2CbqAPqJR+ROXq+k1fjseC4YJ3IKsc
 WJmdxOVAr1xLgCRjNj6YfiDo2UXvCtc/1UdkZfH8rEYP8ZAcYKdZsVoWtOCxOsOj
 OlPuzEoCvxtEbXOOvYi+g8XFJHuXB3yluD7bXXWfLJm324nMuGLxqKvf4YOmSw3R
 4//ju+/xhz459kejIXgHj551AdK3KEKPBkFMtFq+arqSD1yqf1i5KezKKLwbLzHm
 ykfAVV6gefS3NinQwfHIfhnsK2ck+/7+kAdaFfKdk236FTHlRwDQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306egebj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:31:30 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 499DjYPx038363; Wed, 9 Oct 2024 14:31:12 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 422uw8qt0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2024 14:31:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcz6EJhPsS19pr6NyiMvXGvJw7cLpXVhU4cefYl2nYIu5XVpxrnvUuVT1lyvrCKfkxyrjo9z7ORwun1PZqukveUk1gAjibl3ZuJSKN7SmF41qsf1n2dDCF79UWhwqExXIFcmGR4YzqeN/5Y/2QQk/L8dCbN0pFlwyfAsh9dc0CtHg94mLQEjAaRfz3wDUmLqkJKDrhdx9VacznIafvuuqf08yR559/zcwH0gmMpvQHEYZi0jYni49uQpabJuAhNRlGOypD1iWaPnOIddwHPDAOVuieThfMGZLaWhWuTYEDnbgLCWk0h1KZcLYMFPuwd1kfEwiSSzTTCx9A95HDwMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lDuO5UY9Anp/5LG1Ov6PAPu35ofnxeUr7EgSPtM1gw=;
 b=V8xFhhiqcxEDEYibaKkBjmZPEtezaSp2NN4F2oDa+FL0Qk5U6QT96P2J7HGJgIV2MPQrcojTooKYyLSDDEMFgTIylto+WHM5lUtt+hRLp+x+Cb5UShI7BliA7mqlOKIM0fSqmNd80lCo5ltG9dV7aA2wJ9MS2NwaDrH3RRT+RURZmVzz4a/8uGhGzkFPPZO3t5ApOooGxGwCskvY+NmM71hyioqX4tWkbflvT8KeJVJR7NFKiiPsvS79icaSyr3xPMIUYTaUckzCxrOuoeK4QcBPbIK8G5rJaj4c2BeaVLuPsCV5XBnHBhIMOX2ubTuktRswC351/Kxhlewbac/pEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lDuO5UY9Anp/5LG1Ov6PAPu35ofnxeUr7EgSPtM1gw=;
 b=ca6OtwPplicRPxq+g9Zw0asbx3jUkG637vTp+wqWdOoK4buTpZxoPorM00e0rxx6+Eo9N0OR38SQSHw9jEvRVjxZAo4/4Ku/EK2daC471kaPx76Yro/GePYIQqy4NqoErELObqCUZiniIuDstULejkwck61mPvyQ5JGXvpHf9FI=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by MN2PR10MB4349.namprd10.prod.outlook.com (2603:10b6:208:1d4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 14:31:05 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 14:31:04 +0000
Date: Wed, 9 Oct 2024 15:31:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <1cf8c09f-6b36-4650-a017-707f4bc41ca7@lucifer.local>
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-5-arnd@kernel.org>
Content-Disposition: inline
In-Reply-To: <20240925210615.2572360-5-arnd@kernel.org>
X-ClientProxiedBy: LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::7) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|MN2PR10MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cd4e5a-224d-405e-96de-08dce86f015d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C9nFDa2T6TiBxa1Yu8MTXrQ2L4Rc8mkR4FUmLUiF6zfpy9cRYIOUKjnJa9bC?=
 =?us-ascii?Q?coFWO3gvSjsJc0bGeMiwFOtXIydVERnj2eBRxKNgJulj3szFYW1y8KBcj3iP?=
 =?us-ascii?Q?wqXOuIss8Spb49U2FZIU2nSvxHBt6cZJLPd+7IhvX3rge/ncMtfarJK/WYnh?=
 =?us-ascii?Q?wRzFD3S+roU6zKpdW6MY43vXLTkPBD3GvpGfuOKGOOP6zuNmFXxvoV53yzY4?=
 =?us-ascii?Q?DJWXqj4aqipc4nCadIz/u/PLZUZycxQyLvXQ8yLZsj1evW0/kWfMY/A/k71g?=
 =?us-ascii?Q?81iuozCItrt6l8m4z+RWs8/Z3gkrOzpQNPDaW787KpRxpFZWE10ioQAtQMwz?=
 =?us-ascii?Q?2RYA9kMk7UkgO7v4r0XJNIZwvLEpRbwSM4OxOif9RRaUyaxghx0C7qPfB9nU?=
 =?us-ascii?Q?5HjH0DPa+RJE5YC7Ztb0J5cOTb2UQeLsiyYLzrEyIvZpG6dtfjbL2/AnbrS1?=
 =?us-ascii?Q?iXkRGfLDWLFh94XMjUfXT7WlbG+EaCBAyEOqrJSZwTK2D2qrpJWnucMsL0TL?=
 =?us-ascii?Q?SmDXEI4ke9TIW0lS1htCCtV9K8gu1k3NmC2nLFpacmnL4eu1epJbRcRaeXc2?=
 =?us-ascii?Q?XCLuCTQEKXGmZMyPa90VWVL/XnfaFJW+bBthUVCpOxSlcq2+ToYDpvb7RgyW?=
 =?us-ascii?Q?TN3crXzOiw7cYAbq+kpM9OwlNWGUK6gebwFyEO9dXwEkOch2o4hbLuBrw8w0?=
 =?us-ascii?Q?PX5kL6yJ9wKbCkPtZHXqK7p7yznBkcDnbyhfvK7EsTmfRat9R/HEBNASZtfh?=
 =?us-ascii?Q?grr6FIJu2IRkHeytg+EkhwmnIeCWzgWD00MeqdF6p0y3S/pvPxRllAC43cz8?=
 =?us-ascii?Q?MPsfKId2guvVRdm89lZb17jHmeqVAFPNFUFiDcAt9Eo4qx2GmqkHzC3LluFT?=
 =?us-ascii?Q?HmhFcnjOz3CQZTfhlyogIDwtY8Xp7xfR0eQJhis5nsWlHRlzh9ISigTab9QH?=
 =?us-ascii?Q?QpwLbR90OUV5oxIKA/PFzWuI2FhifgnH1o5xp2NVbYCr+fdnBUynL39SWi3K?=
 =?us-ascii?Q?tQ71CErxhQmU9YUyBANuU6NVajO1yiHl3h/MkgpMVxB/2zA4jjHQO+8nCyJD?=
 =?us-ascii?Q?Ytg5es+Dt/fKcDBe1ll9U+0bXQc+Ld8Ngy7bUndFyzHjcIwIj6nivFjzotCT?=
 =?us-ascii?Q?/Nwo12lNv7Z/9E7TviDnsqzoxbOJruZz8NbDqdtuHfXz2NbAqfbYf/VXE/B6?=
 =?us-ascii?Q?jSNPnGZkFfa8BKJ2drc5Es1J6qPnQfU24Th8n/Lpv7H4pK4hxVEWQHPhlvhf?=
 =?us-ascii?Q?Qp9bSySaS26Bcj3yj3ZTlzI4VGUKz5FNz7UKYogZ+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB5613.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w07tJl8W4ojbuOOb73wRLuArjlQ106xgKfQHO9y+ACS3zFCWjKiwceajCPAQ?=
 =?us-ascii?Q?JBA/DfM7ERzjGc65/H6ZoOo6J8nBrYjtKhPsRIdl0QkKCs7Q3R6x6dOpUnVq?=
 =?us-ascii?Q?Tk+kXkK2SeRVJS1MWTURWa5V4uoICTCM5L0c52Bvxpsi5atNylSYyd93nw6n?=
 =?us-ascii?Q?DXzXv6Klj4QcmBSz4ouigmIK9YvQJ8miCwtO2FCijTshZAOCbAvJRZ0lcfai?=
 =?us-ascii?Q?N+BaggNHTp3IRwm34m6cCVdbpmv/6/NDm0VeK3mf7Ecc4p3lLDQGbYef1fMY?=
 =?us-ascii?Q?4LeRI73QRonWlDyEFyh4CE2fPgbcTifbfzphVwlmYz72PmKjnWjVoNyUMu3v?=
 =?us-ascii?Q?jGwpFaBvw8AX6Wgjv5HGWz+43vnID/1Hnf4CJBf0IPbzPRaa0EwH+orH/dyi?=
 =?us-ascii?Q?hxuy6uaBXDodoFp8fOFbciwepI1VlJN1IejZvZidrr1zjqYVZI12Vk0xobeZ?=
 =?us-ascii?Q?mY74zjZX/Q0gAOdDut23Z6FAboDvo2aGRuh/b9MRn13ScBRQhqRYO+z+/6VQ?=
 =?us-ascii?Q?DoXaGOhn3WO599nIPQihG7ikqtDyFDHoJMY9Gx4bcp/wIPj1xlm1UHKovIbq?=
 =?us-ascii?Q?u/xbNRQ4uZ4QZuWldvdYMJRnRJ8grHHugcvKRcwusymWakVESe6nZLeQPliw?=
 =?us-ascii?Q?a06Xzf1lcqCumNFxmcb4IFLnwE+XINet1nxyx0keWRKHYvgECzL4BZC2hVdM?=
 =?us-ascii?Q?x5qFZOTD4N2DTFuAsvgqCiyu4EXqEhKoi17pWXdWhJq4JzLRLQIpkfzGdy46?=
 =?us-ascii?Q?ZxNSbmkdDoRH6nHDDO92JEz/caykLjIPCLyEzaaYBZGHoFei79nE5tYHC3xj?=
 =?us-ascii?Q?2Z7C3S85lXL6ZfvFx1hKWZFJP7YI+veCyKMEYeX0zIEKpsY6eddQ9IMlK4hV?=
 =?us-ascii?Q?RdU8oje9iqtkd6Q9kUbnTObWvzxKytthMNM+zcgoH7ZMusZljbWQMa0pAfQ/?=
 =?us-ascii?Q?Rft2OGY5Np9RGnwV5Mbg6cIOxCxmA+Ze+t81ie20vcffoypKOTF7iq3DdwAu?=
 =?us-ascii?Q?399D8kq8iljQlwVlKJaeZQ6gGmppp8mJG4pkSOSD0PxMvgbaPbbtIQ30Ep40?=
 =?us-ascii?Q?O/r1OMOl+/zDPNimuzAwo2Z3KJ4WGckxTRcNq0Qa2GBsboaC3FA1rG9PNSle?=
 =?us-ascii?Q?sKqN9x1QNZADovjMZfwuyfhobaYr4Y+q6HYKR7fAX2a6OfCF5VwU2SFJCbSC?=
 =?us-ascii?Q?jJz7oAw8bmdUfhoRCdaI86jy3/g6NpqRzhyT4k5WieHChhxsHWwDxCzkXr/w?=
 =?us-ascii?Q?bGeUZpguA18mvocnKGuiZPwUzeMZGf+iSDmFfQmelDc0ekJSvXndGLOPAnRL?=
 =?us-ascii?Q?/n17mB1i7WZW7ksxnill19ijCUtqIjQUg5+jnkoCBuB2pwBxECl9JtqZR6Ok?=
 =?us-ascii?Q?vYVqSNaNJ5PUG53O/+imnaBF6IkrF7ev4S7+l3Z3sXL1OmpXo9xafkXRjOIu?=
 =?us-ascii?Q?EDG9cGBQw+MPSmouxfDdfxRv53aFCrt6ppJoJvSCvjmiUO11AkoUlgW2QfgF?=
 =?us-ascii?Q?MU4e5H1ECPDvyMR+JfHeJpNUQf3ajKnibds7+PX2i1VM2SFwSsZCvcVI8BO1?=
 =?us-ascii?Q?l2Vgy1mw6j9veME+IkkliO3ew4bsS2sGp+qwF/ymKLZw6C3KcsU6482Qn5H5?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eZTI+fVRnAI2vznILZqA0ZrSi2pffz+mpKyUWkWrpu03K+6rB8zhz74Eb2i9XLHyssMUPk424TCilW0Dkmfy57hbyF7+NmBeyBp6TLiqa121MoFmAkcn3WJDyvvaUMlCQs0PPw0fKnQP9C/bmnu0d4UafDtP61TlPWTrke+JTIT3B/c+I36o9hbyo794oiYM8Rd62zpjBDcBmPSmMoFHbuAqBHduoOBk3DP9xYbLh6Tgap//mhaq4w8SS9bSP0OMSwDbEC0TuLanoRG3fICdtSvZpiDvBhFLin7lYuRkXryLMlbIWgRZejeNL8Z51lc/qstIYB0lGOPITyxGRLu9KzX1HnXgl1tCfjjqQ6SXCVrgX0HJEgKQ9WjhtkQrqPjZy/b6vghLt6N87RW6jWAGoo+SjikpXdO9YE6FdETBrA8L1G0Yz60KkS6VIQju7BnLctK1GbVNk7pNhYgmTWXoe4zfLsXwsWszxTEdlpq5acCc8R7qTIqiv5VTvP9Y3GunORfCOb5NfSSV5ZurBZSl1xWTv21EEvhu+IxJHuUU9HM9t1uwW5gwWXLzlVigo+CwvI3Ch3g8wZfIwifZ8HXJr4Y6k4Z9DVT2oWdrvkVuAzQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cd4e5a-224d-405e-96de-08dce86f015d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 14:31:04.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwmnExWKXmnHivWGgmGe11XZdsMvUYeFdDh4NP1Ba5dWaa9scmkjOOmN9++cHD4BHilLBE+zHp1ypvZEiM04YJOrYgUN9cH5GPg9jgSH3/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090089
X-Proofpoint-GUID: ghh5LZgEx122beEUFDqOSeMdfE2G7w6-
X-Proofpoint-ORIG-GUID: ghh5LZgEx122beEUFDqOSeMdfE2G7w6-
X-Mailman-Approved-At: Mon, 14 Oct 2024 08:42:52 +0000
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Kees Cook <kees@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 4/5] asm-generic: use
 asm-generic/mman-common.h on parisc and alpha
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

On Wed, Sep 25, 2024 at 09:06:14PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These two architectures each have their own set of MAP_* flags, like
> powerpc, mips and others do. In addition, the msync() flags are also
> different, here both define the same flags but in a different order.
> Finally, alpha also has a custom MADV_DONTNEED flag for madvise.
>
> Make the generic MADV_DONTNEED and MS_* definitions conditional on
> them already being defined and then include the common header
> header from both architectures, to remove the bulk of the contents.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Lovely! Look at all that red :) Great work!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/alpha/include/uapi/asm/mman.h     | 68 +++-----------------------
>  arch/parisc/include/uapi/asm/mman.h    | 66 +------------------------
>  include/uapi/asm-generic/mman-common.h |  5 ++
>  3 files changed, 13 insertions(+), 126 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
> index 1f1c03c047ce..fc8b74aa3f89 100644
> --- a/arch/alpha/include/uapi/asm/mman.h
> +++ b/arch/alpha/include/uapi/asm/mman.h
> @@ -2,18 +2,6 @@
>  #ifndef __ALPHA_MMAN_H__
>  #define __ALPHA_MMAN_H__
>
> -#define PROT_READ	0x1		/* page can be read */
> -#define PROT_WRITE	0x2		/* page can be written */
> -#define PROT_EXEC	0x4		/* page can be executed */
> -#ifndef PROT_SEM /* different on mips and xtensa */
> -#define PROT_SEM	0x8		/* page may be used for atomic ops */
> -#endif
> -/*			0x10		   reserved for arch-specific use */
> -/*			0x20		   reserved for arch-specific use */
> -#define PROT_NONE	0x0		/* page can not be accessed */
> -#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
> -#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
> -
>  /* 0x01 - 0x03 are defined in linux/mman.h */
>  #define MAP_TYPE	0x0f		/* Mask for type of mapping (OSF/1 is _wrong_) */
>  #define MAP_FIXED	0x100		/* Interpret addr exactly */
> @@ -43,62 +31,18 @@
>  #define MCL_ONFAULT	32768		/* lock all pages that are faulted in */
>
>  /*
> - * Flags for mlock
> - */
> -#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
> -
> -/*
> - * Flags for msync
> + * Flags for msync, order is different from all others
>   */
>  #define MS_ASYNC	1		/* sync memory asynchronously */
>  #define MS_SYNC		2		/* synchronous memory sync */
>  #define MS_INVALIDATE	4		/* invalidate the caches */
>
> -#define MADV_NORMAL	0		/* no further special treatment */
> -#define MADV_RANDOM	1		/* expect random page references */
> -#define MADV_SEQUENTIAL	2		/* expect sequential page references */
> -#define MADV_WILLNEED	3		/* will need these pages */
> -#define MADV_DONTNEED	6		/* don't need these pages */
> +/*
> + * Flags for madvise, 1 through 3 are normal
> + */
>  /* originally MADV_SPACEAVAIL 5 */
> +#define MADV_DONTNEED	6		/* don't need these pages */
>
> -/* common parameters: try to keep these consistent across architectures */
> -#define MADV_FREE	8		/* free pages only if memory pressure */
> -#define MADV_REMOVE	9		/* remove these pages & resources */
> -#define MADV_DONTFORK	10		/* don't inherit across fork */
> -#define MADV_DOFORK	11		/* do inherit across fork */
> -
> -#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
> -#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
> -
> -#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
> -#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
> -
> -#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
> -					   overrides the coredump filter bits */
> -#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
> -
> -#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
> -#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
> -
> -#define MADV_COLD	20		/* deactivate these pages */
> -#define MADV_PAGEOUT	21		/* reclaim these pages */
> -
> -#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
> -#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
> -
> -#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
> -
> -#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
> -
> -#define MADV_HWPOISON	100		/* poison a page for testing */
> -#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
> -
> -/* compatibility flags */
> -#define MAP_FILE	0
> -
> -#define PKEY_DISABLE_ACCESS	0x1
> -#define PKEY_DISABLE_WRITE	0x2
> -#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
> -				 PKEY_DISABLE_WRITE)
> +#include <asm-generic/mman-common.h>
>
>  #endif /* __ALPHA_MMAN_H__ */
> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
> index 1cd5d816d4cf..3732950a5cd8 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -2,19 +2,6 @@
>  #ifndef __PARISC_MMAN_H__
>  #define __PARISC_MMAN_H__
>
> -
> -#define PROT_READ	0x1		/* page can be read */
> -#define PROT_WRITE	0x2		/* page can be written */
> -#define PROT_EXEC	0x4		/* page can be executed */
> -#ifndef PROT_SEM /* different on mips and xtensa */
> -#define PROT_SEM	0x8		/* page may be used for atomic ops */
> -#endif
> -/*			0x10		   reserved for arch-specific use */
> -/*			0x20		   reserved for arch-specific use */
> -#define PROT_NONE	0x0		/* page can not be accessed */
> -#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
> -#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
> -
>  /* 0x01 - 0x03 are defined in linux/mman.h */
>  #define MAP_TYPE	0x2b		/* Mask for type of mapping, includes bits 0x08 and 0x20 */
>  #define MAP_FIXED	0x04		/* Interpret addr exactly */
> @@ -43,61 +30,12 @@
>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
>
>  /*
> - * Flags for mlock
> - */
> -#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
> -
> -/*
> - * Flags for msync
> + * Flags for msync, order is different from all others
>   */
>  #define MS_SYNC		1		/* synchronous memory sync */
>  #define MS_ASYNC	2		/* sync memory asynchronously */
>  #define MS_INVALIDATE	4		/* invalidate the caches */
>
> -#define MADV_NORMAL	0		/* no further special treatment */
> -#define MADV_RANDOM	1		/* expect random page references */
> -#define MADV_SEQUENTIAL	2		/* expect sequential page references */
> -#define MADV_WILLNEED	3		/* will need these pages */
> -#define MADV_DONTNEED	4		/* don't need these pages */
> -
> -/* common parameters: try to keep these consistent across architectures */
> -#define MADV_FREE	8		/* free pages only if memory pressure */
> -#define MADV_REMOVE	9		/* remove these pages & resources */
> -#define MADV_DONTFORK	10		/* don't inherit across fork */
> -#define MADV_DOFORK	11		/* do inherit across fork */
> -
> -#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
> -#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
> -
> -#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
> -#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
> -
> -#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
> -					   overrides the coredump filter bits */
> -#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
> -
> -#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
> -#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
> -
> -#define MADV_COLD	20		/* deactivate these pages */
> -#define MADV_PAGEOUT	21		/* reclaim these pages */
> -
> -#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
> -#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
> -
> -#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
> -
> -#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
> -
> -#define MADV_HWPOISON	100		/* poison a page for testing */
> -#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
> -
> -/* compatibility flags */
> -#define MAP_FILE	0
> -
> -#define PKEY_DISABLE_ACCESS	0x1
> -#define PKEY_DISABLE_WRITE	0x2
> -#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
> -				 PKEY_DISABLE_WRITE)
> +#include <asm-generic/mman-common.h>
>
>  #endif /* __PARISC_MMAN_H__ */
> diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> index 2911dd14ef2a..81a14ed99197 100644
> --- a/include/uapi/asm-generic/mman-common.h
> +++ b/include/uapi/asm-generic/mman-common.h
> @@ -27,15 +27,20 @@
>  /*
>   * Flags for msync
>   */
> +#ifndef MS_ASYNC /* different order on alpha and parisc */
>  #define MS_ASYNC	1		/* sync memory asynchronously */
>  #define MS_INVALIDATE	2		/* invalidate the caches */
>  #define MS_SYNC		4		/* synchronous memory sync */
> +#endif
>
>  #define MADV_NORMAL	0		/* no further special treatment */
>  #define MADV_RANDOM	1		/* expect random page references */
>  #define MADV_SEQUENTIAL	2		/* expect sequential page references */
>  #define MADV_WILLNEED	3		/* will need these pages */
> +/* 4 through 6 are different on alpha */
> +#ifndef MADV_DONTNEED
>  #define MADV_DONTNEED	4		/* don't need these pages */
> +#endif

Rather nice to have these differences both de-duplicated and documented
here...

>
>  /* common parameters: try to keep these consistent across architectures */
>  #define MADV_FREE	8		/* free pages only if memory pressure */
> --
> 2.39.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
