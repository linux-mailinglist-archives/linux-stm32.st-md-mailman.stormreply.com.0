Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8714504D3
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:00:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2D46C5F1C8;
	Mon, 15 Nov 2021 13:00:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4398C5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 13:57:06 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ABBgLEf005409;
 Thu, 11 Nov 2021 05:56:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=PhHL7vvYwXEfy2zdNVgDKVj+eB/yC0xjI2wBNzK5HGA=;
 b=QjZuREvFgb56iyfeV5sXHp/l/kzspzunkfrSbUWM/GWvi1za+Ybkz4CMHMu8ODNmPntk
 PIuLw66DwKnVRrMeRLtdI7AiP29/nvbT0dUy7YQ0PhRYLJepm2C15uUWatPIgOhfHXmb
 XohAJkZ+oARPkYS9Q8OjwQXD3TZGEmKYFSsi5ANKckaqYu8WRVdWrqNE7TRRfhki2ZNl
 NpSMizJ+xKFdSBm1E0Dddtw8Pw1QiVzt23Hhr/gDoyaWqmOlqD/5IDa7uaqPR0St01Zw
 Tja6gK4KDj7s4U0JcPvCTyvdkroOzNOdwF/fb7FzsLETs/22ZlL8mA1OJgkBadpVrwFI Pg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c8dx9173g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 05:56:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op5u3rKRFqLz75+SAPUbzUnFniagY5sPY1oU/ytHY5aRAFm5Oh79UsM206FpYAPR/neSMnWcej0HGUyW5pJL5sc3nQG75bB5XF7zjKgfqL75i22l+2+lda1jU4KfuF+9M3+e7hBo9fg+iOOf0a84g9bSN9tTOMQE9DMxOvt974OXWgRFScmJXqXcDNzFBCSMMJn1oQDzbAcpQTAB4XHu+dXyyv6JI6gkqpDYPysEHc18IG14lpldUTRR96VX1dgd63g4JhQiLA97viM92YOXlewAokq4T9k7smyARHvqdB1b05Gf26jf6Kj9ZOFpUluvmHIJmp6B3NLtGtVNAofXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhHL7vvYwXEfy2zdNVgDKVj+eB/yC0xjI2wBNzK5HGA=;
 b=MLF/czFVjNMHJXyPqvXgq0d6fmjZHKb4Xu35nr0yOYyW+L7ciZaUzK94BrJAbxty+Bh9dVXu9Wi1c9Jagy9OGfstbutSMNJpywyhiKLJQjnEzmR+5fT81mpzBbVXa36bdkUy4b02fAlLQM2ou4Y9D1GTs4Nv3E27IpElJeXoL1iHfbRMYHm8SHL30asjb+Jq4/p3JytA11cqco8jv/hlieUrI2w4cEsAht1JlQ96QR/ebxez/tsQgaUhu/AJzOBRh51W5N0jdDevhLKgfxBLyAGJIkTKjQhtgSym8JSyqzEYJ1nuvz7Cn8uE98wGaoyNIEjruMzOFcwyfaRnj8EVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 13:56:50 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::a090:40db:80ae:f06a]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::a090:40db:80ae:f06a%9]) with mapi id 15.20.4669.019; Thu, 11 Nov 2021
 13:56:49 +0000
