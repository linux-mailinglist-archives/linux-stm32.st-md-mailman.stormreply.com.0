Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AZEMokXwWn5QQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FE2F031F
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1352AC87ED4;
	Mon, 23 Mar 2026 10:35:53 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazolkn19012062.outbound.protection.outlook.com [52.103.2.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACE35C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 04:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCfOTcVkN+MJK3Jh06UvxjDCUc5A+5aFISjcZJogegWIqsoBoAxYW7++ud2uy0UlKhplHciU6TdfVSuDs2FdQkwQlEL3zYsqQw10VJMAtZH78t3ANVViCgkdasQQirKUuIIU0wi8KyeGq20fP9JLbdpkTSNNgDaBLJmlN3La9MaRjjerdBJnxk/ZpHTCCpThQrpb1Jp+Pwr5UtaMw/ePvbzzLkLpHXNdO3PXke6shBQBsjOmM8e3+W3zVcVL/F+j1lSXMCP87rDr3+Ja6vLcLMqoHpyfvWpuJS8uuGamU4E6A3ccx8wzgQHqfwUrAbPUCXmbG6y0FoAlXHcgq8O23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCvlBXZ99NDG5pUFS9gt2G6Z2/x0v6v15bYfZuhB25U=;
 b=d9YM24qG78WxbUeoehMX2UN9+YpL7gRbqhFyN9lVphDvbyL+Q9QmLLysGN2xxlGVqfTjAUbU4L+talLB0ww12wh46CJtENV+B8wY51IOAhO247MoW8UW2mo/rs40Rt7tU45VYTez1zAvTSEMfxh7Cxerq+ZKR6mCr3CoYMXD34IVk6fRUCCrWjbWyiwPpkXcxY2hhu/X1JdpbEAdcqa+IssjvxMab/uFJb1DuT4C1NLsirEqNd2/13HYh8QDVE0fr3DXxSHwwQtFHKsLOU7GAp1snrdXN2tv40c0nXZh64kPhHxw7kuUAjDQv4CWVEvjw2Bf5tbLQbpTpHOfAze66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCvlBXZ99NDG5pUFS9gt2G6Z2/x0v6v15bYfZuhB25U=;
 b=hkdGdBl4GhpKB4eBfHmXOjRFGtlCoLErRHJ3nFK7ly5al1EUpRTQUQ4xXVjZH5Q3Khffc1y8yhyWNYBs+jzN/4aJQsaDLdKKAu6NMgBMT6xJHD0tFplc7xCQS0VKnXkzoU8pMRHxFYAEfGwDg/UJHCb7Qe7Vyoickj7I/o80/WPAMAqXcGcU+xQRM3wOsrXhYupAzfWeyVwF6LYyIP3hJBts9aSr+qB48wCwWAna6oXFI1qGMeG8YkYA9UOSwSULSVHUjKeI/ZUIoZV5kKTLMZXQekpInERU9SbCK2SIIFG2y753n6U9s5bc6EkbWSSYfK+ygfqmqLFPLkJ6cRTcgQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA0PR02MB9193.namprd02.prod.outlook.com (2603:10b6:208:43a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 04:16:20 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9723.018; Mon, 23 Mar 2026
 04:16:20 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Long Li <longli@microsoft.com>, "Lorenzo Stoakes (Oracle)"
 <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Thread-Topic: [PATCH v4 18/21] drivers: hv: vmbus: replace deprecated mmap
 hook with mmap_prepare
Thread-Index: AQJN0rqm5S7tosaoM3nkaYB8eJypuAGlwE9MtMwd4aA=
Date: Mon, 23 Mar 2026 04:16:20 +0000
Message-ID: <SN6PR02MB41573DF211DA2469D7FFE892D44BA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <cover.1774045440.git.ljs@kernel.org>
 <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
In-Reply-To: <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA0PR02MB9193:EE_
x-ms-office365-filtering-correlation-id: 39a7b7e5-fd47-45ff-0fe0-08de8892f01f
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|31061999003|13091999003|19110799012|8060799015|8062599012|37011999003|15080799012|12121999013|3412199025|440099028|102099032|40105399003|41105399003|53005399003;
x-microsoft-antispam-message-info: =?us-ascii?Q?/N3H04TX5bQahuSHyUaieq8RAF4eEp0DeU+m1gxuxPYqKo05Rg5bEthYXy0N?=
 =?us-ascii?Q?7SH4HlohLeS6InvGttrjB4SxysDESZLPBoQWfq1pWOWy8V0RwCCEjYRyroMM?=
 =?us-ascii?Q?PiWCMUEwQdoQ2TLCfacF5D5JPl5FfMWhTCjfOmnuJ/XJqM2HhZfJJTCCdP/s?=
 =?us-ascii?Q?mtCJwE/7NlQ1YQBHAsToPL3VKQ//bY73JrFHJAg04TFtTxnVsuYkwaMkaWQ5?=
 =?us-ascii?Q?CjUUcz8WwXXvJ2OrkvZDAxrcu/CsAS+QypPLO+l2y6tER5FdizzmttuZ+RhD?=
 =?us-ascii?Q?vGzzgKeyNib5W5I1Jvqo2LSp9K7+EVQlnLuVvlE+q8Vwi5KiM0cP/1WL4vcl?=
 =?us-ascii?Q?1iFsRh3nMwOMWFNhMVAw4mfIpB/P7NpVPHcaTb18aL01uAuik7JWV1cw0Hk6?=
 =?us-ascii?Q?jHImw/whHJn4lEh8QQZl/kJHUZWrxNIGMXH8e3pLjMsF4yZJJHfbnwO6ti0G?=
 =?us-ascii?Q?fZ2LNG8NCyjQpvHfdOENae8alVB4aqAsrX18h2QLJVjGrCQSvprRgUVMZKGG?=
 =?us-ascii?Q?Oz5G5hw4YCBiRWG0E8UXiKVOnGvk/Tgk2P6wBEEdZ71L1sTSu3cAWHcrmHE/?=
 =?us-ascii?Q?0XGrG/GnnnTmgOM1g1WYEQ68kJBpKBn1vyxZkF63sWG+b1l5ysyjUwbFzLOv?=
 =?us-ascii?Q?ypEv74WbTjJ2SPsrZAZxD2N4IqYbvIq0ZNbroUGEKJNd8LGY6YwHjkHRwxwv?=
 =?us-ascii?Q?NiKKDVYdcKXUf61EB0AKbHXPBq0Eg+b76UpRtHbmbjdIBWfrTUVoo47QXzJU?=
 =?us-ascii?Q?CPMgw3HHhTFXHztdrE1aWtJeiMRbyC/PRiIGxf2atZatkjfe5A+pArLRqnb2?=
 =?us-ascii?Q?fnK7OkffAlcRzD+lkYY14VQG7uew80QoDEVx5mXYq1qBYX+3v8q5qanYVj0C?=
 =?us-ascii?Q?Vpb1FgEwlpgCV13XnGRc6lqclLC5MtsW8kzGgbxMcWyT4LYpKq6WpJtvnpaz?=
 =?us-ascii?Q?HgfFhxUq62jDj6JgzEMEhx7fUrD3V0J6fCfVchBE26lg3WgveIQBCYcK1qEz?=
 =?us-ascii?Q?7bA8gm2IeSLoxeicTkzr1/AzKieOvz+rWKmNOyDMaJ7wmGc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pAMnP1LvvhF6KDwQuSIFbjHW8GgI+vXR6DbPhPgwY7SHNdHVXCQ9HaN3O2lo?=
 =?us-ascii?Q?HCs2smjpU0aA6wKe89W5KOYn7KnlqqvDpej/UGUbpFK6dToRKGXKbWQWmvZ6?=
 =?us-ascii?Q?NlQfqGQbgtrVCNczIH2pMIFB7AYgVIGAttry3EdFXRS8nuozl/sWJdCJOzZn?=
 =?us-ascii?Q?TkyDp6mpsaLiXS3/1nJLjfZw94prMwcak27DqlV0HDRYBu9aDnTG3hzT41r/?=
 =?us-ascii?Q?P5mjl4A+bGyp5SSG/h4g6+5VRc9QADCNkq4mSuw0rmINiM5BIiPhqtAv9FG4?=
 =?us-ascii?Q?R/yoiwHjTwrjNf12DhFLgq4pedb/rrhvQTd8ggKIAUdpg7PaAfBooBPoh9YL?=
 =?us-ascii?Q?7OmoCBbOGozkr0ysbUr1C1b+zmCB/2Es32Iq2m5lk8LVZB9Gm6ag0DlYxufH?=
 =?us-ascii?Q?U9dPHDHSFSVFT8PWzB4aB5rIVseQKu0ki7jlUvkPovmqJcZU/D8tQhmIvbw7?=
 =?us-ascii?Q?VBpfOln/+y9OU+idyZmvLe4CZ0hUq81M525qlghOvgy+VlQVBmWfxBJqHjCC?=
 =?us-ascii?Q?zLQC1BW0oSL06F3LsHA2843eMJlIJXFuustI7ZoAAlZicR/qgM0d12P7lSmE?=
 =?us-ascii?Q?zlIJHXS3TFjHV4S+dc/eyEiYVo59KSeiC01WcJMD/8iKrjs3iNmEBMU8yGwk?=
 =?us-ascii?Q?dPqfwplnl4VashuIWIlUh6RDbomjJsbDV7DdWVODh07HelgIsQaNIaCv+2Cn?=
 =?us-ascii?Q?MgCGrxrnbOAOpbMv+0njzuL1fjySU8OC8PsdeNzLJWaacuQrk55yFar9WSUP?=
 =?us-ascii?Q?V9f5oMNkQQr5IwEhiHNg6mGSmnVgWvof/vALd5y/VzeO8nPtoRXfw6uXxBDf?=
 =?us-ascii?Q?usv5O748XBNIuvGWHd54GcnwUC2qnRlemQBMN/cL9LIvL9tbnh5PBKJKJ6P1?=
 =?us-ascii?Q?JDcGYxLcW8fxNyXXyS+FDHrGYW8bz+Q4BlkHrIvxm3qgeoHeSOebN6aA9qTB?=
 =?us-ascii?Q?0pjNBiXu/OJSrn7w9sJHWG1uys2agIEeHFVTSU1jXb0INe2GkG/MbX6dvC7f?=
 =?us-ascii?Q?T+nqZ3S7mwWAQzv/pK/aiNwEPVXWC/0bMgSfXTGSFE2Kq3hRu7pL9R5B4I89?=
 =?us-ascii?Q?rPGPtLKHpG6YW+fSuVD6zzvp7anVQAmcRKM3zfEsI2XBr03XegxQdtxuximM?=
 =?us-ascii?Q?PUXExKxk8G+thuLDCWkertAMsb8HJNm4yv+2cF9tb1b8a124oLTvj2S6hpsh?=
 =?us-ascii?Q?Bf3EFX2CrQUjHdRfZKlKSSAxkujLMJK3AtLx3Q17IPA40QdOFXwQLutI7yxA?=
 =?us-ascii?Q?tFnogOlM9DijqvgOCL8YqXBy9Qr1uY2SFQLb0iaixSXbWow7+fu6Lwl1C4dD?=
 =?us-ascii?Q?HneraP9k0fQ3+IOA4qLCFgZgNR34FAktHImiSbpDkodftG+5+JAh9ZEFtX+n?=
 =?us-ascii?Q?4qbj2yA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a7b7e5-fd47-45ff-0fe0-08de8892f01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 04:16:20.7940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9193
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:35:52 +0000
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, David Howells <dhowells@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Wei Liu <wei.liu@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 18/21] drivers: hv: vmbus: replace
 deprecated mmap hook with mmap_prepare
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[outlook.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mhklinux@outlook.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:longli@microsoft.com,m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kern
 el@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5D2FE2F031F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lorenzo Stoakes (Oracle) <ljs@kernel.org> Sent: Friday, March 20, 2026 3:40 PM
> 
> The f_op->mmap interface is deprecated, so update the vmbus driver to use
> its successor, mmap_prepare.
> 
> This updates all callbacks which referenced the function pointer
> hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
> utilising the newly introduced compat_set_desc_from_vma() and
> __compat_vma_mmap() to be able to implement this change.
> 
> The UIO HV generic driver is the only user of hv_create_ring_sysfs(),
> which is the only function which references
> vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
> external interface to hv_mmap_prepare_ring_buffer.
> 
> This patch therefore updates this caller to use mmap_prepare instead,
> which also previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  drivers/hv/hyperv_vmbus.h    |  4 ++--
>  drivers/hv/vmbus_drv.c       | 31 +++++++++++++++++++------------
>  drivers/uio/uio_hv_generic.c | 11 ++++++-----
>  include/linux/hyperv.h       |  4 ++--
>  4 files changed, 29 insertions(+), 21 deletions(-)
> 

There are two mmap() code paths in the Hyper-V UIO code. One path is
to mmap() the file descriptor for /dev/uio<n>, and the other is to mmap()
the "ring" entry under /sys/devices/vmbus/devices/<uuid>. The former is
done by uio_mmap(), and the latter by hv_uio_ring_mmap_prepare().

I tested both these paths using a combination of two methods in a
x86/x64 VM on Hyper-V:

1) Using the fcopy daemon, which maps the ring buffer for the primary
channel and sends/receives messages with the Hyper-V host. This
method tests only the 1st path because the fcopy daemon doesn't create
any subchannels that would use the "ring" entry.

2) Using a custom-built test program. This program doesn't communicate
with the Hyper-V host, but allows mostly verifying both code paths for the
primary channel. As a sanity check, it verifies that the two mmaps are
mapping the same memory, as expected.

As such,

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>

The most robust test would be to run DPDK networking against
UIO, as it would communicate with the Hyper-V host and use
multiple subchannels that resulting in mmap'ing the "ring"
entry under /sys.

@Long Li -- I'll leave it to your discretion as to whether you want
to test DPDK against these mmap() changes.

I've noted one minor issue below.

[snip]

--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1015,8 +1015,8 @@ struct vmbus_channel {
 	/* The max size of a packet on this channel */
 	u32 max_pkt_size;
 
-	/* function to mmap ring buffer memory to the channel's sysfs ring attribute */
-	int (*mmap_ring_buffer)(struct vmbus_channel *channel, struct vm_area_struct *vma);
+	/* function to mmap_prepare ring buffer memory to the channel's sysfs ring attribute */

Changing the comment from "mmap ring buffer" to "mmap_prepare ring buffer"
produces awkward wording since "mmap" is used here as a verb.  It might be better
to just leave the comment unchanged.

Michael


+	int (*mmap_prepare_ring_buffer)(struct vmbus_channel *channel, struct vm_area_desc *desc);
 
 	/* boolean to control visibility of sysfs for ring buffer */
 	bool ring_sysfs_visible;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
