Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDD298814
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 09:12:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D35CC36B37;
	Mon, 26 Oct 2020 08:12:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD12CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:12:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q86o30025180; Mon, 26 Oct 2020 09:12:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=dNYmghTPTHEHlwDFyNETUzc/OLhzLwlNOarXpAJGf6A=;
 b=I1bYGn7G1iVi4iDIEK1P13wHVuTy78X/YrvzYdr4pO2F6GMcSvlzdzqTbRHBeuc2hbtL
 dDRTwV3/P3Iu7zoSOI0RveIjHaPMR05qLHOX76DMnCjUXZ9uPQePZqz+YCEuAEKg7ETx
 elmMpv9UG1ow633ymf8L6h+J8nlvKjz1uR4ShQNkLXImV40TKXM1KP6gTI02Bb+XWYT3
 jPEl602DeswijOAdroZdLfBg0NDhsgjtq3Fkv1JW/yp6Fw3VZFYCHWES+VjuBqTfTSPU
 tDFrti6Y3sx35V7/DAG4cWE89wp/OE8XzduoWQiNdwAPbc1e1G25Kr6C0j7haxyGoP/y 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj1jbhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:12:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71C0D10002A;
 Mon, 26 Oct 2020 09:12:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62EB32ADA17;
 Mon, 26 Oct 2020 09:12:11 +0100 (CET)
Received: from SFHDAG1NODE3.st.com (10.75.127.3) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 09:11:50 +0100
Received: from SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d]) by
 SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d%20]) with mapi id
 15.00.1473.003; Mon, 26 Oct 2020 09:11:50 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Martin Kaiser <martin@kaiser.cx>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH 1/2] mailbox: stm32-ipcc: add COMPILE_TEST dependency
Thread-Index: AQHWqgoYCsODtFZ/S06I0xGYLi0Fbqmpem+A
Date: Mon, 26 Oct 2020 08:11:50 +0000
Message-ID: <4541971e-7e2b-28c9-dbd6-ca3bffbfdcb0@st.com>
References: <20201024133154.22767-1-martin@kaiser.cx>
In-Reply-To: <20201024133154.22767-1-martin@kaiser.cx>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] mailbox: stm32-ipcc: add COMPILE_TEST
	dependency
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
Content-Type: multipart/mixed; boundary="===============8382470442171113782=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8382470442171113782==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4541971e7e2b28c9dbd6ca3bffbfdcb0stcom_"

--_000_4541971e7e2b28c9dbd6ca3bffbfdcb0stcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluDQoNCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gNCg0KT24gMjQvMTAvMjAyMCAz
OjMxIHBtLCBNYXJ0aW4gS2Fpc2VyIHdyb3RlOg0KDQpUaGlzIGFsbG93cyBjb21waWxpbmcgdGhl
IGRyaXZlciBvbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHRoZSBoYXJkd2FyZSBpcyBub3QNCmF2YWls
YWJsZS4gTW9zdCBvdGhlciBtYWlsYm94IGRyaXZlcnMgc3VwcG9ydCB0aGlzIGFzIHdlbGwuDQoN
ClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLYWlzZXIgPG1hcnRpbkBrYWlzZXIuY3g+PG1haWx0bzpt
YXJ0aW5Aa2Fpc2VyLmN4Pg0KDQoNClJldmlld2VkLWJ5OiBGYWJpZW4gRGVzc2VubmUgPGZhYmll
bi5kZXNzZW5uZUBzdC5jb20+PG1haWx0bzpmYWJpZW4uZGVzc2VubmVAc3QuY29tPg0KDQoNCg0K
DQotLS0NCg0KSSB1c2VkIHRoaXMgZm9yIHRlc3RpbmcgdGhlIHRyaXZpYWwgcGF0Y2ggdGhhdCBy
ZW1vdmVzIHRoZSBkdXBsaWNhdGUgZXJyb3INCm1lc3NhZ2UuIEFsc28sIGNvbXBpbGluZyB0aGUg
ZHJpdmVyIG9uIHg4Nl82NCB3b3JrZWQgd2l0aG91dCBlcnJvcnMuDQoNCiBkcml2ZXJzL21haWxi
b3gvS2NvbmZpZyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnIGIvZHJpdmVy
cy9tYWlsYm94L0tjb25maWcNCmluZGV4IDA1YjEwMDllMjgyMC4uYWJiZjVkNjdmZmEyIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9tYWlsYm94L0tjb25maWcNCisrKyBiL2RyaXZlcnMvbWFpbGJveC9L
Y29uZmlnDQpAQCAtMjAxLDcgKzIwMSw3IEBAIGNvbmZpZyBCQ01fRkxFWFJNX01CT1gNCg0KIGNv
bmZpZyBTVE0zMl9JUENDDQogICAgICAgIHRyaXN0YXRlICJTVE0zMiBJUENDIE1haWxib3giDQot
ICAgICAgIGRlcGVuZHMgb24gTUFDSF9TVE0zMk1QMTU3DQorICAgICAgIGRlcGVuZHMgb24gTUFD
SF9TVE0zMk1QMTU3IHx8IENPTVBJTEVfVEVTVA0KICAgICAgICBoZWxwDQogICAgICAgICAgTWFp
bGJveCBpbXBsZW1lbnRhdGlvbiBmb3IgU1RNaWNyb2VsZWN0b25pY3MgU1RNMzIgZmFtaWx5IGNo
aXBzDQogICAgICAgICAgd2l0aCBoYXJkd2FyZSBmb3IgSW50ZXItUHJvY2Vzc29yIENvbW11bmlj
YXRpb24gQ29udHJvbGxlciAoSVBDQykNCg0K

