Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8277B4E8
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 10:57:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57769C6B472;
	Mon, 14 Aug 2023 08:57:43 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6FC6C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 08:57:41 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37E7juZ7011729; Mon, 14 Aug 2023 01:55:20 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3sfg1pr6ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 01:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkAZ+W/lcO2EAbCs+P1+p0m2cT6KHZyIW9nZUfVtZj/yaS9kX9fSSriJKG/5O/QOcVUMf2bvp3SbKWdDKsqeXozU3PVl+IfSV8M97QmAtTrGW6SHpoNM4B8c17OkUp7+yvNpY2Z0XXTwGgOu8eha4AEwLW9cYQQgm53GOwaEgPRNENBpvkE1+NydQ//wGFXSaogGO1jyBAyphFRsPVRZZE0M2dEtBs7tyZmNK37WZr92CMAzQi6u/jmIAKCook2OxirPB06tMDUA4HcAi/Eu/Nj9BwwD3FPS9A7HXHIu3zY4RItWtE9v798pRFGlhSAx8rvAry+L7LHKy7p/o+g/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKlbzCrY1DtBhUGV1M+DO81GolN0fk0rkI9WgvE6w74=;
 b=JfejF8wIyOlLVvzz3JYixBaVKCVBDmLM5W7mwwcVGxCrZcGAVbI4CLhmamy1KHljPqgL2M/wG4H14D4G51vNmjWYx4/yNq2DtcHSQ+T/g1YU6y7q52Z+EZnDwEjRlIxNVEDTuTBFevSKsdD9Rj16Y8yXgGwL9cKw7XogRZplbfpYvTQbj01/wMAWiKvGHucuyLIZQnpyAeO7cpV/pJm4BysfbcJ7wcbk7RPPgDPVdpqLktWQodPltG1ympFoEBD+NOwB/vKSTlqN0fqxhQLFITKYdVTB6qFhG8StD5xMGiNB2w6Z7F/01pbUa0v6f7ogDoQLYwOdRnuTHggJyLzFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKlbzCrY1DtBhUGV1M+DO81GolN0fk0rkI9WgvE6w74=;
 b=cEN1Mlb9YziNR8pu0Zx5zNgYERC4KvFlvhFb2F07Bz7dfoZ8a8WdcjvTGpp8ZALUYiK4pqvlEci5MfmAvJyM9ToQV1MFCXSBOg4C/p+9YiMhNJbYHbSujI1R5DdMFGZ7wPP7crr/5Cft6HseQPdxL/6Wk6qMklhX/he+1pdKmtY=
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 (2603:10b6:301:68::33) by BN9PR18MB4218.namprd18.prod.outlook.com
 (2603:10b6:408:137::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 08:55:15 +0000
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::9ee9:35fc:cabe:11a1]) by MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::9ee9:35fc:cabe:11a1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:55:15 +0000
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
Thread-Index: AQHZznU+ZcDNaqRkgEScX+JwHjZ6da/pbFAAgAAB4aCAAAxOAIAAARQQ
Date: Mon, 14 Aug 2023 08:55:14 +0000
Message-ID: <MWHPR1801MB19182915C64A7C7611F326F7D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
 <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
 <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
 <cceef8a4-6f38-bfd4-4f77-5dffa558b287@kernel.org>
In-Reply-To: <cceef8a4-6f38-bfd4-4f77-5dffa558b287@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jY210aGJtNXZkR2hjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAwTmpjd05XUTRPQzB6WVRnd0xURXhaV1V0WWpabU55MDRNRE00?=
 =?utf-8?B?Wm1KbU1tTTJNakpjWVcxbExYUmxjM1JjTkRZM01EVmtPR0V0TTJFNE1DMHhN?=
 =?utf-8?B?V1ZsTFdJMlpqY3RPREF6T0daaVpqSmpOakl5WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhNek13SWlCMFBTSXhNek16TmpRM05qa3hNVGN4T1RnNE1qY2lJR2c5SW1w?=
 =?utf-8?B?d1pWZFBaR3RRWjBWd1QwTk9lRUUyY1ZjcmNqZEZjRU5QTUQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVZEpWMEZCUkhKWFkyZEphbU0zV2tGWGQwNHdjMkZWUTI5VFNt?=
 =?utf-8?B?SkJNMU40Y0ZGTGFFbHJXa0ZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVKMVJIZEJRVE5uT0VGQlNWRkhRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJSVUpCUVVGQlNUZHhWSEJCUTBGQlVVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZhUVVKNVFVZFZRV04zUW5wQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMDFCWkZGQ2VrRklVVUZpZDBKMFFVWTRRV05C?=
 =?utf-8?B?UW14QlNFbEJZM2RDZGtGSE5FRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsM1FqRkJTRTFCWkVGQ2Rr?=
 =?utf-8?B?RkhNRUZZZDBKM1FVZG5RV0ozUW5WQlIxVkJZbWRDTVVGSE1FRlpaMEpzUVVo?=
 =?utf-8?B?SlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnFRVWhW?=
 =?utf-8?B?UVdOM1FqQkJSemhCWWxGQ1prRklUVUZqZDBKMVFVWTRRVnBCUW1oQlNFMUJZ?=
 =?utf-8?B?VUZDWmtGSVdVRk5RVUY1UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?Q?FBQUFB?=