From: Meng Li <Meng.Li@windriver.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com
Date: Thu, 11 Nov 2021 21:56:30 +0800
Message-Id: <20211111135630.24996-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
Received: from pek-mli1-d2.wrs.com (60.247.85.82) by
 HK2PR04CA0084.apcprd04.prod.outlook.com (2603:1096:202:15::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 11 Nov 2021 13:56:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a09fcd7-dad1-41f5-44ef-08d9a51b1b73
X-MS-TrafficTypeDiagnostic: PH0PR11MB4885:
X-Microsoft-Antispam-PRVS: <PH0PR11MB4885F22BFFD176B623CD2AA8F1949@PH0PR11MB4885.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJEhpGfz69vnMT51iRrgpXCrub52kao6fNYOxI4DZ3gFZE1r4tgvOKWKqIW/sjnTM42pnB+W4nbRz95bqNwJdatLJZIHlgn+4rOR3kFke1RRyQHA44JvvwARpq2hK0dJ0+XVBv2jxkxQ7Xm5JarAHpKXvILKDTku23SD4PH/1agmjKGdBolyO1+42dWLKbCmakrZ+j91T+NYJcpa4L9MgXH2EUUlG+rJTxcxJYKHaSLv9EP+picJ7p6dZxeaG+Na/JXpSDDiI2GkgVG5yBxlWv0kx6YkgaLP+bhhDtooS+dgFf2V1um7npAL24Mou8cRUJH4N5PyG73NTotUb+QEnO3QMI8qmJ2MWe107NdjlmJemLt/Pzx5K4oc79N7BN/acfel/eX5USw38TbONF8693auEVELuwqnH2JAry9UTuCrecvThNu7/a6KXQITGhO6iI0lJZiCAlzy9d8/zbh10jk9oaUHZ6GzdI9qAMXhCdFZVTnVe9OHEWwXO9UHBpMymSe1vwmmEP50kYhoW2THKO57Hi6AeGa7SdHhecqhsbXlNdE+52BSkKj/WDk4wxWZfxfhrx80GCGSIN58xN/tLdDTmCIF9C2SUYCl9G4WGtCziz7yM/RaIFm1CmZdla8AGkIBDIGBq9wMgC+QKxvIwoY4vXHBWp3uXBSfl7bMhM2dMeM03B8uDkaoIxvUbZahQwUyphNcPfczxFXTjIqW1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(66556008)(2616005)(8936002)(38100700002)(956004)(8676002)(38350700002)(508600001)(66946007)(7416002)(26005)(2906002)(107886003)(316002)(36756003)(86362001)(1076003)(83380400001)(5660300002)(15650500001)(6506007)(6512007)(186003)(6486002)(52116002)(4326008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2VVR1hXai9FWm5idEZLcTJLTUV6cnVHNzBibFBSQTdrOER3NHRGNUlDWWF1?=
 =?utf-8?B?aCtVSXJMZlNrNGpiamhIRkpuWFJ1bUphVVpvaS9xVzI0NVJlbmhWTW9hNHls?=
 =?utf-8?B?QWM1Q3U0UElRK3BYZklmN2VmeFY3TnpQbjllZXRHbk1KZlFWODVOaFBnL3p2?=
 =?utf-8?B?ZFYyQ2luZFFYSjBhYnUwVlU3eUh2Tk5QcWxZa1owRHJFZGdzM2JpYVpGdlJn?=
 =?utf-8?B?cElYRlcxdllicDR1aVFCbzREUTNzWHNZUlFhN01OZ21lTVhvVktnaXFkekxZ?=
 =?utf-8?B?eHB3RUR6WndZL3ZHbzNUUEZ6c1VNTG14MHVzQnFHc0txZnlTNXpJN204ZjRO?=
 =?utf-8?B?Zi9zZEdEQTQrL3RQY0xxUXlRYTBZbkFiM2l2a2xtZ1Q2VGtRV1JYa01TVDJJ?=
 =?utf-8?B?bi9salZYQWVNN0R2dFozZGtxQkFRMDBTVlIwcldTZFJaWWRJMWhVYWg2amgx?=
 =?utf-8?B?eXAxVGRYamprWExld0R6b3NicjllbjRGVzVEbzVWeWJtYXRramhtQ3h2WTVC?=
 =?utf-8?B?UERMNklCQU56Wm1uSHlBVWs2UGVNTkp2VGg5bXBGcHFXSGE2SURiU0tXZ20x?=
 =?utf-8?B?RVhZZmlxditBYUtDMlhCNDAzRDlPZmNLclJxblI0QWhoMmhZN0VHNnFDVjFN?=
 =?utf-8?B?NXlhbnA1UDM0bVFkOHFrY2dySlQ5NVBnL21DdTRGa1NEQUcwSWVqd2VWaW8v?=
 =?utf-8?B?a3FlMUgwb2NRVmk0dHZ4NVFhcU1yS0VlcXpHU0JLQXRINkdHU3dSLzR3c3Bx?=
 =?utf-8?B?QUc2UUFBVnM5NmdNRmxBclhpbGF5bnZxMnNtUGtjemZ5c2VHZ2g3bEI2MDBM?=
 =?utf-8?B?UWxKay9hTldMeFRMWWhUMnFqRERMaXlkSEphWGJBd25JZFRjOEg0SWFEZjll?=
 =?utf-8?B?VXlYRnArMHNvbTV4Q1FLVzRjcmszVE5HV2QrdkFJT2M1UXdhRWh6UnFTMGFh?=
 =?utf-8?B?VldRNi9XeXJUdGJ0M29OUkFlQ2NrR3F6WVlVVnBGUW44WHZoZnBqZFl3YzJz?=
 =?utf-8?B?cDVRWFViM2hSakNWUVpTbjNTT2svU3pKTTl3Sm0vcmhJdEpzeHR0QzJ3QnF3?=
 =?utf-8?B?eWNIYVJDK2tSNW1vUTJRMm5jVy83Q2VIRkh3cFpxd1Z3K2hJaS9pdWpBV3R4?=
 =?utf-8?B?aC9yUlkwYS9LUGVOWHgzb0h4VG85NVU5RmE0L0YxNmV4L1I3UVNDSHJ0OXd6?=
 =?utf-8?B?M3FtZS9EYTNTV25rczdSSmNoRFlwNk44QkRWMEtKeDE0OHRkRndULzVlUDlJ?=
 =?utf-8?B?dGhBTk5XcDJneTduK0ZKUzB1bXNsUjdqNFlCcmxqY05OZ1NMSXhMRDhYN1Ar?=
 =?utf-8?B?anl1Z25FQTUrVEkwZnJQOFVKOGV3VzErYTg4WWZPRk1uSlFKTUZadlZxT3dV?=
 =?utf-8?B?YnFTZUZqY2F4RFhKempqZytVWEErWFB1bmdCYVZLeXhEVWZodWhIWHU2dDh4?=
 =?utf-8?B?WGZWYXZVWFBaT2NLL0d3bUFxU0FrcGpVYVVUSG15S2NiaFh1QlU4enI2QWFT?=
 =?utf-8?B?K2xKU1BWRFArLzJKQm9vYjdERnpKcDhQM210b0EycERHUWxnc3Vyb0p3UVds?=
 =?utf-8?B?ODV0SUNBeDhySE5hT1NyTXJyRm02WjJZTGxIbjc2cWhxcUtiVkNUbUk5ZSth?=
 =?utf-8?B?RkF5K2tZZWR3d0VnOTZERFFWWFRTbUdYaTF6ZjFIeTBTNjY4ZjhBV1dOa3Z5?=
 =?utf-8?B?RWVKQmdjZkJBSm15QVVDYkpwcm1jM0w1ZVBLMkxPZUZicjBvZWR1djNCNHVR?=
 =?utf-8?B?K2RxWlNTUHRPVTNqRHZTbDA3dFIzbGpmSG1OazhqU0lWRFFLMmJSTVZSL0Vl?=
 =?utf-8?B?ZzVWQ0JldERoWHlaUy9NejBTRnB0NDlOV1RSYVVFcUdIVlBpSlZkWEhBV09k?=
 =?utf-8?B?bU1zbkNrbGJ3RWVyS0JTdWRxMkc1RXhUcjJJYXZBUmlJWXhTRy9SWmppOHNY?=
 =?utf-8?B?N3UrWnBJR1k0Z1JnL3JITmxYRHVEa2FHL3F4U0pKRFZtSGsveG1DR3UzRWpa?=
 =?utf-8?B?dXMwQnJ3azJSbnpWSk9FNy8vS0tTNXJYTjA2d25HK2Z2eUhmNGlmUjV0YWZs?=
 =?utf-8?B?TWdXZ1h5N1B6SnU0SWg4dzJPYzdwNHpyNVFPZzVaZnVtdXM3dXRRZ3VMSWpl?=
 =?utf-8?B?SEtWZisrWCszVm9aQndDUnJLR1pzNkdaNjBGbWtlaE00RTN6RWh3V2Z6cnJx?=
 =?utf-8?Q?w2oUlR34PbB5jrTJEK9FD/8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a09fcd7-dad1-41f5-44ef-08d9a51b1b73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 13:56:49.6927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mosdEMTffUJWyH6mxi2SFQZtqrLb0/0Fka6LB1sGlpru1DP4Mbd4lWxHNKCy8cSyB1FQoDP50sOVxU1Wvhu7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-Proofpoint-ORIG-GUID: BouA2YSPualeU-ins77kz0mcLa_sgRQS
X-Proofpoint-GUID: BouA2YSPualeU-ins77kz0mcLa_sgRQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_04,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110081
X-Mailman-Approved-At: Mon, 15 Nov 2021 13:00:05 +0000
Cc: netdev@vger.kernel.org, meng.li@windriver.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: socfpga: add runtime
	suspend/resume callback for stratix10 platform
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

RnJvbTogTWVuZyBMaSA8bWVuZy5saUB3aW5kcml2ZXIuY29tPgoKQWNjb3JkaW5nIHRvIHVwc3Ry
ZWFtIGNvbW1pdCA1ZWM1NTgyMzQzOGUoIm5ldDogc3RtbWFjOgphZGQgY2xvY2tzIG1hbmFnZW1l
bnQgZm9yIGdtYWMgZHJpdmVyICIpLCBpdCBpbXByb3ZlIGNsb2NrcwptYW5hZ2VtZW50IGZvciBz
dG1tYWMgZHJpdmVyLiBTbywgaXQgaXMgbmVjZXNzYXJ5IHRvIGltcGxlbWVudAp0aGUgcnVudGlt
ZSBjYWxsYmFjayBpbiBkd21hYy1zb2NmcGdhIGRyaXZlciBiZWNhdXNlIGl0IGRvZXNu4oCZdAp1
c2UgdGhlIGNvbW1vbiBzdG1tYWNfcGx0ZnJfcG1fb3BzIGluc3RhbmNlLiBPdGhlcndpc2UsIGNs
b2NrcwphcmUgbm90IGRpc2FibGVkIHdoZW4gc3lzdGVtIGVudGVycyBzdXNwZW5kIHN0YXR1cy4K
ClNpZ25lZC1vZmYtYnk6IE1lbmcgTGkgPE1lbmcuTGlAd2luZHJpdmVyLmNvbT4KLS0tCiAuLi4v
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgfCAyNCArKysrKysrKysr
KysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1zb2NmcGdhLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1z
b2NmcGdhLmMKaW5kZXggODUyMDgxMjhmMTM1Li45M2FiZGU0NjdkZTQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYworKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zb2NmcGdhLmMKQEAgLTQ4
NSw4ICs0ODUsMjggQEAgc3RhdGljIGludCBzb2NmcGdhX2R3bWFjX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiB9CiAjZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovCiAKLXN0YXRpYyBTSU1Q
TEVfREVWX1BNX09QUyhzb2NmcGdhX2R3bWFjX3BtX29wcywgc3RtbWFjX3N1c3BlbmQsCi0JCQkJ
CSAgICAgICBzb2NmcGdhX2R3bWFjX3Jlc3VtZSk7CitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IHNvY2ZwZ2FfZHdtYWNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlz
dHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBz
dG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOworCisJc3RtbWFjX2J1c19jbGtz
X2NvbmZpZyhwcml2LCBmYWxzZSk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBzb2NmcGdhX2R3bWFjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKK3sKKwlzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwor
CXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOworCisJcmV0dXJu
IHN0bW1hY19idXNfY2xrc19jb25maWcocHJpdiwgdHJ1ZSk7Cit9CisKK2NvbnN0IHN0cnVjdCBk
ZXZfcG1fb3BzIHNvY2ZwZ2FfZHdtYWNfcG1fb3BzID0geworCVNFVF9TWVNURU1fU0xFRVBfUE1f
T1BTKHN0bW1hY19zdXNwZW5kLCBzb2NmcGdhX2R3bWFjX3Jlc3VtZSkKKwlTRVRfUlVOVElNRV9Q
TV9PUFMoc29jZnBnYV9kd21hY19ydW50aW1lX3N1c3BlbmQsIHNvY2ZwZ2FfZHdtYWNfcnVudGlt
ZV9yZXN1bWUsIE5VTEwpCit9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvY2ZwZ2FfZHdtYWNf
b3BzIHNvY2ZwZ2FfZ2VuNV9vcHMgPSB7CiAJLnNldF9waHlfbW9kZSA9IHNvY2ZwZ2FfZ2VuNV9z
ZXRfcGh5X21vZGUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
