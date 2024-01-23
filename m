Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A324C839369
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 16:45:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44461C6DD6D;
	Tue, 23 Jan 2024 15:45:18 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01olkn2024.outbound.protection.outlook.com [40.92.107.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24040C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 15:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adoWhTctxNHF0VtYsVsAeAk48Rp7yGtla1we27Q1CLm/W9ObKbI21fSeb8AEK7lUZn9DltPa1E+suH2/Uy21SMz5d5nhdJH0rnQiVKOInQtuKa4XP4Mj+7sxVikCEecNnQhLSazPLMTq7BU3Oi0hijIBndhieM/cTMP8ddb9qSuR5NC3CPwInhvn3qUR6S1UAXSGm/noltFCelrQ0odCuevLeFU2Gc6OYuluP+4YOftOtF7yx47JoXJTCz/cMmjIajJWCAXVO+lH5vq/jEYkFI7faLxXzuur7TuSSBBf58G73RM6BN1Bfeluc08pC7gioHQ+Q8lpgOc/MziKYysHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhXckNtvEx+khjTvmjd/OcS50z4ss3Qyh+Tyga+M7KQ=;
 b=deUMuDtVm6FBXckKFdNBytiYfmHb1OF/ZnojMGywTT3FdSeCUXLgtlQUYejxUtrGKD1ePJoxDVYZsu9pGYsUuo7xCVF4fMGcuLyFs+FuNTNoVBVvyxZCOt41RANJJwaFKZ87IgwA0r5esipOvsQDjGcoOjFnXvcyPu0D4d598B7Pwjldo42qpVFQgbP2ScxPftySVAwg432I0ElIzchPShqixx0JcgDWagAJSHTZ2edCzhHcdcTTkDxig5FL2csRaqiCmn4lOMPHiccbydBOGVDn3VQGmajNZDnVS27oTtYDrH0IXi/HR/OHpaC0sYdOUSvRzKwokfPyzpcMWXTC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhXckNtvEx+khjTvmjd/OcS50z4ss3Qyh+Tyga+M7KQ=;
 b=RI60ekXtlYR6cJshlh9jbb7cz/DmSxh55fqezATuoo8QK+HkzOV+5LKyBLyyf3Jtk1ciBJUbssXqqH3DINTJX8NkKz15F8dD5tgbZWrjj1U2+Moq6Liv8cF6QxXdnC4QnFGkq4JHFEASSfxmB/Y3bgo5DzRKVFwAb3xW/qRsUajcl0CcLI2ogKJ5/32QQ/K4v0esWr5Au6xngZj5hlz4mhBn/MXmmaSciE+SdXMBHUdsOZSCwZPhIuYL7B7WW6u/6JFIBx+pGEtL5LXTt5k0p/xjQbs2s5hn8ipH3Ka1v88C30WrBQkOVIZY2IPHyNOROYxufcIGYfpIhFjc3AtLoQ==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by TY0PR0101MB4652.apcprd01.prod.exchangelabs.com
 (2603:1096:400:32b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 15:45:11 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 15:45:11 +0000
Message-ID: <TYZPR01MB55564E7754A27CB0E39F5FCDC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Tue, 23 Jan 2024 23:43:59 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
 <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <b84df52a-f144-4ec3-b81b-20d1a0176aff@lunn.ch>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <b84df52a-f144-4ec3-b81b-20d1a0176aff@lunn.ch>
X-TMN: [HMKDoLYeQu4bc17005dO2W7OCKqDuTT7]
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <3093ac9a-98e4-4e04-b9f3-efaf718de087@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|TY0PR0101MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7c044c-2b42-4a54-ba7e-08dc1c2a4894
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT/VAPap+pVtXZmepyzo+OmYTJKyPEetUGsLhppmK7jcpSQDR6JLxtt9/y5ybjgpUxMD4Stv2Ss4hm3VVdphgRLN0ii7kzyE296hLFCbM2+HSYnayDH+HZYTWX6242EG+LXv7bpdLc5dm+dNx+tNJrrnM0LeQPtXnJaq/JCIcoVqtJNQDXWrwVuRHKVlRfktdeeHn7SLv7RTHT2NJX+tDR3ozTt6x0YLI6lFM+/Wx+/lkhjqD9RfNhnN28AEseN6jYOWG8dAWLutUSDR4mi+5383UIyu+HqQyJ0BsTWV+oPGNhn4OoSajIUAWDF/yv8nlpJoQihMc9wJvmHpDd79IAp0s/A/CTjV+NeSaK6Wi3d8huAc2sXh/3a5kS9jz2pFFCrZ4C/tQuNdLyxQqTMVn4EIUP1Ewe+HTgpKY3+L85B8u94u2d9lns38WygBNj7yhTmbfya/n0fT/5m8v4MGWcFOvQGbCMfdg7P1tuoFaWXhBBUKN9gIb594kc7YU5uO6ajLjtWnBUK4BC/TMyYRRts54zg1F96TK1TCq+hkKL6bxg024ke7FoZVhL8VBAiLfmZNY4+G6R6DJwOPRiT7OuqSIKg0fSngkyhah/XLhZgak9BJKZjkp8vqfDXOYu1WydNwYQ1nw9xFBPUWcsXkupZBl92ieeKfS398d2VSrBFOwP6zZZ4LJZ/MWemd1x6vukSGKenP/cqlgVej4g4OewGDpTwHSfClOLOFDgesVzJBndo/nOMoE/ADnE90aD5DhchwUhuvrtjx9ISwkwyXg5QL53roGSUvbziBXCUoqErmUAwzzKaDQRmN
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okt2ZoXwqpH4/Mgp63bLRz9p1FclDPmDFn+JRXZefg/AWbaw0vwDXYhOPaP4bAyqUB2wAMbylRsOVv3nNhboqhWlAQKA5J7zwNDZc4Zy41IPk/Bc0aC525qo/vUdiWchKak1KKWX8/RqYmQY0U+S0C88xFT0bkA3S2zZeCUHw47HEw9CMetMUNJoj2DJBdA0lvsTQZip5R5TWky14I8a77f1v9S9OOJ8ANeH0dHhLz9Yg6eIv8ea880DxCXoV2SZZonApqbJSnLyjhm6nWUygbYWMYIhm7mv0jF1F8dVFRl0qXwbvSO/8d8OhidoR/BJBb45ScZafPL3ao9d+SJpOMLbHvRv/WIWslJfWqX3YKP4KwHiDgo9Ry3zufPCfdG1KuO44XUu1BAfQuloe4d5ljUNH6kAo8OfHt8QjbGK4FgbL+p333D5NlRhVbsnEa0POvo64Z7VLfacz4Jmf4xhTehLLmzivGfWhGT9qaCPY4/GdlUAopM6Pb3yUSU45BWI9hV0ar1cG0UjEVQQocfFjYRXo3Flqet1n2QmxQ2xCXSV1tKbkEub7vEJJZSO9ahG7ulIIUFghrP5r0FOd/HcmCXYjP9DRSieRXp06bpce+A=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amFZKys1aGQ5ZDdNa3NTMDBtNEQzR2JwYkthMjVuYnlCaWZXS3lMVW82UTFs?=
 =?utf-8?B?eVNJaUZ6VkN4ME56U1ZSekpJT1JNUGp5MFE3YXNkeDdGTGZzUForb3NmLzV4?=
 =?utf-8?B?Q09Ra0YveEQ5ZTBlaWMxT3kyU2ZzUU5aM2FMbHp1VEdXUTFxeG1kSFZFTjlW?=
 =?utf-8?B?czZ0S3JoV2VGajFhejN4aXlIWEg5d2ViTk1WUWZpMEJ5R3ovRjM5dTg1eTZN?=
 =?utf-8?B?N3dXZ1NmRTBuNkZpODE3RlZmWTFpd0toY25uVnE3bDVDRWk4bXFjMlQwL2Yx?=
 =?utf-8?B?eGdxZ2VMM0pvMEV0b3RPTWhnTG5QL3hRMFdneHhMUkU1a0QySkl2Mk8rWlNw?=
 =?utf-8?B?NnE0SkFRaHR6MzBZQXJlVXdSbUsycEZsWnVnOGhUeDRXaG5hUC9LV0p5WXlx?=
 =?utf-8?B?dHhzL1ZsSjcxN245QzJwUmN5a2dLMXVUeXdGZXdqNkZTU0lubzZKREp4cVQ1?=
 =?utf-8?B?N1hwYzlzKzFWak5ObnMyZzJaZDBaaC9reERzU0FKYmNSRlFUM2JVNzZqZExX?=
 =?utf-8?B?ZlJRSVU4dHp1ME91clNvUUVEUlVsWDF5NUFhSzdORXYyQzZsRURoSFpBL3RG?=
 =?utf-8?B?T2c3aFkxWnBoc2laWTZTWk5PVURxc3JudWRVZHdiS1VhOUV4b1c3UythZEU0?=
 =?utf-8?B?THlPQW9ReFJBWVVBVEN1Y1dFMUM5amY2ZlJrODl6ZFNWTnpuVktpbTEwYndB?=
 =?utf-8?B?dDhDbHM0WlFmK1oyZVk5bkVvVjIxbzhSYmFncGQ4S3R0TkVHY25GL2xhc1Aw?=
 =?utf-8?B?eHdTWVo0dk5zbDV2NTJXVFA1L0FZMUtFb3NzMjFranZmQ2sxYkQrVGZ2WGc5?=
 =?utf-8?B?Um5HSytQOWRDdUNsMHBTcFlEMmdXUnlRNkp0YVdIUWRqcWdYT3ZxbW9IMCtK?=
 =?utf-8?B?RUNDNUVtaytXV0cwREdwM0RtL2thcURoUVBYVmhuQUgrQlRhZEhxTzJveEZn?=
 =?utf-8?B?RUd5SlpFd1AxUWxROXhqMnFBVzRsUHMvQnhPdWRlc0NIbWNBWnNqazA5Q0w3?=
 =?utf-8?B?OVp5a1VuTU95dGxhSGVxWjVOTVVEUUxvY2Q0alpQUzhNN29tWTdWR1J5VmlF?=
 =?utf-8?B?N1JBL3ZHTFVSK1NhV05lcjVOVEdQWG1yU2pMZlFmdWNPeXViSDNEYWJBcWJu?=
 =?utf-8?B?VUpyYWY1R2t5anVLZE5aUWtPblk0RzkzNmVINzAzTjJhQklkdXU5ZG0zUkhV?=
 =?utf-8?B?RUlLZTJ4d3pPY3d0dm1xMUJ4bklHTi9uWEJlNk1XVFdZT1ZUdTlQeVRXOStk?=
 =?utf-8?B?dkh6NGY3S3plOGppQldTMEkrYThIbGxzaFZXNEQrbjVsR296WXVqc2lNajRa?=
 =?utf-8?B?UVB4N3FQSERjSm16N2xXMmYyUVNPdllkK2hRby91M090MzNmSmd5cHJhY3Bq?=
 =?utf-8?B?aVhLNlBUTGdsSm1qellFa25pWTJxR3JoN29zTGphM1VBK3FFVkc2OTBBNU4r?=
 =?utf-8?B?WEhmWC9jY05FdXJYcmczbWhaUXRRS3EydnMxTGh5c25HRG11T1BHMlM2WkRP?=
 =?utf-8?B?Sm1KTDlyM3hCQ01JZUxxWWFkaXUwVm04NmJSaUNjUStTand2SlpUbXNzUGFi?=
 =?utf-8?B?MGsrREx0ekFzMTF0cVZDVVFNU1phMEZvVmt1WlRxbXJDaytCK0I5NTZXd2pV?=
 =?utf-8?B?Z1lqNkxsR1RNRk1HbzRNTmphTGJoelE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7c044c-2b42-4a54-ba7e-08dc1c2a4894
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:45:11.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4652
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Praveenkumar I <ipkumar@codeaurora.org>,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 5/8] clk: qcom: support for duplicate freq
 in RCG2 freq table
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

5ZyoIDIwMjQvMS8yMyAxOjM0LCBBbmRyZXcgTHVubiDlhpnpgZM6Cj4+Pj4gQ2hhbmdlLUlkOiBJ
OTdkOWUxYjU1ZDhmM2VlMDk1ZjZmMDE3MjlhZjUyN2JhOTBlNTBlNQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFiaGlzaGVrIFNhaHUgPGFic2FodUBjb2RlYXVyb3JhLm9yZz4KPj4+PiAoY2hlcnJ5IHBp
Y2tlZCBmcm9tIGNvbW1pdCA3NzVlN2QzYjY5ZmZjOTdhZmI1YmQ1YTZjOWM0MjNmMmY0ZDhhMGIy
KQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFByYXZlZW5rdW1hciBJIDxpcGt1bWFyQGNvZGVhdXJvcmEu
b3JnPgo+Pj4+Cj4+Pj4gQ2hhbmdlLUlkOiBJZjEwMTkzZmM3OWEzYzEzNzVhYjczNTk3ODEzNzQ1
ZmYxZjRkZjBhZAo+Pj4+Cj4+Pj4gUGljayBmcm9tIGh0dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3Jn
L2Nsby9xc2RrL29zcy9rZXJuZWwvbGludXgtaXBxLTUuNC8tL2NvbW1pdC82ZGZiMzY4YmFlMTMw
YmVlNThlMDBkZGY4MzMwYjU1MDY2ZTFjOGM1Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaXlh
bmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29rLmNvbT4KPj4+Cj4+PiBQbGVhc2UgY2xlYW4gdXAgdGhl
c2UgdGFncy4gVGhlc2UgQ2hhbmdlLUlEIHRhZ3MgYXJlIG1lYW5pbmdsZXNzIGluCj4+PiBtYWlu
bGluZS4gNzc1ZTdkM2I2OWZmYzk3YWZiNWJkNWE2YzljNDIzZjJmNGQ4YTBiMiBpcyBub3QgaW4g
bWFpbmxpbmUKPj4+IGVpdGhlci4gVGhlIHBpY2tlZCBmcm9tIG1pZ2h0IGJlIGludGVyZXN0aW5n
LCBidXQgcGxlYXNlIHB1dCBpdCBpbnRvCj4+PiB0aGUgYm9keSBvZiB0aGUgY29tbWl0IG1lc3Nh
Z2UsIG5vdCBtaXhlZCBpbiB3aXRoIHRoZSB0YWdzLgo+Pj4KPj4+IFdobyBhY3R1YWxseSB3cm90
ZSB0aGlzIHBhdGNoPyBUaGUgZmlyc3QgU2lnbmVkLW9mZi1ieTogaXMgZnJvbQo+Pj4gQWJoaXNo
ZWsgU2FodS4gQnV0IHlvdSBoYXZlIGEgRnJvbSBvZiBQcmF2ZWVua3VtYXIgSSA/Cj4+Cj4+IEkg
aGF2ZSBubyBpZGVhIGFib3V0IHRoaXMuIFRoaXMgcGF0Y2ggaXMgZnJvbSBRdWFsY29tbSB2ZW5k
b3IgbGludXggY29kZS4KPiAKPiBPLksuIFNpbmNlIHRoaXMgaXMgZGlyZWN0IGZyb20gdGhlIHZl
bmRvciwgd2hvIHByb2JhYmx5IGRvZXMgbm90IHRyYWNrCj4gY29kZSBhdXRob3JzaGlwIGNvcnJl
Y3RseSwgaSB3b3VsZCBzYXkgdGhlIGF1dGhvciBpbiBnaXQgaXMgcHJvYmFibHkKPiB3cm9uZy4g
SSB3b3VsZCBzZXQgdGhlIGF1dGhvcjogdG8gQWJoaXNoZWsgU2FodSA8YWJzYWh1QGNvZGVhdXJv
cmEub3JnPi4KPiAKPj4gV2hhdCdzIG1vcmUsIEkgZG9uJ3Qga25vd24gaG93IHRvIGRlYWwgd2l0
aCB0aGVzZSBjb21taXQgbWVzc2FnZSBzaW5jZSBJJ20KPj4gbm90IHRoZSBhdXRob3IgYW5kIEkn
bSBub3Qgc3VyZSBkbyBJIGhhdmUgcmlnaHQgdG8gZWRpdCB0aGVtIGV2ZW4gdGhvdWdoCj4+IHRo
aXMgaXMgR1BMIGNvZGUuCj4gCj4gWW91IHNob3VsZCBrZWVwIGFsbCB0aGUgU2lnbmVkLW9mZi1i
eSwgaW4gdGhlIG9yZGVyIHRoZXkgYXJlLiBCdXQgdGhlCj4gQ2hhbmdlLUlkIGlzIG1lYW5pbmds
ZXNzLCBzbyB0aGVyZSBpcyBubyBwcm9ibGVtIHJlbW92aW5nIHRoZW0uCj4gCj4gCSAgQW5kcmV3
CgpUaGVzZSBkYXlzLCBJIGtub3duIGEgbmV3IGtub3dsZWRnZTogU0dNSUkrIG9ubHkgc3VwcG9y
dCAyLjVHLiAxMDAwTSAKY2FuJ3Qgd29yayB3aXRoIFNHTUlJKyBtb2RlLiBTbyB0aGUgMTAwME0g
ZnJlcXVlbmN5IGRpdmlkZWQgZnJvbSAzLjEyNUcgCmNhbiBiZSBkcm9wcGVkLiBUaGVuIHdlIGRv
bid0IGhhdmUgZHVwbGljYXRlZCBmcmVxdWVuY3kgYW5kIHRoaXMgcGF0Y2ggCmlzIHVubmVjZXNz
YXJ5LiBXaWxsIHRlc3QgbXkgZ3Vlc3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