x-dg-refone: =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJtZEJRVUZI?=
 =?utf-8?B?VFVGa1VVSjZRVWhSUVdKM1FuUkJSamhCWTNkQ2VrRkhORUZZZDBKeVFVZFZR?=
 =?utf-8?B?V1ZSUWpOQlJ6aEJZMmRDYTBGSVRVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZEUVVGQlFV?=
 =?utf-8?B?RkJRMlZCUVVGQldYZENNVUZJVFVGa1FVSjJRVWN3UVZoM1FucEJTRTFCWW1k?=
 =?utf-8?B?Q1prRkhORUZpZDBKclFVZFZRV0pCUW5CQlJ6QkJZVkZDTUVGSFZVRmpaMEpt?=
 =?utf-8?B?UVVoWlFVMUJRWGxCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlNVRkJRVUZCUVVvMFFVRkJRbXBCU0ZWQlkzZENNRUZIT0VGaVVVSm1R?=
 =?utf-8?B?VWhOUVdOM1FuVkJSamhCWTNkQ2QwRkhSVUZaZDBKc1FVWTRRV1JuUVhkQlJF?=
 =?utf-8?B?bEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkZRVUZCUVVGQlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVkUlFXSkJRbmRCUmpo?=
 =?utf-8?B?QlkzZENja0ZJYTBGalFVSnNRVVk0UVZsM1FtOUJSMFZCWkVGQ1prRkhNRUZh?=
 =?utf-8?B?VVVKNlFVaE5RVmxSUW01QlIxVkJXSGRDTWtGRVFVRk5aMEZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVGQlFVRmFR?=
 =?utf-8?B?VUp6UVVoQlFWaDNRbnBCUjNkQldWRkNha0ZIYzBGWWQwSnFRVWRuUVZsUlFq?=
 =?utf-8?B?QkJSamhCWWxGQ2JFRklUVUZqZDBKb1FVZGpRVnBSUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?Q?FBQUFB?=
x-dg-reftwo: =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJR?=
 =?utf-8?B?VUZDYTBGSGQwRmpRVUptUVVoUlFWcFJRbWhCUnpCQlkzZENaa0ZIT0VGaVow?=
 =?utf-8?B?SnNRVWRSUVdOblFuQkJTRmxCV2xGQ1prRkhXVUZoVVVKelFVZFZRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBG?=
 =?utf-8?B?QlFVRkJRVzVuUVVGQlIxVkJZbEZDYUVGSGEwRmlRVUptUVVkRlFWcEJRbXRC?=
 =?utf-8?B?U0VsQldsRkNla0ZJVFVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlEwRkJRVUZCUVVObFFVRkJRV0pSUW1oQlNFbEJaR2RDYkVGSGQw?=
 =?utf-8?B?RllkMEozUVVoSlFXSjNRbkZCUjFWQldYZENNRUZHT0VGaVowSm9RVWN3UVZw?=
 =?utf-8?B?UlFucEJSamhCV1hkQ2RrRkhORUZhWjBKd1FVZFJRVnBSUW5WQlNGRkJZVkZD?=
 =?utf-8?B?YUVGSGQwRllkMEpvUVVkM1FXSjNRblZCUjFWQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkNRVUZCUVVGQlFVRkJRVWxCUVVGQlFVRktORUZCUVVKMFFVZEZRV05u?=
 =?utf-8?B?UWpKQlIxVkJZa0ZDWmtGSVFVRmpaMEoyUVVkdlFWcFJRbXBCU0ZGQldIZENk?=
 =?utf-8?B?VUZIUlVGaVVVSnNRVWhOUVZoM1FubEJSMVZCWTNkQ01FRklTVUZoVVVKcVFV?=
 =?utf-8?B?aFJRVnBSUW10QlJqaEJXVkZDYzBGSE9FRmlaMEpzUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVGblFVRkJRVUZCYm1kQlFV?=
 =?utf-8?B?RkhNRUZaVVVKNVFVaFpRVnBSUW5OQlJqaEJZMEZDZVVGSE9FRmhaMEpzUVVk?=
 =?utf-8?B?TlFXUkJRbVpCUnpSQldWRkNkRUZIVlVGamQwSm1RVWhKUVZwUlFucEJTRkZC?=
 =?utf-8?B?WTJkQ2NFRkhUVUZrUVVKc1FVZFJRVmgzUW05QlIxVkJaVUZDYWtGSE9FRmFR?=
 =?utf-8?B?VUpzUVVoTlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJRVUZCUVVGQlFVRkRRVUZC?=
 =?utf-8?B?UVVGQlEyVkJRVUZCWWxGQ2FFRklTVUZrWjBKc1FVZDNRV0pCUW1aQlIwVkJZ?=
 =?utf-8?B?MmRDZEVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?Q?FBQUFB?=