--_000_4541971e7e2b28c9dbd6ca3bffbfdcb0stcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CD68BD9A661E1A40890A99F30872E881@st.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPHA+SGkgTWFydGlu
PC9wPg0KPHA+PGJyPg0KPC9wPg0KPHA+VGhhbmsgeW91IGZvciB0aGUgcGF0Y2g8YnI+DQo8L3A+
DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDI0LzEwLzIwMjAgMzozMSBwbSwgTWFy
dGluIEthaXNlciB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNp
dGU9Im1pZDoyMDIwMTAyNDEzMzE1NC4yMjc2Ny0xLW1hcnRpbkBrYWlzZXIuY3giPg0KPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5UaGlzIGFsbG93cyBjb21waWxpbmcgdGhlIGRy
aXZlciBvbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHRoZSBoYXJkd2FyZSBpcyBub3QNCmF2YWlsYWJs
ZS4gTW9zdCBvdGhlciBtYWlsYm94IGRyaXZlcnMgc3VwcG9ydCB0aGlzIGFzIHdlbGwuDQoNClNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBLYWlzZXIgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOm1hcnRpbkBrYWlzZXIuY3giPiZsdDttYXJ0aW5Aa2Fpc2VyLmN4Jmd0
OzwvYT48L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxicj4NCjxwcmUgaXRlbXByb3A9ImFydGljbGVC
b2R5IiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250
LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZv
bnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQt
YWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lk
b3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4
OyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjog
aW5pdGlhbDsiPlJldmlld2VkLWJ5OiBGYWJpZW4gRGVzc2VubmUgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmZhYmllbi5kZXNzZW5uZUBzdC5jb20iPiZsdDtm
YWJpZW4uZGVzc2VubmVAc3QuY29tJmd0OzwvYT4NCg0KPC9wcmU+DQo8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIiBjaXRlPSJtaWQ6MjAyMDEwMjQxMzMxNTQuMjI3NjctMS1tYXJ0aW5Aa2Fpc2VyLmN4
Ij4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+DQotLS0NCg0KSSB1c2VkIHRo
aXMgZm9yIHRlc3RpbmcgdGhlIHRyaXZpYWwgcGF0Y2ggdGhhdCByZW1vdmVzIHRoZSBkdXBsaWNh
dGUgZXJyb3INCm1lc3NhZ2UuIEFsc28sIGNvbXBpbGluZyB0aGUgZHJpdmVyIG9uIHg4Nl82NCB3
b3JrZWQgd2l0aG91dCBlcnJvcnMuDQoNCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyB8IDIgJiM0
MzstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCYjNDM7KSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L0tjb25maWcgYi9kcml2ZXJzL21haWxib3gv
S2NvbmZpZw0KaW5kZXggMDViMTAwOWUyODIwLi5hYmJmNWQ2N2ZmYTIgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21haWxib3gvS2NvbmZpZw0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9tYWlsYm94
L0tjb25maWcNCkBAIC0yMDEsNyAmIzQzOzIwMSw3IEBAIGNvbmZpZyBCQ01fRkxFWFJNX01CT1gN
CiANCiBjb25maWcgU1RNMzJfSVBDQw0KIAl0cmlzdGF0ZSAmcXVvdDtTVE0zMiBJUENDIE1haWxi
b3gmcXVvdDsNCi0JZGVwZW5kcyBvbiBNQUNIX1NUTTMyTVAxNTcNCiYjNDM7CWRlcGVuZHMgb24g
TUFDSF9TVE0zMk1QMTU3IHx8IENPTVBJTEVfVEVTVA0KIAloZWxwDQogCSAgTWFpbGJveCBpbXBs
ZW1lbnRhdGlvbiBmb3IgU1RNaWNyb2VsZWN0b25pY3MgU1RNMzIgZmFtaWx5IGNoaXBzDQogCSAg
d2l0aCBoYXJkd2FyZSBmb3IgSW50ZXItUHJvY2Vzc29yIENvbW11bmljYXRpb24gQ29udHJvbGxl
ciAoSVBDQykNCjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_4541971e7e2b28c9dbd6ca3bffbfdcb0stcom_--

--===============8382470442171113782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8382470442171113782==--
