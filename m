Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA676D3956
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 19:02:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EEC8C65E56;
	Sun,  2 Apr 2023 17:02:39 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2103.outbound.protection.outlook.com [40.107.223.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E138C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 17:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzcAiJindyCE/r0QGPX6W0FVWXxfHllDeNSLGw6xCzH1RuK941XzsMZUXZ7vN2TcOo5WCHQUpSwfvfvv5dSytOi6NWhi7O+Uh2MA9VrU/EsRL7o1wl5brgeVR+QpRuAFdwHQwB5tChfHnZAS3rRnb/nuyLQPlJZuuSdmCPVg8Z75Dx4QYjlC1O0TgYfh2nHlUFcnjCChrfm3KFbX+Qa2pZZWp/hviH0kG1ljVd/zC+Rp3CuwlPHLIwz3VgM3WcEtluJUpIWp9nj5mKfuNoRL6P87Mzjy5XaAnFmIxWRmtDhYW1D8/bgrYrbZ2PUQ74rwCpqzoiUANhtBqN1qARgd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkPc/ecXtDYfSsdibvvs01GEC5jB34teB2yeUR7Q9xQ=;
 b=QOZqTWMGZbKjDtc6Hohk/4IELWtSucEumkqTMT8Q9T4cOWcSJkwlVED3hTk6QvQ4J0yN7olOwL56CbMsSjDby8yej77Yq+nxEyYXxwU3wA2RgdZKhvajAZkW9UZTHl2sHbKY7Tsxc4s+QjPEqqYPadaWZ9GT9W8Qdm9L7zsX5jYDNW7vh+fzpKFgcNIHZlTROZCMPlLDySh+Oto0sVGOkTzi+QJadJF+GbiF5oWNniiZjiw+rB/1g4yOJ5cXTT/T2sqzkfm+7g0nUHXR8s1kIWsZOjgG2AblvxPp4d7JAfEZmdJI8Tn8ccXxuAvzYRc5U3HDi7Ir86ddghM8z2OEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkPc/ecXtDYfSsdibvvs01GEC5jB34teB2yeUR7Q9xQ=;
 b=fe6mUID7/ZecY87S7uKr3k6yO5jYI0GhpAt1imSdjfjMffA2l0FB/yEWFb2O5fx/kdJPeENGq1ZWN9axxs4jtOafsI/leZkzo5LtYydu0zMqR7DuqvAl8QoUI+5SLmqy9kjDJodyMrS9tC/Wqr+5mKw9cDwzMZl0oa5ACwcjkec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by MW5PR13MB5995.namprd13.prod.outlook.com (2603:10b6:303:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Sun, 2 Apr
 2023 17:02:34 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Sun, 2 Apr 2023
 17:02:33 +0000
Date: Sun, 2 Apr 2023 19:02:26 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCm1InKDMQERLsK3@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-3-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230402143025.2524443-3-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AS4P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::18) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|MW5PR13MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 138c4393-07ee-4e65-1fd6-08db339c0cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jb8IHAHITp7uMHFqRd107ZQHnxmZbS3EXj5w2yMsOoDUGOVe9v5gY5qt3dxm8BPyjR5yW4BLsODhRhn5qpPWuRPZSgP9Rw+D3iJH97CbpxtzuY0wNI5DPOnkEbgIm9wgZDFu+9P/yVdeJ1nEQo9f3d1+GdWE8pnyY6DYOgFtr27qXTz4THs35xkyjr/59vJ6/Q2MnQxB1KZeFaCP0GvdUJDcrx2x/+rM0r1bWeApngMUapomuL2KL/KJzYyMrH1zu1P+X1IrksxPi8GGJHzjkqddNRwtOmgGBdnzvgRCePs3LWxzrqCDPyF0Y0BgFTCtvO8g3ieD0ksi2s6/iuiZUyuGPD7t4lCI8dLwbIqTHLpaCT2cFaTtO/3jDX/O/Nci3pO5PJ6pXzgllRSjUFUbhkWZw7PbYXgmdFsJDhsjpNfyyzfZNqXpcWD9/O7liJmtwiU2pHv0p84CruiMY/PCfpkr/vGj05TI3VCVcmrhco+fBtKk+UgYONPClmq4ZABQKbm60JoFz4qW5ajDSB0GiQVIPqJax6/MLjtrfnvjgII7XSuCR5IZA4kREUJmha5l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39830400003)(451199021)(86362001)(4744005)(36756003)(2906002)(2616005)(478600001)(186003)(83380400001)(6666004)(6512007)(44832011)(6486002)(6506007)(6916009)(4326008)(66556008)(41300700001)(66946007)(66476007)(8936002)(8676002)(7416002)(5660300002)(54906003)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjIwNXV3cDVQbG1pV1JUcWdWb1l4YStPaFNvRDFSUS96K0d5LzM3NGpYaVQ3?=
 =?utf-8?B?elQ0YldGb0lHZEdGbVBpMnFuZFkrekMrSzRDekFJdjJkcEhLSDc0VTFITTN5?=
 =?utf-8?B?ZDNjVDRHUVpFb2NtNHcwdXJuKzdIQ3RmS2c4WGRRcG1EbVZtN1dsbjlLVFRI?=
 =?utf-8?B?SU9UOGF1bHZ5TkRFZnBrOU1rTWhINHc5SCtCRTM0bE1ZUEsxc2ptSjVsbmUw?=
 =?utf-8?B?R1RUSVBWQWNvRXBOaWhFYVhTUjRNZUtJaFpqWFpVdEVjKzlyWWRPT0JkRTRM?=
 =?utf-8?B?NUJNNE5sRVZPbTZnTXIzNk1kUDhQMkVaQ3lLU3pGc0s4MDJ4NkNRdGNYUlRz?=
 =?utf-8?B?Y3J2ZTZxN0JyeXJ0dkdTcWtQaFhNTVhNR0dHRmdPajFlZ1BnS2VIVDZrY0ls?=
 =?utf-8?B?QlBTOG9Sa0VvdVExN3BlamJzNTVheEdKM25tdCsyMW5Udm10RStWV05jSnJw?=
 =?utf-8?B?bFM2Y01keUl3dU9YVFdEbHR5b2Jkd0dJWVhPQjFhOFhvNHZZdjNjOUhkQndt?=
 =?utf-8?B?MFBoSWx6SGp4TWxuOXZMWjBESWJjb3JQQXNKUnM5aWhEK1lOaldTemxVcjJ6?=
 =?utf-8?B?WXhnVWxiaDJFYkprWHpSMkhuMHVjZitiRXNQeC9kRzVDbGdRVzA0eHVPTHMz?=
 =?utf-8?B?c1IrVFQ2TUg0UHZZQVVaNHFaS083UnE5M2hUMEtQSVhieXhMMTJlcldVbXl4?=
 =?utf-8?B?Z2k4NWdOM2w4MFRNTXlWRlpEeEMyMDFCSU0xYnZBNDZKSlp5OHVzQkx0QldH?=
 =?utf-8?B?VHVYMW4xNHhSR3p6em5EQlB3QlJnSVVYZE9mUnhJRGJwS3NQUTlzZy9EZlRR?=
 =?utf-8?B?MkNkK3hqMmVMc2tnWGprbHdkUytsVTI0VHJqb1VWRXovUUo2MTJaUXZ5eERy?=
 =?utf-8?B?ZmdsVVFUaGN0RjVkOHJBQkNKNkNoOFJJblJjaXNhalZ2NjhLSitaSWNNdUp0?=
 =?utf-8?B?Q3hLbTBhT2MyWEFyWmszRW1Yb2lwcjBvUmx5MGk5SE8zZUZXQ25TcVdzRm1H?=
 =?utf-8?B?WVVLWDRQenJxUTBCcy8zQzJBUUpybWlBWTdSMW5RNkY3OWd1QWZRbmFkc1Ro?=
 =?utf-8?B?ZGR5Zzh6eDNhK2hGZUNWRHVmSGJ2MkRlQ2s5aFNxM2d2Y2EzQ3FSZm5YeTVS?=
 =?utf-8?B?WDduNU9YeVE1bFl2ZjhPZkJDa1JYaFpHZkdvTENtVHJkT0NKL1F1ZVFHMi8w?=
 =?utf-8?B?TkZaNlZRNkRjWmFyek5XblA5bnBHM2lEK0E5R00xK25NN2lvVDJ3YjRHUWh3?=
 =?utf-8?B?dExrbWxZNDNhdFBoNnZidVByQ3VNeVBST1pSZmp0cXZZdXo4eE5UeUxBS2lY?=
 =?utf-8?B?amd0VytDUUZHSXgxcUl6RG1PTGx1Qm5HV2pTT2d3cEIvVmhubzVZbGthY3JP?=
 =?utf-8?B?NDF5eFlSRWJ5U3ZkM3UxeFJUV1lDaTFwUDNLQ1daUFh4N2hTQW9UV1dzbFJn?=
 =?utf-8?B?RVg5MnBpU3VCNEVKRWtoV1JYLzI1WFRWaTA3YVpIUkRtR1VpNE5IWlpiK0dl?=
 =?utf-8?B?TG9iY3ppU3Jkd3RXZVRnMHh4YmFRWTZPRFVMVUEya2pEbjJ3bG0xN1ZjN295?=
 =?utf-8?B?VWJtMjEzV2VnRVUzeHNIckkwekxpQjVadERseXg5L2RzMWFTbmxkY2RwbFJB?=
 =?utf-8?B?MFdGMS9CNHZ1VjRzbUtXN3dNU0R0SGwrazFyQUJSRlZqT3VWYUJ0UTJwMFE2?=
 =?utf-8?B?M2ZyL1h1N05qL29qVDR4RzBIa3p4R2g1a3NRNUpMWWFja0FPN3VicUdqSFdu?=
 =?utf-8?B?OUV3NzVoNXU3M3JYenM0Q3o2OGk1T1BWZkpKN3p4S1Faa2FOaG1QWHhRYXhm?=
 =?utf-8?B?ZUFWR3c4TUZOS0o2aU9JUUdqeFRHcytjM2trWEU4RkRkaGFOeTRpUHpicUp1?=
 =?utf-8?B?WFcvRm5NV0NlR2RURzNjMUdVNzRKekhpampnd0xWZWt4bGJLRGpDdlVsblh3?=
 =?utf-8?B?SkJmVmVLRktpVnNrSjNsVkM5V0dqcWJsa1psVWFwUFVKNlA4SkpvZjE3QkhI?=
 =?utf-8?B?dUZDVzhkMGJaTEYrMjlFZWI5ZzdvT0djZmZxQW93MVlmcmthVkI5VXpJcXhN?=
 =?utf-8?B?NDJNR25YMm5PblNjeDd1QWI0M2pzNU9QNk12TWFwNHFTbjc3T051MGVMQkJX?=
 =?utf-8?B?VE1qY3Vvd293NEhBanNYVHFtcFJDS0R3bFdPRHhLN29YS3htRmtrb2p1NWk3?=
 =?utf-8?B?QU5UdWROZFpteU42SkFGbE52bWttMWxNc2FrZWpUZkxIK3hKUDNmNUV6Ryty?=
 =?utf-8?B?bm1KZmN2c1VncjVCRHVzdEhOMG9RPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138c4393-07ee-4e65-1fd6-08db339c0cdb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 17:02:32.8259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H70DMHCX+Ywhbg4VFm2CPaSRSfrajnHujIJRiGaOAPrU3EaNhs2CX4B9KHK55e7jJq6JY06rSumr2OvVqpGMlZeLSV+GN7xGlfQGV5T2ZGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR13MB5995
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 02/11] net: stmmac:
 dwmac-visconti: Make visconti_eth_clock_remove() return void
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU3VuLCBBcHIgMDIsIDIwMjMgYXQgMDQ6MzA6MTZQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIENo
YW5nZSBpdCB0byByZXR1cm4gdm9pZAo+IGluc3RlYWQgd2hpY2ggc2ltcGxpZmllcyBvbmUgY2Fs
bGVyIGFzIGVycm9yIGhhbmRpbmcgYmVjb21lcwo+IHVubmVjZXNzYXJ5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
CgouLi4KCj4gQEAgLTI2Nyw5ICsyNjUsNyBAQCBzdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9kd21h
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4gIAlzdG1tYWNfcGx0
ZnJfcmVtb3ZlKHBkZXYpOwo+ICAKPiAtCWVyciA9IHZpc2NvbnRpX2V0aF9jbG9ja19yZW1vdmUo
cGRldik7Cj4gLQlpZiAoZXJyIDwgMCkKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQg
dG8gcmVtb3ZlIGNsb2NrOiAlZFxuIiwgZXJyKTsKPiArCXZpc2NvbnRpX2V0aF9jbG9ja19yZW1v
dmUocGRldik7Cj4gIAo+ICAJc3RtbWFjX3JlbW92ZV9jb25maWdfZHQocGRldiwgcHJpdi0+cGxh
dCk7CgplcnIgaXMgbm93IHJldHVybmVkIHVuaW5pdGlhbGlzZWQgYnkgdGhpcyBmdW5jdGlvbi4K
Ckkgc2VlIHRoYXQgZXJyIGlzIHJlbW92ZWQgaW4gYSBsYXRlciBwYXRjaC4KQnV0IHBlcmhhcHMg
aXQncyBiZXN0IHRvIG1ha2UgdGhpcyBwYXRjaCBjbGVhbiBpbiB0aGlzIHJlZ2FyZCB0b28uCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