x-dg-refthree: =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUpCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?U1VGQlFVRkJRVW8wUVVGQlFuUkJSMFZCWTJkQ01rRkhWVUZpUVVKelFVWTRR?=
 =?utf-8?B?VnAzUW5aQlJ6aEJXbmRDYzBGSFZVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGRlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFXZEJRVUZCUVVGdVowRkJRVWN3UVZsUlFubEJTRmxCV2xG?=
 =?utf-8?B?Q2MwRkhkMEZZZDBKM1FVaEpRV0ozUW5GQlIxVkJXWGRDTUVGR09FRlpkMEoy?=
 =?utf-8?B?UVVkUlFWcFJRbnBCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVGaVVVSm9R?=
 =?utf-8?B?VWhKUVdSblFteEJSM2RCWWtGQ1prRklRVUZqWjBKMlFVZHZRVnBSUW1wQlNG?=
 =?utf-8?B?RkJXSGRDYWtGSE9FRmFRVUpzUVVoTlFWaDNRbXRCUjJ0QldYZENNRUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJRVUZCU2pS?=
 =?utf-8?B?QlFVRkNkRUZIUlVGalowSXlRVWRWUVdKQlFuTkJSamhCWTBGQ2VVRkhPRUZo?=
 =?utf-8?B?WjBKc1FVZE5RV1JCUW1aQlJ6UkJXVkZDZEVGSFZVRmpkMEptUVVkTlFXSjNR?=
 =?utf-8?B?blZCUjFsQllWRkNhMEZIVlVGaVowSXdRVWRyUVZsUlFuTkJSamhCWWxGQ2FF?=
 =?utf-8?B?RklTVUZrWjBKc1FVZDNRV0pCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVVkJRVUZCUVVGQlFVRkJa?=
 =?utf-8?B?MEZCUVVGQlFXNW5RVUZCUnpCQldWRkNlVUZJV1VGYVVVSnpRVWQzUVZoM1Fu?=
 =?utf-8?B?ZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVWTRRV0puUW1oQlJ6QkJXbEZDZWtG?=
 =?utf-8?B?R09FRlpkMEoyUVVjMFFWcG5RbkJCUjFGQldsRkNkVUZJVVVGaFVVSm9RVWQz?=
 =?utf-8?B?UVZoM1FuUkJSMFZCWTJkQ01rRkhWVUZpUVVKelFVWTRRV0ozUW5sQlJqaEJX?=
 =?utf-8?B?VkZDZVVGSE1FRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?Q?FBQUFB?=
x-dg-reffour: =?utf-8?B?UVVGQlFVRkJRVUZCUVdkQlFVRkJRVUZCUVVGQlFVRkJRVUZSUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUTBGQlFVRkJRVU5sUVVGQlFXSlJRbWhCU0VsQlpHZENiRUZIZDBGaVFV?=
 =?utf-8?B?Sm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZZZDBKMVFVZEZRV0pSUW14?=
 =?utf-8?B?QlNFMUJXSGRDYWtGSE9FRmlaMEp0UVVkclFWcEJRbXhCUnpSQlpFRkNjRUZI?=
 =?utf-8?B?UlVGaVFVSm1RVWN3UVZsUlFubEJTRmxCV2xGQ2MwRkhkMEZZZDBKMlFVaEpR?=
 =?utf-8?B?VmgzUW01QlJ6aEJZbmRDYmtGSGQwRmFVVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?Q1FVRkJRVUZCUVVGQlFVbEJRVUZCUVVGS05FRkJRVUowUVVkRlFXTm5RakpC?=
 =?utf-8?B?UjFWQllrRkNjMEZHT0VGalFVSjVRVWM0UVdGblFteEJSMDFCWkVGQ1prRkhO?=
 =?utf-8?B?RUZaVVVKMFFVZFZRV04zUW1aQlNFbEJXbEZDZWtGSVVVRmpaMEp3UVVkTlFX?=
 =?utf-8?B?UkJRbXhCUjFGQldIZENkRUZIUlVGalowSXlRVWRWUVdKQlFuTkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJSVUZCUVVGQlFVRkJRVUZuUVVGQlFVRkJibWRCUVVGSE1F?=
 =?utf-8?B?RlpVVUo1UVVoWlFWcFJRbk5CUjNkQldIZENkMEZJU1VGaWQwSnhRVWRWUVZs?=
 =?utf-8?B?M1FqQkJSamhCWW1kQ2FFRkhNRUZhVVVKNlFVWTRRV05uUW14QlNFMUJaRUZD?=
 =?utf-8?B?ZVVGSGEwRlpkMEl3UVVkVlFWcEJRbVpCUnpCQldWRkNlVUZJV1VGYVVVSnpR?=
 =?utf-8?B?VWQzUVZoM1FuWkJTRWxCV0hkQ2FFRklTVUZpVVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVZGQlFVRkJRVUZCUVVGRFFVRkJRVUZC?=
 =?utf-8?B?UTJWQlFVRkJZbEZDYUVGSVNVRmtaMEpzUVVkM1FXSkJRbVpCU0ZGQldsRkNl?=
 =?utf-8?B?VUZITUVGaFVVSjFRVWhWUVdOM1FVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVSkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJTVUZCUVVGQlFVbzBRVUZCUW5SQlIwVkJZMmRDTWtGSFZVRmlRVUp6UVVZ?=
 =?utf-8?B?NFFXUjNRblpCU0VsQldrRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlFVRkJRVUZG?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVdkQlFVRkJRVUZvUVZsQlFVRkJRVUZCUVdOQlFVRkJR?=
 =?utf-8?B?VkZCUVVGQlFVRkJRVU5zVGtaRGRUZDBkRk5UY1hWR2JuVkJTazlsTlVSSVFV?=
 =?utf-8?Q?FBQUFF?=
x-dg-reffive: =?utf-8?B?UVVGQlFVRkJRVUZCTVRCblptTmlNVXh6YTJWUVQzSTFTSFpRUlRGeGVXOUJR?=
 =?utf-8?B?VUZCUWtGQlFVRkpaMEZCUVVGQlFVRkJRbXBCUnpoQlltZENiVUZIYTBGYVFV?=
 =?utf-8?B?SnNRVWMwUVdSQlFuQkJSMFZCWWtGQlFVRkNiMGRCUVVGYVFVRkJRVWRCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDYUVGSFVVRmFRVUo1UVVkVlFXTjNRbnBCUVVGQlNrRkJRVUZC?=
 =?utf-8?B?UVVGQlFVSnFRVWhWUVdOM1FqQkJSemhCWWxGQ1prRklRVUZhVVVKNVFVaE5R?=
 =?utf-8?B?V0ozUW5WQlFVRkJUR2RCUVVGQlFVRkJRVUpxUVVoVlFXTjNRakJCUnpoQlls?=
 =?utf-8?B?RkNaa0ZJUVVGaFFVSjJRVWMwUVZwUlFuVkJTRlZCWWxGQ2FVRkhWVUZqWjBG?=
 =?utf-8?B?QlFVUkJRVUZCUVVGQlFVRkJXWGRDTVVGSVRVRmtRVUoyUVVjd1FWaDNRbnBC?=
 =?utf-8?B?U0UxQlltZENaa0ZIVVVGWlVVSjZRVWRuUVZoM1FqSkJSRUZCVFdkQlFVRkVR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVmwzUWpGQlNFMUJaRUZDZGtGSE1FRllkMEo2UVVoTlFX?=
 =?utf-8?B?Sm5RbVpCUjNOQldsRkNOVUZJWTBGaWQwSjVRVWRSUVdOM1FVRkJSRFJCUVVG?=
 =?utf-8?B?QlFVRkJRVUZaZDBJeFFVaE5RV1JCUW5aQlJ6QkJXSGRDZWtGSVRVRmlaMEpt?=
 =?utf-8?B?UVVjMFFXSjNRbXRCUjFWQllrRkNjRUZITUVGaFVVSXdRVWRWUVdOblFtWkJT?=
 =?utf-8?B?RmxCVFVGQmVVRkJRVUZOWjBGQlFVRkJRVUZCUW1wQlNGVkJZM2RDTUVGSE9F?=
 =?utf-8?B?RmlVVUptUVVoTlFXTjNRblZCUmpoQlkzZENkMEZIUlVGWmQwSnNRVVk0UVdS?=
 =?utf-8?B?blFYZEJSRWxCUVVGQkswRkJRVUZCUVVGQlFVZFJRV0pCUW5kQlJqaEJZM2RD?=
 =?utf-8?B?Y2tGSWEwRmpRVUpzUVVZNFFWbDNRbTlCUjBWQlpFRkNaa0ZITUVGYVVVSjZR?=
 =?utf-8?B?VWhOUVZsUlFtNUJSMVZCV0hkQ01rRkVRVUZOWjBGQlFVUlpRVUZCUVVGQlFV?=
 =?utf-8?B?RkJXa0ZDYzBGSVFVRllkMEo2UVVkM1FWbFJRbXBCUjNOQldIZENha0ZIWjBG?=
 =?utf-8?B?WlVVSXdRVVk0UVdKUlFteEJTRTFCWTNkQ2FFRkhZMEZhVVVGQlFVUm5RVUZC?=
 =?utf-8?B?UVVGQlFVRkJXa0ZDYzBGSVFVRllkMEl3UVVkVlFWbFJRblJCU0UxQldIZENk?=
 =?utf-8?B?a0ZITkVGYVVVSnJRVWhKUVdGUlFqSkJSMVZCV0hkQ2JVRkhhMEZpUVVKc1FV?=
 =?utf-8?B?RkJRVXBCUVVGQlFVbEJRVUZDYkVGSE1FRlpVVUp3UVVkM1FWaDNRbWhCUjFG?=
 =?utf-8?B?QldrRkNlVUZIVlVGamQwSjZRVUZCUVZkQlFVRkJRVUZCUVVGQ2RFRkhSVUZq?=
 =?utf-8?B?WjBJeVFVZFZRV0pCUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVoUlFWaDNR?=
 =?utf-8?B?blZCUjBWQllsRkNiRUZJVFVGWWQwSnFRVWM0UVdKblFtMUJSMnRCV2tGQ2JF?=
 =?utf-8?B?RkhORUZrUVVKd1FVZEZRV0pCUW1aQlIwVkJZa0ZDZGtGSE5FRmFVVUZCUVVa?=
 =?utf-8?B?UlFVRkJRVUZCUVVGQllsRkNhRUZJU1VGa1owSnNRVWQzUVZoM1FuZEJTRWxC?=
 =?utf-8?B?WW5kQ2NVRkhWVUZaZDBJd1FVWTRRV0puUW1oQlJ6QkJXbEZDZWtGR09FRmpa?=
 =?utf-8?B?MEpzUVVoTlFXUkJRbmxCUjJ0QldYZENNRUZIVlVGYVFVSm1RVWRGUVdKQlFu?=
 =?utf-8?B?WkJSelJCV2xGQlFVRkdiMEZCUVVGQlFVRkJRV0pSUW1oQlNFbEJaR2RDYkVG?=
 =?utf-8?B?SGQwRllkMEozUVVoSlFXSjNRbkZCUjFWQldYZENNRUZHT0VGaVowSm9RVWN3?=
 =?utf-8?B?UVZwUlFucEJSamhCWTJkQ2JFRklUVUZrUVVKNVFVZHJRVmwzUWpCQlIxVkJX?=
 =?utf-8?B?a0ZDWmtGSFowRmFVVUkwUVVkTlFXSjNRbXRCUjFWQlkzZEJRVUZEUVVGQlFV?=
 =?utf-8?Q?FBQUFB?=
x-dg-tag-bcast: {BB38C8B4-BBDA-40C5-8168-0013E523D1A2}
x-dg-refsix: =?utf-8?B?UVdKUlFtaEJTRWxCWkdkQ2JFRkhkMEZpUVVKbVFVZEZRV05uUW5SQlFVRkJT?=
 =?utf-8?B?bWRCUVVGQlFVRkJRVUowUVVkRlFXTm5RakpCUjFWQllrRkNjMEZHT0VGYWQw?=
 =?utf-8?B?SjJRVWM0UVZwM1FuTkJSMVZCUVVGQk1FRkJRVUZCUVVGQlFVY3dRVmxSUW5s?=
 =?utf-8?B?QlNGbEJXbEZDYzBGSGQwRllkMEozUVVoSlFXSjNRbkZCUjFWQldYZENNRUZH?=
 =?utf-8?B?T0VGWmQwSjJRVWRSUVZwUlFucEJRVUZCVUdkQlFVRkJRVUZCUVVKMFFVZEZR?=
 =?utf-8?B?V05uUWpKQlIxVkJZa0ZDYzBGR09FRmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpF?=
 =?utf-8?B?RkNaa0ZIVFVGaWQwSnJRVWRWUVdOM1FtWkJSMUZCWVZGQ2FrRklVVUZCUVVK?=
 =?utf-8?B?bFFVRkJRVUZCUVVGQlJ6QkJXVkZDZVVGSVdVRmFVVUp6UVVkM1FWaDNRbmRC?=
 =?utf-8?B?U0VsQlluZENjVUZIVlVGWmQwSXdRVVk0UVdKblFtaEJSekJCV2xGQ2VrRkdP?=
 =?utf-8?B?RUZaZDBKMlFVYzBRVnBuUW5CQlIxRkJXbEZDZFVGSVVVRmhVVUpvUVVkM1FW?=
 =?utf-8?B?aDNRblJCUjBWQlkyZENNa0ZIVlVGaVFVSnpRVUZCUVdKQlFVRkJRVWxCUVVG?=
 =?utf-8?B?Q2RFRkhSVUZqWjBJeVFVZFZRV0pCUW5OQlJqaEJZMEZDZVVGSE9FRmhaMEpz?=
 =?utf-8?B?UVVkTlFXUkJRbVpCUnpSQldWRkNkRUZIVlVGamQwSm1RVWROUVdKM1FuVkJS?=
 =?utf-8?B?MWxCWVZGQ2EwRkhWVUZpWjBJd1FVZHJRVmxSUW5OQlJqaEJZbEZDYUVGSVNV?=
 =?utf-8?B?RmtaMEpzUVVkM1FXSkJRbVpCUnpoQlkyZENaa0ZIUlVGalowSjBRVUZCUVdO?=
 =?utf-8?B?blFVRkJRVUZCUVVGQ2RFRkhSVUZqWjBJeVFVZFZRV0pCUW5OQlJqaEJZMEZD?=
 =?utf-8?B?ZVVGSE9FRmhaMEpzUVVkTlFXUkJRbVpCUnpSQldWRkNkRUZIVlVGamQwSm1R?=
 =?utf-8?B?VWROUVdKM1FuVkJSMWxCWVZGQ2EwRkhWVUZpWjBJd1FVZHJRVmxSUW5OQlJq?=
 =?utf-8?B?aEJZbEZDYUVGSVNVRmtaMEpzUVVkM1FXSkJRbVpCUnpoQlkyZENaa0ZIWTBG?=
 =?utf-8?B?aWQwSjJRVWRqUVdKQlFteEJRVUZCVjJkQlFVRkJRVUZCUVVKMFFVZEZRV05u?=
 =?utf-8?B?UWpKQlIxVkJZa0ZDYzBGR09FRmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNa?=
 =?utf-8?B?a0ZITkVGWlVVSjBRVWRWUVdOM1FtWkJTRWxCV2xGQ2VrRklVVUZqWjBKd1FV?=
 =?utf-8?B?ZE5RV1JCUW14QlIxRkJXSGRDZEVGSFJVRmpaMEl5UVVkVlFXSkJRbk5CUVVG?=
 =?utf-8?B?QllVRkJRVUZCUVVGQlFVSjBRVWRGUVdOblFqSkJSMVZCWWtGQ2MwRkdPRUZq?=
 =?utf-8?B?UVVKNVFVYzRRV0ZuUW14QlIwMUJaRUZDWmtGSE5FRlpVVUowUVVkVlFXTjNR?=
 =?utf-8?B?bVpCU0VsQldsRkNla0ZJVVVGalowSndRVWROUVdSQlFteEJSMUZCV0hkQ2RF?=
 =?utf-8?B?RkhSVUZqWjBJeVFVZFZRV0pCUW5OQlJqaEJZbmRDZVVGR09FRlpVVUo1UVVj?=
 =?utf-8?B?d1FVRkJRWEZCUVVGQlFVRkJRVUZITUVGWlVVSjVRVWhaUVZwUlFuTkJSM2RC?=
 =?utf-8?B?V0hkQ01FRkhWVUZqWjBKMFFVZHJRV0puUWpGQlNFMUJRVUZCYVVGQlFVRkJV?=
 =?utf-8?B?VUZCUVVjd1FWbFJRbmxCU0ZsQldsRkNjMEZIZDBGWWQwSXpRVWM0UVdOblFt?=
 =?utf-8?B?dEJRVUZCSWk4K1BDOXRaWFJoUGc9PQ==?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1801MB1918:EE_|BN9PR18MB4218:EE_
x-ms-office365-filtering-correlation-id: 1403d4c5-3f1d-4d7b-3036-08db9ca42d32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ervs2b5XDRxVhM7rIo7ZxE2daA9hNUTaNJQjc7UkVWiF/WzwK+Hw8NiyGsmq2AcxA5VkdR2m2qroXF144gzIiAdBmZWoVKg1uJo3sJg8Y78AUa1oYdEZkfCRszMt/RCupYzBDfl9QEkOrzJoHOxbq4FXe8jNUmhzU15ofcyf13uUm7qdtKIGigQEoYOfhOs3zSLhbnUL0i3d5IPfQ5AFBRf0jE498Z9D/kS3o4s84k2jwJWbbADgwgNWXJNVqsxWROIPSUPTmT1uyR2z5fAUI3H1MV3fwQnp+NRwB2TMgqV4/7AAYRt3olew/QDtypB6H1tg21LqiVnGBIumvbJiNWLOgE3CT9KBnYDB2RqkZAlqG2n+IS9l0kuDC3bGD41cHBI18gCtNYc38rakl4SX1cmlDP8cJBc1rVJrQL6Z4SGGpo9nlqxWFK/43TB2MG36JaWxEYrMNPjJCW0lgO3pSrlCOYgcji3niSDDU3JUKt4C/Rj64jeVYL7vofrc4DQhqaDa1jB5rTNzatjbyC43hSWPZCUsXuNCyPvHoYzHQSvOqCe+xkCbP8loFt/BYmUx3RxtqJ9yUPCeyLf6r8r9QR72xDRQMF2LwuXOWjeHe6JDDV8DRbs6tJ4adL+06j0jDPHZpe+RpgZucHwxZDaQUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1801MB1918.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(1800799006)(186006)(38100700002)(55016003)(54906003)(110136005)(19627235002)(7696005)(71200400001)(478600001)(122000001)(7336002)(7416002)(7366002)(7406005)(52536014)(38070700005)(5660300002)(2906002)(33656002)(86362001)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(41300700001)(8936002)(8676002)(316002)(55236004)(6506007)(26005)(83380400001)(9686003)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eElUNFE3M2lTanJEcExZWStKZitJVTFZMDQ5NGN2aXBHSUk3ZExZVmZ6RDNH?=
 =?utf-8?B?NGxjS0F6YjhmNm5HNGszWlcydlZ5RUtGWTlVbDFzdG1DS1NLaEVyWmFvN1Fk?=
 =?utf-8?B?QmVxa3pKWGtodEZZZHAxMktFeVk0djBsNlBNSEM5M0QrdnNJNUdpQzVEWjhK?=
 =?utf-8?B?UVgwaDhKWk5CRDdMT0ZsV3VoNklsVHp4RWRpRGFuZlY1ajA3MGNXcUM1T044?=
 =?utf-8?B?eis5WkU1dHJDT3FEb04wQ2J6RVNKY1RTTGlRUW9TamFvWFlQMExDditVcEhL?=
 =?utf-8?B?K0R4NDlFWVBEMHhDY3VKeG8zOXJzclRVK1E3KzRsbDBydStvUmpjdlNDM0t3?=
 =?utf-8?B?N2RndTlKTTIrdXNJdXJFNUZZWE5LNEx5amVpbTJTT01iMFJSYzY1ODdQdkJz?=
 =?utf-8?B?YlZZS2YrUXpNdGtuNWdKUDNHaDQ4QWsza3lLMW1ReXJsbm5ZOU55YWpqVU8y?=
 =?utf-8?B?QzdKVm5qU2lndlA3TXh0bUkvNHJXSWttWGZTMEFPSzdvdXZlZjBXUVZvSTZs?=
 =?utf-8?B?a1RXcjRaVlg4MzhjNmNUbTVEV3BnTnVScjhOUFQ4OHZicVd4c2Jzd3YwWHF0?=
 =?utf-8?B?Slp0dHZmczB1VXYvS0tSSlNTd1Y2anZwbUNkMWNLV0dsenNxSGNaVURsY2oz?=
 =?utf-8?B?Z2xmMmExTC9iNUxpSm8yM3NQa2Vua0VTUnkzeGZBVm8wd0xVZmhPNGZ5c3Zv?=
 =?utf-8?B?MjhQKzQwMzRHUDJUMlVaUGRSZEU4NU0yUXJZek8weXNMeTQ0bHR3UG9OSUxo?=
 =?utf-8?B?Y1A4Q0VPUjRLektUT01FazZzejBmVjRLbzVkdzhVSjZQVklJbjBNSURHbFRn?=
 =?utf-8?B?dzBXWVhiaTg5SHVnSWI3WUs4RHRsY1I3dG5xY2Q3ajFFbFRNK3NFdUFiV1hZ?=
 =?utf-8?B?UVRLR3pHVTRCUmJ6Zmg0R0t1d2J6d3N1ZGFLd29jWDBnODE5N2pIc0hpUmxU?=
 =?utf-8?B?d2kyNzRzdTg4d25wblZjT2hKeW05b3N1cmJaejZIaW9BUHBYeDlhV0VZemRZ?=
 =?utf-8?B?RFBiRFJUdExmOG50Tys1eXRNOW4xbjQ2Z3hXT2VocVdCU3BzMWQ5WmVQZEtv?=
 =?utf-8?B?QVhIM3U2TUNWNllzZURVa3RtS2gwV3JUVFVHaUh3RzhrYVZpTzlCRHA4a21U?=
 =?utf-8?B?YUUxbGRyRUFPZ3Q2SXZkemYwUUNkcElZOXc3SytuTFR1MkdxQ09ISDY4NTBl?=
 =?utf-8?B?TmVyTXVEK0QwRTJoY1pXQzNYNUNFd0VmdlRpWW9vNko3cTBnTXhiaU9NOUNs?=
 =?utf-8?B?eTVLZHZJRzQ5VldtaWJZcFR6RFQxV1MwVzlvdFVtNmllWnYyQWZUREdFRG1n?=
 =?utf-8?B?UldOM2pNS0hMR0NlNnQ4aWVEMEU5RDlNVktMQlE1QUV2VnFGMG1NNEZXRHU5?=
 =?utf-8?B?dVR2NFNlZFJCdTcxd05nNCs0UTd3aURST1B2LzgxdDNYZEJEZG5NSktYUW94?=
 =?utf-8?B?NWtrMWhldEM0WEcxc3E4Y0hLR05CcXlGSlA1b3hZM0dmelArckRyTTNVeVlV?=
 =?utf-8?B?VFBtSlZHSE5aYjA5TmhvdmFLOXBBZjdQOWs3RmJici8zd1V5MzlBaGZ5K2pC?=
 =?utf-8?B?TXk5YXdrUDNlNS95MGcxTWlMUmhXeEVXenJjQmxGZHkzSzRBSGxsUVF0c08v?=
 =?utf-8?B?Y1dFS0dsbzFySW1SUDNBNDF2MFFBbThOZ08xWFN6UVlzd1FQYUp6aFNNL051?=
 =?utf-8?B?SVNPLzhRZmIrdjUrT1JNcjMyWFpTWmVtT05ERldaRi8yRGlUZHRFZVp5T0ZV?=
 =?utf-8?B?YUR3Yktham84cjdFbFY4REk5R3FvbE41NEdHbkoyaldBTUhDckZTVWg2MjJo?=
 =?utf-8?B?TUlHUTN5TGhrWTRkcmR3Q0V3RFNmN0ZVZUZiV0Jrd1dXOXdyMDlRdFpaeW9k?=
 =?utf-8?B?dWJYMFhOV1UxZzNLNUtGVTc1bERraEJVdmpUcldSQ25vaStzL2FIdzVUVXJ2?=
 =?utf-8?B?b3Fzd2o2cEt0dElkT2dDQkdmRUUxdFVrb1M0VjJKNGdLeVV3YWp3ZGZQRHQ0?=
 =?utf-8?B?Q0lhM0JYNi9peUc4QUZNTTlQMzVXNEpQSUdBVW1uT0V3cVErVnc3cjQ2QnlE?=
 =?utf-8?B?a3J6cEJvbXhOdFVFc3pHNjNuN2RoMzB4Y0Vsc1pPTWlSV096U0RPdjIxeEoz?=
 =?utf-8?Q?tuKvMuDdvGt9m09ftYBhIGbKV?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1801MB1918.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1403d4c5-3f1d-4d7b-3036-08db9ca42d32
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 08:55:14.9683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tEQ2Lj2R5COsWOyoJVNnUSmF9cho/4qEBN2oS9h/PIyBPLfwWDhz0C1//gKEciGE2Rla/akpatL/YvZhr5ZNwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4218
X-Proofpoint-ORIG-GUID: VKSPZR_T51MpOOi_5HyduhDxSjK4c4Ug
X-Proofpoint-GUID: VKSPZR_T51MpOOi_5HyduhDxSjK4c4Ug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_03,2023-08-10_01,2023-05-22_02
Cc: "jolsa@kernel.org" <jolsa@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "error27@gmail.com" <error27@gmail.com>,
 "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "alexanderduyck@fb.com" <alexanderduyck@fb.com>,
 "ast@kernel.org" <ast@kernel.org>, "andrii@kernel.org" <andrii@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "sdf@google.com" <sdf@google.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "horatiu.vultur@microchip.com" <horatiu.vultur@microchip.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "mw@semihalf.com" <mw@semihalf.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "longli@microsoft.com" <longli@microsoft.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Subbaraya Sundeep Bhatta <sbhatta@marvell.com>,
 "shenwei.wang@nxp.com" <shenwei.wang@nxp.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "simon.horman@corigine.com" <simon.horman@corigine.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "jgross@suse.com" <jgross@suse.com>,
 Hariprasad Kelam <hkelam@marvell.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "maciej.fijalkowski@intel.com" <maciej.fijalkowski@intel.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Geethasowjanya Akula <gakula@marvell.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "jiawenwu@trustnetic.com" <jiawenwu@trustnetic.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "john@phrozen.org" <john@phrozen.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "michael.chan@broadcom.com" <michael.chan@broadcom.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "haoluo@google.com" <haoluo@google.com>,
 "salil.mehta@huawei.com" <salil.mehta@huawei.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "leon@kernel.org" <leon@kernel.org>,
 "song@kernel.org" <song@kernel.org>,
 "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "Mark-MC.Lee@mediatek.com" <Mark-MC.Lee@mediatek.com>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>,
 "linyunsheng@huawei.com" <linyunsheng@huawei.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "yang.lee@linux.alibaba.com" <yang.lee@linux.alibaba.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "wei.fang@nxp.com" <wei.fang@nxp.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "saeedm@nvidia.com" <saeedm@nvidia.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "nbd@nbd.name" <nbd@nbd.name>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v1 net] page_pool: Cap queue
	size to 32k.
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

> From: Jesper Dangaard Brouer <hawk@kernel.org>
> Subject: Re: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.


> I agree with Johannes, this commit message is too thin.
ACK.

 
> It makes sense to give a summary of the discussion, because it show us
> (page_pool maintainers) what you concluded for the discussion.
Got it. Thanks. 

> Further more, you also send another patch:
>   - "[PATCH net-next] page_pool: Set page pool size"
Okay. 

>   -
> https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__lore.kernel.org_all_20230809021920.913324-2D1-2Drkannoth-
> 40marvell.com_&d=DwICaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=aekcsyBCH00
> _LewrEDcQBzsRw8KCpUR0vZb_auTHk4M&m=uvV_vt_cNyQItTD90jF1LdKovP
> 7j7FYtnr7I38__nYY6wHtFHSozYoRSSvCI14nh&s=vGgt2ccGdiRTEhj3MoGVx-
> EXHmB03v6I3UIIY1fEb24&e=
> 
> That patch solves the issue for your driver marvell/octeontx2 and I like than
> change.
Okay. 

> Why did you conclude that PP core should also change?
I could not  answer Jacub's question at https://lore.kernel.org/netdev/20230810024422.1781312-1-rkannoth@marvell.com/T/ 

> (p.s. Cc/To list have gotten excessive with 89 recipients)
I added maintainters of all files which used page_pool_init(). 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
